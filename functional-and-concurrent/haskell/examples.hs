module Main where

import Data.List (intercalate, sort)
import qualified Data.Map.Strict as Map

-- A record introduces a type and its field accessors.
data Book = Book
  { title :: String
  , available :: Bool
  , tags :: [String]
  } deriving (Show)

books :: [Book]
books =
  [ Book "Dune" True ["fiction", "space"]
  , Book "Emma" False ["fiction"]
  , Book "Sapiens" True ["history"]
  ]

-- Pure functions have no printing or mutation hidden inside them.
label :: Book -> String
label book = title book ++ " — " ++ status
  where
    status = if available book then "on shelf" else "on loan"

-- Pattern matching covers both shapes of a list.
firstTitle :: [Book] -> String
firstTitle [] = "No books"
firstTitle (book : _) = title book

availableTitles :: [Book] -> [String]
availableTitles = sort . map title . filter available

-- IO actions describe effects; do sequences them.
main :: IO ()
main = do
  putStrLn "Neighborhood shelf"
  mapM_ (putStrLn . label) books
  putStrLn ("Choose: " ++ intercalate ", " (availableTitles books))
  putStrLn ("First: " ++ firstTitle books)
  putStrLn ("Empty: " ++ firstTitle [])

  -- Record update constructs a new value.
  let original = Book "Dune" True ["fiction", "space"]
      borrowed = original { available = False }
      catalog = Map.fromList [(title book, book) | book <- books]
  putStrLn ("Original: " ++ label original)
  putStrLn ("Updated: " ++ label borrowed)

  -- Maybe represents absence without a null reference.
  case Map.lookup "Dune" catalog of
    Just book -> putStrLn ("Found: " ++ label book)
    Nothing -> putStrLn "Missing title"

  let fiction = [title book | book <- books, "fiction" `elem` tags book]
  putStrLn ("Fiction: " ++ intercalate ", " fiction)
