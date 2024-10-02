vsim work.alu_c
add wave -position insertpoint  \
sim:/alu_c/a \
sim:/alu_c/sel \
sim:/alu_c/cin \
sim:/alu_c/f \
sim:/alu_c/cout
force -freeze sim:/alu_c/a 11100010 0
force -freeze sim:/alu_c/sel 0000 0
force -freeze sim:/alu_c/cin 1 0
run
force -freeze sim:/alu_c/sel 0001 0
run
force -freeze sim:/alu_c/sel 0010 0
run
force -freeze sim:/alu_c/sel 0011 0
run