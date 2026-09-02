# API Environment & Constraints

Atlas-CFM targets the **World of Warcraft 1.12.1** addon API. This document outlines the constraints of the vanilla environment and the extensions available when developing for modified clients like Octo WoW and Turtle WoW.

## Vanilla 1.12.1 API Constraints
When developing features for Atlas-CFM, you must adhere to the limitations of Lua 5.0 and the original 1.12.1 API:
- **Missing Modern Globals:** `hooksecurefunc`, `select`, and modern table utilities are not natively available in pure 1.12.1.
- **Unit Identification:** Vanilla relies entirely on names (`UnitName`) rather than unique identifiers (GUIDs).
- **Event Limitations:** Combat log parsing requires scraping chat messages; there is no structured combat log event system.

---

## Extended Environment (Octo WoW / Turtle WoW)
Modern private servers often bundle API extensions that give developers more "wiggle room" and modernize the development experience. When writing features that integrate specifically with these servers, Atlas-CFM can leverage the following extensions:

### [SuperWoW](https://github.com/balakethelock/SuperWoW/wiki/Features)
A 1.12.1 client mod that expands base API functionalities.
- **Combat Log:** Introduces `RAW_COMBATLOG` containing unstructured text and GUIDs.
- **Unit Tracking:** `UnitExists` now returns the unit's GUID in addition to its presence. Added `UnitPosition()` for tracking friendly units.
- **Spells & Macros:** Added `SpellInfo(spellid)` to query spell details. Macros can now be queried for cooldowns and counts just like items.
- **CVars:** Introduces UI extensions like `NameplateRange` and `FoV`.

### [ClassicAPI](https://github.com/brues-code/ClassicAPI)
A DLL/AddOn bundle that actively backports modern WoW API functionalities directly into 1.12.1.
- **Unit Tokens:** Adds support for modern targeting tokens including `focus`, `focustarget`, `nameplateN`, and `markN` (raid markers).
- **Modern Namespaces:** Backports `C_Item`, `C_Timer`, and other modern `C_` namespaces for cleaner data retrieval.
- **Unit Identifiers:** Backports `UnitGUID` allowing for absolute entity identification.
- **Lua Helpers:** Injects modern structural mixins like `CallbackRegistryMixin`, `EventRegistry`, `MathUtil`, and `TableUtil`.

## Guidelines for Atlas-CFM
1. **Graceful Degradation:** Features utilizing SuperWoW or ClassicAPI must fail gracefully (or disable themselves) if loaded on a pure 1.12.1 client.
2. **Conditional Execution:** Check for the existence of extended globals (e.g., `if C_Item then ... end` or `if UnitGUID then ... end`) before invoking them.
