`timescale 1ns/1ps
// Verilog-2005 simulation: a four-entry synchronous lookup circuit.
module examples;
    reg clk;
    reg reset;
    reg enable;
    reg [1:0] address;
    reg [7:0] lookup [0:3];
    reg [7:0] result;
    integer i;

    // Functions describe reusable combinational calculations.
    function [7:0] normalize;
        input [7:0] sample;
        begin
            if (sample > 8'd100)
                normalize = 8'd100;
            else
                normalize = sample;
        end
    endfunction

    // Independent procedural blocks execute concurrently.
    initial clk = 1'b0;
    always #5 clk = ~clk;

    // Nonblocking assignments model clocked register updates.
    always @(posedge clk) begin
        if (reset)
            result <= 8'd0;
        else if (enable)
            result <= normalize(lookup[address]);
    end

    initial begin
        lookup[0] = 8'd12;
        lookup[1] = 8'd85;
        lookup[2] = 8'd120;
        lookup[3] = 8'd0;
        reset = 1'b1;
        enable = 1'b0;
        address = 2'd0;
        // Drive on falling edges to avoid racing the clocked block.
        @(negedge clk);
        reset = 1'b0;
        enable = 1'b1;
        for (i = 0; i < 4; i = i + 1) begin
            address = i[1:0];
            @(posedge clk);
            #1; // Observe after nonblocking updates.
            $display("address=%0d result=%0d", address, result);
            if (result !== normalize(lookup[address])) begin
                $display("ERROR: lookup mismatch");
                $stop;
            end
            @(negedge clk);
        end
        $finish;
    end
endmodule
