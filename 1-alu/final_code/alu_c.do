vsim -gui work.alu_c -gn=8

radix -bin
add wave *

force -freeze sim:/alu_c/a 11110000 0
force -freeze sim:/alu_c/sel 00 0
run

force -freeze sim:/alu_c/sel 01 0
run

force -freeze sim:/alu_c/cin 0 0
force -freeze sim:/alu_c/sel 10 0
run

force -freeze sim:/alu_c/cin 1 0
force -freeze sim:/alu_c/sel 10 0
run

force -freeze sim:/alu_c/sel 11 0
run

radix -hex