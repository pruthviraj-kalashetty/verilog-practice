<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:0D1117,50:161B22,100:238636&height=150&section=header&text=ELEVATOR%20CONTROLLER&fontSize=32&fontColor=FFFFFF&animation=fadeIn&fontAlignY=62"/>

◈ Verilog RTL Design • Seven-State Moore FSM • Digital Control System
<p>
  <img src="https://img.shields.io/badge/PROJECT-RTL%20MINI%20PROJECT-0D1117?style=for-the-badge&labelColor=161B22&color=238636"/>
  <img src="https://img.shields.io/badge/ARCHITECTURE-MOORE%20FSM-0D1117?style=for-the-badge&labelColor=161B22&color=3B82F6"/>
  <img src="https://img.shields.io/badge/HDL-VERILOG-0D1117?style=for-the-badge&labelColor=161B22&color=8B5CF6"/>
  <img src="https://img.shields.io/badge/FLOORS-3-0D1117?style=for-the-badge&labelColor=161B22&color=14B8A6"/>
</p>

A modular RTL implementation of floor requests, elevator movement, door timing, and emergency control.
</div>

📋 Introduction
An elevator controller is a digital control system that coordinates floor requests, movement between floors, door operation, and emergency behavior. It must follow a defined sequence of states and respond predictably to inputs.

This project implements an Elevator Controller using Verilog HDL. Its control logic is organized as a seven-state Moore Finite State Machine (FSM). The design supports three valid floors, upward and downward movement, current-floor requests, a timed door-open interval, and an emergency state that remains active until reset.

The project is divided into RTL modules and testbenches. This structure makes it easier to understand each function, simulate the design, debug behavior, and verify the integrated controller.
📌 Project Summary
Item	Description
Project Type	RTL Mini-Project
Architecture	Seven-state Moore FSM
Design Language	Verilog HDL
Floor Encoding	00 = Floor 0, 01 = Floor 1, 10 = Floor 2
Invalid Encoding	11
Reset	Synchronous, active-high
Door Timing	16 clock cycles
Emergency Behavior	Latched until reset
Simulation	Icarus Verilog
Waveform Viewer	GTKWave


[!NOTE]
The main controller simulation output shared during development shows passing checks for the tested movement scenarios, emergency behavior, reset recovery, invalid requests, current-floor requests, and door closure. Separate submodule tests and synthesis checks should be confirmed before claiming complete verification.

🔌 Interface Specifications
The following table summarizes the interface used in the project context. Confirm each port name and width against the final RTL source before submission.
Port	Direction	Width	Description
clk	Input	1 bit	Master clock
reset	Input	1 bit	Synchronous active-high reset
floor_request	Input	2 bits	Encoded requested floor
emergency_stop	Input	1 bit	Requests emergency stop
move_up	Output	1 bit	Indicates upward movement
move_down	Output	1 bit	Indicates downward movement
door_open	Output	1 bit	Indicates door-open condition
floor_display	Output	2 bits	Current floor in binary encoding
emergency_active	Output	1 bit	Indicates active emergency condition


🏗️ Architecture
The controller uses an FSM to coordinate its operating sequence. Supporting modules separate floor-request handling, door timing, and display decoding from the main control logic.
Block Diagram
 
FSM State Diagram
 
Timing Diagram
 
[!TIP]
Add the final block diagram, FSM state diagram, and timing diagram at the paths above. Make sure each image matches the implemented RTL and finalized requirements.

FSM State Encoding
State	Encoding	Function
IDLE	3'b000	Waits for a floor request
MOVE_UP	3'b001	Controls upward movement
MOVE_DOWN	3'b010	Controls downward movement
DOOR_OPEN	3'b011	Opens the door
DOOR_TIMER	3'b100	Tracks the door-open interval
DOOR_CLOSE	3'b101	Controls door closure
EMERGENCY	3'b110	Holds the controller in emergency mode


