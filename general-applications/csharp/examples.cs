using System;
using System.Collections.Generic;
using System.Linq;

// Compile this source on its own: it has its own entry point.
class Examples
{
    /// <summary>Describe a book without changing its title.</summary>
    static string Label(string title, bool available)
    {
        return title.Trim() + (available ? " (ready)" : " (borrowed)");
    }

    static void Main()
    {
        // var infers a static type; const fixes a compile-time value.
        const string Library = "Neighborhood shelf";
        int previewLimit = 2;
        bool showBorrowed = false;
        Console.WriteLine(Library);

        var titles = new List<string> { "Dune", "Earthsea", "The Hobbit" };
        var availability = new Dictionary<string, bool>
        {
            { "Dune", true },
            { "Earthsea", false },
            { "The Hobbit", true }
        };

        // Iterate the ordered list rather than relying on dictionary order.
        foreach (string title in titles)
        {
            if (showBorrowed || availability[title])
            {
                Console.WriteLine(Label(title, availability[title]));
            }
        }

        // LINQ composes filters and projections using lambda functions.
        var ready = titles.Where(title => availability[title]).ToList();
        var preview = ready.Take(previewLimit).Select(title => title.ToUpperInvariant());
        Console.WriteLine("Preview: " + string.Join(", ", preview));

        var tags = new HashSet<string> { "fiction", "classic", "fiction" };
        Console.WriteLine("Has fiction tag: " + tags.Contains("fiction"));

        // A new list copies elements; assignment would share the same list.
        var extended = new List<string>(ready);
        extended.Add("Foundation");
        Console.WriteLine("Original: " + ready.Count + "; copy: " + extended.Count);

        bool found;
        if (!availability.TryGetValue("Unknown title", out found))
        {
            Console.WriteLine("Unknown title has no availability entry.");
        }
    }
}
