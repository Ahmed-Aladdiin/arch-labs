vsim work.adder -gn=8

radix -bin

add wave *

force -freeze sim:/adder/a 01010101 0
force -freeze sim:/adder/b 11000101 0
force -freeze sim:/adder/cin 0 0
force -freeze sim:/adder/sel 0 0
run

force -freeze sim:/adder/a 00010101 0
force -freeze sim:/adder/b 11000110 0
force -freeze sim:/adder/cin 1 0
force -freeze sim:/adder/sel 0 0
run

force -freeze sim:/adder/a 11010101 0
force -freeze sim:/adder/b 10100101 0
force -freeze sim:/adder/cin 0 0
force -freeze sim:/adder/sel 1 0
run