The encoding 3'b111 is not assigned to a named state in this state table. Confirm the default-state recovery behavior in the final RTL.
💻 RTL Implementation
The project is organized into four RTL modules:
- Elevator Controller — manages the main FSM and coordinates movement, door operation, and emergency handling.
- Floor Request Handler — handles floor-request information and request acceptance.
- Door Timer — tracks the door-open interval.
- Seven-Segment Display — converts supported floor information into display outputs.
RTL Source Files
Module	File	Responsibility
Main controller	[`01_elevator_controller.v`](./rtl-design/01_elevator_controller.v)	Main FSM and control sequencing
Floor request handler	[`02_floor_request_handler.v`](./rtl-design/02_floor_request_handler.v)	Floor-request handling
Door timer	[`03_door_timer.v`](./rtl-design/03_door_timer.v)	Door-open timing
Seven-segment display	[`04_seven_segment_display.v`](./rtl-design/04_seven_segment_display.v)	Display decoding


Testbench Files
Testbench	File	Purpose
Main controller	[`01_elevator_controller_tb.v`](./testbench/01_elevator_controller_tb.v)	Integrated controller behavior
Floor request handler	[`02_floor_request_handler_tb.v`](./testbench/02_floor_request_handler_tb.v)	Request-handling behavior
Door timer	[`03_door_timer_tb.v`](./testbench/03_door_timer_tb.v)	Timer behavior
Seven-segment display	[`04_seven_segment_display_tb.v`](./testbench/04_seven_segment_display_tb.v)	Display decoding behavior


🧪 Verification Strategy
The main controller testbench is used to check:
- Reset behavior and return to IDLE
- Movement from Floor 0 to Floor 1
- Movement from Floor 0 to Floor 2
- Return movement from Floor 2 to Floor 0
- Movement from Floor 2 to Floor 1
- Emergency-stop activation during movement
- Emergency remaining latched after the stop input is released
- Ignoring new floor requests during emergency mode
- Reset recovery from emergency mode
- Invalid floor requests
- Current-floor requests without movement
- Door timing, door closure, and return to IDLE
Separate testbenches are included for the supporting modules. Run each one and record its actual result before final submission.
📈 Simulation Evidence
Waveform
 
The waveform should show key signals such as clk, reset, floor_request, FSM state, floor display, movement outputs, door status, and emergency status. Add the final waveform screenshot after inspecting the simulation in GTKWave.
RTL Schematic
 
Add a schematic only after generating it from the final RTL using a synthesis or RTL inspection tool. Do not present a placeholder image as a generated schematic.
🧪 Verification & Simulation Results
The table below summarizes the checks shown in the shared main controller simulation output. It does not claim that separate module testbenches or synthesis checks have passed.
Test Case	Scenario	Expected Behavior	Observed Result	Status
TC_01	Reset	Controller returns to IDLE	Reset check passed	✅ PASS
TC_02	Floor 0 → Floor 2	Reaches Floor 2	Destination reached	✅ PASS
TC_03	Floor 2 → Floor 0	Returns to Floor 0	Destination reached	✅ PASS
TC_04	Floor 0 → Floor 1	Reaches Floor 1	Destination reached	✅ PASS
TC_05	Floor 2 → Floor 1	Reaches Floor 1	Destination reached	✅ PASS
TC_06	Emergency during movement	Movement stops; emergency activates	Emergency state confirmed	✅ PASS
TC_07	Emergency input released	Emergency remains latched	Emergency remained active	✅ PASS
TC_08	New request during emergency	New request is ignored	Acceptance disabled	✅ PASS
TC_09	Reset during emergency	Emergency clears; controller returns to IDLE	Reset recovery check passed	✅ PASS
TC_10	Invalid floor request	No movement is initiated	Check passed	✅ PASS
TC_11	Current-floor request	Door opens without movement	Check passed	✅ PASS
TC_12	Door closure	Door closes; controller returns to IDLE	Check passed	✅ PASS


[!IMPORTANT]
Run all three supporting-module testbenches and record their actual results before marking the complete project as fully verified.

🛠️ Simulation and Verification Process
Behavioral simulation is performed using Icarus Verilog (iverilog). The compiled simulation is run with vvp, and the generated waveform can be inspected using GTKWave.

