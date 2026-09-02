# Atlas-CFM Documentation

Welcome to the documentation for **Atlas-CFM**, tailored for the **Octo WoW** server (running on the Turtle WoW 1.18.1 client). 

This folder contains technical and development documentation to help you understand the architecture of the addon, how it handles server-specific modifications, and how you can contribute to its data modules (Loot, Quests, Maps).

## Table of Contents

1. [Architecture Overview](Architecture.md)
   - Learn about the split between `CFMAtlas`, `CFMLoot`, and `CFMQuest`.
2. [Server Integration (Octo WoW)](Server_Integration.md)
   - Explains how server detection works in `AtlasServer.lua` and how to leverage `AtlasCFM.Server.TURTLE` for 1.18.1 specific features.
3. [Adding Maps and Data](Adding_Data.md)
   - A guide on adding new instances, quests, and loot tables to the addon.
4. [API Environment & Constraints](API_Environment.md)
   - Outlines vanilla 1.12.1 limitations and utilizing modern API extensions provided by SuperWoW and ClassicAPI.
