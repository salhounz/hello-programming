extends SceneTree
# Godot 4 standalone script: no scene or project assets required.

signal item_collected(item_name: String)

enum Mode { EXPLORING, RESTING }

const CAPACITY: int = 3
var mode: Mode = Mode.EXPLORING
var inventory: Array[String] = []
var energy: int = 5
var location: Vector2 = Vector2.ZERO
var supplies: Dictionary = {"apple": 2, "water": 1}


func can_collect(item_name: String) -> bool:
    return not item_name.is_empty() and inventory.size() < CAPACITY


func collect(item_name: String) -> bool:
    if not can_collect(item_name):
        return false
    inventory.append(item_name)
    item_collected.emit(item_name)
    return true


func on_item_collected(item_name: String) -> void:
    print("Collected: %s" % item_name)


func describe_mode() -> String:
    match mode:
        Mode.EXPLORING:
            return "exploring"
        Mode.RESTING:
            return "resting"
        _:
            return "unknown"


func _init() -> void:
    item_collected.connect(on_item_collected)
    for item_name in ["map", "torch", "key", "coin"]:
        if not collect(item_name):
            print("Bag full; leaving %s" % item_name)

    for item_name in supplies:
        print("%s: %d" % [item_name, supplies[item_name]])

    while energy > 2:
        location += Vector2.RIGHT
        energy -= 1

    mode = Mode.RESTING
    print("Position: %s; mode: %s" % [location, describe_mode()])
    print("Inventory: ", inventory)
    quit()
