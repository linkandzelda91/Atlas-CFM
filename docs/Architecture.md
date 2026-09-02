# Architecture Overview

Atlas-CFM is modularized into three main components: `CFMAtlas`, `CFMLoot`, and `CFMQuest`. These components handle mapping, loot tables, and quest tracking, respectively.

## 1. CFMAtlas (The Core Mapping Module)

`CFMAtlas` is the foundation of the addon. It manages:
- **Map Registration & Display:** Loading the correct instance maps, managing dropdowns, and rendering map textures.
- **Server Identification:** Detecting the current client and server (via `AtlasServer.lua`) to serve correct data. Since Octo WoW is based on Turtle WoW 1.18.1, the framework checks the client build `1.18.1` to apply the `AtlasCFM.Server.TURTLE` profile.
- **UI Framework:** Creating the main Atlas frame (`AtlasCFMFrame`), integrating with map markers, coordinates, and `pfUI` compatibility.

### Key Files
- `Atlas.lua`: Core initialization and map changing logic.
- `AtlasServer.lua`: Server detection and fallback inheritance.
- `AtlasMapMarkers.lua`: Managing world map pins.

## 2. CFMLoot (The Loot Browser)

`CFMLoot` is responsible for registering boss loot and profession crafting recipes.
- **Data Structure:** Loot tables are stored in `CFMLoot/Data/`. This includes instance-specific loot (`Instances/`), sets (`Tables/Sets.lua`), and crafting items.
- **UI Integration:** It attaches a loot panel to the bottom of the main Atlas window, which updates dynamically when you select different bosses on the map.
- **Server Specifics:** You can specify whitelist/blacklist rules for items (e.g., items that only exist on Octo WoW or Turtle WoW) directly inside the item tables using the `servers` field.

### Key Files
- `LootUI.lua`: Renders the loot frames.
- `Core/LootBrowserUI.lua`: Handles navigation within the loot tables.

## 3. CFMQuest (The Quest Module)

`CFMQuest` handles linking quests to instances.
- **Quest Data:** Displays which quests can be completed inside an instance, their level requirements, faction restrictions, and rewards.
- **Integration with pfQuest:** Allows users to right-click an item or quest to search the `pfQuest` database directly.

### Key Files
- `QuestLogic.lua`: Determines which quests apply to the current map and filters by character faction/class.
- `QuestUIinAtlas.lua`: Connects the quest module to the Atlas UI sidebar.
