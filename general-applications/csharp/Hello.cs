using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Threading.Tasks;

sealed class Counter
{
    private int count;
    public int Value { get { return count; } }
    public void Increment() { count++; }
}

class Hello
{
    static void Main()
    {

        /*
            Type Systems & Variables
        */
        // var infers a static type; const defines a compile-time constant.
        int score = 10;
        score += 5;
        const string Language = "C#";
        var ready = true;

        /*
            Control Flow Operations
        */
        // if and foreach handle decisions and iteration.
        string status = score >= 10 ? "pass" : "retry";
        foreach (int value in new[] { 1, 2, 3 }) { score += value; }

        /*
            Execution Blocks
        */
        // Delegates and lambdas group operations; braces introduce local scope.
        Func<int, int, int> add = (left, right) => left + right;
        int sum = add(2, 3);

        /*
            Code Health & Documentation
        */
        // Use line comments, block comments, and XML documentation on declarations.
        // A single-line comment.
        /* A multi-line comment.
           Explain the behavior callers need to know. */
        // On a declaration: /// <summary>Return a sum.</summary>

        /*
            Built-In Collections
        */
        // List grows dynamically, Dictionary maps keys, and HashSet stores unique values.
        var values = new List<int> { 1, 2, 3 };
        var inventory = new Dictionary<string, int> { { "apples", 3 } };
        var unique = new HashSet<int> { 1, 1, 2 };

        /*
            Data Mutability
        */
        // Reference assignments share mutable objects; a new list copies elements shallowly.
        var copied = new List<int>(values);
        copied.Add(4);
        var alias = values;

        /*
            Access & Encapsulation
        */
        // private restricts members; the Counter type exposes methods and a getter.
        var counter = new Counter();
        counter.Increment();
        int count = counter.Value;

        /*
            Design Paradigms & Patterns
        */
        // LINQ and delegates compose transformations without changing the input collection.
        var doubled = values.Select(value => value * 2).ToList();
        int total = values.Sum();

        /*
            Memory Management
        */
        // The GC handles managed objects; using disposes external or disposable resources.
        using (var reader = new StringReader("sample"))
        {
            int firstCharacter = reader.Read();
        }

        /*
            Concurrency & Parallelism
        */
        // Task.Run schedules worker work; this synchronous entry point waits for its result.
        Task<int> task = Task.Run(() => 42);
        int answer = task.GetAwaiter().GetResult();
        // In an async method, prefer: int answer = await task;

        /*
            Performance Optimization
        */
        // Reuse appropriate lookup collections and reserve capacity for known batches.
        var batch = new List<int>(100);
        bool isUnique = unique.Contains(2);

        Console.WriteLine("Hello, World!");
    }
}
