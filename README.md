# A Low-Power FSM-Based Hardware Intrusion Detection System with Lightweight Decoy Logic for Secure SoC Architectures

## Overview

This project presents a Verilog-based hardware intrusion detection system designed to detect suspicious hardware behavior and protect System-on-Chip (SoC) architectures against hardware Trojan activity.

The design combines Finite State Machine (FSM)-based detection, alert generation, decoy memory redirection, and event-driven clock gating to support low-overhead, real-time hardware security.

## Key Features

- FSM-based runtime intrusion detection
- Detection of abnormal signal patterns and control behavior
- Decoy logic to redirect suspicious memory accesses
- Dummy memory responses using lightweight XOR-based data masking
- Alert generation through LED or interrupt signals
- Event-driven clock gating for dynamic power management
- Configurable 16-bit, 32-bit, and 64-bit implementations

## Architecture

The system consists of the following functional blocks:

1. Signal preprocessing unit
2. Trojan detection logic
3. FSM controller
4. Multiplexer-based memory redirection
5. Decoy memory and data obfuscation logic
6. Alert generation and reset control
7. Clock-gating logic

The FSM follows the states IDLE, MONITORING, TROJAN DETECTED, DECOY ACTIVE, and RESET. When suspicious behavior is detected, the controller activates the decoy mechanism and alerts the system.

## Tools and Technologies

- Verilog HDL
- Xilinx Vivado Design Suite
- Xilinx Artix-7 FPGA
- RTL synthesis and implementation
- Static timing and power analysis

## Reported 32-Bit Implementation Results

| Metric | Reported Result |
|---|---:|
| FPGA platform | Xilinx Artix-7 |
| LUTs | 252 |
| Flip-flops | 103 |
| Slices | 90 |
| BRAM | 1 |
| Total power | 0.349 W |
| Detection-to-response latency | 8.48 ns |
| Multiplexer switching delay | Less than 2 ns |

These values are reported in the research paper and should be interpreted in the context of its stated implementation and measurement setup.

## Evaluation

The paper evaluates the design using the AES-T100 hardware Trojan benchmark from Trust-Hub, including normal, Trojan-activated, and mixed/noise signal traces. The reported implementation results cover resource utilization, power consumption, and timing performance.

## Research Publication

**Title:** A Low-Power FSM-Based Hardware Intrusion Detection System with Lightweight Decoy Logic for Secure SoC Architectures

**Authors:** Bukke Chandrababu Naik, Alok Jiten Rao, and Varun P. Gopi

**Journal:** International Journal of Information Technology, Springer Nature

**DOI:** https://doi.org/10.1007/s41870-025-02942-x

## Repository Structure

```text
fsm-hardware-intrusion-detection/
├── rtl/       # RTL modules
├── tb/        # Testbench files
├── docs/      # Permitted documentation and reports
└── README.md
```

Adapt this structure to the files actually uploaded.

## Author

**Alok Jiten Rao**

Department of Electronics and Telecommunication Engineering  
Veer Surendra Sai University of Technology (VSSUT), Burla

- GitHub: https://github.com/alokjiten
- LinkedIn: https://www.linkedin.com/in/alokjitenrao
