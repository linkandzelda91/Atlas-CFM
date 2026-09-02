# API Environment & Constraints

Atlas-CFM strictly targets the **Turtle WoW 1.18.1 / Octo WoW** addon API. This document outlines the modern extensions provided by the modified client and its integrated libraries. We **do not** support pure Vanilla 1.12.1 clients.

## Vanilla 1.12.1 Baseline
While built upon the 1.12.1 client architecture (Lua 5.0), you do not need to strictly adhere to its vanilla limitations when developing Atlas-CFM. The target environment includes several integrated API backports and custom server features.

---

## Extended Environment (Octo WoW / Turtle WoW)
The server client provides a heavily modernized API environment. You can and should rely on these extensions for all feature development:

### [SuperWoW](https://github.com/balakethelock/SuperWoW/wiki/Features)
A client mod integrated into the environment that expands base API functionalities.
- **Combat Log:** Introduces `RAW_COMBATLOG` containing unstructured text and GUIDs.
- **Unit Tracking:** `UnitExists` now returns the unit's GUID in addition to its presence. Added `UnitPosition()` for tracking friendly units.
- **Spells & Macros:** Added `SpellInfo(spellid)` to query spell details. Macros can now be queried for cooldowns and counts just like items.
- **CVars:** Introduces UI extensions like `NameplateRange` and `FoV`.

### [ClassicAPI](https://github.com/brues-code/ClassicAPI)
A library bundled with the client that actively backports modern WoW API functionalities.
- **Unit Tokens:** Adds support for modern targeting tokens including `focus`, `focustarget`, `nameplateN`, and `markN` (raid markers).
- **Modern Namespaces:** Backports `C_Item`, `C_Timer`, and other modern `C_` namespaces for cleaner data retrieval.
- **Unit Identifiers:** Backports `UnitGUID` allowing for absolute entity identification.
- **Lua Helpers:** Injects modern structural mixins like `CallbackRegistryMixin`, `EventRegistry`, `MathUtil`, and `TableUtil`.

### Server-Specific API Backports (WotLK+)
The Turtle WoW 1.18.1 client features native backports of systems introduced in later expansions, such as:
- **Quest Tracking:** Functions like `QueryQuestsCompleted()` and `GetQuestsCompleted()` are available natively, allowing addons to request the character's full completed quest history directly from the server.

## Guidelines for Atlas-CFM
1. **Strict Dependency:** Assume SuperWoW, ClassicAPI, and TW 1.18.1 features are always present. Do **not** write fallback code or graceful degradation paths for pure 1.12.1.
2. **Modern Usage:** Prefer `UnitGUID` over `UnitName`, utilize `C_Timer` instead of creating `OnUpdate` frames for simple delays, and leverage `C_` namespaces where applicable.
