read_file -format verilog coder_2_2.v
create_clock -name "clk" -period 10 -waveform { 5 10  }  { clock  }
set_dont_touch_network  [ find clock clk ]
set_input_delay  -max  5  -clock  clk  [get_ports  datain*]
link
compile_ultra
report_area > coder_2_2.area_rpt
report_power > coder_2_2.power_rpt

read_file -format verilog coder_2_7.v
create_clock -name "clk" -period 10 -waveform { 5 10  }  { clock  }
set_dont_touch_network  [ find clock clk ]
set_input_delay  -max  5  -clock  clk  [get_ports  datain*]
link
compile_ultra
report_area > coder_2_7.area_rpt
report_power > coder_2_7.power_rpt

read_file -format verilog coder_3_2.v
create_clock -name "clk" -period 10 -waveform { 5 10  }  { clock  }
set_dont_touch_network  [ find clock clk ]
set_input_delay  -max  5  -clock  clk  [get_ports  datain*]
link
compile_ultra
report_area > coder_3_2.area_rpt
report_power > coder_3_2.power_rpt

read_file -format verilog coder_3_6.v
create_clock -name "clk" -period 10 -waveform { 5 10  }  { clock  }
set_dont_touch_network  [ find clock clk ]
set_input_delay  -max  5  -clock  clk  [get_ports  datain*]
link
compile_ultra
report_area > coder_3_6.area_rpt
report_power > coder_3_6.power_rpt

read_file -format verilog coder_4_2.v
create_clock -name "clk" -period 10 -waveform { 5 10  }  { clock  }
set_dont_touch_network  [ find clock clk ]
set_input_delay  -max  5  -clock  clk  [get_ports  datain*]
link
compile_ultra
report_area > coder_4_2.area_rpt
report_power > coder_4_2.power_rpt

read_file -format verilog coder_4_5.v
create_clock -name "clk" -period 10 -waveform { 5 10  }  { clock  }
set_dont_touch_network  [ find clock clk ]
set_input_delay  -max  5  -clock  clk  [get_ports  datain*]
link
compile_ultra
report_area > coder_4_5.area_rpt
report_power > coder_4_5.power_rpt

read_file -format verilog coder_5_2.v
create_clock -name "clk" -period 10 -waveform { 5 10  }  { clock  }
set_dont_touch_network  [ find clock clk ]
set_input_delay  -max  5  -clock  clk  [get_ports  datain*]
link
compile_ultra
report_area > coder_5_2.area_rpt
report_power > coder_5_2.power_rpt

read_file -format verilog coder_5_4.v
create_clock -name "clk" -period 10 -waveform { 5 10  }  { clock  }
set_dont_touch_network  [ find clock clk ]
set_input_delay  -max  5  -clock  clk  [get_ports  datain*]
link
compile_ultra
report_area > coder_5_4.area_rpt
report_power > coder_5_4.power_rpt

read_file -format verilog coder_6_2.v
create_clock -name "clk" -period 10 -waveform { 5 10  }  { clock  }
set_dont_touch_network  [ find clock clk ]
set_input_delay  -max  5  -clock  clk  [get_ports  datain*]
link
compile_ultra
report_area > coder_6_2.area_rpt
report_power > coder_6_2.power_rpt

read_file -format verilog coder_6_3.v
create_clock -name "clk" -period 10 -waveform { 5 10  }  { clock  }
set_dont_touch_network  [ find clock clk ]
set_input_delay  -max  5  -clock  clk  [get_ports  datain*]
link
compile_ultra
report_area > coder_6_3.area_rpt
report_power > coder_6_3.power_rpt

read_file -format verilog coder_7_2.v
create_clock -name "clk" -period 10 -waveform { 5 10  }  { clock  }
set_dont_touch_network  [ find clock clk ]
set_input_delay  -max  5  -clock  clk  [get_ports  datain*]
link
compile_ultra
report_area > coder_7_2.area_rpt
report_power > coder_7_2.power_rpt

read_file -format verilog coder_8_1.v
create_clock -name "clk" -period 10 -waveform { 5 10  }  { clock  }
set_dont_touch_network  [ find clock clk ]
set_input_delay  -max  5  -clock  clk  [get_ports  datain*]
link
compile_ultra
report_area > coder_8_1.area_rpt
report_power > coder_8_1.power_rpt