
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2$
create_project: 2default:default2
00:00:092default:default2
00:00:092default:default2
1345.4412default:default2
0.0232default:default2
16392default:default2
20462default:defaultZ17-722h px� 
�
Command: %s
1870*	planAhead2�
pread_checkpoint -auto_incremental -incremental /home/ubuntu/labs/lab8/lab8.srcs/utils_1/imports/synth_1/Echo.dcp2default:defaultZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2U
A/home/ubuntu/labs/lab8/lab8.srcs/utils_1/imports/synth_1/Echo.dcp2default:defaultZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
q
Command: %s
53*	vivadotcl2@
,synth_design -top Top -part xc7a100tcsg324-12default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-349h px� 
W
Loading part %s157*device2$
xc7a100tcsg324-12default:defaultZ21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
�
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
42default:defaultZ8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
`
#Helper process launched with PID %s4824*oasys2
791272default:defaultZ8-7075h px� 
�
%s*synth2�
�Starting RTL Elaboration : Time (s): cpu = 00:00:06 ; elapsed = 00:00:07 . Memory (MB): peak = 2009.406 ; gain = 378.770 ; free physical = 720 ; free virtual = 1126
2default:defaulth px� 
�
synthesizing module '%s'%s4497*oasys2
Top2default:default2
 2default:default2R
</home/ubuntu/labs/lab8/lab8.srcs/sources_1/new/top_receive.v2default:default2
12default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
Receive2default:default2
 2default:default2N
8/home/ubuntu/labs/lab8/lab8.srcs/sources_1/new/receive.v2default:default2
12default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Receive2default:default2
 2default:default2
02default:default2
12default:default2N
8/home/ubuntu/labs/lab8/lab8.srcs/sources_1/new/receive.v2default:default2
12default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
Segment2default:default2
 2default:default2N
8/home/ubuntu/labs/lab8/lab8.srcs/sources_1/new/segment.v2default:default2
12default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Segment2default:default2
 2default:default2
02default:default2
12default:default2N
8/home/ubuntu/labs/lab8/lab8.srcs/sources_1/new/segment.v2default:default2
12default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Top2default:default2
 2default:default2
02default:default2
12default:default2R
</home/ubuntu/labs/lab8/lab8.srcs/sources_1/new/top_receive.v2default:default2
12default:default8@Z8-6155h px� 
�
%s*synth2�
�Finished RTL Elaboration : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 2075.375 ; gain = 444.738 ; free physical = 635 ; free virtual = 1041
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 2090.219 ; gain = 459.582 ; free physical = 631 ; free virtual = 1038
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 2090.219 ; gain = 459.582 ; free physical = 631 ; free virtual = 1038
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:00.012default:default2
2090.2192default:default2
0.0002default:default2
6312default:default2
10372default:defaultZ17-722h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2M
7/home/ubuntu/labs/lab8/lab8.srcs/constrs_1/new/send.xdc2default:default8Z20-179h px� 
�
No ports matched '%s'.
584*	planAhead2
sw[0]2default:default2M
7/home/ubuntu/labs/lab8/lab8.srcs/constrs_1/new/send.xdc2default:default2
52default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2M
7/home/ubuntu/labs/lab8/lab8.srcs/constrs_1/new/send.xdc2default:default2
52default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[1]2default:default2M
7/home/ubuntu/labs/lab8/lab8.srcs/constrs_1/new/send.xdc2default:default2
62default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2M
7/home/ubuntu/labs/lab8/lab8.srcs/constrs_1/new/send.xdc2default:default2
62default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[2]2default:default2M
7/home/ubuntu/labs/lab8/lab8.srcs/constrs_1/new/send.xdc2default:default2
72default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2M
7/home/ubuntu/labs/lab8/lab8.srcs/constrs_1/new/send.xdc2default:default2
72default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[3]2default:default2M
7/home/ubuntu/labs/lab8/lab8.srcs/constrs_1/new/send.xdc2default:default2
82default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2M
7/home/ubuntu/labs/lab8/lab8.srcs/constrs_1/new/send.xdc2default:default2
82default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[4]2default:default2M
7/home/ubuntu/labs/lab8/lab8.srcs/constrs_1/new/send.xdc2default:default2
92default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2M
7/home/ubuntu/labs/lab8/lab8.srcs/constrs_1/new/send.xdc2default:default2
92default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[5]2default:default2M
7/home/ubuntu/labs/lab8/lab8.srcs/constrs_1/new/send.xdc2default:default2
102default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2M
7/home/ubuntu/labs/lab8/lab8.srcs/constrs_1/new/send.xdc2default:default2
102default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[6]2default:default2M
7/home/ubuntu/labs/lab8/lab8.srcs/constrs_1/new/send.xdc2default:default2
112default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2M
7/home/ubuntu/labs/lab8/lab8.srcs/constrs_1/new/send.xdc2default:default2
112default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[7]2default:default2M
7/home/ubuntu/labs/lab8/lab8.srcs/constrs_1/new/send.xdc2default:default2
122default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2M
7/home/ubuntu/labs/lab8/lab8.srcs/constrs_1/new/send.xdc2default:default2
122default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
btn2default:default2M
7/home/ubuntu/labs/lab8/lab8.srcs/constrs_1/new/send.xdc2default:default2
252default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2M
7/home/ubuntu/labs/lab8/lab8.srcs/constrs_1/new/send.xdc2default:default2
252default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
	uart_dout2default:default2M
7/home/ubuntu/labs/lab8/lab8.srcs/constrs_1/new/send.xdc2default:default2
282default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2M
7/home/ubuntu/labs/lab8/lab8.srcs/constrs_1/new/send.xdc2default:default2
282default:default8@Z17-55h px�
�
Finished Parsing XDC File [%s]
178*designutils2M
7/home/ubuntu/labs/lab8/lab8.srcs/constrs_1/new/send.xdc2default:default8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2K
7/home/ubuntu/labs/lab8/lab8.srcs/constrs_1/new/send.xdc2default:default2)
.Xil/Top_propImpl.xdc2default:defaultZ1-236h px� 
�
Parsing XDC File [%s]
179*designutils2P
:/home/ubuntu/labs/lab8/lab8.srcs/constrs_1/new/receive.xdc2default:default8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2P
:/home/ubuntu/labs/lab8/lab8.srcs/constrs_1/new/receive.xdc2default:default8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2N
:/home/ubuntu/labs/lab8/lab8.srcs/constrs_1/new/receive.xdc2default:default2)
.Xil/Top_propImpl.xdc2default:defaultZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:00.032default:default2
2241.9692default:default2
0.0002default:default2
6212default:default2
10272default:defaultZ17-722h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2
00:00:002default:default2
2241.9692default:default2
0.0002default:default2
6202default:default2
10272default:defaultZ17-722h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Constraint Validation : Time (s): cpu = 00:00:17 ; elapsed = 00:00:19 . Memory (MB): peak = 2241.969 ; gain = 611.332 ; free physical = 620 ; free virtual = 1026
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Loading part: xc7a100tcsg324-1
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:17 ; elapsed = 00:00:19 . Memory (MB): peak = 2241.969 ; gain = 611.332 ; free physical = 620 ; free virtual = 1027
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:17 ; elapsed = 00:00:19 . Memory (MB): peak = 2241.969 ; gain = 611.332 ; free physical = 620 ; free virtual = 1027
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:17 ; elapsed = 00:00:20 . Memory (MB): peak = 2241.969 ; gain = 611.332 ; free physical = 620 ; free virtual = 1027
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   10 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    4 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    3 Bit       Adders := 1     
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               32 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               10 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                8 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                4 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                1 Bit    Registers := 1     
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   10 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 4     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2k
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:20 ; elapsed = 00:00:22 . Memory (MB): peak = 2241.969 ; gain = 611.332 ; free physical = 596 ; free virtual = 1008
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:26 ; elapsed = 00:00:29 . Memory (MB): peak = 2241.969 ; gain = 611.332 ; free physical = 596 ; free virtual = 1007
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Timing Optimization : Time (s): cpu = 00:00:26 ; elapsed = 00:00:29 . Memory (MB): peak = 2241.969 ; gain = 611.332 ; free physical = 596 ; free virtual = 1007
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Technology Mapping : Time (s): cpu = 00:00:26 ; elapsed = 00:00:29 . Memory (MB): peak = 2241.969 ; gain = 611.332 ; free physical = 596 ; free virtual = 1007
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished IO Insertion : Time (s): cpu = 00:00:32 ; elapsed = 00:00:35 . Memory (MB): peak = 2241.969 ; gain = 611.332 ; free physical = 595 ; free virtual = 1007
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:32 ; elapsed = 00:00:35 . Memory (MB): peak = 2241.969 ; gain = 611.332 ; free physical = 595 ; free virtual = 1007
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:32 ; elapsed = 00:00:35 . Memory (MB): peak = 2241.969 ; gain = 611.332 ; free physical = 595 ; free virtual = 1007
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:32 ; elapsed = 00:00:35 . Memory (MB): peak = 2241.969 ; gain = 611.332 ; free physical = 595 ; free virtual = 1007
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:32 ; elapsed = 00:00:35 . Memory (MB): peak = 2241.969 ; gain = 611.332 ; free physical = 595 ; free virtual = 1007
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:32 ; elapsed = 00:00:35 . Memory (MB): peak = 2241.969 ; gain = 611.332 ; free physical = 595 ; free virtual = 1007
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|1     |BUFG   |     1|
2default:defaulth px� 
D
%s*synth2,
|2     |CARRY4 |     8|
2default:defaulth px� 
D
%s*synth2,
|3     |LUT1   |     3|
2default:defaulth px� 
D
%s*synth2,
|4     |LUT2   |     7|
2default:defaulth px� 
D
%s*synth2,
|5     |LUT3   |     7|
2default:defaulth px� 
D
%s*synth2,
|6     |LUT4   |     4|
2default:defaulth px� 
D
%s*synth2,
|7     |LUT5   |     5|
2default:defaulth px� 
D
%s*synth2,
|8     |LUT6   |    31|
2default:defaulth px� 
D
%s*synth2,
|9     |MUXF7  |     4|
2default:defaulth px� 
D
%s*synth2,
|10    |FDRE   |    93|
2default:defaulth px� 
D
%s*synth2,
|11    |FDSE   |     1|
2default:defaulth px� 
D
%s*synth2,
|12    |IBUF   |     3|
2default:defaulth px� 
D
%s*synth2,
|13    |OBUF   |     7|
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:32 ; elapsed = 00:00:35 . Memory (MB): peak = 2241.969 ; gain = 611.332 ; free physical = 595 ; free virtual = 1007
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 1 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Runtime : Time (s): cpu = 00:00:30 ; elapsed = 00:00:33 . Memory (MB): peak = 2241.969 ; gain = 459.582 ; free physical = 595 ; free virtual = 1007
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:32 ; elapsed = 00:00:35 . Memory (MB): peak = 2241.969 ; gain = 611.332 ; free physical = 596 ; free virtual = 1007
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.012default:default2
00:00:002default:default2
2241.9692default:default2
0.0002default:default2
5952default:default2
10072default:defaultZ17-722h px� 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
122default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
2241.9692default:default2
0.0002default:default2
8792default:default2
12902default:defaultZ17-722h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
h
%Synth Design complete | Checksum: %s
562*	vivadotcl2
6d765ae22default:defaultZ4-1430h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
282default:default2
112default:default2
102default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
synth_design: 2default:default2
00:00:412default:default2
00:00:422default:default2
2241.9692default:default2
896.5272default:default2
8792default:default2
12902default:defaultZ17-722h px� 
�
%s peak %s Memory [%s] %s12246*common2 
synth_design2default:default2
Physical2default:default2
PSS2default:default2O
;(MB): overall = 1703.208; main = 1375.334; forked = 352.8812default:defaultZ17-2834h px� 
�
%s peak %s Memory [%s] %s12246*common2 
synth_design2default:default2
Virtual2default:default2
VSS2default:default2P
<(MB): overall = 3231.152; main = 2241.973; forked = 1021.1952default:defaultZ17-2834h px� 
u
%s6*runtcl2Y
ESynthesis results are not added to the cache due to CRITICAL_WARNING
2default:defaulth px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2D
0/home/ubuntu/labs/lab8/lab8.runs/synth_1/Top.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2p
\Executing : report_utilization -file Top_utilization_synth.rpt -pb Top_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Thu Nov 30 23:01:49 20232default:defaultZ17-206h px� 


End Record