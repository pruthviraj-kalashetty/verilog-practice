<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:020617,25:0F172A,50:1E3A8A,75:0F766E,100:14532D&height=160&section=header&text=TRAFFIC%20LIGHT%20CONTROLLER&fontSize=30&fontColor=FFFFFF&animation=twinkling&fontAlignY=55&desc=MOORE%20FSM%20%E2%80%A2%20SYNTHESIZABLE%20VERILOG%20RTL&descAlignY=78&descSize=14&stroke=22C55E&strokeWidth=1"/>

</div>

---

## 📋 Introduction

<div align="center">

<img src="./assets/traffic-light-animation.gif" width="180">

<br>

**🚦 Moore FSM • Timed State Transitions • Synthesizable Verilog RTL**

</div>

Modern digital systems use sequential logic and finite state machines to control operations that must follow a defined sequence of events. A traffic-light controller is a practical example, where the controller continuously manages signal states and transitions between them according to a defined timing sequence.

This project implements a **synthesizable Traffic-Light Controller in Verilog HDL** using a **3-state Moore Finite State Machine (FSM)** architecture. The outputs depend only on the current FSM state, providing predictable and well-defined signal behavior. The design separates **state memory, next-state logic, and output logic**, following a structured RTL design approach suitable for simulation and synthesis.

<div align="center">

<img src="./assets/fsm-animation.gif" width="520">

<br>

`STATE → TRANSITION → STATE → TRANSITION → STATE`

</div>
