vsim work.adder_sub_1bit

# Add signals to the waveform
add wave *


#make a for loop to test all the combinations
for {set i 0} {$i < 2} {incr i} {
    for {set j 0} {$j < 2} {incr j} {
        for {set k 0} {$k < 2} {incr k} {
            for {set l 0} {$l < 2} {incr l} {
                force -freeze sim:/adder_sub_1bit/a $i
                force -freeze sim:/adder_sub_1bit/b $j
                force -freeze sim:/adder_sub_1bit/cin $k
                force -freeze sim:/adder_sub_1bit/sel $l
                run 50
            }
        }
    }
}