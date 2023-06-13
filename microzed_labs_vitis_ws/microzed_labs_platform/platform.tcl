# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/pedro/Documents/github/Dissertation/training/microzed_labs_vitis_ws/microzed_labs_platform/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/pedro/Documents/github/Dissertation/training/microzed_labs_vitis_ws/microzed_labs_platform/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {microzed_labs_platform}\
-hw {/home/pedro/Documents/github/Dissertation/training/microzed_labs/lab1/design_1_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {/home/pedro/Documents/github/Dissertation/training/microzed_labs_vitis_ws}

platform write
platform generate -domains 
platform active {microzed_labs_platform}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
domain active {zynq_fsbl}
bsp reload
platform generate
platform generate -domains standalone_domain,zynq_fsbl 
platform generate
