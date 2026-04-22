if {[file exists work]} {
    vdel -lib work -all
}
vlib work
vmap work work

vlog -work work uart_tx.v
vlog -work work uart_rx.v
vlog -work work uart_tb.v

vsim -wlf uart_tb_run.wlf work.uart_tb

add wave -divider {UART TB}
add wave sim:/uart_tb/clk
add wave sim:/uart_tb/rst_n
add wave sim:/uart_tb/tx_start
add wave sim:/uart_tb/tx_data
add wave sim:/uart_tb/tx_line
add wave sim:/uart_tb/tx_done
add wave sim:/uart_tb/rx_valid
add wave sim:/uart_tb/rx_data

add wave -divider {TX Internals}
add wave sim:/uart_tb/u_tx/state
add wave sim:/uart_tb/u_tx/clk_count
add wave sim:/uart_tb/u_tx/bit_index

add wave -divider {RX Internals}
add wave sim:/uart_tb/u_rx/state
add wave sim:/uart_tb/u_rx/clk_count
add wave sim:/uart_tb/u_rx/bit_index

run -all
wave zoom full
