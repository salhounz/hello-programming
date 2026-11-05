# Visual Basic

Visual Basic is used for .NET business, desktop, and automation applications.

Official documentation: [Visual Basic documentation](https://learn.microsoft.com/dotnet/visual-basic/)

Run: `vbc Hello.vb && Hello.exe`

## Concise introductory examples

[examples.vb](./examples.vb) introduces strict typing, strings, booleans, comments,
value-type structures, constructors, functions and `Sub`, generic lists and
dictionaries, iteration, branching, copying, and safe keyed lookup.

Use the Visual Basic compiler from a .NET Framework 4.x developer command prompt
on Windows. From this directory, run
`vbc /nologo /optionstrict+ /target:exe /main:Examples /out:examples.exe examples.vb`,
then `.\examples.exe` in PowerShell (or `examples.exe` in cmd). This compiles only
the new source, selecting its `Examples` startup module independently of
`Hello.vb`. Modern .NET SDK `dotnet run` requires a VB project; no project is
provided or created here. The program uses Framework libraries only and prints
a shelf catalog, available titles, a copied record, and a lookup result.
