# Server Integration (Octo WoW)

Because **Octo WoW** is based on the **Turtle WoW 1.18.1** client, Atlas-CFM handles its specific custom content by identifying the client version in `CFMAtlas/AtlasServer.lua`.

## Detection Mechanism

When Atlas-CFM initializes, `AtlasCFM.Server.Detect()` checks the client build:

```lua
local build = GetBuildInfo()
if build == "1.18.1" then
    currentDetectedServer = AtlasCFM.Server.TURTLE
    return currentDetectedServer
end
```

By default, an Octo WoW client will register as `AtlasCFM.Server.TURTLE`.

## Handling Server-Specific Data

When creating new items, maps, or quests for Octo WoW, you can ensure they only load on your server by using the `servers` whitelist array.

### Whitelisting Octo WoW (Turtle WoW 1.18.1)

In your data files (like `CFMLoot/Data/Instances/WailingCaverns.lua`), you can add a `servers` table to an entry:

```lua
{
    name = "Custom Octo WoW Item",
    itemID = 99999,
    servers = { "Turtle WoW" }
}
```

Since Octo WoW maps to `"Turtle WoW"` in the detector, this item will appear. 

### Blacklisting
If you want to hide a Vanilla or Turtle WoW item because it was removed on Octo WoW, use the negative syntax:

```lua
{
    name = "Removed Item",
    itemID = 12345,
    servers = { "!Turtle WoW" }
}
```

## Advanced: Adding a Dedicated Octo WoW Constant

If in the future Octo WoW requires a complete separation from Turtle WoW (e.g., custom Realm Name check), you can edit `CFMAtlas/AtlasServer.lua`:

1. Define a constant: `AtlasCFM.Server.OCTOWOW = "Octo WoW"`
2. Add detection logic checking `GetRealmName()` for `"Octo"`.
3. Update data files to explicitly use `servers = { "Octo WoW" }`.

Until then, leveraging the 1.18.1 `"Turtle WoW"` fallback ensures you get the baseline custom content which you can override as needed.
