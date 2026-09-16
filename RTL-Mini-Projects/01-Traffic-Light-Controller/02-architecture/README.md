# Traffic Light Controller — Architecture

The architecture of the Traffic Light Controller is represented using three complementary views: the RTL block architecture, the FSM state diagram, and the timing flow. Together, these diagrams describe how the controller is structured, how it changes states, and how the traffic-light outputs evolve with clock cycles.

---

## 1. RTL Block Architecture

The block diagram shows the main functional components of the controller and the flow of information between them. The design uses a state register and counter as sequential elements, while next-state logic determines FSM transitions and output logic decodes the current state into traffic-light signals. Timing parameters control the duration of each traffic phase.

![Traffic Light Controller Block Diagram](01-block-diagram.png)

---

## 2. FSM State Diagram

The Traffic Light Controller is implemented as a six-state Moore FSM. Each state represents one traffic-light phase, and the FSM moves through the defined sequence based on the configured cycle count. The outputs depend only on the current state, providing a clear and deterministic control sequence.

The state sequence is:

`NS_GREEN → NS_YELLOW → ALL_RED_TO_EW → EW_GREEN → EW_YELLOW → ALL_RED_TO_NS → NS_GREEN`

![Traffic Light Controller State Diagram](02-state-diagram.png)

---

## 3. Timing Flow

The timing-flow diagram illustrates how the FSM states and traffic-light outputs change with respect to the clock. Each state remains active for its configured number of clock cycles before the counter causes a transition to the next state. The all-red phases provide a clearance interval between changes in traffic direction.

For the default configuration:

- `GREEN_CYCLE = 5` clock cycles
- `YELLOW_CYCLE = 2` clock cycles
- `RED_CYCLE = 1` clock cycle
- Clock period = `10 ns`

![Traffic Light Controller Timing Flow](03-timing-flow.png)

---

## Architecture Summary

```text
State Register + Counter
          ↓
    Next-State Logic
          ↓
       FSM State
          ↓
     Output Logic
          ↓
 Traffic-Light Outputs
