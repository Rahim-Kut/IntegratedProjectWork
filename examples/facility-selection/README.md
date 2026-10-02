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

The tests check selection payloads, replacing options when the popup reopens, and cancellation without selection. The included GitHub Actions workflow runs this example's tests automatically on pushes and pull requests.

Verified locally with Godot 4.5.1 and GUT 9.5.0: **3 tests and 11 assertions passed**. The main scene also started successfully in headless mode. The original simulator's full test suite was not rerun as part of this example.

## Original feature and adaptations

The selector and test design are adapted from the initial room-type popup and tests I implemented for the simulator. Paths and scene layout were simplified, and typing, tile copying and option refresh were improved. The surrounding demo application, extended test assertions and CI workflow were added for this showcase.
