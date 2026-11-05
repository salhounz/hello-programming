`timescale 1ns/1ps
// Simulation-only stimulus around a small clocked state machine.
module examples;
    typedef enum logic [1:0] { IDLE, ACTIVE, DONE } state_t;
    typedef struct packed {
        logic valid;
        logic [7:0] value;
    } sample_t;

    logic clk = 0;
    logic reset = 1;
    state_t state = IDLE;
    sample_t samples [0:2];
    logic [7:0] peak = 0;
    int unsigned index = 0;

    function automatic logic [7:0] larger(
        input logic [7:0] left_value,
        input logic [7:0] right_value
    );
        return left_value > right_value ? left_value : right_value;
    endfunction

    always #5 clk = ~clk;

    always_ff @(posedge clk) begin
        if (reset) begin
            state <= IDLE;
            index <= 0;
            peak <= 0;
        end else begin
            case (state)
                IDLE: state <= ACTIVE;
                ACTIVE: begin
                    if (samples[index].valid)
                        peak <= larger(peak, samples[index].value);
                    if (index == 2)
                        state <= DONE;
                    else
                        index <= index + 1;
                end
                DONE: state <= DONE;
                default: state <= IDLE;
            endcase
        end
    end

    initial begin
        samples[0] = {1'b1, 8'd12};
        samples[1] = {1'b0, 8'd99};
        samples[2] = {1'b1, 8'd40};
        foreach (samples[i])
            $display("sample %0d: %0d", i, samples[i].value);
        @(negedge clk) reset = 0;
        wait (state == DONE);
        #1;
        assert (peak == 40) else $fatal(1, "unexpected peak");
        $display("peak=%0d", peak);
        $finish;
    end
endmodule
