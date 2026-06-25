# 🗡️ Adventure Time

**Adventure Time** is a 2D top-down action RPG built with **Godot 4.5**, featuring real-time combat, puzzles, NPC interactions, inventory management, and a full save/load system.

---

## 🎮 Controls

### ⌨️ Keyboard & Mouse

| Action | Key |
|---|---|
| Move | `W` `A` `S` `D` or Arrow Keys |
| Attack | `Z` or **Left Click** |
| Charge Attack | Hold `Z` / Hold **Left Click** after attacking |
| Ability (Boomerang) | `X` or **Middle Mouse Button** |
| Interact / Lift / Throw | `C` or **Right Click** |
| Pause | `Escape` |

### 🎮 Gamepad

| Action | Button |
|---|---|
| Move | Left Stick / D-Pad |
| Attack | `A` (South) |
| Ability (Boomerang) | `Y` (North) |
| Interact / Lift / Throw | `X` (West) |
| Pause | `Select` |

---

## ⚔️ Combat System

### Basic Attack
Press **Attack** to swing your sword.

### Charge Attack
1. Press **Attack** once to perform a normal swing
2. **Hold Attack** immediately after — a charge indicator (particles) appears
3. After **1 second**, the charge completes (burst of particles + sound)
4. **Release** to unleash a spinning charge attack
   - Grants **invulnerability** during the spin
   - Deals AOE damage around the player
   - If you release early (before charge completes), the attack is cancelled

### Boomerang
- Press **Ability** to throw a boomerang in your facing direction
- It travels forward, decelerates, then **automatically returns** to you
- Deals damage both on the way out **and** on the way back

---

## 🧍 Player Actions

### Lift & Carry
- Walk up to a **Throwable object** and press **Interact**
- The player lifts it and enters **Carry mode**
- Press **Interact** again to **throw** it forward — deals damage to enemies!

### Interact
Press **Interact** near:
- **NPCs** → starts a dialogue
- **Treasure Chests** → opens and adds items to inventory
- **Levers** → activates/deactivates connected doors
- **Locked Doors** (with a Dungeon Key) → unlocks permanently

---

## 🗺️ World Structure

```
Title Screen
    ↓
Area 01 (Overworld) — 4 Rooms
    ↓
Dungeon 01 — 4 Rooms (Boss at the end)
```

---

## 🧩 Puzzle Mechanics

| Element | How It Works |
|---|---|
| **Pressure Plate** | Activated by standing on it or placing an object on it |
| **Pushable Statue** | Push it onto a Pressure Plate to hold it down |
| **Lever** | Interact to toggle a connected door |
| **Barred Door** | Opens via Lever, Pressure Plate, or defeating all enemies |
| **Locked Door** | Requires a **Dungeon Key** to open permanently |

---

## 👾 Enemies

| Enemy | Behavior |
|---|---|
| **Slime** | Wanders → spots player → chases → attacks → stunned → dies |
| **Goblin** | Patrols → spots player → chases → attacks → stunned → dies |

---

## 🎒 Items

| Item | Effect |
|---|---|
| 🍎 Apple | Restores HP |
| 🧪 Potion | Restores HP |
| 💎 Gem | Collectible |
| 🪨 Stone | Can be thrown at enemies |
| 🗝️ Dungeon Key | Opens Locked Doors |

---

## ⏸️ Pause Menu

Press **Escape** to pause:
- **Inventory** — view collected items
- **Resume** — return to game
- **Quit** — exit to title screen

---

## 💾 Save System

- Opened chests **stay open** after saving and reloading
- **Continue** on the title screen loads your last save
- Player position, HP, and inventory are all saved

---

## 🛠️ Technical Details

| Detail | Info |
|---|---|
| Engine | Godot 4.5 |
| Language | GDScript |
| Resolution | 480×270 (scaled to 1440×810) |
| Renderer | Forward+ |
| Platform | Windows / Web (HTML5) |

### Systems
- **State Machines** — Player (Idle, Walk, Attack, ChargeAttack, Lift, Carry, Stun, Death) & Enemies
- **NPC System** — Patrol & Wander behaviors with branching dialogue
- **Save Manager** — JSON-based save with persistent event tracking
- **Audio Manager** — Dynamic music & SFX
- **Level Manager** — Seamless scene transitions with spawn point system

---

## 📁 Project Structure

```
adventure-time/
├── 00_Globals/       — Autoload managers (Player, Level, Save, Audio)
├── Player/           — Player scene, scripts, states, abilities
├── Enemies/          — Slime, Goblin + shared AI scripts & states
├── GUI/              — HUD, Pause Menu, Dialog System, Inventory
├── Levels/           — Area01 & Dungeon01 scenes + transitions
├── Items/            — Item data resources & pickup scene
├── interactables/    — Treasure Chest, Throwable, Dungeon puzzles
├── npc/              — NPC scenes, behaviors, dialog resources
├── Props/            — Pot, Plant, decorative objects
└── Tile Maps/        — Tile map scenes & sprites
```

---

Made with ❤️ using **Godot 4**
