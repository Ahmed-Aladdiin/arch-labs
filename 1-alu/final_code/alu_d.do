vsim -gui work.alu_d

radix -bin
add wave *

force -freeze sim:/alu_d/a 11110000 0
force -freeze sim:/alu_d/sel 00 0
run

force -freeze sim:/alu_d/sel 01 0
run

force -freeze sim:/alu_d/cin 0 0
force -freeze sim:/alu_d/sel 10 0
run

force -freeze sim:/alu_d/cin 1 0
force -freeze sim:/alu_d/sel 10 0
run

force -freeze sim:/alu_d/sel 11 0
run

radix -hex