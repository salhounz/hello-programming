# Run: Rscript examples.r
# Uses only base R; no packages or input files are required.

# 1. Comments: # starts a comment; use it on each line for longer notes.

# 2. Values and types: <- is the conventional assignment operator.
count <- 3L                  # Integer; L distinguishes it from double
temperature <- 21.5          # Double
ready <- TRUE                # Logical; TRUE/FALSE are uppercase
language <- "R"              # Character (text)
unavailable <- NA_real_      # Typed missing numeric value
no_result <- NULL            # Absence of an object, not a missing observation
print(typeof(count))
print(typeof(temperature))

# 3. Vectors: elements share a type; indexing starts at one.
scores <- c(72, 85, 91)
print(scores[1])
print(scores[scores >= 80])   # Logical indexing
print(c(1, "two"))           # Coerced to character to share one type

# Lists can mix types; [[ extracts an element, [ keeps a sublist.
person <- list(name = "Ada", age = 36L, active = TRUE)
print(person$name)
print(person[["age"]])

# A data frame holds equal-length columns of potentially different types.
observations <- data.frame(
  name = c("Ada", "Grace", "Linus"),
  score = c(85, NA, 91)
)
print(observations[!is.na(observations$score), ])

# Factors represent categorical data with a defined set of levels.
priority <- factor(c("low", "high", "low"), levels = c("low", "high"))
print(levels(priority))

# 4. Functions: the last expression is returned implicitly.
greet <- function(name = "World") {
  paste0("Hello, ", name, "!")
}
print(greet("Ada"))

# 5. Control flow: if expects one non-missing logical condition.
if (ready) {
  print("Ready to analyze measurements")
}
for (label in c("baseline", "follow-up")) {
  print(label)
}

# 6. Vectorized operations and missing values.
print(round(c(21.45, 22.18), digits = 1))
print(is.na(observations$score))   # Use is.na(), not == NA
print(mean(observations$score, na.rm = TRUE))
print(seq_along(scores))          # Safe iteration indices, even for empty vectors
