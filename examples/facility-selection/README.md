# Facility selection example

A standalone Godot adaptation of my initial facility/room selection feature from the Integrated Project Work simulator. It demonstrates generated selection buttons, signals carrying the selected tile and type, and cancellation behavior.

## Run

Open `project.godot` in Godot 4.5.1, then run the project. Click **Choose facility type** and select an option. The application reports the selected type and tile.

The example uses Godot's built-in controls and sample data. It runs independently of the original simulator and MQTT back-end modules.

## Tests

Install GUT 9.5.0 into this example's `addons/gut` directory using Godot's AssetLib. From this directory, run:

```sh
godot --headless --import --quit
godot --headless -s addons/gut/gut_cmdln.gd -gdir=res://test/unit -gexit
```

The tests check selection payloads, replacing options when the popup reopens, and cancellation without selection. The included GitHub Actions workflow is configured to run this example's tests automatically when the showcase is published.

Verified locally with Godot 4.5.1 and GUT 9.5.0: **3 tests and 11 assertions passed**. The main scene also started successfully in headless mode. The original simulator's full test suite was not rerun as part of this example.

## Provenance

The selector is based on my original commits `53d2777`, `d3fc76f`, `d9a0af4` and `f5c42a2` in the private simulator repository. The test design is based on the popup tests I introduced in `f5c42a2`.

For this standalone adaptation, the paths and scene layout were simplified, types were added, tile data is copied when opened, and old options are removed immediately during refresh. The small application around the popup, extended assertions and example CI workflow were added for this showcase. They are separate from the original course submission.
