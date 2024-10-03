# VHDL ALU
This task is a VHDL implementation of an Arithmetic Logic Unit (ALU).

## Contributors

- Ahmed Alaadin
- Adham Hussin

## Overview

The ALU is a fundamental building block of a CPU, performing arithmetic and logical operations. This implementation includes basic operations such as addition, subtraction, and logical AND/OR.

## Design
- alu: The main ALU entity that includes all the operations.
- alu_b: The ALU entity for Part B operations.
- alu_c: The ALU entity for Part C operations.
- alu_d: The ALU entity for Part D operations.
- mux4: A 4-to-1 multiplexer entity used for selecting the part of the ALU to be used.

## Operations

### Part B

- `F = A xor B, Cout = 0`
- `F = A nand B, Cout = 0`
- `F = A or B, Cout = 0`
- `F = Not A, Cout = 0`

### Part C

- `F = Logic shift left A, Cout = shifted bit`
- `F = Rotate left A, Cout = rotated bit`
- `F = Rotate Left A with carry (cin), Cout = rotated bit`
- `F = 0000, Cout = 0`

### Part D

- `F = Logic shift right A, Cout = shifted bit`
- `F = Rotate right A, Cout = rotated bit`
- `F = Rotate right A with carry (cin), Cout = rotated bit`
- `F = Arithmetic Shift A`

## Requirements

- VHDL Compiler
- Simulation Tool (e.g., ModelSim, GHDL)

## Usage

1. Clone the repository.
2. Compile the VHDL files using your preferred VHDL compiler.
3. Run simulations through do files to verify the functionality.

