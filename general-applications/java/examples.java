import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

// Lowercase matches examples.java; conventional Java class names use capitals.
public class examples {
    /** Return a label without changing the supplied name. */
    private static String label(String name, boolean available) {
        return name.trim() + (available ? " (ready)" : " (borrowed)");
    }

    public static void main(String[] args) {
        // Types are checked at compile time; final prevents reassignment.
        final String library = "Neighborhood shelf";
        int previewLimit = 2;
        boolean showBorrowed = false;
        System.out.println(library);

        // LinkedHashMap retains insertion order, unlike HashMap.
        Map<String, Boolean> books = new LinkedHashMap<>();
        books.put("Dune", true);
        books.put("Earthsea", false);
        books.put("The Hobbit", true);

        List<String> available = new ArrayList<>();
        for (Map.Entry<String, Boolean> book : books.entrySet()) {
            if (book.getValue()) {
                available.add(book.getKey());
            }
            if (showBorrowed || book.getValue()) {
                System.out.println(label(book.getKey(), book.getValue()));
            }
        }

        // Streams transform a collection; lambdas describe each operation.
        String preview = available.stream()
            .limit(previewLimit)
            .map(title -> title.toUpperCase(java.util.Locale.ROOT))
            .collect(Collectors.joining(", "));
        System.out.println("Preview: " + preview);

        Set<String> tags = new LinkedHashSet<>(Arrays.asList("fiction", "classic", "fiction"));
        System.out.println("Unique tags: " + tags);
        List<String> copy = new ArrayList<>(available);
        copy.add("Foundation");
        System.out.println("Original size: " + available.size() + "; copy: " + copy.size());

        // Optional describes an absent result without dereferencing null.
        String first = available.stream().findFirst().orElse("No books ready");
        System.out.println("Recommendation: " + first);
    }
}
