# Adding Maps and Data

If you are developing custom instances, adding items, or creating new quests for Octo WoW, follow these guidelines to get them displayed in Atlas-CFM.

## 1. Adding a New Instance Map

1. **Place the Texture:**
   Add your map textures to `Images/[MapName]/`.
2. **Register the Map:**
   Open the localization data (e.g., `Locales/enUS/MapData.lua`) to register the map's display name.
3. **Configure Atlas:**
   Add the map coordinates, dropdown classification, and configuration to `CFMAtlas/AtlasConfig.lua`.

## 2. Adding Boss Loot

Loot tables are primarily found in `CFMLoot/Data/Instances/`.

Create or edit a `.lua` file for your instance. Use this structure:

```lua
AtlasCFM.Loot.Data.Instances["CustomInstance"] = {
    Name = "Custom Instance Name",
    Bosses = {
        {
            Name = "Boss 1",
            Items = {
                { itemID = 10001, dropRate = "15%", servers = { "Turtle WoW" } },
                { itemID = 10002, dropRate = "5%" }
            }
        }
    }
}
```
*Note: Make sure to include the file in `CFMLoot/LootInit.xml` if creating a new file.*

## 3. Adding Quests

Quests are linked in the quest databases typically driven by locale strings and map connections.

1. Ensure the quest ID exists on the Octo WoW server.
2. In the quest lists, tag the quest for your specific map. 
3. If the quest is restricted to Octo WoW, use the `servers` table to limit its visibility so standard Vanilla clients won't see invalid quest IDs.

## Translation & Localization

Atlas-CFM handles translation via the `Locales/` folder. Always make sure you add your English base strings to `Locales/enUS/` (e.g., `MapData.lua`, `Bosses.lua`). The system will gracefully fall back to `enUS` if you don't supply strings for `deDE`, `esES`, etc.
