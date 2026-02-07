# GMSK Processor Project (Gooty Mohammed Sameer Khan)

## 🚀 Vision
To build a custom, open-source System-on-Chip (SoC) integration for **Sameer OS** and **Sameer AI**. 
The goal is to create silicon that is optimized for our specific OS and AI workloads, moving beyond generic hardware.

## 🧠 The Strategy: Hybrid Approach (Learn -> Adopt)
You asked: *"Are we building from scratch or using open source?"*
**The Answer:** We are doing **BOTH**, in specific stages.

1.  **GMSK-P1 (Current Phase):** We build a tiny processor **from scratch**.
    *   *Why?* To understand *how* it works. If we don't know how an ALU works, we can't fix the open-source one later.
    *   *Analogy:* Learning to change a tire before buying a Ferrari.

2.  **GMSK-V1 (Production Phase):** We will download an **Open Source RISC-V Core** (like `CV32E40P` from OpenHW Group).
    *   *Why?* It is verified, fast, and bug-free.
    *   *Our Job:* We take that core and add our "Sameer AI" accelerators to it.

## 📅 Roadmap
*   **GMSK-P1 (Prototype 1):** 
    *   **Goal:** A simple 32-bit RISC-V Core (RV32I).
    *   **Features:** Basic Integer instructions, fetching from memory, executing simple C programs.
    *   **Platform:** Simulation only (Verilator/Icarus).
*   **GMSK-P2 (Prototype 2):**
    *   **Goal:** Adding "Un-core" components.
    *   **Features:** UART (Serial Console), GPIO (LEDs), maybe a simple Timer.
    *   **Platform:** FPGA (Field Programmable Gate Array) if available, or advanced simulation.
*   **GMSK-V1 (Version 1 - Official):**
    *   **Goal:** The MVP (Minimum Viable Processor).
    *   **Features:** Pipeline optimizations, Basic AI Accelerator (Matrix Multiplication Unit), Booting a tiny OS Kernel.

## 🧠 Architecture: RISC-V
We are choosing **RISC-V** (Reduced Instruction Set Computer - V) because:
1.  **Open Source:** No licensing fees (unlike ARM).
2.  **Extensible:** We can add our own "Sameer AI" instructions.
3.  **Community:** Massive ecosystem of tools and compilers.

## 🛠️ The Digital Workbench (Tools)
We are using professional-grade open-source tools installed on macOS:
*   **Icarus Verilog (`iverilog`):** Compiles our hardware code (Verilog) into a simulation.
*   **GTKWave (`gtkwave`):** "Oscilloscope" for code. Logic Analyzer to see 1s and 0s moving in the chip.
*   **Verilator:** Fast simulation for running software on our chip.
*   **QEMU:** Emulates the full system to test the OS before the chip is ready.

## 📂 Structure
*   `src/`: The source code of the processor (Verilog/SystemVerilog).
*   `docs/`: Datasheets, Architecture Diagrams, and Notes.
*   `tests/`: Verification programs to ensure the processor calculates `1+1=2` correctly.
*   `software/`: The C/Assembly code we will run on the GMSK processor.

---
**Maintained by:** Gooty Mohammed Sameer Khan
**Status:** Initialization
