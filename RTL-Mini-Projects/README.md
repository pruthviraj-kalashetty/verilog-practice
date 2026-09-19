<div align="center">

### Synthesizable Verilog RTL • FSM Design • Simulation & Verification

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:0D1117,50:161B22,100:238636&height=120&section=header&text=TRAFFIC%20LIGHT%20CONTROLLER&fontSize=28&fontColor=FFFFFF&animation=fadeIn&fontAlignY=65"/>

<br>

<img src="https://img.shields.io/badge/HDL-Verilog-58A6FF?style=for-the-badge&logo=verilog&logoColor=white"/>
<img src="https://img.shields.io/badge/DESIGN-FSM-8B5CF6?style=for-the-badge"/>
<img src="https://img.shields.io/badge/RTL-Synthesizable-22C55E?style=for-the-badge"/>
<img src="https://img.shields.io/badge/VERIFICATION-Testbench-F0883E?style=for-the-badge"/>

<br><br>

<img src="./assets/traffic-light-animation.gif" width="420">

<br><br>

> **A finite-state-machine based traffic light controller implemented in synthesizable Verilog RTL and verified through simulation.**

<br>

<a href="./03-rtl-tb/traffic_light_controller.v">
<img src="https://img.shields.io/badge/▶%20OPEN%20RTL-1F6FEB?style=for-the-badge"/>
</a>

&nbsp;

<a href="./03-rtl-tb/traffic_light_controller_tb.v">
<img src="https://img.shields.io/badge/🧪%20OPEN%20TESTBENCH-F0883E?style=for-the-badge"/>
</a>

</div>

---

## ⚙️ Design Overview

```text
                 ┌─────────────────────┐
                 │   Traffic Controller │
                 │        FSM           │
                 └──────────┬──────────┘
                            │
          ┌─────────────────┼─────────────────┐
          ↓                 ↓                 ↓
      North/South       Yellow Phase      East/West
         GREEN             ↓                GREEN
          ↓              ALL RED              ↓
       YELLOW               ↓              YELLOW
          └─────────────────┴─────────────────┘

---
```
---
<img src="https://capsule-render.vercel.app/api?type=waving&color=0:0D1117,50:161B22,100:238636&height=120&section=header&text=TRAFFIC%20LIGHT%20CONTROLLER&fontSize=28&fontColor=FFFFFF&animation=fadeIn&fontAlignY=65"/>

<br>

