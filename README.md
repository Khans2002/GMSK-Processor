# GMSK-P1: 32-bit RISC-V Processor Core

**GMSK-P1** is a custom-built 32-bit RISC-V processor core designed from scratch in Verilog. It serves as the foundational prototype for the **Sameer OS / Sameer AI Silicon Integration** initiative. This project implements a functional 5-stage-like architecture capable of executing basic RISC-V arithmetic instructions.

## 🚀 Features
*   **Architecture:** 32-bit RISC-V (RV32I Subset).
*   **Core Components:**
    *   **ALU:** 32-bit Arithmetic Logic Unit (ADD, SUB, AND, OR).
    *   **Register File:** 32 x 32-bit Registers (`x0`-`x31`) with dual-read/single-write ports.
    *   **Program Counter (PC):** 32-bit instruction pointer.
    *   **Instruction Memory:** Embedded ROM for program storage.
*   **Instruction Set Support:**
    *   R-Type: `ADD`
    *   I-Type: `ADDI`
*   **Simulation:** Fully verifiable using **Icarus Verilog** and **GTKWave**.

## 📂 Directory Structure
```text
GMSK_Processor/
├── src/                  # Source Code (Verilog)
│   ├── gmsk_p1.v         # Top-Level Core
│   ├── alu.v             # Arithmetic Logic Unit
│   ├── register_file.v   # Register File
│   ├── program_counter.v # PC Logic
│   └── instruction_memory.v
├── tests/                # Testbenches
│   ├── gmsk_p1_tb.v      # Full Core Testbench
│   └── [unit_tests]      # Component Testbenches
├── Makefile              # Build Automation
└── README.md             # Project Documentation
```

## 🛠️ Getting Started

### Prerequisites
*   **Icarus Verilog** (`iverilog`)
*   **GTKWave** (for waveform viewing)

### Building and Running
To simulate the full processor core:

```bash
make core
```

To view the waveforms:

```bash
make wave
```

## 🧠 Architecture Overview
The GMSK-P1 follows a simplified single-cycle architecture:
1.  **Fetch:** The **Program Counter** retrieves the next instruction from **Instruction Memory**.
2.  **Decode:** The instruction is split into Opcode, Register Identifiers (rs1, rs2, rd), and Immediate values.
3.  **Execute:** The **ALU** performs the operation (e.g., `x1 + 1`).
4.  **Writeback:** The result is written back to the **Register File**.

## 📜 License
This project is part of the **Sameer AI Silicon Initiative**.
Copyright © 2026 Gooty Mohammed Sameer Khan.
