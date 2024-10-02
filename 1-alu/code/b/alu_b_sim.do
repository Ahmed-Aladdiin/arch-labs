vsim work.alu_b
add wave -position insertpoint  \
sim:/alu_b/a \
sim:/alu_b/b \
sim:/alu_b/sel \
sim:/alu_b/f \
sim:/alu_b/cout
force -freeze sim:/alu_b/a 10101100 0
force -freeze sim:/alu_b/b 00111100 0
force -freeze sim:/alu_b/sel 0000 0
run
force -freeze sim:/alu_b/sel 0001 0
run
force -freeze sim:/alu_b/sel 0010 0
run
force -freeze sim:/alu_b/sel 0011 0
run