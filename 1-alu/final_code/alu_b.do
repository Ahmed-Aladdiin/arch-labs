vsim -gui work.alu_b -gn=8

radix -bin
add wave *

force -freeze sim:/alu_b/a 11110000 0
force -freeze sim:/alu_b/b 10110000 0
force -freeze sim:/alu_b/sel 00 0
run

force -freeze sim:/alu_b/b 00001011 0
force -freeze sim:/alu_b/sel 01 0
run

force -freeze sim:/alu_b/b 10110000 0
force -freeze sim:/alu_b/sel 10 0
run

force -freeze sim:/alu_b/sel 11 0
run

radix -hex