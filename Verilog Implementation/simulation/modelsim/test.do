onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench_filter/DUT/i_clk
add wave -noupdate -radix unsigned /testbench_filter/DUT/result
add wave -noupdate -radix unsigned /testbench_filter/DUT/signal
add wave -noupdate -color Gold -radix unsigned -childformat {{{/testbench_filter/DUT/tap_dff[7]} -radix unsigned} {{/testbench_filter/DUT/tap_dff[6]} -radix unsigned} {{/testbench_filter/DUT/tap_dff[5]} -radix unsigned} {{/testbench_filter/DUT/tap_dff[4]} -radix unsigned} {{/testbench_filter/DUT/tap_dff[3]} -radix unsigned} {{/testbench_filter/DUT/tap_dff[2]} -radix unsigned} {{/testbench_filter/DUT/tap_dff[1]} -radix unsigned} {{/testbench_filter/DUT/tap_dff[0]} -radix unsigned}} -expand -subitemconfig {{/testbench_filter/DUT/tap_dff[7]} {-color Gold -radix unsigned} {/testbench_filter/DUT/tap_dff[6]} {-color Gold -radix unsigned} {/testbench_filter/DUT/tap_dff[5]} {-color Gold -radix unsigned} {/testbench_filter/DUT/tap_dff[4]} {-color Gold -radix unsigned} {/testbench_filter/DUT/tap_dff[3]} {-color Gold -radix unsigned} {/testbench_filter/DUT/tap_dff[2]} {-color Gold -radix unsigned} {/testbench_filter/DUT/tap_dff[1]} {-color Gold -radix unsigned} {/testbench_filter/DUT/tap_dff[0]} {-color Gold -radix unsigned}} /testbench_filter/DUT/tap_dff
add wave -noupdate -color Magenta -radix unsigned -childformat {{{/testbench_filter/DUT/tap_sums[7]} -radix unsigned} {{/testbench_filter/DUT/tap_sums[6]} -radix unsigned} {{/testbench_filter/DUT/tap_sums[5]} -radix unsigned} {{/testbench_filter/DUT/tap_sums[4]} -radix unsigned} {{/testbench_filter/DUT/tap_sums[3]} -radix unsigned} {{/testbench_filter/DUT/tap_sums[2]} -radix unsigned} {{/testbench_filter/DUT/tap_sums[1]} -radix unsigned} {{/testbench_filter/DUT/tap_sums[0]} -radix unsigned}} -expand -subitemconfig {{/testbench_filter/DUT/tap_sums[7]} {-color Magenta -radix unsigned} {/testbench_filter/DUT/tap_sums[6]} {-color Magenta -radix unsigned} {/testbench_filter/DUT/tap_sums[5]} {-color Magenta -radix unsigned} {/testbench_filter/DUT/tap_sums[4]} {-color Magenta -radix unsigned} {/testbench_filter/DUT/tap_sums[3]} {-color Magenta -radix unsigned} {/testbench_filter/DUT/tap_sums[2]} {-color Magenta -radix unsigned} {/testbench_filter/DUT/tap_sums[1]} {-color Magenta -radix unsigned} {/testbench_filter/DUT/tap_sums[0]} {-color Magenta -radix unsigned}} /testbench_filter/DUT/tap_sums
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {150 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 211
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {150 ns} {550 ns}