Run the following commands from the 03-rtl-design-and-verification directory, where the rtl-design/ and testbench/ folders are located.
1. Compile the Main Controller and Testbench
iverilog -o elevator_test \
  rtl-design/01_elevator_controller.v \
  rtl-design/02_floor_request_handler.v \
  rtl-design/03_door_timer.v \
  rtl-design/04_seven_segment_display.v \
  testbench/01_elevator_controller_tb.v
2. Run the Simulation
vvp elevator_test
The testbench writes 01_elevator_controller.vcd if its $dumpfile statement uses that filename. Check the testbench for the exact waveform filename.
3. Open the Waveform
gtkwave 01_elevator_controller.vcd
If the VCD file is saved under another name or directory, use that actual path instead.
4. Compile and Run the Supporting Module Testbenches
Floor request handler
iverilog -o floor_request_test \
  rtl-design/02_floor_request_handler.v \
  testbench/02_floor_request_handler_tb.v
vvp floor_request_test
Door timer
iverilog -o door_timer_test \
  rtl-design/03_door_timer.v \
  testbench/03_door_timer_tb.v
vvp door_timer_test
Seven-segment display
iverilog -o seven_segment_test \
  rtl-design/04_seven_segment_display.v \
  testbench/04_seven_segment_display_tb.v
vvp seven_segment_test
If a testbench instantiates additional modules, include those source files in its compile command. Check the module dependencies if compilation reports an unknown module.

📚 Key RTL Concepts Applied
- Moore FSM: Organizes control behavior into named states.
- Sequential Logic: Updates state and registered information on clock edges.
- Request Handling: Processes destination-floor requests.
- Counter-Based Timing: Tracks a fixed door-open interval.
- Emergency Latching: Keeps emergency mode active until reset, as implemented and tested.
- Modular Design: Separates the main controller from supporting logic.
- Functional Verification: Uses testbenches to check expected behavior.
- Waveform Debugging: Helps trace state transitions and signal timing.
💬 Interview Questions
Q: Why is an FSM useful in an elevator controller?
A: It organizes the controller into defined states, making control sequencing easier to design, read, and verify.

Q: What is a Moore FSM?
A: A Moore FSM is a finite state machine whose outputs depend on its current state.

Q: Why use a separate door timer?
A: A separate timer module isolates the timing function and makes it easier to test independently.

Q: Why should an emergency condition remain latched?
A: The controller should not automatically resume normal movement just because the emergency input is released. The reset behavior should follow the design requirements.

Q: How is an invalid floor request represented?
A: The two-bit value 2'b11 is reserved as an invalid floor encoding.

Q: Why use separate module testbenches?
A: They help identify problems in individual modules without relying only on the integrated controller testbench.

Q: How could the design be extended?
A: Possible extensions include a request queue, more floors, door obstruction detection, and additional safety inputs.
⚖️ Design Decisions & Trade-offs
- Moore FSM: Makes state-based control behavior explicit.
- Synchronous active-high reset: Resets the controller in relation to the clock.
- Two-bit floor encoding: Represents three valid floors and one invalid value.
- Fixed door timing: Keeps the initial implementation focused on a predictable timing interval.
- Modular architecture: Improves separation of responsibilities and supports individual module testing.
- Latched emergency mode: Prevents normal operation from resuming until the specified reset behavior occurs.
🚀 Future Improvements
- Add a queue for multiple pending floor requests.
- Extend the controller to support additional floors.
- Add door obstruction detection and safety interlocks.
- Add synchronization for asynchronous external inputs where required.
- Improve automated checking with more self-checking test cases.
- Generate a final RTL schematic and waveform evidence.
- Run synthesis and review warnings from the chosen synthesis tool.
- Expand timing and corner-case verification.
These are potential future improvements, not claims that the features are already implemented.
🔗 Related
Part of the [RTL Mini-Projects](../README.md) collection.

This project develops practical skills in Verilog RTL design, FSM-based control, counters, modular hardware architecture, and simulation-based verification. It provides a foundation for larger digital hardware projects and future RTL design work.
