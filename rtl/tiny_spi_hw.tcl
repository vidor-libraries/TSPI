# +-----------------------------------
# |
# | tiny_spi "tiny_spi" v1.0
# | Thomas Chou 2010.01.19.18:07:51
# | SPI 8 bits
# |
# | tiny_spi/hdl/tiny_spi.v
# |
# |    ./hdl/tiny_spi.v syn, sim
# |
# +-----------------------------------

package require -exact qsys 16.1

# +-----------------------------------
# | module tiny_spi
# |
set_module_property DESCRIPTION "tiny SPI 8 bits"
set_module_property NAME tiny_spi
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP ipTronix
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME "Tiny SPI"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false
# |
# +-----------------------------------

# +-----------------------------------
# | files
# |
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL tiny_spi
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file tiny_spi.v VERILOG PATH tiny_spi.v TOP_LEVEL_FILE
# |
# +-----------------------------------

# +-----------------------------------
# | parameters
# |
# |
# +-----------------------------------
add_parameter BAUD_WIDTH INTEGER 8
set_parameter_property BAUD_WIDTH DEFAULT_VALUE 8
set_parameter_property BAUD_WIDTH DISPLAY_NAME BAUD_WIDTH
set_parameter_property BAUD_WIDTH UNITS None
set_parameter_property BAUD_WIDTH AFFECTS_GENERATION false
set_parameter_property BAUD_WIDTH HDL_PARAMETER true
add_parameter BAUD_DIV INTEGER 0
set_parameter_property BAUD_DIV DEFAULT_VALUE 0
set_parameter_property BAUD_DIV DISPLAY_NAME BAUD_DIV
set_parameter_property BAUD_DIV UNITS None
set_parameter_property BAUD_DIV AFFECTS_GENERATION false
set_parameter_property BAUD_DIV HDL_PARAMETER true
add_parameter SPI_MODE INTEGER 0
set_parameter_property SPI_MODE DEFAULT_VALUE 0
set_parameter_property SPI_MODE DISPLAY_NAME SPI_MODE
set_parameter_property SPI_MODE UNITS None
set_parameter_property SPI_MODE AFFECTS_GENERATION false
set_parameter_property SPI_MODE HDL_PARAMETER true

# +-----------------------------------
# | display items
# |
# |
# +-----------------------------------

# +-----------------------------------
# | connection point avalon_slave
# |
add_interface avalon_slave avalon end
set_interface_property avalon_slave addressAlignment NATIVE
set_interface_property avalon_slave addressUnits WORDS
set_interface_property avalon_slave associatedClock clk
set_interface_property avalon_slave associatedReset reset
set_interface_property avalon_slave burstOnBurstBoundariesOnly false
set_interface_property avalon_slave explicitAddressSpan 0
set_interface_property avalon_slave holdTime 0
set_interface_property avalon_slave isMemoryDevice false
set_interface_property avalon_slave isNonVolatileStorage false
set_interface_property avalon_slave linewrapBursts false
set_interface_property avalon_slave maximumPendingReadTransactions 0
set_interface_property avalon_slave printableDevice false
set_interface_property avalon_slave readLatency 1
set_interface_property avalon_slave readWaitStates 0
set_interface_property avalon_slave readWaitTime 0
set_interface_property avalon_slave setupTime 0
set_interface_property avalon_slave timingUnits Cycles
set_interface_property avalon_slave writeWaitTime 0

set_interface_property avalon_slave ENABLED true

add_interface_port avalon_slave stb_i chipselect Input 1
add_interface_port avalon_slave we_i write Input 1
add_interface_port avalon_slave dat_i writedata Input 32
add_interface_port avalon_slave adr_i address Input 3
add_interface_port avalon_slave dat_o readdata Output 32
# |
# +-----------------------------------

# +-----------------------------------
# | connection point clk
# |
add_interface clk clock end

set_interface_property clk ENABLED true

add_interface_port clk clk_i clk Input 1
# |
# +-----------------------------------


# +-----------------------------------
# | connection point reset
# |
add_interface reset reset end
set_interface_property reset associatedClock clk
set_interface_property reset synchronousEdges DEASSERT

set_interface_property reset ENABLED true

add_interface_port reset rst_i reset Input 1
# |
# +-----------------------------------

# +-----------------------------------
# | connection point irq
# |
add_interface irq interrupt end
set_interface_property irq associatedAddressablePoint avalon_slave
set_interface_property irq associatedClock clk
set_interface_property irq associatedReset reset
set_interface_property irq ENABLED true

add_interface_port irq int_o irq Output 1
# |
# +-----------------------------------

# +-----------------------------------
# | connection point spi
# |
add_interface spi conduit end

set_interface_property spi ENABLED true

add_interface_port spi MOSI MOSI Output 1
add_interface_port spi SCLK SCLK Output 1
add_interface_port spi MISO MISO Input 1
add_interface_port spi CS CS Output 1
# |
# +-----------------------------------
