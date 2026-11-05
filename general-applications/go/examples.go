package main

import (
	"fmt"
	"strconv"
	"strings"
)

// task groups a string and a boolean in a statically typed value.
type task struct {
	title string
	done  bool
}

func label(item task) string {
	status := "next"
	if item.done {
		status = "done"
	}
	return fmt.Sprintf("[%s] %s", status, strings.TrimSpace(item.title))
}

func main() {
	const owner = "Ada"
	previewLimit := 2
	showCompleted := false
	fmt.Println("Tasks for", owner)

	// A slice is ordered; range supplies each index and value.
	tasks := []task{{"Read a chapter", true}, {"Water plants", false}, {"Plan a walk", false}}
	pending := make([]string, 0, len(tasks))
	for _, item := range tasks {
		if !item.done {
			pending = append(pending, item.title)
		}
		if showCompleted || !item.done {
			fmt.Println(label(item))
		}
	}
	if len(pending) < previewLimit {
		previewLimit = len(pending)
	}
	fmt.Println("Preview:", strings.Join(pending[:previewLimit], ", "))

	// Map lookup returns a value and a presence flag; order is unspecified.
	minutes := map[string]int{"reading": 20, "walk": 30}
	if estimate, ok := minutes["walk"]; ok {
		fmt.Println("Walk minutes:", estimate)
	}

	// Conversion returns an error explicitly; callers decide how to recover.
	requested, err := strconv.Atoi("two")
	if err != nil {
		requested = previewLimit
	}
	fmt.Println("Requested preview size:", requested)
}
