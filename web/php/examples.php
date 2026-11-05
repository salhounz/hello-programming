<?php
declare(strict_types=1);

// PHP arrays serve as both ordered lists and key/value maps.
$reader = "Ada";
$includeRead = false;
$books = [
    ["title" => "Web basics", "read" => true],
    ["title" => "Useful scripts", "read" => false],
];

/** Format one record; parameter and return types are checked. */
function describeBook(array $book): string
{
    $status = $book["read"] ? "read" : "next";
    return "{$book['title']} ({$status})";
}

echo "{$reader}'s reading list", PHP_EOL;
foreach ($books as $book) {
    if (!$includeRead && $book["read"]) {
        continue;
    }
    echo describeBook($book), PHP_EOL;
}

// Arrow functions capture surrounding values automatically by value.
$prefix = "Recommended: ";
$titles = array_map(
    fn(array $book): string => $prefix . $book["title"],
    $books
);
echo implode(PHP_EOL, $titles), PHP_EOL;

// Copying an array gives value semantics for these nested arrays.
$updated = $books;
$updated[1]["read"] = true;
echo "Original: ", describeBook($books[1]), PHP_EOL;
echo "Updated: ", describeBook($updated[1]), PHP_EOL;

$settings = ["theme" => "dark", "nickname" => null];
$nickname = $settings["nickname"] ?? $reader;
echo "Welcome, {$nickname}", PHP_EOL;
$themeLabel = match ($settings["theme"]) {
    "dark" => "Night reading",
    "light" => "Day reading",
    default => "System theme",
};
echo $themeLabel, PHP_EOL;

// JSON_THROW_ON_ERROR turns conversion failures into exceptions.
try {
    $json = json_encode($books, JSON_THROW_ON_ERROR);
    echo $json, PHP_EOL;
} catch (JsonException $error) {
    fwrite(STDERR, $error->getMessage() . PHP_EOL);
}
