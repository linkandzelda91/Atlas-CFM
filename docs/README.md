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

## Versioning

This project uses [Semantic Versioning (SemVer)](https://semver.org/) in the format `MAJOR.MINOR.PATCH` (e.g., `1.7.0`). When pushing changes, you must bump the version in `Atlas-CFM.toc` according to the following rules:

- **MAJOR (1.x.x):** Increment when making incompatible API changes, major architectural rewrites, or removing core functionality.
- **MINOR (x.7.x):** Increment when adding new features or functionality in a backward-compatible manner (e.g., Auto-Quest sync).
- **PATCH (x.x.1):** Increment when making backward-compatible bug fixes or minor UI tweaks.
