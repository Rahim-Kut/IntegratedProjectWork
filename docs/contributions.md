# Contribution details

My role in the project was HCI development and integration within a shared Godot simulator. This page records representative implementations and how they relate to collaborative features.

## Individual implementations

| Contribution | What changed | Representative commits |
|---|---|---|
| Initial facility-type popup | Created the scene and dynamic buttons, emitted selection/cancel signals and connected the early HUD selection flow. | `0d73f66`, `53d2777`, `d3fc76f`, `d9a0af4` |
| Popup tests | Added GUT tests for the original popup's structure, generated buttons and signals. | `f5c42a2` |
| Facility-view HUD | Added view-dependent actions, facility information and the return-to-mall interaction. | `4c8cc22` |
| HUD tests | Added tests around the revised HUD state and menu interactions. | `cf02adf` |
| Signal connection fix | Prevented the refreshed menu from reconnecting an existing signal callback. | `6effc19` |
| Single/double-click navigation | Kept single-click information requests and used double-click to enter a facility; added checks for unknown facilities and facilities without an interior view. | `8471372`, `e1f8e75` |
| Base UI theme | Introduced the initial button and popup theme resource. The team subsequently expanded the styling. | `01ae6e4` |

These commits record my implementations. The surrounding systems and later versions of the affected files include work by other contributors.

[The facility selection code example](../examples/facility-selection/README.md) adapts the original selector and test design for standalone use. Its added demo wiring and test assertions are documented separately from the original submission.

## Collaborative features

| Feature | My involvement | Representative commits |
|---|---|---|
| Mall information popup | Co-developed its initial interface and tests. | `824447c`, `feb9615`, `6b6392e` |
| MQTT-backed information flow | Helped connect world clicks, information requests and received data to the interface. | `d80b609`, `a067674`, `4a55a2e`, `2011bf0` |
| Facility creation integration | Helped connect type selection, facility naming and spawner handoff. | `f4ef949`, `937435d`, `5282ba1` |
| Menu and UI design | Co-developed the burger menu and helped integrate visual changes across dialogs and scenes. | `1c029e8`, `4bf28c6`, `7ce001b`, `b060278` |
| Test maintenance | Helped update tests after refactoring and repair MQTT tests. | `7e7c49d`, `023e224` |

The recorded coauthors for these features include Jesper Tsuranov, Milkias Michael Teklesenbet, Sarah Wattar and Taiba Abdul Karim, with Hoda Saleh also credited on facility-spawner integration. Individual collaboration varied by commit.

## Evidence and scope

The examples above were checked against the original repository's local Git history and code changes. Both `Abdulrahim Kuteifan` and `Hilofer04` are my confirmed author identities. The commit identifiers refer to the private course repository, so they serve as provenance references rather than public links.

This case study presents my HCI role. The shared simulator, agent movement, facility rendering, chart implementation, MQTT client and CI workflow have their own contributors. The separate Logistics, Meeple Brain and Pathfinding modules form part of the overall project architecture.
