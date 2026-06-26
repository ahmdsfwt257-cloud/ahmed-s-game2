# 🗡️ Adventure Time

**Adventure Time** is a 2D top-down action RPG built with **Godot 4.5**, featuring real-time combat, puzzles, NPC interactions, inventory management, and a full save/load system.

\---

## 🎮 Controls

### ⌨️ Keyboard \& Mouse

|Action|Key|
|-|-|
|Move|`W` `A` `S` `D` or Arrow Keys|
|Attack|`Z` or **Left Click**|
|Charge Attack|Hold `Z` / Hold **Left Click** after attacking|
|Ability (Boomerang)|`X` or **Middle Mouse Button**|
|Interact / Lift / Throw|`C` or **Right Click**|
|Pause|`Escape`|

### 🎮 Gamepad

|Action|Button|
|-|-|
|Move|Left Stick / D-Pad|
|Attack|`A` (South)|
|Ability (Boomerang)|`Y` (North)|
|Interact / Lift / Throw|`X` (West)|
|Pause|`Select`|

\---

## ⚔️ Combat System

### Basic Attack

Press **Attack** to swing your sword.

### Charge Attack

1. Press **Attack** once to perform a normal swing
2. **Hold Attack** immediately after — a charge indicator (particles) appears
3. After **1 second**, the charge completes (burst of particles + sound)
4. **Release** to unleash a spinning charge attack

   * Grants **invulnerability** during the spin
   * Deals AOE damage around the player
   * If you release early (before charge completes), the attack is cancelled

### Boomerang

* Press **Ability** to throw a boomerang in your facing direction
* It travels forward, decelerates, then **automatically returns** to you
* Deals damage both on the way out **and** on the way back

\---

## 🧍 Player Actions

### Lift \& Carry

* Walk up to a **Throwable object** and press **Interact**
* The player lifts it and enters **Carry mode**
* Press **Interact** again to **throw** it forward — deals damage to enemies!

### Interact

Press **Interact** near:

* **NPCs** → starts a dialogue
* **Treasure Chests** → opens and adds items to inventory
* **Levers** → activates/deactivates connected doors
* **Locked Doors** (with a Dungeon Key) → unlocks permanently

\---

📖 The Story

In a once-peaceful land, a sudden dark aura has emerged from the depths of the ancient dungeon, bringing with it aggressive monsters that threaten the safety of the nearby village. You step into the shoes of a brave, young hero who takes it upon themselves to venture into the unknown. Your mission is simple but dangerous: descend into the darkness, eliminate the source of the evil, and restore peace to your home.

