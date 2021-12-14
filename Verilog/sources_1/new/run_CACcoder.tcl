read_file -format verilog CACcoder_4.v
create_clock -name "clk" -period 10 -waveform { 5 10  }  { clock  }
set_dont_touch_network  [ find clock clk ]
set_input_delay  -max  5  -clock  clk  [get_ports  datain*]
link
compile_ultra
report_area > CACcoder_4.area_rpt
report_power > CACcoder_4.power_rpt

read_file -format verilog CACcoder_5.v
create_clock -name "clk" -period 10 -waveform { 5 10  }  { clock  }
set_dont_touch_network  [ find clock clk ]
set_input_delay  -max  5  -clock  clk  [get_ports  datain*]
link
compile_ultra
report_area > CACcoder_5.area_rpt
report_power > CACcoder_5.power_rpt

read_file -format verilog CACcoder_6.v
create_clock -name "clk" -period 10 -waveform { 5 10  }  { clock  }
set_dont_touch_network  [ find clock clk ]
set_input_delay  -max  5  -clock  clk  [get_ports  datain*]
link
compile_ultra
report_area > CACcoder_6.area_rpt
report_power > CACcoder_6.power_rpt

read_file -format verilog CACcoder_7.v
create_clock -name "clk" -period 10 -waveform { 5 10  }  { clock  }
set_dont_touch_network  [ find clock clk ]
set_input_delay  -max  5  -clock  clk  [get_ports  datain*]
link
compile_ultra
report_area > CACcoder_7.area_rpt
report_power > CACcoder_7.power_rpt

read_file -format verilog CACcoder_8.v
create_clock -name "clk" -period 10 -waveform { 5 10  }  { clock  }
set_dont_touch_network  [ find clock clk ]
set_input_delay  -max  5  -clock  clk  [get_ports  datain*]
link
compile_ultra
report_area > CACcoder_8.area_rpt
report_power > CACcoder_8.power_rpt

read_file -format verilog CACcoder_9.v
create_clock -name "clk" -period 10 -waveform { 5 10  }  { clock  }
set_dont_touch_network  [ find clock clk ]
set_input_delay  -max  5  -clock  clk  [get_ports  datain*]
link
compile_ultra
report_area > CACcoder_9.area_rpt
report_power > CACcoder_9.power_rpt