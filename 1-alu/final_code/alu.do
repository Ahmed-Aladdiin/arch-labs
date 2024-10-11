vsim work.alu -gn=8

radix -bin
add wave *

# Test alu_a
## A
force -freeze sim:/alu/a 11110000 0
force -freeze sim:/alu/b 10110000 0
force -freeze sim:/alu/cin 0 0
force -freeze sim:/alu/sel 0000 0
run 

## A + 1
force -freeze sim:/alu/cin 1 0
run

## A + B
force -freeze sim:/alu/cin 0 0
force -freeze sim:/alu/sel 0001 0
run 

## A + B + 1
force -freeze sim:/alu/cin 1 0
run

## A - B - 1
force -freeze sim:/alu/sel 0010 0
force -freeze sim:/alu/cin 0 0
run 

## A - B
force -freeze sim:/alu/cin 1 0
run 

## A - 1
force -freeze sim:/alu/sel 0011 0
force -freeze sim:/alu/cin 0 0
run 

## B
force -freeze sim:/alu/sel 0011 0
force -freeze sim:/alu/cin 1 0
run 

# Test alu_b
force -freeze sim:/alu/a 11110000 0
force -freeze sim:/alu/b 10110000 0
force -freeze sim:/alu/cin x 0
force -freeze sim:/alu/sel 0100 0
run

force -freeze sim:/alu/b 00001011 0
force -freeze sim:/alu/sel 0101 0
run

force -freeze sim:/alu/b 10110000 0
force -freeze sim:/alu/sel 0110 0
run

force -freeze sim:/alu/sel 0111 0
run

# Test alu_c
force -freeze sim:/alu/sel 1000 0
run

force -freeze sim:/alu/sel 1001 0
run

force -freeze sim:/alu/cin 0 0
force -freeze sim:/alu/sel 1010 0
run

force -freeze sim:/alu/cin 1 0
force -freeze sim:/alu/sel 1010 0
run

force -freeze sim:/alu/sel 1011 0
run

# Test alu_d
force -freeze sim:/alu/sel 1100 0
run

force -freeze sim:/alu/sel 1101 0
run

force -freeze sim:/alu/cin 0 0
force -freeze sim:/alu/sel 1110 0
run

force -freeze sim:/alu/cin 1 0
force -freeze sim:/alu/sel 1110 0
run

force -freeze sim:/alu/sel 1111 0
run

radix -hex