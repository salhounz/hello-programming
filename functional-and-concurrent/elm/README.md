# Elm

Elm is a functional language for reliable browser user interfaces.

Official documentation: [Elm guide](https://guide.elm-lang.org/)

Run: `elm make Hello.elm --output=hello.html`

## Concise introductory examples

[examples.elm](./examples.elm) introduces typed records, strings, booleans, lists,
comments, pure functions, filtering, mapping, `Maybe` pattern matching, local
bindings, and a coherent static `Html` view of a shelf catalog.

Use an existing Elm 0.19.1 application whose `elm.json` includes `src` as a source
directory and `elm/html` as a direct dependency. The repository keeps the requested
lowercase basename; [Elm requires module names to match filenames](https://guide.elm-lang.org/webapps/modules).
Copy this file into that application's `src/Examples.elm` without changing its
`module Examples` declaration. For example, in PowerShell from this directory:

```powershell
Copy-Item ./examples.elm C:/path/to/your-elm-app/src/Examples.elm
Set-Location C:/path/to/your-elm-app
elm make src/Examples.elm --output=examples.html
```

Replace the application path with your existing project. Open the generated
`examples.html` in a browser. This is a static view and needs no JavaScript host
code, subscriptions, or update function. No new project is included here.
