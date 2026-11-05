Option Strict On
Option Explicit On

Imports System
Imports System.Collections.Generic

Module Examples
    ' A structure is a value type; assignment copies its fields.
    Private Structure Book
        Public Title As String
        Public Available As Boolean

        Public Sub New(title As String, available As Boolean)
            Me.Title = title
            Me.Available = available
        End Sub
    End Structure

    ' Functions return values; Sub procedures carry out actions.
    Private Function Label(item As Book) As String
        Dim status As String = If(item.Available, "on shelf", "on loan")
        Return item.Title & " - " & status
    End Function

    Sub Main()
        Dim books As New List(Of Book) From {
            New Book("Dune", True),
            New Book("Emma", False),
            New Book("Sapiens", True)
        }
        Dim availableTitles As New List(Of String)
        Dim catalog As New Dictionary(Of String, Book)

        Console.WriteLine("Neighborhood shelf")
        For Each item As Book In books
            Console.WriteLine(Label(item))
            catalog(item.Title) = item
            If item.Available Then
                availableTitles.Add(item.Title)
            End If
        Next
        availableTitles.Sort()
        Console.WriteLine("Choose: " & String.Join(", ", availableTitles.ToArray()))
        Console.WriteLine("Available count: " & availableTitles.Count)

        Dim borrowed As Book = books(0)
        borrowed.Available = False
        Console.WriteLine("Original: " & Label(books(0)))
        Console.WriteLine("Updated: " & Label(borrowed))

        ' TryGetValue avoids indexing a dictionary with a missing key.
        Dim found As Book
        If catalog.TryGetValue("Dune", found) Then
            Console.WriteLine("Found: " & Label(found))
        Else
            Console.WriteLine("Missing title")
        End If
    End Sub
End Module
