set board_name "basys3"
set fpga_part "xc7a35tcpg236-1"

# set project
set project_name "picorv32"
set top_level "picorv32_system"
set top_level_tb "tb_${top_level}.v"

# set template directory
set dir_rtl "logical/rtl"
set dir_tb "logical/tb"
set dir_xdc "logical/viv/xdc"
set dir_out "logical/viv/out"
set dir_log "logical/viv/out/log"
set dir_report "logical/viv/res/report"
set dir_bitstream "logical/viv/res"

# set reference directories for source files
set dir_origin [file normalize "."]
puts "INFO: dir_origin is  $dir_origin"


# set file constrains
set filename_xdc "${board_name}_${project_name}.xdc"
set filename_bitstream "${board_name}_${project_name}.bit"