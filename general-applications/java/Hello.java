import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.io.StringReader;

public class Hello {
    private static int add(int left, int right) { return left + right; }
    private static class Counter {
        private int count;
        void increment() { count++; }
        int value() { return count; }
    }
    public static void main(String[] args) throws Exception {

        /*
            Type Systems & Variables
        */
        // Declarations specify static types; final prevents reassignment of a binding.
        int score = 10;
        score += 5;
        final String language = "Java";

        /*
            Control Flow Operations
        */
        // if, switch, and loops direct execution.
        String status = score >= 10 ? "pass" : "retry";
        for (int index = 0; index < 3; index++) { score += index; }

        /*
            Execution Blocks
        */
        // Methods group operations; braces restrict local scope.
        int sum = add(2, 3);
        { int local = 7; sum += local; }

        /*
            Code Health & Documentation
        */
        // Use //, block comments, and Javadoc for public contracts.
        // A single-line comment.
        /* A multi-line comment.
           Explain assumptions instead of repeating obvious code. */
        /** Documentation comments belong on declarations. */

        /*
            Built-In Collections
        */
        // List is ordered, Map associates keys, and Set stores distinct members.
        List<Integer> values = new ArrayList<>(Arrays.asList(1, 2, 3));
        Map<String, Integer> inventory = new HashMap<>();
        inventory.put("apples", 3);
        Set<Integer> unique = new HashSet<>(Arrays.asList(1, 1, 2));

        /*
            Data Mutability
        */
        // References can share mutable objects; collection constructors make shallow copies.
        List<Integer> copied = new ArrayList<>(values);
        copied.add(4);
        List<Integer> readOnlyView = Collections.unmodifiableList(values);

        /*
            Access & Encapsulation
        */
        // Private fields hide state; the Counter helper exposes only selected operations.
        Counter counter = new Counter();
        counter.increment();
        int count = counter.value();

        /*
            Design Paradigms & Patterns
        */
        // Streams and lambdas support declarative transformations; interfaces define contracts.
        int total = values.stream().mapToInt(Integer::intValue).sum();
        java.util.function.IntUnaryOperator doubleValue = value -> value * 2;

        /*
            Memory Management
        */
        // Garbage collection handles object storage; try-with-resources closes AutoCloseable resources.
        try (StringReader reader = new StringReader("sample")) {
            int firstCharacter = reader.read();
        }

        /*
            Concurrency & Parallelism
        */
        // CompletableFuture can schedule work; join waits and propagates a failure.
        CompletableFuture<Integer> task = CompletableFuture.supplyAsync(() -> 42);
        int answer = task.join();

        /*
            Performance Optimization
        */
        // Preallocate suitable collections and measure before changing algorithms or allocations.
        List<Integer> batch = new ArrayList<>(100);
        for (int index = 0; index < 100; index++) { batch.add(index); }

        System.out.println("Hello, World!");
    }
}
