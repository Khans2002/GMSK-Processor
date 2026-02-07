# GMSK Processor Makefile

# Tools
IVERILOG = iverilog
VVP = vvp
GTKWAVE = gtkwave

# Files
SRC = src/counter_4bit.v
TB = tests/counter_tb.v
OUT = tests/counter.vvp
VCD = tests/counter.vcd

# Targets
all: compile run

compile:
	@echo "Compiling GMSK-P1 Hardware..."
	$(IVERILOG) -o $(OUT) $(SRC) $(TB)

run:
	@echo "Running Simulation..."
	$(VVP) $(OUT)

alu:
	@echo "Compiling GMSK-P1 ALU..."
	$(IVERILOG) -o tests/alu.vvp src/alu.v tests/alu_tb.v
	@echo "Running ALU Simulation..."
	$(VVP) tests/alu.vvp

reg:
	@echo "Compiling GMSK-P1 Register File..."
	$(IVERILOG) -o tests/register_file.vvp src/register_file.v tests/register_file_tb.v
	@echo "Running Register File Simulation..."
	$(VVP) tests/register_file.vvp

conductor:
	@echo "Compiling GMSK-P1 Conductor..."
	$(IVERILOG) -o tests/conductor.vvp src/program_counter.v src/instruction_memory.v tests/conductor_tb.v
	@echo "Running Conductor Simulation..."
	$(VVP) tests/conductor.vvp

core:
	@echo "Compiling GMSK-P1 Core (Grand Integration)..."
	$(IVERILOG) -o tests/gmsk_p1.vvp src/gmsk_p1.v src/alu.v src/register_file.v src/program_counter.v src/instruction_memory.v tests/gmsk_p1_tb.v
	@echo "Running Core Simulation..."
	$(VVP) tests/gmsk_p1.vvp

wave:
	@echo "Opening Waveforms..."
	$(GTKWAVE) $(VCD) &

clean:
	rm -f $(OUT) $(VCD)
