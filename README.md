# Playdate Midi Synth

Simple app to control the playdate via a midi keyboard.

Try out via the [Playdate MIDI Synth Controller Demo Site](https://tedbrakob.github.io/pd-midi-synth-controller/)

## Supported Message Types

* noteon
  * Begins playing a MIDI note
  ```
    {
      type: 'noteon'
      note: number
      velocity: number
    }
  ```
* noteoff
  * Ends a currently playing MIDI note
  ```
    {
      type: 'noteoff'
      note: number
      velocity: number
    }
  ```
* damperpedal
  * Turns the damper pedal on or off. (value = 1 for on, 0 for off)
  ```
    {
      type: 'damperpedal'
      value: 0 | 1
    }
  ```

## Sending Messages

The above messages are sent through the playdate serial message interface in serialized JSON format.

See an example setup in [Playdate MIDI Synth Controller](https://github.com/tedbrakob/pd-midi-synth-controller/blob/main/src/main.ts)

## Build via Make File
- Execute `make` in the project directory to build the project
- Execute `make run` in the project directory to build and launch the project in the Playdate simulator.

## Build in VS Code
- In VS Code, choose Run > Run Without Debugging to launch the project in the Playdate simulator.
- Assign a keyboard shortcut to the Run Without Debugging option to build and run with a keypress.

## Output
- Build files get output to `bin/output.pdx`.