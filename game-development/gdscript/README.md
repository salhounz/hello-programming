# GDScript

GDScript is the primary scripting language for the Godot game engine.

Official documentation: [GDScript documentation](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/)

Run: `godot --headless --script hello.gd`

## Concise introduction

[examples.gd](./examples.gd) is a standalone Godot 4 SceneTree script covering
typed values, constants, arrays, dictionaries, enums, functions, guards, loops,
match, Vector2, and a connected custom signal. It needs no scene, assets, or
Node attachment; SceneTree is the host entry point and _init starts the example.

From this directory run `godot --headless --script examples.gd` with an existing
Godot 4 installation (use its executable path if it is not named godot).
For a parse check use `godot --headless --check-only --script examples.gd`.
Expect three collection signals, a full-bag message for coin, supply counts, and
a resting position of (3, 0), then automatic exit.
