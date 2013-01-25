//POVRay-File created by 3d41.ulp v20110101
//G:/CMPSC/RGB Doorlock Eagle Files/Boards/master_board.brd
//11/19/2011 6:32:52 PM

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

#declare global_use_radiosity = on;

#declare global_ambient_mul = 1;
#declare global_ambient_mul_emit = 0;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare e3d_environment = off;

#local cam_x = 0;
#local cam_y = 234;
#local cam_z = -125;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -5;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 180;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#local pcb_wire_bridges = off;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 26;
#local lgt1_pos_y = 39;
#local lgt1_pos_z = 28;
#local lgt1_intense = 0.754493;
#local lgt2_pos_x = -26;
#local lgt2_pos_y = 39;
#local lgt2_pos_z = 28;
#local lgt2_intense = 0.754493;
#local lgt3_pos_x = 26;
#local lgt3_pos_y = 39;
#local lgt3_pos_z = -19;
#local lgt3_intense = 0.754493;
#local lgt4_pos_x = -26;
#local lgt4_pos_y = 39;
#local lgt4_pos_z = -19;
#local lgt4_intense = 0.754493;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 69.850000;
#declare pcb_y_size = 54.610000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(272);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "e3d_tools.inc"
#include "e3d_user.inc"

global_settings{charset utf8}

#if(e3d_environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animation data
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "No/not enough Animation Data available (min. 3 points) (Flight path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "No/not enough Animation Data available (min. 3 points) (View path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-34.925000,0,-27.305000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro MASTER_BOARD(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<0.000000,0.000000><69.850000,0.000000>
<69.850000,0.000000><69.850000,54.610000>
<69.850000,54.610000><0.000000,54.610000>
<0.000000,54.610000><0.000000,0.000000>
texture{col_brd}}
}//End union(PCB)
//Holes(real)/Parts
cylinder{<6.350000,1,5.334000><6.350000,-5,5.334000>1.651000 texture{col_hls}}
//Holes(real)/Board
cylinder{<15.240000,1,50.673000><15.240000,-5,50.673000>1.600000 texture{col_hls}}
cylinder{<66.040000,1,35.560000><66.040000,-5,35.560000>1.600000 texture{col_hls}}
cylinder{<66.040000,1,7.620000><66.040000,-5,7.620000>1.600000 texture{col_hls}}
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_AD5206) #declare global_pack_AD5206=yes; object {IC_DIS_DIP24("","ST",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<32.258000,0.000000,38.100000>}#end		//DIP24 300mil AD5206  DIL24-3
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_DIS_ELKO_3MM5_8MM("",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<38.862000,0.000000,11.684000>}#end		//Elko 3,5mm Pitch, 8mm  Diameter, 11,5mm High C1  E3,5-8
#ifndef(pack_D1) #declare global_pack_D1=yes; object {DIODE_DIS_DO41_102MM_H("1N4004",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<14.224000,0.000000,9.652000>}#end		//Diode DO35 10mm hor. D1 1N4004 DO41-10
#ifndef(pack_D2) #declare global_pack_D2=yes; object {DIODE_DIS_DO41_102MM_H("1N4004",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<24.638000,0.000000,13.716000>}#end		//Diode DO35 10mm hor. D2 1N4004 DO41-10
#ifndef(pack_E_3) #declare global_pack_E_3=yes; object {CON_PH_2X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<64.897000,0.000000,27.940000>}#end		//Header 2,54mm Grid 3Pin 2Row (jumper.lib) E$3  2X03
#ifndef(pack_J1) #declare global_pack_J1=yes; object {CON_PH_1X8()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<32.766000,0.000000,50.800000>}#end		//Header 2,54mm Grid 8Pin 1Row (jumper.lib) J1  1X08
#ifndef(pack_J2) #declare global_pack_J2=yes; object {CON_PH_1X6()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<57.150000,0.000000,2.540000>}#end		//Header 2,54mm Grid 6Pin 1Row (jumper.lib) J2  1X06
#ifndef(pack_J3) #declare global_pack_J3=yes; object {CON_PH_1X8()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<54.610000,0.000000,50.800000>}#end		//Header 2,54mm Grid 8Pin 1Row (jumper.lib) J3  1X08
#ifndef(pack_LEDPWR) #declare global_pack_LEDPWR=yes; object {CON_PH_1X6()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<22.098000,0.000000,20.066000>}#end		//Header 2,54mm Grid 6Pin 1Row (jumper.lib) LEDPWR LED PWR 1X06
#ifndef(pack_POWER) #declare global_pack_POWER=yes; object {CON_PH_1X6()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<39.370000,0.000000,2.540000>}#end		//Header 2,54mm Grid 6Pin 1Row (jumper.lib) POWER  1X06
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_DIS_0204_054MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<49.530000,0.000000,10.160000>}#end		//Discrete Resistor 0,15W 5,4MM Grid R1 1k 0204/5
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_DIS_0204_054MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<52.070000,0.000000,10.160000>}#end		//Discrete Resistor 0,15W 5,4MM Grid R2 1k 0204/5
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_DIS_0204_054MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<54.610000,0.000000,10.160000>}#end		//Discrete Resistor 0,15W 5,4MM Grid R3 1k 0204/5
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_DIS_0204_054MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<57.150000,0.000000,10.160000>}#end		//Discrete Resistor 0,15W 5,4MM Grid R4 1k 0204/5
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_DIS_0204_054MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<8.890000,0.000000,31.242000>}#end		//Discrete Resistor 0,15W 5,4MM Grid R5 100 0204/5
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_DIS_0204_054MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<16.510000,0.000000,29.718000>}#end		//Discrete Resistor 0,15W 5,4MM Grid R6 100 0204/5
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_DIS_0207_075MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Green*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<27.178000,0.000000,25.146000>}#end		//Discrete Resistor 0,3W 7,5MM Grid R7 150 0207/7
#ifndef(pack_R8) #declare global_pack_R8=yes; object {RES_DIS_0204_054MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<23.876000,0.000000,29.718000>}#end		//Discrete Resistor 0,15W 5,4MM Grid R8 100 0204/5
#ifndef(pack_R9) #declare global_pack_R9=yes; object {RES_DIS_0204_054MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<31.496000,0.000000,29.718000>}#end		//Discrete Resistor 0,15W 5,4MM Grid R9 100 0204/5
#ifndef(pack_R10) #declare global_pack_R10=yes; object {RES_DIS_0207_075MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Green*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<16.764000,0.000000,25.146000>}#end		//Discrete Resistor 0,3W 7,5MM Grid R10 150 0207/7
#ifndef(pack_R11) #declare global_pack_R11=yes; object {RES_DIS_0204_054MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<64.770000,0.000000,22.860000>}#end		//Discrete Resistor 0,15W 5,4MM Grid R11 1k 0204/5
#ifndef(pack_R12) #declare global_pack_R12=yes; object {RES_DIS_0204_054MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<64.770000,0.000000,19.050000>}#end		//Discrete Resistor 0,15W 5,4MM Grid R12 1k 0204/5
#ifndef(pack_R13) #declare global_pack_R13=yes; object {RES_DIS_0204_054MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<64.770000,0.000000,15.240000>}#end		//Discrete Resistor 0,15W 5,4MM Grid R13 1k 0204/5
#ifndef(pack_R14) #declare global_pack_R14=yes; object {RES_DIS_0204_054MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<64.770000,0.000000,11.430000>}#end		//Discrete Resistor 0,15W 5,4MM Grid R14 1k 0204/5
#ifndef(pack_R15) #declare global_pack_R15=yes; object {RES_DIS_0204_054MM(texture{pigment{Green*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Blue}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<20.320000,0.000000,50.546000>}#end		//Discrete Resistor 0,15W 5,4MM Grid R15 560 0204/5
#ifndef(pack_SV2) #declare global_pack_SV2=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<35.306000,0.000000,21.590000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) SV2 LED-GND MA04-1
#ifndef(pack_SWITCHES) #declare global_pack_SWITCHES=yes; object {CON_PH_1X6()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<57.150000,0.000000,25.400000>}#end		//Header 2,54mm Grid 6Pin 1Row (jumper.lib) SWITCHES SWITCHES 1X06
#ifndef(pack_T1) #declare global_pack_T1=yes; object {TR_TO92_L("2N2222",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<41.402000,0.000000,19.558000>}#end		//TO92 straight vertical T1 2N2222 TO92-CBE
#ifndef(pack_T2) #declare global_pack_T2=yes; object {TR_TO92_L("2N2222",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<48.514000,0.000000,22.606000>}#end		//TO92 straight vertical T2 2N2222 TO92-CBE
#ifndef(pack_T3) #declare global_pack_T3=yes; object {TR_TO92_L("2N2222",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<41.402000,0.000000,26.924000>}#end		//TO92 straight vertical T3 2N2222 TO92-CBE
#ifndef(pack_T4) #declare global_pack_T4=yes; object {TR_TO92_L("2N2222",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<48.514000,0.000000,28.956000>}#end		//TO92 straight vertical T4 2N2222 TO92-CBE
#ifndef(pack_T5) #declare global_pack_T5=yes; object {TR_TO220_3_H("TIP120",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<6.350000,0.000000,16.510000>}#end		//TO220 horizontal straight leads T5 TIP120 TO220AH
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_AD5206) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<18.288000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_AD5206) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<20.828000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_AD5206) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<23.368000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_AD5206) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<25.908000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_AD5206) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<28.448000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_AD5206) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<30.988000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_AD5206) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<33.528000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_AD5206) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<36.068000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_AD5206) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<38.608000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_AD5206) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<41.148000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_AD5206) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<43.688000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_AD5206) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<46.228000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_AD5206) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<46.228000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_AD5206) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<43.688000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_AD5206) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<41.148000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_AD5206) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<38.608000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_AD5206) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<36.068000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_AD5206) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<33.528000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_AD5206) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<30.988000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_AD5206) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<28.448000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_AD5206) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<25.908000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_AD5206) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<23.368000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_AD5206) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<20.828000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_AD5206) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<18.288000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<37.084000,0,11.684000> texture{col_thl}}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<40.640000,0,11.684000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<14.224000,0,4.572000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<14.224000,0,14.732000> texture{col_thl}}
#ifndef(global_pack_D2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<19.558000,0,13.716000> texture{col_thl}}
#ifndef(global_pack_D2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<29.718000,0,13.716000> texture{col_thl}}
#ifndef(global_pack_E_3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<66.167000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_E_3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<63.627000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_E_3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<66.167000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_E_3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<63.627000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_E_3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<66.167000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_E_3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<63.627000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<23.876000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<26.416000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<28.956000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<31.496000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<34.036000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<36.576000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<39.116000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<41.656000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<50.800000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<53.340000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<55.880000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<58.420000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<60.960000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<63.500000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<45.720000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<48.260000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<50.800000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<53.340000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<55.880000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<58.420000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<60.960000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<63.500000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_LEDPWR) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<15.748000,0,20.066000> texture{col_thl}}
#ifndef(global_pack_LEDPWR) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<18.288000,0,20.066000> texture{col_thl}}
#ifndef(global_pack_LEDPWR) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<20.828000,0,20.066000> texture{col_thl}}
#ifndef(global_pack_LEDPWR) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<23.368000,0,20.066000> texture{col_thl}}
#ifndef(global_pack_LEDPWR) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<25.908000,0,20.066000> texture{col_thl}}
#ifndef(global_pack_LEDPWR) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<28.448000,0,20.066000> texture{col_thl}}
#ifndef(global_pack_OUAZ_SS_105D) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<3.835400,0,49.504600> texture{col_thl}}
#ifndef(global_pack_OUAZ_SS_105D) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<11.404600,0,36.855400> texture{col_thl}}
#ifndef(global_pack_OUAZ_SS_105D) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<11.404600,0,39.370000> texture{col_thl}}
#ifndef(global_pack_OUAZ_SS_105D) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<3.835400,0,36.855400> texture{col_thl}}
#ifndef(global_pack_OUAZ_SS_105D) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<3.835400,0,39.370000> texture{col_thl}}
#ifndef(global_pack_POWER) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<33.020000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_POWER) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<35.560000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_POWER) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<38.100000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_POWER) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<40.640000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_POWER) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<43.180000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_POWER) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<45.720000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<49.530000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<49.530000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<52.070000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<52.070000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<54.610000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<54.610000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<57.150000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<57.150000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<6.350000,0,31.242000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<11.430000,0,31.242000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<13.970000,0,29.718000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<19.050000,0,29.718000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<23.368000,0,25.146000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<30.988000,0,25.146000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<21.336000,0,29.718000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<26.416000,0,29.718000> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<28.956000,0,29.718000> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<34.036000,0,29.718000> texture{col_thl}}
#ifndef(global_pack_R10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<12.954000,0,25.146000> texture{col_thl}}
#ifndef(global_pack_R10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<20.574000,0,25.146000> texture{col_thl}}
#ifndef(global_pack_R11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<62.230000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_R11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<67.310000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_R12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<62.230000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_R12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<67.310000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_R13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<62.230000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_R13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<67.310000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_R14) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<62.230000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_R14) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<67.310000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_R15) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<20.320000,0,48.006000> texture{col_thl}}
#ifndef(global_pack_R15) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<20.320000,0,53.086000> texture{col_thl}}
#ifndef(global_pack_SV2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<35.306000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_SV2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<35.306000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_SV2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<35.306000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_SV2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<35.306000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_SWITCHES) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<57.150000,0,31.750000> texture{col_thl}}
#ifndef(global_pack_SWITCHES) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<57.150000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_SWITCHES) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<57.150000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_SWITCHES) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<57.150000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_SWITCHES) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<57.150000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_SWITCHES) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<57.150000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<41.402000,0,19.558000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<38.862000,0,19.558000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<43.942000,0,19.558000> texture{col_thl}}
#ifndef(global_pack_T2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<48.514000,0,22.606000> texture{col_thl}}
#ifndef(global_pack_T2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<45.974000,0,22.606000> texture{col_thl}}
#ifndef(global_pack_T2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<51.054000,0,22.606000> texture{col_thl}}
#ifndef(global_pack_T3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<41.402000,0,26.924000> texture{col_thl}}
#ifndef(global_pack_T3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<38.862000,0,26.924000> texture{col_thl}}
#ifndef(global_pack_T3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<43.942000,0,26.924000> texture{col_thl}}
#ifndef(global_pack_T4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<48.514000,0,28.956000> texture{col_thl}}
#ifndef(global_pack_T4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<45.974000,0,28.956000> texture{col_thl}}
#ifndef(global_pack_T4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<51.054000,0,28.956000> texture{col_thl}}
#ifndef(global_pack_T5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<8.890000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_T5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<6.350000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_T5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<3.810000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<20.066000,0,5.334000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<22.606000,0,5.334000> texture{col_thl}}
#ifndef(global_pack_X3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<25.400000,0,5.334000> texture{col_thl}}
#ifndef(global_pack_X3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<27.940000,0,5.334000> texture{col_thl}}
//Pads/Vias
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<29.718000,0,38.100000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<29.718000,0,43.942000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<32.258000,0,38.100000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<34.036000,0,48.514000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<32.258000,0,4.826000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<16.510000,0,3.810000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<32.004000,0,13.716000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<32.004000,0,7.620000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<17.780000,0,2.540000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<3.810000,0,27.178000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<35.306000,0,46.990000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<34.798000,0,38.100000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<39.878000,0,44.196000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<49.276000,0,41.402000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<1.016000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<1.016000,0.000000,45.466000>}
box{<0,0,-0.406400><17.526000,0.035000,0.406400> rotate<0,90.000000,0> translate<1.016000,0.000000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<1.016000,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<1.016000,-1.535000,48.361600>}
box{<0,0,-0.406400><33.883600,0.035000,0.406400> rotate<0,90.000000,0> translate<1.016000,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<1.016000,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<2.159000,-1.535000,49.504600>}
box{<0,0,-0.406400><1.616446,0.035000,0.406400> rotate<0,-44.997030,0> translate<1.016000,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<2.286000,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<2.286000,-1.535000,35.306000>}
box{<0,0,-0.406400><20.320000,0.035000,0.406400> rotate<0,90.000000,0> translate<2.286000,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<2.286000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<2.286000,0.000000,38.862000>}
box{<0,0,-0.406400><10.160000,0.035000,0.406400> rotate<0,90.000000,0> translate<2.286000,0.000000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<1.016000,0.000000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<2.286000,0.000000,46.736000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,-44.997030,0> translate<1.016000,0.000000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<2.286000,0.000000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<2.794000,0.000000,39.370000>}
box{<0,0,-0.406400><0.718420,0.035000,0.406400> rotate<0,-44.997030,0> translate<2.286000,0.000000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<1.016000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.556000,0.000000,25.400000>}
box{<0,0,-0.406400><3.592102,0.035000,0.406400> rotate<0,44.997030,0> translate<1.016000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.556000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.556000,0.000000,34.290000>}
box{<0,0,-0.406400><4.572000,0.035000,0.406400> rotate<0,90.000000,0> translate<3.556000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.556000,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.556000,-1.535000,34.290000>}
box{<0,0,-0.406400><4.572000,0.035000,0.406400> rotate<0,90.000000,0> translate<3.556000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<1.016000,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.810000,-1.535000,11.684000>}
box{<0,0,-0.406400><3.951313,0.035000,0.406400> rotate<0,44.997030,0> translate<1.016000,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.810000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.810000,-1.535000,22.860000>}
box{<0,0,-0.406400><7.620000,0.035000,0.406400> rotate<0,90.000000,0> translate<3.810000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<2.286000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.810000,0.000000,27.178000>}
box{<0,0,-0.406400><2.155261,0.035000,0.406400> rotate<0,44.997030,0> translate<2.286000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<2.286000,-1.535000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.835400,-1.535000,36.855400>}
box{<0,0,-0.406400><2.191182,0.035000,0.406400> rotate<0,-44.997030,0> translate<2.286000,-1.535000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<2.794000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.835400,0.000000,39.370000>}
box{<0,0,-0.406400><1.041400,0.035000,0.406400> rotate<0,0.000000,0> translate<2.794000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<2.159000,-1.535000,49.504600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.835400,-1.535000,49.504600>}
box{<0,0,-0.406400><1.676400,0.035000,0.406400> rotate<0,0.000000,0> translate<2.159000,-1.535000,49.504600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<2.286000,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<4.318000,-1.535000,12.954000>}
box{<0,0,-0.406400><2.873682,0.035000,0.406400> rotate<0,44.997030,0> translate<2.286000,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.556000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<4.318000,0.000000,35.052000>}
box{<0,0,-0.406400><1.077631,0.035000,0.406400> rotate<0,-44.997030,0> translate<3.556000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.810000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<4.826000,-1.535000,14.224000>}
box{<0,0,-0.406400><1.436841,0.035000,0.406400> rotate<0,44.997030,0> translate<3.810000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.350000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.350000,-1.535000,16.256000>}
box{<0,0,-0.406400><6.604000,0.035000,0.406400> rotate<0,-90.000000,0> translate<6.350000,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.810000,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.350000,-1.535000,24.638000>}
box{<0,0,-0.406400><3.592102,0.035000,0.406400> rotate<0,44.997030,0> translate<3.810000,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.350000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.350000,-1.535000,24.638000>}
box{<0,0,-0.406400><1.778000,0.035000,0.406400> rotate<0,90.000000,0> translate<6.350000,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.556000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.350000,0.000000,26.924000>}
box{<0,0,-0.406400><3.951313,0.035000,0.406400> rotate<0,44.997030,0> translate<3.556000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.556000,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.350000,-1.535000,26.924000>}
box{<0,0,-0.406400><3.951313,0.035000,0.406400> rotate<0,44.997030,0> translate<3.556000,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.350000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.350000,0.000000,31.242000>}
box{<0,0,-0.406400><1.778000,0.035000,0.406400> rotate<0,90.000000,0> translate<6.350000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.350000,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.604000,-1.535000,16.002000>}
box{<0,0,-0.406400><0.359210,0.035000,0.406400> rotate<0,44.997030,0> translate<6.350000,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.604000,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<7.112000,-1.535000,15.494000>}
box{<0,0,-0.406400><0.718420,0.035000,0.406400> rotate<0,44.997030,0> translate<6.604000,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.350000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<7.366000,0.000000,28.448000>}
box{<0,0,-0.406400><1.436841,0.035000,0.406400> rotate<0,44.997030,0> translate<6.350000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.556000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<7.620000,0.000000,25.400000>}
box{<0,0,-0.406400><4.064000,0.035000,0.406400> rotate<0,0.000000,0> translate<3.556000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.350000,0.000000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.128000,0.000000,26.924000>}
box{<0,0,-0.406400><1.778000,0.035000,0.406400> rotate<0,0.000000,0> translate<6.350000,0.000000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.350000,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.128000,-1.535000,26.924000>}
box{<0,0,-0.406400><1.778000,0.035000,0.406400> rotate<0,0.000000,0> translate<6.350000,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.556000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.636000,-1.535000,39.370000>}
box{<0,0,-0.406400><7.184205,0.035000,0.406400> rotate<0,-44.997030,0> translate<3.556000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<7.620000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.890000,0.000000,24.130000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<7.620000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.890000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.890000,0.000000,24.130000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,90.000000,0> translate<8.890000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<7.366000,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.144000,0.000000,28.448000>}
box{<0,0,-0.406400><1.778000,0.035000,0.406400> rotate<0,0.000000,0> translate<7.366000,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.810000,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.398000,-1.535000,11.684000>}
box{<0,0,-0.406400><5.588000,0.035000,0.406400> rotate<0,0.000000,0> translate<3.810000,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<4.318000,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.160000,-1.535000,12.954000>}
box{<0,0,-0.406400><5.842000,0.035000,0.406400> rotate<0,0.000000,0> translate<4.318000,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.144000,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.160000,0.000000,27.432000>}
box{<0,0,-0.406400><1.436841,0.035000,0.406400> rotate<0,44.997030,0> translate<9.144000,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.160000,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.414000,-1.535000,11.938000>}
box{<0,0,-0.406400><1.047269,0.035000,0.406400> rotate<0,75.958743,0> translate<10.160000,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.398000,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.668000,-1.535000,7.620000>}
box{<0,0,-0.406400><4.257816,0.035000,0.406400> rotate<0,72.641181,0> translate<9.398000,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.128000,0.000000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.668000,0.000000,24.384000>}
box{<0,0,-0.406400><3.592102,0.035000,0.406400> rotate<0,44.997030,0> translate<8.128000,0.000000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.128000,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.668000,-1.535000,24.384000>}
box{<0,0,-0.406400><3.592102,0.035000,0.406400> rotate<0,44.997030,0> translate<8.128000,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.668000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.668000,0.000000,24.384000>}
box{<0,0,-0.406400><6.096000,0.035000,0.406400> rotate<0,90.000000,0> translate<10.668000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.668000,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.668000,-1.535000,24.384000>}
box{<0,0,-0.406400><6.096000,0.035000,0.406400> rotate<0,90.000000,0> translate<10.668000,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.668000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.176000,-1.535000,6.350000>}
box{<0,0,-0.406400><1.367832,0.035000,0.406400> rotate<0,68.194090,0> translate<10.668000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.176000,-1.535000,3.302000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.176000,-1.535000,6.350000>}
box{<0,0,-0.406400><3.048000,0.035000,0.406400> rotate<0,90.000000,0> translate<11.176000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<4.826000,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.176000,-1.535000,14.224000>}
box{<0,0,-0.406400><6.350000,0.035000,0.406400> rotate<0,0.000000,0> translate<4.826000,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.636000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.404600,-1.535000,39.370000>}
box{<0,0,-0.406400><2.768600,0.035000,0.406400> rotate<0,0.000000,0> translate<8.636000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.414000,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.684000,-1.535000,7.874000>}
box{<0,0,-0.406400><4.257816,0.035000,0.406400> rotate<0,72.641181,0> translate<10.414000,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.668000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.938000,0.000000,17.018000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<10.668000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.668000,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.938000,-1.535000,17.018000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<10.668000,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.192000,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.192000,-1.535000,11.176000>}
box{<0,0,-0.406400><2.032000,0.035000,0.406400> rotate<0,-90.000000,0> translate<12.192000,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.176000,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.192000,-1.535000,13.208000>}
box{<0,0,-0.406400><1.436841,0.035000,0.406400> rotate<0,44.997030,0> translate<11.176000,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.684000,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.446000,-1.535000,5.842000>}
box{<0,0,-0.406400><2.170177,0.035000,0.406400> rotate<0,69.439372,0> translate<11.684000,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.446000,-1.535000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.446000,-1.535000,5.842000>}
box{<0,0,-0.406400><2.286000,0.035000,0.406400> rotate<0,90.000000,0> translate<12.446000,-1.535000,5.842000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.954000,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.954000,0.000000,25.146000>}
box{<0,0,-0.406400><1.574800,0.035000,0.406400> rotate<0,90.000000,0> translate<12.954000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<4.318000,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.954000,0.000000,35.052000>}
box{<0,0,-0.406400><8.636000,0.035000,0.406400> rotate<0,0.000000,0> translate<4.318000,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.176000,-1.535000,3.302000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.208000,-1.535000,1.270000>}
box{<0,0,-0.406400><2.873682,0.035000,0.406400> rotate<0,44.997030,0> translate<11.176000,-1.535000,3.302000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.160000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.208000,0.000000,27.432000>}
box{<0,0,-0.406400><3.048000,0.035000,0.406400> rotate<0,0.000000,0> translate<10.160000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.446000,-1.535000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.462000,-1.535000,2.540000>}
box{<0,0,-0.406400><1.436841,0.035000,0.406400> rotate<0,44.997030,0> translate<12.446000,-1.535000,3.556000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<7.112000,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.462000,-1.535000,15.494000>}
box{<0,0,-0.406400><6.350000,0.035000,0.406400> rotate<0,0.000000,0> translate<7.112000,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.970000,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.970000,0.000000,29.718000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,90.000000,0> translate<13.970000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.192000,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.224000,-1.535000,4.572000>}
box{<0,0,-0.406400><6.909547,0.035000,0.406400> rotate<0,72.892460,0> translate<12.192000,-1.535000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.462000,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.224000,-1.535000,14.732000>}
box{<0,0,-0.406400><1.077631,0.035000,0.406400> rotate<0,44.997030,0> translate<13.462000,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.954000,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.732000,0.000000,36.576000>}
box{<0,0,-0.406400><2.341764,0.035000,0.406400> rotate<0,-40.598615,0> translate<12.954000,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.430000,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.986000,-1.535000,34.798000>}
box{<0,0,-0.406400><5.028943,0.035000,0.406400> rotate<0,-44.997030,0> translate<11.430000,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.986000,-1.535000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.986000,-1.535000,43.688000>}
box{<0,0,-0.406400><8.890000,0.035000,0.406400> rotate<0,90.000000,0> translate<14.986000,-1.535000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.938000,0.000000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.240000,0.000000,17.018000>}
box{<0,0,-0.406400><3.302000,0.035000,0.406400> rotate<0,0.000000,0> translate<11.938000,0.000000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.938000,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.240000,-1.535000,17.018000>}
box{<0,0,-0.406400><3.302000,0.035000,0.406400> rotate<0,0.000000,0> translate<11.938000,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.954000,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.748000,0.000000,20.066000>}
box{<0,0,-0.406400><4.482506,0.035000,0.406400> rotate<0,51.438205,0> translate<12.954000,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.208000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.900400,0.000000,25.400000>}
box{<0,0,-0.406400><3.373135,0.035000,0.406400> rotate<0,37.040030,0> translate<13.208000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.900400,0.000000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.900400,0.000000,25.400000>}
box{<0,0,-0.406400><2.286000,0.035000,0.406400> rotate<0,90.000000,0> translate<15.900400,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.224000,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.002000,-1.535000,4.572000>}
box{<0,0,-0.406400><1.778000,0.035000,0.406400> rotate<0,0.000000,0> translate<14.224000,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.240000,0.000000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.002000,0.000000,16.256000>}
box{<0,0,-0.406400><1.077631,0.035000,0.406400> rotate<0,44.997030,0> translate<15.240000,0.000000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.256000,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.256000,-1.535000,43.180000>}
box{<0,0,-0.406400><14.986000,0.035000,0.406400> rotate<0,90.000000,0> translate<16.256000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.510000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.510000,0.000000,1.778000>}
box{<0,0,-0.406400><2.032000,0.035000,0.406400> rotate<0,-90.000000,0> translate<16.510000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.002000,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.510000,-1.535000,3.810000>}
box{<0,0,-0.406400><0.915810,0.035000,0.406400> rotate<0,56.306216,0> translate<16.002000,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.240000,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.764000,-1.535000,15.494000>}
box{<0,0,-0.406400><2.155261,0.035000,0.406400> rotate<0,44.997030,0> translate<15.240000,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.764000,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.764000,-1.535000,15.494000>}
box{<0,0,-0.406400><6.858000,0.035000,0.406400> rotate<0,90.000000,0> translate<16.764000,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.986000,-1.535000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.018000,-1.535000,45.466000>}
box{<0,0,-0.406400><2.700057,0.035000,0.406400> rotate<0,-41.183207,0> translate<14.986000,-1.535000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.970000,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.145000,0.000000,26.035000>}
box{<0,0,-0.406400><3.987881,0.035000,0.406400> rotate<0,37.232377,0> translate<13.970000,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.119600,0.000000,24.460200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.145000,0.000000,26.035000>}
box{<0,0,-0.406400><1.575005,0.035000,0.406400> rotate<0,-89.070076,0> translate<17.119600,0.000000,24.460200> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.510000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.526000,0.000000,1.270000>}
box{<0,0,-0.406400><1.135923,0.035000,0.406400> rotate<0,26.563298,0> translate<16.510000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.256000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.526000,-1.535000,44.196000>}
box{<0,0,-0.406400><1.626394,0.035000,0.406400> rotate<0,-38.657257,0> translate<16.256000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.462000,-1.535000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.780000,-1.535000,2.540000>}
box{<0,0,-0.406400><4.318000,0.035000,0.406400> rotate<0,0.000000,0> translate<13.462000,-1.535000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.900400,0.000000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.288000,0.000000,20.066000>}
box{<0,0,-0.406400><3.871813,0.035000,0.406400> rotate<0,51.923791,0> translate<15.900400,0.000000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.288000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.288000,-1.535000,34.290000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,-90.000000,0> translate<18.288000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.732000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.288000,0.000000,39.624000>}
box{<0,0,-0.406400><4.683529,0.035000,0.406400> rotate<0,-40.598615,0> translate<14.732000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.288000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.288000,0.000000,41.910000>}
box{<0,0,-0.406400><2.286000,0.035000,0.406400> rotate<0,90.000000,0> translate<18.288000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.050000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.050000,0.000000,30.988000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,90.000000,0> translate<19.050000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<2.286000,0.000000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.050000,0.000000,46.736000>}
box{<0,0,-0.406400><16.764000,0.035000,0.406400> rotate<0,0.000000,0> translate<2.286000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.256000,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.558000,-1.535000,25.654000>}
box{<0,0,-0.406400><4.165910,0.035000,0.406400> rotate<0,37.566113,0> translate<16.256000,-1.535000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.526000,-1.535000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.812000,-1.535000,44.196000>}
box{<0,0,-0.406400><2.286000,0.035000,0.406400> rotate<0,0.000000,0> translate<17.526000,-1.535000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.764000,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.066000,-1.535000,5.334000>}
box{<0,0,-0.406400><4.669733,0.035000,0.406400> rotate<0,44.997030,0> translate<16.764000,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.050000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.066000,0.000000,32.258000>}
box{<0,0,-0.406400><1.626394,0.035000,0.406400> rotate<0,-51.336803,0> translate<19.050000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.050000,0.000000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.320000,0.000000,48.006000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,-44.997030,0> translate<19.050000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.558000,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.574000,-1.535000,25.146000>}
box{<0,0,-0.406400><1.135923,0.035000,0.406400> rotate<0,26.563298,0> translate<19.558000,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.119600,0.000000,24.460200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.828000,0.000000,20.066000>}
box{<0,0,-0.406400><5.749889,0.035000,0.406400> rotate<0,49.834666,0> translate<17.119600,0.000000,24.460200> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.828000,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.828000,-1.535000,34.290000>}
box{<0,0,-0.406400><4.064000,0.035000,0.406400> rotate<0,90.000000,0> translate<20.828000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.828000,-1.535000,42.926000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.828000,-1.535000,41.910000>}
box{<0,0,-0.406400><1.016000,0.035000,0.406400> rotate<0,-90.000000,0> translate<20.828000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.812000,-1.535000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.828000,-1.535000,42.926000>}
box{<0,0,-0.406400><1.626394,0.035000,0.406400> rotate<0,51.336803,0> translate<19.812000,-1.535000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.828000,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.336000,-1.535000,29.718000>}
box{<0,0,-0.406400><0.718420,0.035000,0.406400> rotate<0,44.997030,0> translate<20.828000,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.288000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.590000,-1.535000,39.624000>}
box{<0,0,-0.406400><4.325464,0.035000,0.406400> rotate<0,-40.233703,0> translate<18.288000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.558000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.844000,0.000000,11.430000>}
box{<0,0,-0.406400><3.232892,0.035000,0.406400> rotate<0,44.997030,0> translate<19.558000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.732000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.352000,0.000000,36.576000>}
box{<0,0,-0.406400><7.620000,0.035000,0.406400> rotate<0,0.000000,0> translate<14.732000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.606000,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.606000,-1.535000,6.858000>}
box{<0,0,-0.406400><1.524000,0.035000,0.406400> rotate<0,90.000000,0> translate<22.606000,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.352000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.860000,0.000000,36.576000>}
box{<0,0,-0.406400><0.508000,0.035000,0.406400> rotate<0,0.000000,0> translate<22.352000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.606000,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.368000,-1.535000,7.620000>}
box{<0,0,-0.406400><1.077631,0.035000,0.406400> rotate<0,-44.997030,0> translate<22.606000,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.368000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.368000,0.000000,25.146000>}
box{<0,0,-0.406400><5.080000,0.035000,0.406400> rotate<0,90.000000,0> translate<23.368000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.368000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.368000,0.000000,34.290000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,-90.000000,0> translate<23.368000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.352000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.368000,0.000000,35.560000>}
box{<0,0,-0.406400><1.436841,0.035000,0.406400> rotate<0,44.997030,0> translate<22.352000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.368000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.368000,-1.535000,41.910000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,90.000000,0> translate<23.368000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.590000,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.130000,-1.535000,39.624000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,0.000000,0> translate<21.590000,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.368000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.130000,-1.535000,39.624000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,53.126596,0> translate<23.368000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.208000,-1.535000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.384000,-1.535000,1.270000>}
box{<0,0,-0.406400><11.176000,0.035000,0.406400> rotate<0,0.000000,0> translate<13.208000,-1.535000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.384000,-1.535000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<25.400000,-1.535000,2.286000>}
box{<0,0,-0.406400><1.436841,0.035000,0.406400> rotate<0,-44.997030,0> translate<24.384000,-1.535000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<25.400000,-1.535000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<25.400000,-1.535000,5.334000>}
box{<0,0,-0.406400><3.048000,0.035000,0.406400> rotate<0,90.000000,0> translate<25.400000,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<25.908000,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<25.908000,-1.535000,24.892000>}
box{<0,0,-0.406400><4.826000,0.035000,0.406400> rotate<0,90.000000,0> translate<25.908000,-1.535000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<25.908000,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<25.908000,-1.535000,34.290000>}
box{<0,0,-0.406400><2.286000,0.035000,0.406400> rotate<0,-90.000000,0> translate<25.908000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.860000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<25.908000,0.000000,39.624000>}
box{<0,0,-0.406400><4.310523,0.035000,0.406400> rotate<0,-44.997030,0> translate<22.860000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<25.908000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<25.908000,0.000000,41.910000>}
box{<0,0,-0.406400><2.286000,0.035000,0.406400> rotate<0,90.000000,0> translate<25.908000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.416000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.416000,0.000000,25.654000>}
box{<0,0,-0.406400><4.064000,0.035000,0.406400> rotate<0,-90.000000,0> translate<26.416000,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.368000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.178000,-1.535000,7.620000>}
box{<0,0,-0.406400><3.810000,0.035000,0.406400> rotate<0,0.000000,0> translate<23.368000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.130000,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.178000,-1.535000,39.624000>}
box{<0,0,-0.406400><3.048000,0.035000,0.406400> rotate<0,0.000000,0> translate<24.130000,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<25.908000,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.178000,-1.535000,39.624000>}
box{<0,0,-0.406400><3.302000,0.035000,0.406400> rotate<0,-67.375688,0> translate<25.908000,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.018000,-1.535000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.178000,-1.535000,45.466000>}
box{<0,0,-0.406400><10.160000,0.035000,0.406400> rotate<0,0.000000,0> translate<17.018000,-1.535000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.940000,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.940000,-1.535000,5.334000>}
box{<0,0,-0.406400><1.524000,0.035000,0.406400> rotate<0,-90.000000,0> translate<27.940000,-1.535000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.178000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.940000,-1.535000,6.858000>}
box{<0,0,-0.406400><1.077631,0.035000,0.406400> rotate<0,44.997030,0> translate<27.178000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<25.908000,-1.535000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.940000,-1.535000,26.924000>}
box{<0,0,-0.406400><2.873682,0.035000,0.406400> rotate<0,-44.997030,0> translate<25.908000,-1.535000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.416000,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<28.448000,0.000000,23.622000>}
box{<0,0,-0.406400><2.873682,0.035000,0.406400> rotate<0,44.997030,0> translate<26.416000,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<28.448000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<28.448000,0.000000,23.622000>}
box{<0,0,-0.406400><3.556000,0.035000,0.406400> rotate<0,90.000000,0> translate<28.448000,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.940000,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<28.448000,-1.535000,27.432000>}
box{<0,0,-0.406400><0.718420,0.035000,0.406400> rotate<0,-44.997030,0> translate<27.940000,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<28.448000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<28.448000,-1.535000,36.830000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,90.000000,0> translate<28.448000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<28.448000,-1.535000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<28.448000,-1.535000,41.910000>}
box{<0,0,-0.406400><2.032000,0.035000,0.406400> rotate<0,-90.000000,0> translate<28.448000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.178000,-1.535000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<28.448000,-1.535000,43.942000>}
box{<0,0,-0.406400><1.983803,0.035000,0.406400> rotate<0,50.191116,0> translate<27.178000,-1.535000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<28.448000,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<28.956000,-1.535000,27.940000>}
box{<0,0,-0.406400><0.718420,0.035000,0.406400> rotate<0,-44.997030,0> translate<28.448000,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<28.956000,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<28.956000,-1.535000,27.940000>}
box{<0,0,-0.406400><1.778000,0.035000,0.406400> rotate<0,-90.000000,0> translate<28.956000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<28.956000,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<28.956000,-1.535000,48.514000>}
box{<0,0,-0.406400><2.286000,0.035000,0.406400> rotate<0,-90.000000,0> translate<28.956000,-1.535000,48.514000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.780000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<29.464000,0.000000,2.540000>}
box{<0,0,-0.406400><11.684000,0.035000,0.406400> rotate<0,0.000000,0> translate<17.780000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<29.464000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<29.718000,0.000000,2.794000>}
box{<0,0,-0.406400><0.359210,0.035000,0.406400> rotate<0,-44.997030,0> translate<29.464000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<29.718000,0.000000,2.794000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<29.718000,0.000000,4.064000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,90.000000,0> translate<29.718000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<28.448000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<29.718000,-1.535000,38.100000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,-44.997030,0> translate<28.448000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<29.718000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<29.718000,0.000000,43.942000>}
box{<0,0,-0.406400><5.842000,0.035000,0.406400> rotate<0,90.000000,0> translate<29.718000,0.000000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.526000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<29.972000,0.000000,1.270000>}
box{<0,0,-0.406400><12.446000,0.035000,0.406400> rotate<0,0.000000,0> translate<17.526000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.860000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<29.972000,0.000000,36.576000>}
box{<0,0,-0.406400><7.112000,0.035000,0.406400> rotate<0,0.000000,0> translate<22.860000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<28.956000,-1.535000,48.514000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.226000,-1.535000,47.244000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<28.956000,-1.535000,48.514000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<29.718000,-1.535000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.734000,-1.535000,45.466000>}
box{<0,0,-0.406400><1.831620,0.035000,0.406400> rotate<0,-56.306216,0> translate<29.718000,-1.535000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<29.972000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.988000,0.000000,2.286000>}
box{<0,0,-0.406400><1.436841,0.035000,0.406400> rotate<0,-44.997030,0> translate<29.972000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.988000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.988000,0.000000,3.556000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,90.000000,0> translate<30.988000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.988000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.988000,0.000000,29.464000>}
box{<0,0,-0.406400><4.318000,0.035000,0.406400> rotate<0,90.000000,0> translate<30.988000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.988000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.988000,0.000000,34.290000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,-90.000000,0> translate<30.988000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<29.972000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.988000,0.000000,35.560000>}
box{<0,0,-0.406400><1.436841,0.035000,0.406400> rotate<0,44.997030,0> translate<29.972000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.988000,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.988000,-1.535000,41.910000>}
box{<0,0,-0.406400><1.524000,0.035000,0.406400> rotate<0,90.000000,0> translate<30.988000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.002000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<31.242000,0.000000,16.256000>}
box{<0,0,-0.406400><15.240000,0.035000,0.406400> rotate<0,0.000000,0> translate<16.002000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.178000,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<31.496000,-1.535000,39.624000>}
box{<0,0,-0.406400><4.318000,0.035000,0.406400> rotate<0,0.000000,0> translate<27.178000,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.988000,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<31.496000,-1.535000,39.624000>}
box{<0,0,-0.406400><0.915810,0.035000,0.406400> rotate<0,56.306216,0> translate<30.988000,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<29.718000,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.004000,0.000000,6.350000>}
box{<0,0,-0.406400><3.232892,0.035000,0.406400> rotate<0,-44.997030,0> translate<29.718000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.004000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.004000,0.000000,7.620000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,90.000000,0> translate<32.004000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<29.718000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.004000,0.000000,13.716000>}
box{<0,0,-0.406400><2.286000,0.035000,0.406400> rotate<0,0.000000,0> translate<29.718000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.004000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.004000,-1.535000,13.716000>}
box{<0,0,-0.406400><6.096000,0.035000,0.406400> rotate<0,90.000000,0> translate<32.004000,-1.535000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.988000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.258000,0.000000,4.826000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,-44.997030,0> translate<30.988000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.258000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.258000,0.000000,43.942000>}
box{<0,0,-0.406400><5.842000,0.035000,0.406400> rotate<0,90.000000,0> translate<32.258000,0.000000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.226000,-1.535000,47.244000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.512000,-1.535000,47.244000>}
box{<0,0,-0.406400><2.286000,0.035000,0.406400> rotate<0,0.000000,0> translate<30.226000,-1.535000,47.244000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.988000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.766000,0.000000,31.242000>}
box{<0,0,-0.406400><2.514472,0.035000,0.406400> rotate<0,-44.997030,0> translate<30.988000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.512000,-1.535000,47.244000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.020000,-1.535000,47.244000>}
box{<0,0,-0.406400><0.508000,0.035000,0.406400> rotate<0,0.000000,0> translate<32.512000,-1.535000,47.244000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.258000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.528000,-1.535000,36.830000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<32.258000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.528000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.528000,-1.535000,36.830000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,90.000000,0> translate<33.528000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.528000,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.528000,-1.535000,41.910000>}
box{<0,0,-0.406400><1.524000,0.035000,0.406400> rotate<0,90.000000,0> translate<33.528000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<31.242000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.782000,0.000000,13.716000>}
box{<0,0,-0.406400><3.592102,0.035000,0.406400> rotate<0,44.997030,0> translate<31.242000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.004000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.782000,0.000000,13.716000>}
box{<0,0,-0.406400><1.778000,0.035000,0.406400> rotate<0,0.000000,0> translate<32.004000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.844000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.036000,0.000000,11.430000>}
box{<0,0,-0.406400><12.192000,0.035000,0.406400> rotate<0,0.000000,0> translate<21.844000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<31.496000,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.036000,-1.535000,39.624000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,0.000000,0> translate<31.496000,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.528000,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.036000,-1.535000,39.624000>}
box{<0,0,-0.406400><0.915810,0.035000,0.406400> rotate<0,56.306216,0> translate<33.528000,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.258000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.036000,0.000000,45.720000>}
box{<0,0,-0.406400><2.514472,0.035000,0.406400> rotate<0,-44.997030,0> translate<32.258000,0.000000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.036000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.036000,0.000000,48.514000>}
box{<0,0,-0.406400><2.794000,0.035000,0.406400> rotate<0,90.000000,0> translate<34.036000,0.000000,48.514000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.036000,-1.535000,48.514000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.036000,-1.535000,50.800000>}
box{<0,0,-0.406400><2.286000,0.035000,0.406400> rotate<0,90.000000,0> translate<34.036000,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.798000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.798000,0.000000,43.688000>}
box{<0,0,-0.406400><5.588000,0.035000,0.406400> rotate<0,90.000000,0> translate<34.798000,0.000000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.782000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.052000,0.000000,13.716000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,0.000000,0> translate<33.782000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.020000,-1.535000,47.244000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.052000,-1.535000,47.244000>}
box{<0,0,-0.406400><2.032000,0.035000,0.406400> rotate<0,0.000000,0> translate<33.020000,-1.535000,47.244000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.306000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.306000,0.000000,25.400000>}
box{<0,0,-0.406400><2.794000,0.035000,0.406400> rotate<0,-90.000000,0> translate<35.306000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.036000,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.306000,-1.535000,30.988000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,-44.997030,0> translate<34.036000,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.798000,0.000000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.306000,0.000000,44.450000>}
box{<0,0,-0.406400><0.915810,0.035000,0.406400> rotate<0,-56.306216,0> translate<34.798000,0.000000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.052000,-1.535000,47.244000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.306000,-1.535000,46.990000>}
box{<0,0,-0.406400><0.359210,0.035000,0.406400> rotate<0,44.997030,0> translate<35.052000,-1.535000,47.244000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.306000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.306000,0.000000,46.990000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,90.000000,0> translate<35.306000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.734000,-1.535000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.560000,-1.535000,45.466000>}
box{<0,0,-0.406400><4.826000,0.035000,0.406400> rotate<0,0.000000,0> translate<30.734000,-1.535000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<29.972000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.814000,0.000000,36.576000>}
box{<0,0,-0.406400><5.842000,0.035000,0.406400> rotate<0,0.000000,0> translate<29.972000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.798000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.068000,-1.535000,37.084000>}
box{<0,0,-0.406400><1.626394,0.035000,0.406400> rotate<0,38.657257,0> translate<34.798000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.068000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.068000,-1.535000,37.084000>}
box{<0,0,-0.406400><2.794000,0.035000,0.406400> rotate<0,90.000000,0> translate<36.068000,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.068000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.068000,0.000000,41.910000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,-90.000000,0> translate<36.068000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.306000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.322000,0.000000,28.956000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,-36.867464,0> translate<35.306000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.560000,-1.535000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.576000,-1.535000,46.228000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,-36.867464,0> translate<35.560000,-1.535000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.576000,-1.535000,46.228000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.576000,-1.535000,50.800000>}
box{<0,0,-0.406400><4.572000,0.035000,0.406400> rotate<0,90.000000,0> translate<36.576000,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.306000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.830000,0.000000,20.320000>}
box{<0,0,-0.406400><1.524000,0.035000,0.406400> rotate<0,0.000000,0> translate<35.306000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.306000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.830000,0.000000,22.860000>}
box{<0,0,-0.406400><1.524000,0.035000,0.406400> rotate<0,0.000000,0> translate<35.306000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.052000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<37.084000,0.000000,11.684000>}
box{<0,0,-0.406400><2.873682,0.035000,0.406400> rotate<0,44.997030,0> translate<35.052000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.306000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<37.084000,0.000000,17.780000>}
box{<0,0,-0.406400><1.778000,0.035000,0.406400> rotate<0,0.000000,0> translate<35.306000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.068000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<37.084000,0.000000,44.196000>}
box{<0,0,-0.406400><1.436841,0.035000,0.406400> rotate<0,-44.997030,0> translate<36.068000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.036000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<38.100000,0.000000,7.366000>}
box{<0,0,-0.406400><5.747364,0.035000,0.406400> rotate<0,44.997030,0> translate<34.036000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<38.100000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<38.100000,0.000000,7.366000>}
box{<0,0,-0.406400><4.826000,0.035000,0.406400> rotate<0,90.000000,0> translate<38.100000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<38.608000,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<38.608000,-1.535000,34.290000>}
box{<0,0,-0.406400><2.286000,0.035000,0.406400> rotate<0,-90.000000,0> translate<38.608000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.814000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<38.608000,0.000000,39.624000>}
box{<0,0,-0.406400><4.134820,0.035000,0.406400> rotate<0,-47.486419,0> translate<35.814000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<38.608000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<38.608000,0.000000,41.910000>}
box{<0,0,-0.406400><2.286000,0.035000,0.406400> rotate<0,90.000000,0> translate<38.608000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<37.084000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<38.862000,0.000000,19.558000>}
box{<0,0,-0.406400><2.514472,0.035000,0.406400> rotate<0,-44.997030,0> translate<37.084000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.830000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<38.862000,0.000000,24.892000>}
box{<0,0,-0.406400><2.873682,0.035000,0.406400> rotate<0,-44.997030,0> translate<36.830000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<38.862000,0.000000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<38.862000,0.000000,26.924000>}
box{<0,0,-0.406400><2.032000,0.035000,0.406400> rotate<0,90.000000,0> translate<38.862000,0.000000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.830000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<39.116000,0.000000,22.606000>}
box{<0,0,-0.406400><3.232892,0.035000,0.406400> rotate<0,-44.997030,0> translate<36.830000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<39.116000,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<39.116000,-1.535000,50.800000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,90.000000,0> translate<39.116000,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.258000,-1.535000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<39.624000,-1.535000,4.826000>}
box{<0,0,-0.406400><7.366000,0.035000,0.406400> rotate<0,0.000000,0> translate<32.258000,-1.535000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.036000,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<39.878000,-1.535000,39.624000>}
box{<0,0,-0.406400><5.842000,0.035000,0.406400> rotate<0,0.000000,0> translate<34.036000,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<38.608000,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<39.878000,-1.535000,39.624000>}
box{<0,0,-0.406400><3.302000,0.035000,0.406400> rotate<0,-67.375688,0> translate<38.608000,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<37.084000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<39.878000,0.000000,44.196000>}
box{<0,0,-0.406400><2.794000,0.035000,0.406400> rotate<0,0.000000,0> translate<37.084000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.814000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.132000,0.000000,36.576000>}
box{<0,0,-0.406400><4.318000,0.035000,0.406400> rotate<0,0.000000,0> translate<35.814000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.640000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.640000,-1.535000,2.540000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,-90.000000,0> translate<40.640000,-1.535000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<39.624000,-1.535000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.640000,-1.535000,3.810000>}
box{<0,0,-0.406400><1.436841,0.035000,0.406400> rotate<0,44.997030,0> translate<39.624000,-1.535000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.640000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.640000,-1.535000,4.064000>}
box{<0,0,-0.406400><0.254000,0.035000,0.406400> rotate<0,90.000000,0> translate<40.640000,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.640000,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.640000,-1.535000,7.366000>}
box{<0,0,-0.406400><3.302000,0.035000,0.406400> rotate<0,90.000000,0> translate<40.640000,-1.535000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.640000,-1.535000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.640000,-1.535000,11.684000>}
box{<0,0,-0.406400><4.318000,0.035000,0.406400> rotate<0,90.000000,0> translate<40.640000,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.148000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.148000,0.000000,34.290000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,-90.000000,0> translate<41.148000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.132000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.148000,0.000000,35.560000>}
box{<0,0,-0.406400><1.436841,0.035000,0.406400> rotate<0,44.997030,0> translate<40.132000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.148000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.148000,-1.535000,41.910000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,90.000000,0> translate<41.148000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.640000,-1.535000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.402000,-1.535000,8.128000>}
box{<0,0,-0.406400><1.077631,0.035000,0.406400> rotate<0,-44.997030,0> translate<40.640000,-1.535000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.402000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.402000,0.000000,16.510000>}
box{<0,0,-0.406400><3.048000,0.035000,0.406400> rotate<0,-90.000000,0> translate<41.402000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.402000,0.000000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.402000,0.000000,25.400000>}
box{<0,0,-0.406400><1.524000,0.035000,0.406400> rotate<0,-90.000000,0> translate<41.402000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.640000,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.656000,-1.535000,5.080000>}
box{<0,0,-0.406400><1.436841,0.035000,0.406400> rotate<0,-44.997030,0> translate<40.640000,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.656000,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.656000,-1.535000,50.800000>}
box{<0,0,-0.406400><2.032000,0.035000,0.406400> rotate<0,90.000000,0> translate<41.656000,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<39.116000,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.910000,-1.535000,45.466000>}
box{<0,0,-0.406400><3.951313,0.035000,0.406400> rotate<0,44.997030,0> translate<39.116000,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.402000,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<42.164000,-1.535000,8.128000>}
box{<0,0,-0.406400><0.762000,0.035000,0.406400> rotate<0,0.000000,0> translate<41.402000,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.402000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<42.418000,0.000000,24.384000>}
box{<0,0,-0.406400><1.436841,0.035000,0.406400> rotate<0,44.997030,0> translate<41.402000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<39.878000,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<42.418000,-1.535000,39.624000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,0.000000,0> translate<39.878000,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.148000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<42.418000,-1.535000,39.624000>}
box{<0,0,-0.406400><1.626394,0.035000,0.406400> rotate<0,38.657257,0> translate<41.148000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.306000,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<42.672000,-1.535000,30.988000>}
box{<0,0,-0.406400><7.366000,0.035000,0.406400> rotate<0,0.000000,0> translate<35.306000,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.656000,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<42.926000,-1.535000,47.498000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<41.656000,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.402000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.180000,0.000000,14.732000>}
box{<0,0,-0.406400><2.514472,0.035000,0.406400> rotate<0,44.997030,0> translate<41.402000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<42.672000,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.688000,-1.535000,32.004000>}
box{<0,0,-0.406400><1.436841,0.035000,0.406400> rotate<0,-44.997030,0> translate<42.672000,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.688000,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.688000,-1.535000,34.290000>}
box{<0,0,-0.406400><2.286000,0.035000,0.406400> rotate<0,90.000000,0> translate<43.688000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.688000,0.000000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.688000,0.000000,41.910000>}
box{<0,0,-0.406400><2.794000,0.035000,0.406400> rotate<0,-90.000000,0> translate<43.688000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<42.164000,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.942000,-1.535000,9.906000>}
box{<0,0,-0.406400><2.514472,0.035000,0.406400> rotate<0,-44.997030,0> translate<42.164000,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.942000,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.942000,-1.535000,15.748000>}
box{<0,0,-0.406400><5.842000,0.035000,0.406400> rotate<0,90.000000,0> translate<43.942000,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.942000,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.942000,-1.535000,19.558000>}
box{<0,0,-0.406400><3.810000,0.035000,0.406400> rotate<0,90.000000,0> translate<43.942000,-1.535000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.942000,-1.535000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.942000,-1.535000,26.924000>}
box{<0,0,-0.406400><7.366000,0.035000,0.406400> rotate<0,90.000000,0> translate<43.942000,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.132000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.942000,0.000000,36.576000>}
box{<0,0,-0.406400><3.810000,0.035000,0.406400> rotate<0,0.000000,0> translate<40.132000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<42.418000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.196000,0.000000,24.384000>}
box{<0,0,-0.406400><1.778000,0.035000,0.406400> rotate<0,0.000000,0> translate<42.418000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.688000,0.000000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.450000,0.000000,45.466000>}
box{<0,0,-0.406400><1.077631,0.035000,0.406400> rotate<0,-44.997030,0> translate<43.688000,0.000000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.196000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<45.466000,0.000000,25.654000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,-44.997030,0> translate<44.196000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.942000,-1.535000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<45.720000,-1.535000,17.526000>}
box{<0,0,-0.406400><2.514472,0.035000,0.406400> rotate<0,-44.997030,0> translate<43.942000,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<45.720000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<45.720000,0.000000,50.800000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,90.000000,0> translate<45.720000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<39.116000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<45.974000,0.000000,22.606000>}
box{<0,0,-0.406400><6.858000,0.035000,0.406400> rotate<0,0.000000,0> translate<39.116000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.322000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<45.974000,0.000000,28.956000>}
box{<0,0,-0.406400><9.652000,0.035000,0.406400> rotate<0,0.000000,0> translate<36.322000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.228000,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.228000,-1.535000,34.290000>}
box{<0,0,-0.406400><2.286000,0.035000,0.406400> rotate<0,-90.000000,0> translate<46.228000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.942000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.228000,0.000000,39.370000>}
box{<0,0,-0.406400><3.610018,0.035000,0.406400> rotate<0,-50.707246,0> translate<43.942000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.228000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.228000,0.000000,41.910000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,90.000000,0> translate<46.228000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<39.878000,-1.535000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.482000,-1.535000,44.196000>}
box{<0,0,-0.406400><6.604000,0.035000,0.406400> rotate<0,0.000000,0> translate<39.878000,-1.535000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.066000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.990000,0.000000,32.258000>}
box{<0,0,-0.406400><26.924000,0.035000,0.406400> rotate<0,0.000000,0> translate<20.066000,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.450000,0.000000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.990000,0.000000,45.466000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,0.000000,0> translate<44.450000,0.000000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.180000,0.000000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<47.498000,0.000000,14.732000>}
box{<0,0,-0.406400><4.318000,0.035000,0.406400> rotate<0,0.000000,0> translate<43.180000,0.000000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<45.720000,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<48.006000,-1.535000,17.526000>}
box{<0,0,-0.406400><2.286000,0.035000,0.406400> rotate<0,0.000000,0> translate<45.720000,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<48.260000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<48.260000,0.000000,50.800000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,90.000000,0> translate<48.260000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<48.514000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<48.514000,0.000000,22.606000>}
box{<0,0,-0.406400><6.096000,0.035000,0.406400> rotate<0,90.000000,0> translate<48.514000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<48.514000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<48.514000,0.000000,27.686000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,-90.000000,0> translate<48.514000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.766000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.022000,0.000000,31.242000>}
box{<0,0,-0.406400><16.256000,0.035000,0.406400> rotate<0,0.000000,0> translate<32.766000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<48.514000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.276000,0.000000,26.924000>}
box{<0,0,-0.406400><1.077631,0.035000,0.406400> rotate<0,44.997030,0> translate<48.514000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.990000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.276000,0.000000,34.290000>}
box{<0,0,-0.406400><3.058565,0.035000,0.406400> rotate<0,-41.630792,0> translate<46.990000,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<42.418000,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.276000,-1.535000,39.624000>}
box{<0,0,-0.406400><6.858000,0.035000,0.406400> rotate<0,0.000000,0> translate<42.418000,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.228000,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.276000,-1.535000,39.624000>}
box{<0,0,-0.406400><4.310523,0.035000,0.406400> rotate<0,-44.997030,0> translate<46.228000,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.482000,-1.535000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.276000,-1.535000,41.402000>}
box{<0,0,-0.406400><3.951313,0.035000,0.406400> rotate<0,44.997030,0> translate<46.482000,-1.535000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.276000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.276000,0.000000,41.402000>}
box{<0,0,-0.406400><7.112000,0.035000,0.406400> rotate<0,90.000000,0> translate<49.276000,0.000000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.530000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.530000,0.000000,7.620000>}
box{<0,0,-0.406400><2.286000,0.035000,0.406400> rotate<0,90.000000,0> translate<49.530000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<47.498000,0.000000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.530000,0.000000,12.700000>}
box{<0,0,-0.406400><2.873682,0.035000,0.406400> rotate<0,44.997030,0> translate<47.498000,0.000000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.320000,0.000000,53.086000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.038000,0.000000,53.086000>}
box{<0,0,-0.406400><29.718000,0.035000,0.406400> rotate<0,0.000000,0> translate<20.320000,0.000000,53.086000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.530000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.800000,0.000000,4.064000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<49.530000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.800000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.800000,0.000000,4.064000>}
box{<0,0,-0.406400><1.524000,0.035000,0.406400> rotate<0,90.000000,0> translate<50.800000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<45.466000,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.800000,0.000000,25.654000>}
box{<0,0,-0.406400><5.334000,0.035000,0.406400> rotate<0,0.000000,0> translate<45.466000,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<45.720000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.800000,0.000000,43.180000>}
box{<0,0,-0.406400><7.184205,0.035000,0.406400> rotate<0,44.997030,0> translate<45.720000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<48.260000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.800000,0.000000,45.720000>}
box{<0,0,-0.406400><3.592102,0.035000,0.406400> rotate<0,44.997030,0> translate<48.260000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<48.006000,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<51.054000,-1.535000,20.320000>}
box{<0,0,-0.406400><4.134820,0.035000,0.406400> rotate<0,-42.507642,0> translate<48.006000,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<51.054000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<51.054000,-1.535000,22.606000>}
box{<0,0,-0.406400><2.286000,0.035000,0.406400> rotate<0,90.000000,0> translate<51.054000,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<51.054000,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<51.054000,-1.535000,28.956000>}
box{<0,0,-0.406400><6.350000,0.035000,0.406400> rotate<0,90.000000,0> translate<51.054000,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.022000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<51.054000,0.000000,33.528000>}
box{<0,0,-0.406400><3.058565,0.035000,0.406400> rotate<0,-48.363269,0> translate<49.022000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.276000,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<51.054000,-1.535000,37.846000>}
box{<0,0,-0.406400><2.514472,0.035000,0.406400> rotate<0,44.997030,0> translate<49.276000,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<51.054000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<51.054000,-1.535000,37.846000>}
box{<0,0,-0.406400><8.890000,0.035000,0.406400> rotate<0,90.000000,0> translate<51.054000,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.990000,0.000000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<51.054000,0.000000,41.402000>}
box{<0,0,-0.406400><5.747364,0.035000,0.406400> rotate<0,44.997030,0> translate<46.990000,0.000000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<51.054000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<51.054000,0.000000,41.402000>}
box{<0,0,-0.406400><7.874000,0.035000,0.406400> rotate<0,90.000000,0> translate<51.054000,0.000000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.276000,0.000000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<51.308000,0.000000,26.924000>}
box{<0,0,-0.406400><2.032000,0.035000,0.406400> rotate<0,0.000000,0> translate<49.276000,0.000000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.038000,0.000000,53.086000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<51.308000,0.000000,53.086000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,0.000000,0> translate<50.038000,0.000000,53.086000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.070000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.070000,0.000000,7.620000>}
box{<0,0,-0.406400><2.286000,0.035000,0.406400> rotate<0,90.000000,0> translate<52.070000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<48.514000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.070000,0.000000,12.700000>}
box{<0,0,-0.406400><5.211644,0.035000,0.406400> rotate<0,46.971834,0> translate<48.514000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.800000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.070000,0.000000,43.180000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,0.000000,0> translate<50.800000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.910000,-1.535000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.070000,-1.535000,45.466000>}
box{<0,0,-0.406400><10.160000,0.035000,0.406400> rotate<0,0.000000,0> translate<41.910000,-1.535000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<51.308000,0.000000,53.086000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.578000,0.000000,53.086000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,0.000000,0> translate<51.308000,0.000000,53.086000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.070000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<53.340000,0.000000,4.064000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<52.070000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<53.340000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<53.340000,0.000000,4.064000>}
box{<0,0,-0.406400><1.524000,0.035000,0.406400> rotate<0,90.000000,0> translate<53.340000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<53.340000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<53.340000,0.000000,17.272000>}
box{<0,0,-0.406400><5.842000,0.035000,0.406400> rotate<0,-90.000000,0> translate<53.340000,0.000000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.800000,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<53.340000,0.000000,23.114000>}
box{<0,0,-0.406400><3.592102,0.035000,0.406400> rotate<0,44.997030,0> translate<50.800000,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.070000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<53.340000,0.000000,41.910000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<52.070000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<53.340000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<53.340000,0.000000,41.910000>}
box{<0,0,-0.406400><15.240000,0.035000,0.406400> rotate<0,90.000000,0> translate<53.340000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.800000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<53.340000,0.000000,45.720000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,0.000000,0> translate<50.800000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.578000,0.000000,53.086000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<53.340000,0.000000,52.324000>}
box{<0,0,-0.406400><1.077631,0.035000,0.406400> rotate<0,44.997030,0> translate<52.578000,0.000000,53.086000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<53.340000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<53.340000,0.000000,52.324000>}
box{<0,0,-0.406400><1.524000,0.035000,0.406400> rotate<0,90.000000,0> translate<53.340000,0.000000,52.324000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.070000,-1.535000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<53.848000,-1.535000,43.688000>}
box{<0,0,-0.406400><2.514472,0.035000,0.406400> rotate<0,44.997030,0> translate<52.070000,-1.535000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<53.848000,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<53.848000,-1.535000,43.688000>}
box{<0,0,-0.406400><20.066000,0.035000,0.406400> rotate<0,90.000000,0> translate<53.848000,-1.535000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.610000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.610000,0.000000,7.620000>}
box{<0,0,-0.406400><2.286000,0.035000,0.406400> rotate<0,90.000000,0> translate<54.610000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.610000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.610000,0.000000,12.700000>}
box{<0,0,-0.406400><3.048000,0.035000,0.406400> rotate<0,-90.000000,0> translate<54.610000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<53.340000,0.000000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.610000,0.000000,15.748000>}
box{<0,0,-0.406400><1.983803,0.035000,0.406400> rotate<0,50.191116,0> translate<53.340000,0.000000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.610000,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.610000,0.000000,18.034000>}
box{<0,0,-0.406400><5.588000,0.035000,0.406400> rotate<0,-90.000000,0> translate<54.610000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<51.308000,0.000000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.610000,0.000000,23.622000>}
box{<0,0,-0.406400><4.669733,0.035000,0.406400> rotate<0,44.997030,0> translate<51.308000,0.000000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<53.340000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.610000,0.000000,44.450000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<53.340000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.610000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.610000,0.000000,44.450000>}
box{<0,0,-0.406400><16.510000,0.035000,0.406400> rotate<0,90.000000,0> translate<54.610000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.864000,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.864000,-1.535000,19.812000>}
box{<0,0,-0.406400><2.794000,0.035000,0.406400> rotate<0,-90.000000,0> translate<54.864000,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<53.848000,-1.535000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.864000,-1.535000,22.606000>}
box{<0,0,-0.406400><1.436841,0.035000,0.406400> rotate<0,44.997030,0> translate<53.848000,-1.535000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.864000,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<55.626000,-1.535000,19.050000>}
box{<0,0,-0.406400><1.077631,0.035000,0.406400> rotate<0,44.997030,0> translate<54.864000,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.610000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<55.880000,0.000000,4.064000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<54.610000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<55.880000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<55.880000,0.000000,4.064000>}
box{<0,0,-0.406400><1.524000,0.035000,0.406400> rotate<0,90.000000,0> translate<55.880000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<53.340000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<55.880000,0.000000,24.130000>}
box{<0,0,-0.406400><3.592102,0.035000,0.406400> rotate<0,44.997030,0> translate<53.340000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.610000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<55.880000,0.000000,26.670000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<54.610000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<55.880000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<55.880000,0.000000,50.800000>}
box{<0,0,-0.406400><5.080000,0.035000,0.406400> rotate<0,90.000000,0> translate<55.880000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.150000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.150000,0.000000,7.620000>}
box{<0,0,-0.406400><2.286000,0.035000,0.406400> rotate<0,90.000000,0> translate<57.150000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.610000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.150000,0.000000,14.986000>}
box{<0,0,-0.406400><3.967607,0.035000,0.406400> rotate<0,50.191116,0> translate<54.610000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.150000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.150000,0.000000,14.986000>}
box{<0,0,-0.406400><2.286000,0.035000,0.406400> rotate<0,90.000000,0> translate<57.150000,0.000000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<55.626000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.150000,-1.535000,19.050000>}
box{<0,0,-0.406400><1.524000,0.035000,0.406400> rotate<0,0.000000,0> translate<55.626000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.150000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.150000,0.000000,19.050000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,90.000000,0> translate<57.150000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<55.880000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.150000,0.000000,24.130000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,0.000000,0> translate<55.880000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<55.880000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.150000,0.000000,26.670000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,0.000000,0> translate<55.880000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<55.880000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.150000,0.000000,44.450000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<55.880000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.150000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.150000,0.000000,44.450000>}
box{<0,0,-0.406400><12.700000,0.035000,0.406400> rotate<0,90.000000,0> translate<57.150000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<42.926000,-1.535000,47.498000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.166000,-1.535000,47.498000>}
box{<0,0,-0.406400><15.240000,0.035000,0.406400> rotate<0,0.000000,0> translate<42.926000,-1.535000,47.498000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.150000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.420000,0.000000,4.064000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<57.150000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.420000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.420000,0.000000,4.064000>}
box{<0,0,-0.406400><1.524000,0.035000,0.406400> rotate<0,90.000000,0> translate<58.420000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.420000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.420000,0.000000,50.800000>}
box{<0,0,-0.406400><3.810000,0.035000,0.406400> rotate<0,90.000000,0> translate<58.420000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.150000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.674000,0.000000,29.210000>}
box{<0,0,-0.406400><1.524000,0.035000,0.406400> rotate<0,0.000000,0> translate<57.150000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.150000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.928000,0.000000,21.590000>}
box{<0,0,-0.406400><1.778000,0.035000,0.406400> rotate<0,0.000000,0> translate<57.150000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.150000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<59.436000,-1.535000,21.590000>}
box{<0,0,-0.406400><2.286000,0.035000,0.406400> rotate<0,0.000000,0> translate<57.150000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<59.690000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<59.690000,0.000000,19.558000>}
box{<0,0,-0.406400><1.778000,0.035000,0.406400> rotate<0,90.000000,0> translate<59.690000,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<59.690000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<59.690000,0.000000,19.812000>}
box{<0,0,-0.406400><0.254000,0.035000,0.406400> rotate<0,90.000000,0> translate<59.690000,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<59.690000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<59.690000,0.000000,19.812000>}
box{<0,0,-0.406400><1.016000,0.035000,0.406400> rotate<0,-90.000000,0> translate<59.690000,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.928000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<59.690000,0.000000,20.828000>}
box{<0,0,-0.406400><1.077631,0.035000,0.406400> rotate<0,44.997030,0> translate<58.928000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.674000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<59.690000,0.000000,30.226000>}
box{<0,0,-0.406400><1.436841,0.035000,0.406400> rotate<0,-44.997030,0> translate<58.674000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<59.690000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<59.690000,0.000000,30.734000>}
box{<0,0,-0.406400><0.508000,0.035000,0.406400> rotate<0,90.000000,0> translate<59.690000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<59.690000,0.000000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<59.690000,0.000000,31.496000>}
box{<0,0,-0.406400><0.762000,0.035000,0.406400> rotate<0,90.000000,0> translate<59.690000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.420000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<59.690000,0.000000,45.720000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<58.420000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<59.690000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<59.690000,0.000000,45.720000>}
box{<0,0,-0.406400><14.224000,0.035000,0.406400> rotate<0,90.000000,0> translate<59.690000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.150000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<60.198000,0.000000,24.130000>}
box{<0,0,-0.406400><3.048000,0.035000,0.406400> rotate<0,0.000000,0> translate<57.150000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<59.436000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<60.452000,-1.535000,22.606000>}
box{<0,0,-0.406400><1.436841,0.035000,0.406400> rotate<0,-44.997030,0> translate<59.436000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.166000,-1.535000,47.498000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<60.452000,-1.535000,45.212000>}
box{<0,0,-0.406400><3.232892,0.035000,0.406400> rotate<0,44.997030,0> translate<58.166000,-1.535000,47.498000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<60.452000,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<60.452000,-1.535000,45.212000>}
box{<0,0,-0.406400><22.606000,0.035000,0.406400> rotate<0,90.000000,0> translate<60.452000,-1.535000,45.212000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<60.960000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<60.960000,0.000000,22.098000>}
box{<0,0,-0.406400><1.778000,0.035000,0.406400> rotate<0,90.000000,0> translate<60.960000,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<60.960000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<60.960000,0.000000,22.352000>}
box{<0,0,-0.406400><0.254000,0.035000,0.406400> rotate<0,90.000000,0> translate<60.960000,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<60.960000,0.000000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<60.960000,0.000000,22.352000>}
box{<0,0,-0.406400><1.016000,0.035000,0.406400> rotate<0,-90.000000,0> translate<60.960000,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<60.198000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<60.960000,0.000000,23.368000>}
box{<0,0,-0.406400><1.077631,0.035000,0.406400> rotate<0,44.997030,0> translate<60.198000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.150000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<60.960000,0.000000,26.670000>}
box{<0,0,-0.406400><3.810000,0.035000,0.406400> rotate<0,0.000000,0> translate<57.150000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<60.960000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<61.468000,0.000000,26.162000>}
box{<0,0,-0.406400><0.718420,0.035000,0.406400> rotate<0,44.997030,0> translate<60.960000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<61.468000,0.000000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<61.468000,0.000000,26.162000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,90.000000,0> translate<61.468000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.150000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<62.230000,0.000000,12.700000>}
box{<0,0,-0.406400><7.184205,0.035000,0.406400> rotate<0,44.997030,0> translate<57.150000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<62.230000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<62.230000,0.000000,12.700000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,90.000000,0> translate<62.230000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<59.690000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<62.230000,0.000000,15.240000>}
box{<0,0,-0.406400><3.592102,0.035000,0.406400> rotate<0,44.997030,0> translate<59.690000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<60.960000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<62.230000,0.000000,19.050000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<60.960000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<61.468000,0.000000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<62.230000,0.000000,24.130000>}
box{<0,0,-0.406400><1.077631,0.035000,0.406400> rotate<0,44.997030,0> translate<61.468000,0.000000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<62.230000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<62.230000,0.000000,24.130000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,90.000000,0> translate<62.230000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.656000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<62.738000,-1.535000,5.080000>}
box{<0,0,-0.406400><21.082000,0.035000,0.406400> rotate<0,0.000000,0> translate<41.656000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<62.738000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<63.500000,-1.535000,5.842000>}
box{<0,0,-0.406400><1.077631,0.035000,0.406400> rotate<0,-44.997030,0> translate<62.738000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<63.500000,-1.535000,5.842000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<63.500000,-1.535000,8.636000>}
box{<0,0,-0.406400><2.794000,0.035000,0.406400> rotate<0,90.000000,0> translate<63.500000,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<63.500000,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<64.770000,-1.535000,9.906000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,-44.997030,0> translate<63.500000,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<64.770000,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<66.802000,-1.535000,9.906000>}
box{<0,0,-0.406400><2.032000,0.035000,0.406400> rotate<0,0.000000,0> translate<64.770000,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<66.802000,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<67.310000,-1.535000,10.414000>}
box{<0,0,-0.406400><0.718420,0.035000,0.406400> rotate<0,-44.997030,0> translate<66.802000,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<67.310000,-1.535000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<67.310000,-1.535000,11.430000>}
box{<0,0,-0.406400><1.016000,0.035000,0.406400> rotate<0,90.000000,0> translate<67.310000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<67.310000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<67.310000,-1.535000,15.240000>}
box{<0,0,-0.406400><3.810000,0.035000,0.406400> rotate<0,90.000000,0> translate<67.310000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<67.310000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<67.310000,-1.535000,19.050000>}
box{<0,0,-0.406400><3.810000,0.035000,0.406400> rotate<0,90.000000,0> translate<67.310000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<67.310000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<67.310000,-1.535000,22.860000>}
box{<0,0,-0.406400><3.810000,0.035000,0.406400> rotate<0,90.000000,0> translate<67.310000,-1.535000,22.860000> }
//Text
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
texture{col_pol}
}
#end
union{
cylinder{<18.288000,0.038000,34.290000><18.288000,-1.538000,34.290000>0.406400}
cylinder{<20.828000,0.038000,34.290000><20.828000,-1.538000,34.290000>0.406400}
cylinder{<23.368000,0.038000,34.290000><23.368000,-1.538000,34.290000>0.406400}
cylinder{<25.908000,0.038000,34.290000><25.908000,-1.538000,34.290000>0.406400}
cylinder{<28.448000,0.038000,34.290000><28.448000,-1.538000,34.290000>0.406400}
cylinder{<30.988000,0.038000,34.290000><30.988000,-1.538000,34.290000>0.406400}
cylinder{<33.528000,0.038000,34.290000><33.528000,-1.538000,34.290000>0.406400}
cylinder{<36.068000,0.038000,34.290000><36.068000,-1.538000,34.290000>0.406400}
cylinder{<38.608000,0.038000,34.290000><38.608000,-1.538000,34.290000>0.406400}
cylinder{<41.148000,0.038000,34.290000><41.148000,-1.538000,34.290000>0.406400}
cylinder{<43.688000,0.038000,34.290000><43.688000,-1.538000,34.290000>0.406400}
cylinder{<46.228000,0.038000,34.290000><46.228000,-1.538000,34.290000>0.406400}
cylinder{<46.228000,0.038000,41.910000><46.228000,-1.538000,41.910000>0.406400}
cylinder{<43.688000,0.038000,41.910000><43.688000,-1.538000,41.910000>0.406400}
cylinder{<41.148000,0.038000,41.910000><41.148000,-1.538000,41.910000>0.406400}
cylinder{<38.608000,0.038000,41.910000><38.608000,-1.538000,41.910000>0.406400}
cylinder{<36.068000,0.038000,41.910000><36.068000,-1.538000,41.910000>0.406400}
cylinder{<33.528000,0.038000,41.910000><33.528000,-1.538000,41.910000>0.406400}
cylinder{<30.988000,0.038000,41.910000><30.988000,-1.538000,41.910000>0.406400}
cylinder{<28.448000,0.038000,41.910000><28.448000,-1.538000,41.910000>0.406400}
cylinder{<25.908000,0.038000,41.910000><25.908000,-1.538000,41.910000>0.406400}
cylinder{<23.368000,0.038000,41.910000><23.368000,-1.538000,41.910000>0.406400}
cylinder{<20.828000,0.038000,41.910000><20.828000,-1.538000,41.910000>0.406400}
cylinder{<18.288000,0.038000,41.910000><18.288000,-1.538000,41.910000>0.406400}
cylinder{<37.084000,0.038000,11.684000><37.084000,-1.538000,11.684000>0.406400}
cylinder{<40.640000,0.038000,11.684000><40.640000,-1.538000,11.684000>0.406400}
cylinder{<14.224000,0.038000,4.572000><14.224000,-1.538000,4.572000>0.558800}
cylinder{<14.224000,0.038000,14.732000><14.224000,-1.538000,14.732000>0.558800}
cylinder{<19.558000,0.038000,13.716000><19.558000,-1.538000,13.716000>0.558800}
cylinder{<29.718000,0.038000,13.716000><29.718000,-1.538000,13.716000>0.558800}
cylinder{<66.167000,0.038000,25.400000><66.167000,-1.538000,25.400000>0.508000}
cylinder{<63.627000,0.038000,25.400000><63.627000,-1.538000,25.400000>0.508000}
cylinder{<66.167000,0.038000,27.940000><66.167000,-1.538000,27.940000>0.508000}
cylinder{<63.627000,0.038000,27.940000><63.627000,-1.538000,27.940000>0.508000}
cylinder{<66.167000,0.038000,30.480000><66.167000,-1.538000,30.480000>0.508000}
cylinder{<63.627000,0.038000,30.480000><63.627000,-1.538000,30.480000>0.508000}
cylinder{<23.876000,0.038000,50.800000><23.876000,-1.538000,50.800000>0.508000}
cylinder{<26.416000,0.038000,50.800000><26.416000,-1.538000,50.800000>0.508000}
cylinder{<28.956000,0.038000,50.800000><28.956000,-1.538000,50.800000>0.508000}
cylinder{<31.496000,0.038000,50.800000><31.496000,-1.538000,50.800000>0.508000}
cylinder{<34.036000,0.038000,50.800000><34.036000,-1.538000,50.800000>0.508000}
cylinder{<36.576000,0.038000,50.800000><36.576000,-1.538000,50.800000>0.508000}
cylinder{<39.116000,0.038000,50.800000><39.116000,-1.538000,50.800000>0.508000}
cylinder{<41.656000,0.038000,50.800000><41.656000,-1.538000,50.800000>0.508000}
cylinder{<50.800000,0.038000,2.540000><50.800000,-1.538000,2.540000>0.508000}
cylinder{<53.340000,0.038000,2.540000><53.340000,-1.538000,2.540000>0.508000}
cylinder{<55.880000,0.038000,2.540000><55.880000,-1.538000,2.540000>0.508000}
cylinder{<58.420000,0.038000,2.540000><58.420000,-1.538000,2.540000>0.508000}
cylinder{<60.960000,0.038000,2.540000><60.960000,-1.538000,2.540000>0.508000}
cylinder{<63.500000,0.038000,2.540000><63.500000,-1.538000,2.540000>0.508000}
cylinder{<45.720000,0.038000,50.800000><45.720000,-1.538000,50.800000>0.508000}
cylinder{<48.260000,0.038000,50.800000><48.260000,-1.538000,50.800000>0.508000}
cylinder{<50.800000,0.038000,50.800000><50.800000,-1.538000,50.800000>0.508000}
cylinder{<53.340000,0.038000,50.800000><53.340000,-1.538000,50.800000>0.508000}
cylinder{<55.880000,0.038000,50.800000><55.880000,-1.538000,50.800000>0.508000}
cylinder{<58.420000,0.038000,50.800000><58.420000,-1.538000,50.800000>0.508000}
cylinder{<60.960000,0.038000,50.800000><60.960000,-1.538000,50.800000>0.508000}
cylinder{<63.500000,0.038000,50.800000><63.500000,-1.538000,50.800000>0.508000}
cylinder{<15.748000,0.038000,20.066000><15.748000,-1.538000,20.066000>0.508000}
cylinder{<18.288000,0.038000,20.066000><18.288000,-1.538000,20.066000>0.508000}
cylinder{<20.828000,0.038000,20.066000><20.828000,-1.538000,20.066000>0.508000}
cylinder{<23.368000,0.038000,20.066000><23.368000,-1.538000,20.066000>0.508000}
cylinder{<25.908000,0.038000,20.066000><25.908000,-1.538000,20.066000>0.508000}
cylinder{<28.448000,0.038000,20.066000><28.448000,-1.538000,20.066000>0.508000}
cylinder{<3.835400,0.038000,49.504600><3.835400,-1.538000,49.504600>0.400000}
cylinder{<11.404600,0.038000,36.855400><11.404600,-1.538000,36.855400>0.400000}
cylinder{<11.404600,0.038000,39.370000><11.404600,-1.538000,39.370000>0.400000}
cylinder{<3.835400,0.038000,36.855400><3.835400,-1.538000,36.855400>0.400000}
cylinder{<3.835400,0.038000,39.370000><3.835400,-1.538000,39.370000>0.400000}
cylinder{<33.020000,0.038000,2.540000><33.020000,-1.538000,2.540000>0.508000}
cylinder{<35.560000,0.038000,2.540000><35.560000,-1.538000,2.540000>0.508000}
cylinder{<38.100000,0.038000,2.540000><38.100000,-1.538000,2.540000>0.508000}
cylinder{<40.640000,0.038000,2.540000><40.640000,-1.538000,2.540000>0.508000}
cylinder{<43.180000,0.038000,2.540000><43.180000,-1.538000,2.540000>0.508000}
cylinder{<45.720000,0.038000,2.540000><45.720000,-1.538000,2.540000>0.508000}
cylinder{<49.530000,0.038000,12.700000><49.530000,-1.538000,12.700000>0.406400}
cylinder{<49.530000,0.038000,7.620000><49.530000,-1.538000,7.620000>0.406400}
cylinder{<52.070000,0.038000,12.700000><52.070000,-1.538000,12.700000>0.406400}
cylinder{<52.070000,0.038000,7.620000><52.070000,-1.538000,7.620000>0.406400}
cylinder{<54.610000,0.038000,12.700000><54.610000,-1.538000,12.700000>0.406400}
cylinder{<54.610000,0.038000,7.620000><54.610000,-1.538000,7.620000>0.406400}
cylinder{<57.150000,0.038000,12.700000><57.150000,-1.538000,12.700000>0.406400}
cylinder{<57.150000,0.038000,7.620000><57.150000,-1.538000,7.620000>0.406400}
cylinder{<6.350000,0.038000,31.242000><6.350000,-1.538000,31.242000>0.406400}
cylinder{<11.430000,0.038000,31.242000><11.430000,-1.538000,31.242000>0.406400}
cylinder{<13.970000,0.038000,29.718000><13.970000,-1.538000,29.718000>0.406400}
cylinder{<19.050000,0.038000,29.718000><19.050000,-1.538000,29.718000>0.406400}
cylinder{<23.368000,0.038000,25.146000><23.368000,-1.538000,25.146000>0.406400}
cylinder{<30.988000,0.038000,25.146000><30.988000,-1.538000,25.146000>0.406400}
cylinder{<21.336000,0.038000,29.718000><21.336000,-1.538000,29.718000>0.406400}
cylinder{<26.416000,0.038000,29.718000><26.416000,-1.538000,29.718000>0.406400}
cylinder{<28.956000,0.038000,29.718000><28.956000,-1.538000,29.718000>0.406400}
cylinder{<34.036000,0.038000,29.718000><34.036000,-1.538000,29.718000>0.406400}
cylinder{<12.954000,0.038000,25.146000><12.954000,-1.538000,25.146000>0.406400}
cylinder{<20.574000,0.038000,25.146000><20.574000,-1.538000,25.146000>0.406400}
cylinder{<62.230000,0.038000,22.860000><62.230000,-1.538000,22.860000>0.406400}
cylinder{<67.310000,0.038000,22.860000><67.310000,-1.538000,22.860000>0.406400}
cylinder{<62.230000,0.038000,19.050000><62.230000,-1.538000,19.050000>0.406400}
cylinder{<67.310000,0.038000,19.050000><67.310000,-1.538000,19.050000>0.406400}
cylinder{<62.230000,0.038000,15.240000><62.230000,-1.538000,15.240000>0.406400}
cylinder{<67.310000,0.038000,15.240000><67.310000,-1.538000,15.240000>0.406400}
cylinder{<62.230000,0.038000,11.430000><62.230000,-1.538000,11.430000>0.406400}
cylinder{<67.310000,0.038000,11.430000><67.310000,-1.538000,11.430000>0.406400}
cylinder{<20.320000,0.038000,48.006000><20.320000,-1.538000,48.006000>0.406400}
cylinder{<20.320000,0.038000,53.086000><20.320000,-1.538000,53.086000>0.406400}
cylinder{<35.306000,0.038000,17.780000><35.306000,-1.538000,17.780000>0.508000}
cylinder{<35.306000,0.038000,20.320000><35.306000,-1.538000,20.320000>0.508000}
cylinder{<35.306000,0.038000,22.860000><35.306000,-1.538000,22.860000>0.508000}
cylinder{<35.306000,0.038000,25.400000><35.306000,-1.538000,25.400000>0.508000}
cylinder{<57.150000,0.038000,31.750000><57.150000,-1.538000,31.750000>0.508000}
cylinder{<57.150000,0.038000,29.210000><57.150000,-1.538000,29.210000>0.508000}
cylinder{<57.150000,0.038000,26.670000><57.150000,-1.538000,26.670000>0.508000}
cylinder{<57.150000,0.038000,24.130000><57.150000,-1.538000,24.130000>0.508000}
cylinder{<57.150000,0.038000,21.590000><57.150000,-1.538000,21.590000>0.508000}
cylinder{<57.150000,0.038000,19.050000><57.150000,-1.538000,19.050000>0.508000}
cylinder{<41.402000,0.038000,19.558000><41.402000,-1.538000,19.558000>0.406400}
cylinder{<38.862000,0.038000,19.558000><38.862000,-1.538000,19.558000>0.406400}
cylinder{<43.942000,0.038000,19.558000><43.942000,-1.538000,19.558000>0.406400}
cylinder{<48.514000,0.038000,22.606000><48.514000,-1.538000,22.606000>0.406400}
cylinder{<45.974000,0.038000,22.606000><45.974000,-1.538000,22.606000>0.406400}
cylinder{<51.054000,0.038000,22.606000><51.054000,-1.538000,22.606000>0.406400}
cylinder{<41.402000,0.038000,26.924000><41.402000,-1.538000,26.924000>0.406400}
cylinder{<38.862000,0.038000,26.924000><38.862000,-1.538000,26.924000>0.406400}
cylinder{<43.942000,0.038000,26.924000><43.942000,-1.538000,26.924000>0.406400}
cylinder{<48.514000,0.038000,28.956000><48.514000,-1.538000,28.956000>0.406400}
cylinder{<45.974000,0.038000,28.956000><45.974000,-1.538000,28.956000>0.406400}
cylinder{<51.054000,0.038000,28.956000><51.054000,-1.538000,28.956000>0.406400}
cylinder{<8.890000,0.038000,22.860000><8.890000,-1.538000,22.860000>0.558800}
cylinder{<6.350000,0.038000,22.860000><6.350000,-1.538000,22.860000>0.558800}
cylinder{<3.810000,0.038000,22.860000><3.810000,-1.538000,22.860000>0.558800}
cylinder{<20.066000,0.038000,5.334000><20.066000,-1.538000,5.334000>0.500000}
cylinder{<22.606000,0.038000,5.334000><22.606000,-1.538000,5.334000>0.500000}
cylinder{<25.400000,0.038000,5.334000><25.400000,-1.538000,5.334000>0.500000}
cylinder{<27.940000,0.038000,5.334000><27.940000,-1.538000,5.334000>0.500000}
//Holes(fast)/Vias
cylinder{<29.718000,0.038000,38.100000><29.718000,-1.538000,38.100000>0.300000 }
cylinder{<29.718000,0.038000,43.942000><29.718000,-1.538000,43.942000>0.300000 }
cylinder{<32.258000,0.038000,38.100000><32.258000,-1.538000,38.100000>0.300000 }
cylinder{<34.036000,0.038000,48.514000><34.036000,-1.538000,48.514000>0.300000 }
cylinder{<32.258000,0.038000,4.826000><32.258000,-1.538000,4.826000>0.300000 }
cylinder{<16.510000,0.038000,3.810000><16.510000,-1.538000,3.810000>0.300000 }
cylinder{<32.004000,0.038000,13.716000><32.004000,-1.538000,13.716000>0.300000 }
cylinder{<32.004000,0.038000,7.620000><32.004000,-1.538000,7.620000>0.300000 }
cylinder{<17.780000,0.038000,2.540000><17.780000,-1.538000,2.540000>0.300000 }
cylinder{<3.810000,0.038000,27.178000><3.810000,-1.538000,27.178000>0.300000 }
cylinder{<35.306000,0.038000,46.990000><35.306000,-1.538000,46.990000>0.300000 }
cylinder{<34.798000,0.038000,38.100000><34.798000,-1.538000,38.100000>0.300000 }
cylinder{<39.878000,0.038000,44.196000><39.878000,-1.538000,44.196000>0.300000 }
cylinder{<49.276000,0.038000,41.402000><49.276000,-1.538000,41.402000>0.300000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.079200,0.000000,43.633300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.299700,0.000000,43.633300>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,0.000000,0> translate<23.299700,0.000000,43.633300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.299700,0.000000,43.633300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.909900,0.000000,44.023000>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,44.989680,0> translate<22.909900,0.000000,44.023000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.909900,0.000000,44.023000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.299700,0.000000,44.412800>}
box{<0,0,-0.050800><0.551260,0.036000,0.050800> rotate<0,-44.997030,0> translate<22.909900,0.000000,44.023000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.299700,0.000000,44.412800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.079200,0.000000,44.412800>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,0.000000,0> translate<23.299700,0.000000,44.412800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.494600,0.000000,43.633300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.494600,0.000000,44.412800>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<23.494600,0.000000,44.412800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.079200,0.000000,44.802600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.909900,0.000000,44.802600>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<22.909900,0.000000,44.802600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.909900,0.000000,44.802600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.909900,0.000000,45.387200>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,90.000000,0> translate<22.909900,0.000000,45.387200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.909900,0.000000,45.387200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.104800,0.000000,45.582100>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<22.909900,0.000000,45.387200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.104800,0.000000,45.582100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.494600,0.000000,45.582100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<23.104800,0.000000,45.582100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.494600,0.000000,45.582100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.689500,0.000000,45.387200>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<23.494600,0.000000,45.582100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.689500,0.000000,45.387200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.689500,0.000000,44.802600>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,-90.000000,0> translate<23.689500,0.000000,44.802600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.689500,0.000000,45.192300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.079200,0.000000,45.582100>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,-45.004380,0> translate<23.689500,0.000000,45.192300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.909900,0.000000,46.751400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.909900,0.000000,45.971900>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,-90.000000,0> translate<22.909900,0.000000,45.971900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.909900,0.000000,45.971900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.079200,0.000000,45.971900>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<22.909900,0.000000,45.971900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.079200,0.000000,45.971900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.079200,0.000000,46.751400>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<24.079200,0.000000,46.751400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.494600,0.000000,45.971900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.494600,0.000000,46.361600>}
box{<0,0,-0.050800><0.389700,0.036000,0.050800> rotate<0,90.000000,0> translate<23.494600,0.000000,46.361600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.079200,0.000000,47.141200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.909900,0.000000,47.141200>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<22.909900,0.000000,47.141200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.909900,0.000000,47.141200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.909900,0.000000,47.920700>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<22.909900,0.000000,47.920700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.494600,0.000000,47.141200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.494600,0.000000,47.530900>}
box{<0,0,-0.050800><0.389700,0.036000,0.050800> rotate<0,90.000000,0> translate<23.494600,0.000000,47.530900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.644800,0.000000,45.582200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.449900,0.000000,45.387300>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<25.449900,0.000000,45.387300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.449900,0.000000,45.387300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.449900,0.000000,44.997500>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<25.449900,0.000000,44.997500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.449900,0.000000,44.997500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.644800,0.000000,44.802700>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<25.449900,0.000000,44.997500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.644800,0.000000,44.802700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.424400,0.000000,44.802700>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<25.644800,0.000000,44.802700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.424400,0.000000,44.802700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.619200,0.000000,44.997500>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<26.424400,0.000000,44.802700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.619200,0.000000,44.997500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.619200,0.000000,45.387300>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<26.619200,0.000000,45.387300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.619200,0.000000,45.387300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.424400,0.000000,45.582200>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<26.424400,0.000000,45.582200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.424400,0.000000,45.582200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.034600,0.000000,45.582200>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<26.034600,0.000000,45.582200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.034600,0.000000,45.582200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.034600,0.000000,45.192400>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<26.034600,0.000000,45.192400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.619200,0.000000,45.972000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.449900,0.000000,45.972000>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<25.449900,0.000000,45.972000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.449900,0.000000,45.972000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.619200,0.000000,46.751500>}
box{<0,0,-0.050800><1.405305,0.036000,0.050800> rotate<0,-33.686713,0> translate<25.449900,0.000000,45.972000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.619200,0.000000,46.751500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.449900,0.000000,46.751500>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<25.449900,0.000000,46.751500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.449900,0.000000,47.141300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.619200,0.000000,47.141300>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<25.449900,0.000000,47.141300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.619200,0.000000,47.141300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.619200,0.000000,47.725900>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,90.000000,0> translate<26.619200,0.000000,47.725900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.619200,0.000000,47.725900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.424400,0.000000,47.920800>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<26.424400,0.000000,47.920800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.424400,0.000000,47.920800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.644800,0.000000,47.920800>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<25.644800,0.000000,47.920800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.644800,0.000000,47.920800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.449900,0.000000,47.725900>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<25.449900,0.000000,47.725900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.449900,0.000000,47.725900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.449900,0.000000,47.141300>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,-90.000000,0> translate<25.449900,0.000000,47.141300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.379700,0.000000,45.972100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.989900,0.000000,46.361800>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,44.989680,0> translate<27.989900,0.000000,46.361800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.989900,0.000000,46.361800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.159200,0.000000,46.361800>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<27.989900,0.000000,46.361800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.159200,0.000000,45.972100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.159200,0.000000,46.751600>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<29.159200,0.000000,46.751600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.184800,0.000000,47.141400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.989900,0.000000,47.336200>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<27.989900,0.000000,47.336200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.989900,0.000000,47.336200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.989900,0.000000,47.726000>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<27.989900,0.000000,47.726000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.989900,0.000000,47.726000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.184800,0.000000,47.920900>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<27.989900,0.000000,47.726000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.184800,0.000000,47.920900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.379700,0.000000,47.920900>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<28.184800,0.000000,47.920900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.379700,0.000000,47.920900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.574600,0.000000,47.726000>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<28.379700,0.000000,47.920900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.574600,0.000000,47.726000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.574600,0.000000,47.531100>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<28.574600,0.000000,47.531100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.574600,0.000000,47.726000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.769500,0.000000,47.920900>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<28.574600,0.000000,47.726000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.769500,0.000000,47.920900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.964400,0.000000,47.920900>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<28.769500,0.000000,47.920900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.964400,0.000000,47.920900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.159200,0.000000,47.726000>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<28.964400,0.000000,47.920900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.159200,0.000000,47.726000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.159200,0.000000,47.336200>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<29.159200,0.000000,47.336200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.159200,0.000000,47.336200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.964400,0.000000,47.141400>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<28.964400,0.000000,47.141400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.919700,0.000000,45.972100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.529900,0.000000,46.361800>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,44.989680,0> translate<30.529900,0.000000,46.361800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.529900,0.000000,46.361800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.699200,0.000000,46.361800>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<30.529900,0.000000,46.361800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.699200,0.000000,45.972100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.699200,0.000000,46.751600>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<31.699200,0.000000,46.751600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.699200,0.000000,47.920900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.699200,0.000000,47.141400>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,-90.000000,0> translate<31.699200,0.000000,47.141400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.699200,0.000000,47.141400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.919700,0.000000,47.920900>}
box{<0,0,-0.050800><1.102379,0.036000,0.050800> rotate<0,44.997030,0> translate<30.919700,0.000000,47.920900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.919700,0.000000,47.920900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.724800,0.000000,47.920900>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<30.724800,0.000000,47.920900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.724800,0.000000,47.920900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.529900,0.000000,47.726000>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<30.529900,0.000000,47.726000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.529900,0.000000,47.726000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.529900,0.000000,47.336200>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<30.529900,0.000000,47.336200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.529900,0.000000,47.336200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.724800,0.000000,47.141400>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<30.529900,0.000000,47.336200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.459700,0.000000,45.972100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.069900,0.000000,46.361800>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,44.989680,0> translate<33.069900,0.000000,46.361800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.069900,0.000000,46.361800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.239200,0.000000,46.361800>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<33.069900,0.000000,46.361800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.239200,0.000000,45.972100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.239200,0.000000,46.751600>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<34.239200,0.000000,46.751600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.459700,0.000000,47.141400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.069900,0.000000,47.531100>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,44.989680,0> translate<33.069900,0.000000,47.531100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.069900,0.000000,47.531100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.239200,0.000000,47.531100>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<33.069900,0.000000,47.531100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.239200,0.000000,47.141400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.239200,0.000000,47.920900>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<34.239200,0.000000,47.920900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.999700,0.000000,45.972100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.609900,0.000000,46.361800>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,44.989680,0> translate<35.609900,0.000000,46.361800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.609900,0.000000,46.361800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.779200,0.000000,46.361800>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<35.609900,0.000000,46.361800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.779200,0.000000,45.972100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.779200,0.000000,46.751600>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<36.779200,0.000000,46.751600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.584400,0.000000,47.141400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.804800,0.000000,47.141400>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<35.804800,0.000000,47.141400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.804800,0.000000,47.141400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.609900,0.000000,47.336200>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<35.609900,0.000000,47.336200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.609900,0.000000,47.336200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.609900,0.000000,47.726000>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<35.609900,0.000000,47.726000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.609900,0.000000,47.726000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.804800,0.000000,47.920900>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<35.609900,0.000000,47.726000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.804800,0.000000,47.920900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.584400,0.000000,47.920900>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<35.804800,0.000000,47.920900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.584400,0.000000,47.920900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.779200,0.000000,47.726000>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<36.584400,0.000000,47.920900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.779200,0.000000,47.726000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.779200,0.000000,47.336200>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<36.779200,0.000000,47.336200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.779200,0.000000,47.336200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.584400,0.000000,47.141400>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<36.584400,0.000000,47.141400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.584400,0.000000,47.141400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.804800,0.000000,47.920900>}
box{<0,0,-0.050800><1.102450,0.036000,0.050800> rotate<0,44.993355,0> translate<35.804800,0.000000,47.920900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.124400,0.000000,47.141500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.319200,0.000000,47.336300>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<39.124400,0.000000,47.141500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.319200,0.000000,47.336300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.319200,0.000000,47.726100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<39.319200,0.000000,47.726100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.319200,0.000000,47.726100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.124400,0.000000,47.921000>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<39.124400,0.000000,47.921000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.124400,0.000000,47.921000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.344800,0.000000,47.921000>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<38.344800,0.000000,47.921000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.344800,0.000000,47.921000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.149900,0.000000,47.726100>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<38.149900,0.000000,47.726100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.149900,0.000000,47.726100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.149900,0.000000,47.336300>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<38.149900,0.000000,47.336300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.149900,0.000000,47.336300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.344800,0.000000,47.141500>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<38.149900,0.000000,47.336300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.344800,0.000000,47.141500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.539700,0.000000,47.141500>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<38.344800,0.000000,47.141500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.539700,0.000000,47.141500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.734600,0.000000,47.336300>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-44.982329,0> translate<38.539700,0.000000,47.141500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.734600,0.000000,47.336300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.734600,0.000000,47.921000>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,90.000000,0> translate<38.734600,0.000000,47.921000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.884800,0.000000,47.141500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.689900,0.000000,47.336300>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<40.689900,0.000000,47.336300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.689900,0.000000,47.336300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.689900,0.000000,47.726100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<40.689900,0.000000,47.726100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.689900,0.000000,47.726100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.884800,0.000000,47.921000>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<40.689900,0.000000,47.726100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.884800,0.000000,47.921000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.079700,0.000000,47.921000>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<40.884800,0.000000,47.921000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.079700,0.000000,47.921000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.274600,0.000000,47.726100>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<41.079700,0.000000,47.921000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.274600,0.000000,47.726100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.469500,0.000000,47.921000>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<41.274600,0.000000,47.726100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.469500,0.000000,47.921000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.664400,0.000000,47.921000>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<41.469500,0.000000,47.921000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.664400,0.000000,47.921000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.859200,0.000000,47.726100>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<41.664400,0.000000,47.921000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.859200,0.000000,47.726100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.859200,0.000000,47.336300>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<41.859200,0.000000,47.336300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.859200,0.000000,47.336300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.664400,0.000000,47.141500>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<41.664400,0.000000,47.141500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.664400,0.000000,47.141500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.469500,0.000000,47.141500>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<41.469500,0.000000,47.141500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.469500,0.000000,47.141500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.274600,0.000000,47.336300>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<41.274600,0.000000,47.336300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.274600,0.000000,47.336300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.079700,0.000000,47.141500>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-44.982329,0> translate<41.079700,0.000000,47.141500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.079700,0.000000,47.141500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.884800,0.000000,47.141500>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<40.884800,0.000000,47.141500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.274600,0.000000,47.336300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.274600,0.000000,47.726100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<41.274600,0.000000,47.726100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.769900,0.000000,47.141500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.769900,0.000000,47.921000>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<45.769900,0.000000,47.921000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.769900,0.000000,47.921000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.964800,0.000000,47.921000>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<45.769900,0.000000,47.921000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.964800,0.000000,47.921000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.744400,0.000000,47.141500>}
box{<0,0,-0.050800><1.102450,0.036000,0.050800> rotate<0,44.993355,0> translate<45.964800,0.000000,47.921000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.744400,0.000000,47.141500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.939200,0.000000,47.141500>}
box{<0,0,-0.050800><0.194800,0.036000,0.050800> rotate<0,0.000000,0> translate<46.744400,0.000000,47.141500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.309900,0.000000,47.921000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.504800,0.000000,47.531200>}
box{<0,0,-0.050800><0.435810,0.036000,0.050800> rotate<0,63.430762,0> translate<48.309900,0.000000,47.921000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.504800,0.000000,47.531200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.894600,0.000000,47.141500>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,44.989680,0> translate<48.504800,0.000000,47.531200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.894600,0.000000,47.141500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.284400,0.000000,47.141500>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<48.894600,0.000000,47.141500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.284400,0.000000,47.141500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.479200,0.000000,47.336300>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<49.284400,0.000000,47.141500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.479200,0.000000,47.336300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.479200,0.000000,47.726100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<49.479200,0.000000,47.726100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.479200,0.000000,47.726100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.284400,0.000000,47.921000>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<49.284400,0.000000,47.921000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.284400,0.000000,47.921000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.089500,0.000000,47.921000>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<49.089500,0.000000,47.921000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.089500,0.000000,47.921000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.894600,0.000000,47.726100>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<48.894600,0.000000,47.726100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.894600,0.000000,47.726100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.894600,0.000000,47.141500>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,-90.000000,0> translate<48.894600,0.000000,47.141500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.849900,0.000000,47.921000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.849900,0.000000,47.141500>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,-90.000000,0> translate<50.849900,0.000000,47.141500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.849900,0.000000,47.141500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.434600,0.000000,47.141500>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,0.000000,0> translate<50.849900,0.000000,47.141500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.434600,0.000000,47.141500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.239700,0.000000,47.531200>}
box{<0,0,-0.050800><0.435720,0.036000,0.050800> rotate<0,63.424882,0> translate<51.239700,0.000000,47.531200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.239700,0.000000,47.531200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.239700,0.000000,47.726100>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,90.000000,0> translate<51.239700,0.000000,47.726100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.239700,0.000000,47.726100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.434600,0.000000,47.921000>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<51.239700,0.000000,47.726100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.434600,0.000000,47.921000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.824400,0.000000,47.921000>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<51.434600,0.000000,47.921000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.824400,0.000000,47.921000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.019200,0.000000,47.726100>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<51.824400,0.000000,47.921000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.019200,0.000000,47.726100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.019200,0.000000,47.336300>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<52.019200,0.000000,47.336300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.019200,0.000000,47.336300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.824400,0.000000,47.141500>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<51.824400,0.000000,47.141500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<54.559200,0.000000,47.726100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.389900,0.000000,47.726100>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<53.389900,0.000000,47.726100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.389900,0.000000,47.726100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.974600,0.000000,47.141500>}
box{<0,0,-0.050800><0.826820,0.036000,0.050800> rotate<0,44.992130,0> translate<53.389900,0.000000,47.726100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.974600,0.000000,47.141500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.974600,0.000000,47.921000>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<53.974600,0.000000,47.921000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.124800,0.000000,47.141500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<55.929900,0.000000,47.336300>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<55.929900,0.000000,47.336300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<55.929900,0.000000,47.336300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<55.929900,0.000000,47.726100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<55.929900,0.000000,47.726100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<55.929900,0.000000,47.726100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.124800,0.000000,47.921000>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<55.929900,0.000000,47.726100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.124800,0.000000,47.921000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.319700,0.000000,47.921000>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<56.124800,0.000000,47.921000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.319700,0.000000,47.921000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.514600,0.000000,47.726100>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<56.319700,0.000000,47.921000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.514600,0.000000,47.726100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.514600,0.000000,47.531200>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<56.514600,0.000000,47.531200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.514600,0.000000,47.726100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.709500,0.000000,47.921000>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<56.514600,0.000000,47.726100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.709500,0.000000,47.921000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.904400,0.000000,47.921000>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<56.709500,0.000000,47.921000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.904400,0.000000,47.921000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.099200,0.000000,47.726100>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<56.904400,0.000000,47.921000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.099200,0.000000,47.726100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.099200,0.000000,47.336300>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<57.099200,0.000000,47.336300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.099200,0.000000,47.336300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.904400,0.000000,47.141500>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<56.904400,0.000000,47.141500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.639200,0.000000,47.921000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.639200,0.000000,47.141500>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,-90.000000,0> translate<59.639200,0.000000,47.141500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.639200,0.000000,47.141500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.859700,0.000000,47.921000>}
box{<0,0,-0.050800><1.102379,0.036000,0.050800> rotate<0,44.997030,0> translate<58.859700,0.000000,47.921000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.859700,0.000000,47.921000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.664800,0.000000,47.921000>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<58.664800,0.000000,47.921000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.664800,0.000000,47.921000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.469900,0.000000,47.726100>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<58.469900,0.000000,47.726100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.469900,0.000000,47.726100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.469900,0.000000,47.336300>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<58.469900,0.000000,47.336300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.469900,0.000000,47.336300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.664800,0.000000,47.141500>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<58.469900,0.000000,47.336300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<61.399700,0.000000,47.141500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<61.009900,0.000000,47.531200>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,44.989680,0> translate<61.009900,0.000000,47.531200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<61.009900,0.000000,47.531200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<62.179200,0.000000,47.531200>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<61.009900,0.000000,47.531200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<62.179200,0.000000,47.141500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<62.179200,0.000000,47.921000>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<62.179200,0.000000,47.921000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.524400,0.000000,47.141500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.744800,0.000000,47.141500>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<63.744800,0.000000,47.141500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.744800,0.000000,47.141500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.549900,0.000000,47.336300>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<63.549900,0.000000,47.336300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.549900,0.000000,47.336300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.549900,0.000000,47.726100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<63.549900,0.000000,47.726100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.549900,0.000000,47.726100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.744800,0.000000,47.921000>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<63.549900,0.000000,47.726100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.744800,0.000000,47.921000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.524400,0.000000,47.921000>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<63.744800,0.000000,47.921000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.524400,0.000000,47.921000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.719200,0.000000,47.726100>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<64.524400,0.000000,47.921000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.719200,0.000000,47.726100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.719200,0.000000,47.336300>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<64.719200,0.000000,47.336300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.719200,0.000000,47.336300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.524400,0.000000,47.141500>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<64.524400,0.000000,47.141500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.524400,0.000000,47.141500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.744800,0.000000,47.921000>}
box{<0,0,-0.050800><1.102450,0.036000,0.050800> rotate<0,44.993355,0> translate<63.744800,0.000000,47.921000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.311600,0.000000,45.758100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.311600,0.000000,46.698700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<61.311600,0.000000,46.698700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.998100,0.000000,46.698700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.625100,0.000000,46.698700>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<60.998100,0.000000,46.698700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.933600,0.000000,46.698700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.560600,0.000000,45.758100>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,56.309028,0> translate<61.933600,0.000000,46.698700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.560600,0.000000,46.698700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.933600,0.000000,45.758100>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-56.309028,0> translate<61.933600,0.000000,45.758100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.804600,0.000000,45.758100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.804600,0.000000,46.698700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<63.804600,0.000000,46.698700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.804600,0.000000,46.698700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.274900,0.000000,46.698700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<63.804600,0.000000,46.698700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.274900,0.000000,46.698700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.431600,0.000000,46.541900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<64.274900,0.000000,46.698700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.431600,0.000000,46.541900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.431600,0.000000,46.228400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,-90.000000,0> translate<64.431600,0.000000,46.228400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.431600,0.000000,46.228400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.274900,0.000000,46.071600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<64.274900,0.000000,46.071600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.274900,0.000000,46.071600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.804600,0.000000,46.071600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<63.804600,0.000000,46.071600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.118100,0.000000,46.071600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.431600,0.000000,45.758100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<64.118100,0.000000,46.071600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.740100,0.000000,46.698700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.367100,0.000000,45.758100>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,56.309028,0> translate<64.740100,0.000000,46.698700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.367100,0.000000,46.698700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.740100,0.000000,45.758100>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-56.309028,0> translate<64.740100,0.000000,45.758100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.969200,0.000000,5.130800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.799900,0.000000,5.130800>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<31.799900,0.000000,5.130800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.799900,0.000000,5.130800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.799900,0.000000,5.715400>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,90.000000,0> translate<31.799900,0.000000,5.715400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.799900,0.000000,5.715400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.994800,0.000000,5.910300>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<31.799900,0.000000,5.715400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.994800,0.000000,5.910300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.384600,0.000000,5.910300>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<31.994800,0.000000,5.910300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.384600,0.000000,5.910300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.579500,0.000000,5.715400>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<32.384600,0.000000,5.910300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.579500,0.000000,5.715400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.579500,0.000000,5.130800>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,-90.000000,0> translate<32.579500,0.000000,5.130800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.579500,0.000000,5.520500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.969200,0.000000,5.910300>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,-45.004380,0> translate<32.579500,0.000000,5.520500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.799900,0.000000,7.079600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.799900,0.000000,6.300100>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,-90.000000,0> translate<31.799900,0.000000,6.300100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.799900,0.000000,6.300100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.969200,0.000000,6.300100>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<31.799900,0.000000,6.300100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.969200,0.000000,6.300100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.969200,0.000000,7.079600>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<32.969200,0.000000,7.079600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.384600,0.000000,6.300100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.384600,0.000000,6.689800>}
box{<0,0,-0.050800><0.389700,0.036000,0.050800> rotate<0,90.000000,0> translate<32.384600,0.000000,6.689800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.994800,0.000000,8.248900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.799900,0.000000,8.054000>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<31.799900,0.000000,8.054000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.799900,0.000000,8.054000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.799900,0.000000,7.664200>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<31.799900,0.000000,7.664200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.799900,0.000000,7.664200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.994800,0.000000,7.469400>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<31.799900,0.000000,7.664200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.994800,0.000000,7.469400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.189700,0.000000,7.469400>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<31.994800,0.000000,7.469400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.189700,0.000000,7.469400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.384600,0.000000,7.664200>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-44.982329,0> translate<32.189700,0.000000,7.469400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.384600,0.000000,7.664200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.384600,0.000000,8.054000>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<32.384600,0.000000,8.054000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.384600,0.000000,8.054000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.579500,0.000000,8.248900>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<32.384600,0.000000,8.054000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.579500,0.000000,8.248900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.774400,0.000000,8.248900>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<32.579500,0.000000,8.248900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.774400,0.000000,8.248900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.969200,0.000000,8.054000>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<32.774400,0.000000,8.248900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.969200,0.000000,8.054000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.969200,0.000000,7.664200>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<32.969200,0.000000,7.664200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.969200,0.000000,7.664200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.774400,0.000000,7.469400>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<32.774400,0.000000,7.469400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.799900,0.000000,9.418200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.799900,0.000000,8.638700>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,-90.000000,0> translate<31.799900,0.000000,8.638700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.799900,0.000000,8.638700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.969200,0.000000,8.638700>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<31.799900,0.000000,8.638700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.969200,0.000000,8.638700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.969200,0.000000,9.418200>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<32.969200,0.000000,9.418200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.384600,0.000000,8.638700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.384600,0.000000,9.028400>}
box{<0,0,-0.050800><0.389700,0.036000,0.050800> rotate<0,90.000000,0> translate<32.384600,0.000000,9.028400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.969200,0.000000,10.197700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.799900,0.000000,10.197700>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<31.799900,0.000000,10.197700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.799900,0.000000,9.808000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.799900,0.000000,10.587500>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<31.799900,0.000000,10.587500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.534800,0.000000,5.130800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.339900,0.000000,5.325600>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<34.339900,0.000000,5.325600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.339900,0.000000,5.325600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.339900,0.000000,5.715400>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<34.339900,0.000000,5.715400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.339900,0.000000,5.715400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.534800,0.000000,5.910300>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<34.339900,0.000000,5.715400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.534800,0.000000,5.910300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.729700,0.000000,5.910300>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<34.534800,0.000000,5.910300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.729700,0.000000,5.910300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.924600,0.000000,5.715400>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<34.729700,0.000000,5.910300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.924600,0.000000,5.715400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.924600,0.000000,5.520500>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<34.924600,0.000000,5.520500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.924600,0.000000,5.715400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.119500,0.000000,5.910300>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<34.924600,0.000000,5.715400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.119500,0.000000,5.910300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.314400,0.000000,5.910300>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<35.119500,0.000000,5.910300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.314400,0.000000,5.910300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.509200,0.000000,5.715400>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<35.314400,0.000000,5.910300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.509200,0.000000,5.715400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.509200,0.000000,5.325600>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<35.509200,0.000000,5.325600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.509200,0.000000,5.325600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.314400,0.000000,5.130800>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<35.314400,0.000000,5.130800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.339900,0.000000,6.300100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.119500,0.000000,6.300100>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<34.339900,0.000000,6.300100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.119500,0.000000,6.300100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.509200,0.000000,6.689800>}
box{<0,0,-0.050800><0.551119,0.036000,0.050800> rotate<0,-44.997030,0> translate<35.119500,0.000000,6.300100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.509200,0.000000,6.689800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.119500,0.000000,7.079600>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,45.004380,0> translate<35.119500,0.000000,7.079600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.119500,0.000000,7.079600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.339900,0.000000,7.079600>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<34.339900,0.000000,7.079600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.534800,0.000000,7.469400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.339900,0.000000,7.664200>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<34.339900,0.000000,7.664200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.339900,0.000000,7.664200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.339900,0.000000,8.054000>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<34.339900,0.000000,8.054000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.339900,0.000000,8.054000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.534800,0.000000,8.248900>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<34.339900,0.000000,8.054000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.534800,0.000000,8.248900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.729700,0.000000,8.248900>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<34.534800,0.000000,8.248900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.729700,0.000000,8.248900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.924600,0.000000,8.054000>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<34.729700,0.000000,8.248900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.924600,0.000000,8.054000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.924600,0.000000,7.859100>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<34.924600,0.000000,7.859100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.924600,0.000000,8.054000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.119500,0.000000,8.248900>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<34.924600,0.000000,8.054000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.119500,0.000000,8.248900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.314400,0.000000,8.248900>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<35.119500,0.000000,8.248900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.314400,0.000000,8.248900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.509200,0.000000,8.054000>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<35.314400,0.000000,8.248900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.509200,0.000000,8.054000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.509200,0.000000,7.664200>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<35.509200,0.000000,7.664200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.509200,0.000000,7.664200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.314400,0.000000,7.469400>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<35.314400,0.000000,7.469400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.614300,0.000000,6.300000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.919500,0.000000,6.300000>}
box{<0,0,-0.050800><0.694800,0.036000,0.050800> rotate<0,0.000000,0> translate<37.919500,0.000000,6.300000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.919500,0.000000,6.300000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.919500,0.000000,5.778900>}
box{<0,0,-0.050800><0.521100,0.036000,0.050800> rotate<0,-90.000000,0> translate<37.919500,0.000000,5.778900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.919500,0.000000,5.778900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.266900,0.000000,5.952600>}
box{<0,0,-0.050800><0.388405,0.036000,0.050800> rotate<0,-26.563298,0> translate<37.919500,0.000000,5.778900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.266900,0.000000,5.952600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.440600,0.000000,5.952600>}
box{<0,0,-0.050800><0.173700,0.036000,0.050800> rotate<0,0.000000,0> translate<38.266900,0.000000,5.952600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.440600,0.000000,5.952600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.614300,0.000000,5.778900>}
box{<0,0,-0.050800><0.245649,0.036000,0.050800> rotate<0,44.997030,0> translate<38.440600,0.000000,5.952600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.614300,0.000000,5.778900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.614300,0.000000,5.431500>}
box{<0,0,-0.050800><0.347400,0.036000,0.050800> rotate<0,-90.000000,0> translate<38.614300,0.000000,5.431500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.614300,0.000000,5.431500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.440600,0.000000,5.257800>}
box{<0,0,-0.050800><0.245649,0.036000,0.050800> rotate<0,-44.997030,0> translate<38.440600,0.000000,5.257800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.440600,0.000000,5.257800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.093200,0.000000,5.257800>}
box{<0,0,-0.050800><0.347400,0.036000,0.050800> rotate<0,0.000000,0> translate<38.093200,0.000000,5.257800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.093200,0.000000,5.257800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.919500,0.000000,5.431500>}
box{<0,0,-0.050800><0.245649,0.036000,0.050800> rotate<0,44.997030,0> translate<37.919500,0.000000,5.431500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.971900,0.000000,6.300000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.971900,0.000000,5.605200>}
box{<0,0,-0.050800><0.694800,0.036000,0.050800> rotate<0,-90.000000,0> translate<38.971900,0.000000,5.605200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.971900,0.000000,5.605200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.319300,0.000000,5.257800>}
box{<0,0,-0.050800><0.491298,0.036000,0.050800> rotate<0,44.997030,0> translate<38.971900,0.000000,5.605200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.319300,0.000000,5.257800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.666700,0.000000,5.605200>}
box{<0,0,-0.050800><0.491298,0.036000,0.050800> rotate<0,-44.997030,0> translate<39.319300,0.000000,5.257800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.666700,0.000000,5.605200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.666700,0.000000,6.300000>}
box{<0,0,-0.050800><0.694800,0.036000,0.050800> rotate<0,90.000000,0> translate<39.666700,0.000000,6.300000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.771500,0.000000,6.126300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.597800,0.000000,6.300000>}
box{<0,0,-0.050800><0.245649,0.036000,0.050800> rotate<0,44.997030,0> translate<41.597800,0.000000,6.300000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.597800,0.000000,6.300000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.250400,0.000000,6.300000>}
box{<0,0,-0.050800><0.347400,0.036000,0.050800> rotate<0,0.000000,0> translate<41.250400,0.000000,6.300000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.250400,0.000000,6.300000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.076700,0.000000,6.126300>}
box{<0,0,-0.050800><0.245649,0.036000,0.050800> rotate<0,-44.997030,0> translate<41.076700,0.000000,6.126300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.076700,0.000000,6.126300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.076700,0.000000,5.431500>}
box{<0,0,-0.050800><0.694800,0.036000,0.050800> rotate<0,-90.000000,0> translate<41.076700,0.000000,5.431500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.076700,0.000000,5.431500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.250400,0.000000,5.257800>}
box{<0,0,-0.050800><0.245649,0.036000,0.050800> rotate<0,44.997030,0> translate<41.076700,0.000000,5.431500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.250400,0.000000,5.257800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.597800,0.000000,5.257800>}
box{<0,0,-0.050800><0.347400,0.036000,0.050800> rotate<0,0.000000,0> translate<41.250400,0.000000,5.257800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.597800,0.000000,5.257800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.771500,0.000000,5.431500>}
box{<0,0,-0.050800><0.245649,0.036000,0.050800> rotate<0,-44.997030,0> translate<41.597800,0.000000,5.257800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.771500,0.000000,5.431500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.771500,0.000000,5.778900>}
box{<0,0,-0.050800><0.347400,0.036000,0.050800> rotate<0,90.000000,0> translate<41.771500,0.000000,5.778900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.771500,0.000000,5.778900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.424100,0.000000,5.778900>}
box{<0,0,-0.050800><0.347400,0.036000,0.050800> rotate<0,0.000000,0> translate<41.424100,0.000000,5.778900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.129100,0.000000,5.257800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.129100,0.000000,6.300000>}
box{<0,0,-0.050800><1.042200,0.036000,0.050800> rotate<0,90.000000,0> translate<42.129100,0.000000,6.300000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.129100,0.000000,6.300000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.823900,0.000000,5.257800>}
box{<0,0,-0.050800><1.252569,0.036000,0.050800> rotate<0,56.306216,0> translate<42.129100,0.000000,6.300000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.823900,0.000000,5.257800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.823900,0.000000,6.300000>}
box{<0,0,-0.050800><1.042200,0.036000,0.050800> rotate<0,90.000000,0> translate<42.823900,0.000000,6.300000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.181500,0.000000,6.300000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.181500,0.000000,5.257800>}
box{<0,0,-0.050800><1.042200,0.036000,0.050800> rotate<0,-90.000000,0> translate<43.181500,0.000000,5.257800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.181500,0.000000,5.257800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.702600,0.000000,5.257800>}
box{<0,0,-0.050800><0.521100,0.036000,0.050800> rotate<0,0.000000,0> translate<43.181500,0.000000,5.257800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.702600,0.000000,5.257800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.876300,0.000000,5.431500>}
box{<0,0,-0.050800><0.245649,0.036000,0.050800> rotate<0,-44.997030,0> translate<43.702600,0.000000,5.257800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.876300,0.000000,5.431500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.876300,0.000000,6.126300>}
box{<0,0,-0.050800><0.694800,0.036000,0.050800> rotate<0,90.000000,0> translate<43.876300,0.000000,6.126300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.876300,0.000000,6.126300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.702600,0.000000,6.300000>}
box{<0,0,-0.050800><0.245649,0.036000,0.050800> rotate<0,44.997030,0> translate<43.702600,0.000000,6.300000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.702600,0.000000,6.300000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.181500,0.000000,6.300000>}
box{<0,0,-0.050800><0.521100,0.036000,0.050800> rotate<0,0.000000,0> translate<43.181500,0.000000,6.300000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.286300,0.000000,6.300000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.286300,0.000000,5.605200>}
box{<0,0,-0.050800><0.694800,0.036000,0.050800> rotate<0,-90.000000,0> translate<45.286300,0.000000,5.605200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.286300,0.000000,5.605200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.633700,0.000000,5.257800>}
box{<0,0,-0.050800><0.491298,0.036000,0.050800> rotate<0,44.997030,0> translate<45.286300,0.000000,5.605200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.633700,0.000000,5.257800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.981100,0.000000,5.605200>}
box{<0,0,-0.050800><0.491298,0.036000,0.050800> rotate<0,-44.997030,0> translate<45.633700,0.000000,5.257800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.981100,0.000000,5.605200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.981100,0.000000,6.300000>}
box{<0,0,-0.050800><0.694800,0.036000,0.050800> rotate<0,90.000000,0> translate<45.981100,0.000000,6.300000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.338700,0.000000,5.257800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.686100,0.000000,5.257800>}
box{<0,0,-0.050800><0.347400,0.036000,0.050800> rotate<0,0.000000,0> translate<46.338700,0.000000,5.257800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.512400,0.000000,5.257800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.512400,0.000000,6.300000>}
box{<0,0,-0.050800><1.042200,0.036000,0.050800> rotate<0,90.000000,0> translate<46.512400,0.000000,6.300000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.338700,0.000000,6.300000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.686100,0.000000,6.300000>}
box{<0,0,-0.050800><0.347400,0.036000,0.050800> rotate<0,0.000000,0> translate<46.338700,0.000000,6.300000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.518100,0.000000,5.130800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.518100,0.000000,5.910300>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<49.518100,0.000000,5.910300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.518100,0.000000,5.910300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.907800,0.000000,6.300100>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,-45.004380,0> translate<49.518100,0.000000,5.910300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.907800,0.000000,6.300100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.297600,0.000000,5.910300>}
box{<0,0,-0.050800><0.551260,0.036000,0.050800> rotate<0,44.997030,0> translate<49.907800,0.000000,6.300100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.297600,0.000000,5.910300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.297600,0.000000,5.130800>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,-90.000000,0> translate<50.297600,0.000000,5.130800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.518100,0.000000,5.715400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.297600,0.000000,5.715400>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,0.000000,0> translate<49.518100,0.000000,5.715400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.687400,0.000000,5.325600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.687400,0.000000,6.105200>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,90.000000,0> translate<50.687400,0.000000,6.105200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.687400,0.000000,6.105200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.882200,0.000000,6.300100>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-45.011732,0> translate<50.687400,0.000000,6.105200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.882200,0.000000,6.300100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.272000,0.000000,6.300100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<50.882200,0.000000,6.300100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.272000,0.000000,6.300100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.466900,0.000000,6.105200>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<51.272000,0.000000,6.300100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.466900,0.000000,6.105200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.466900,0.000000,5.325600>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,-90.000000,0> translate<51.466900,0.000000,5.325600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.466900,0.000000,5.325600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.272000,0.000000,5.130800>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-44.982329,0> translate<51.272000,0.000000,5.130800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.272000,0.000000,5.130800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.882200,0.000000,5.130800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<50.882200,0.000000,5.130800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.882200,0.000000,5.130800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.687400,0.000000,5.325600>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,44.997030,0> translate<50.687400,0.000000,5.325600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.687400,0.000000,5.325600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.466900,0.000000,6.105200>}
box{<0,0,-0.050800><1.102450,0.036000,0.050800> rotate<0,-45.000705,0> translate<50.687400,0.000000,5.325600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.026000,0.000000,5.910300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.415700,0.000000,6.300100>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,-45.004380,0> translate<53.026000,0.000000,5.910300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.415700,0.000000,6.300100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.415700,0.000000,5.130800>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,-90.000000,0> translate<53.415700,0.000000,5.130800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.026000,0.000000,5.130800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.805500,0.000000,5.130800>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,0.000000,0> translate<53.026000,0.000000,5.130800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.144100,0.000000,5.130800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<55.364600,0.000000,5.130800>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,0.000000,0> translate<55.364600,0.000000,5.130800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<55.364600,0.000000,5.130800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.144100,0.000000,5.910300>}
box{<0,0,-0.050800><1.102379,0.036000,0.050800> rotate<0,-44.997030,0> translate<55.364600,0.000000,5.130800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.144100,0.000000,5.910300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.144100,0.000000,6.105200>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,90.000000,0> translate<56.144100,0.000000,6.105200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.144100,0.000000,6.105200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<55.949200,0.000000,6.300100>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<55.949200,0.000000,6.300100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<55.949200,0.000000,6.300100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<55.559400,0.000000,6.300100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<55.559400,0.000000,6.300100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<55.559400,0.000000,6.300100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<55.364600,0.000000,6.105200>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-45.011732,0> translate<55.364600,0.000000,6.105200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.703200,0.000000,6.105200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.898000,0.000000,6.300100>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-45.011732,0> translate<57.703200,0.000000,6.105200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.898000,0.000000,6.300100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.287800,0.000000,6.300100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<57.898000,0.000000,6.300100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.287800,0.000000,6.300100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.482700,0.000000,6.105200>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<58.287800,0.000000,6.300100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.482700,0.000000,6.105200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.482700,0.000000,5.910300>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<58.482700,0.000000,5.910300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.482700,0.000000,5.910300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.287800,0.000000,5.715400>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<58.287800,0.000000,5.715400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.287800,0.000000,5.715400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.092900,0.000000,5.715400>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<58.092900,0.000000,5.715400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.287800,0.000000,5.715400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.482700,0.000000,5.520500>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<58.287800,0.000000,5.715400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.482700,0.000000,5.520500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.482700,0.000000,5.325600>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<58.482700,0.000000,5.325600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.482700,0.000000,5.325600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.287800,0.000000,5.130800>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-44.982329,0> translate<58.287800,0.000000,5.130800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.287800,0.000000,5.130800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.898000,0.000000,5.130800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<57.898000,0.000000,5.130800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.898000,0.000000,5.130800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.703200,0.000000,5.325600>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,44.997030,0> translate<57.703200,0.000000,5.325600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.626400,0.000000,5.130800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.626400,0.000000,6.300100>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,90.000000,0> translate<60.626400,0.000000,6.300100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.626400,0.000000,6.300100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.041800,0.000000,5.715400>}
box{<0,0,-0.050800><0.826820,0.036000,0.050800> rotate<0,-45.001930,0> translate<60.041800,0.000000,5.715400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.041800,0.000000,5.715400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.821300,0.000000,5.715400>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,0.000000,0> translate<60.041800,0.000000,5.715400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.159900,0.000000,6.300100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<62.380400,0.000000,6.300100>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,0.000000,0> translate<62.380400,0.000000,6.300100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<62.380400,0.000000,6.300100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<62.380400,0.000000,5.715400>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,-90.000000,0> translate<62.380400,0.000000,5.715400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<62.380400,0.000000,5.715400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<62.770100,0.000000,5.910300>}
box{<0,0,-0.050800><0.435720,0.036000,0.050800> rotate<0,-26.569178,0> translate<62.380400,0.000000,5.715400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<62.770100,0.000000,5.910300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<62.965000,0.000000,5.910300>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<62.770100,0.000000,5.910300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<62.965000,0.000000,5.910300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.159900,0.000000,5.715400>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<62.965000,0.000000,5.910300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.159900,0.000000,5.715400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.159900,0.000000,5.325600>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<63.159900,0.000000,5.325600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.159900,0.000000,5.325600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<62.965000,0.000000,5.130800>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-44.982329,0> translate<62.965000,0.000000,5.130800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<62.965000,0.000000,5.130800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<62.575200,0.000000,5.130800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<62.575200,0.000000,5.130800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<62.575200,0.000000,5.130800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<62.380400,0.000000,5.325600>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,44.997030,0> translate<62.380400,0.000000,5.325600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.859700,0.000000,16.814800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.469900,0.000000,17.204500>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,44.989680,0> translate<58.469900,0.000000,17.204500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.469900,0.000000,17.204500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.639200,0.000000,17.204500>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<58.469900,0.000000,17.204500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.639200,0.000000,16.814800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.639200,0.000000,17.594300>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<59.639200,0.000000,17.594300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.469900,0.000000,33.850300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.664800,0.000000,33.460500>}
box{<0,0,-0.050800><0.435810,0.036000,0.050800> rotate<0,63.430762,0> translate<58.469900,0.000000,33.850300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.664800,0.000000,33.460500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.054600,0.000000,33.070800>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,44.989680,0> translate<58.664800,0.000000,33.460500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.054600,0.000000,33.070800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.444400,0.000000,33.070800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<59.054600,0.000000,33.070800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.444400,0.000000,33.070800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.639200,0.000000,33.265600>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<59.444400,0.000000,33.070800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.639200,0.000000,33.265600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.639200,0.000000,33.655400>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<59.639200,0.000000,33.655400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.639200,0.000000,33.655400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.444400,0.000000,33.850300>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<59.444400,0.000000,33.850300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.444400,0.000000,33.850300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.249500,0.000000,33.850300>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<59.249500,0.000000,33.850300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.249500,0.000000,33.850300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.054600,0.000000,33.655400>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<59.054600,0.000000,33.655400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.054600,0.000000,33.655400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.054600,0.000000,33.070800>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,-90.000000,0> translate<59.054600,0.000000,33.070800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.512800,0.000000,21.912300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.902500,0.000000,22.302100>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,-45.004380,0> translate<13.512800,0.000000,21.912300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.902500,0.000000,22.302100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.902500,0.000000,21.132800>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,-90.000000,0> translate<13.902500,0.000000,21.132800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.512800,0.000000,21.132800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.292300,0.000000,21.132800>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,0.000000,0> translate<13.512800,0.000000,21.132800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.929300,0.000000,22.302100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.539500,0.000000,22.107200>}
box{<0,0,-0.050800><0.435810,0.036000,0.050800> rotate<0,-26.563298,0> translate<30.539500,0.000000,22.107200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.539500,0.000000,22.107200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.149800,0.000000,21.717400>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,-45.004380,0> translate<30.149800,0.000000,21.717400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.149800,0.000000,21.717400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.149800,0.000000,21.327600>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<30.149800,0.000000,21.327600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.149800,0.000000,21.327600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.344600,0.000000,21.132800>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,44.997030,0> translate<30.149800,0.000000,21.327600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.344600,0.000000,21.132800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.734400,0.000000,21.132800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<30.344600,0.000000,21.132800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.734400,0.000000,21.132800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.929300,0.000000,21.327600>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-44.982329,0> translate<30.734400,0.000000,21.132800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.929300,0.000000,21.327600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.929300,0.000000,21.522500>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,90.000000,0> translate<30.929300,0.000000,21.522500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.929300,0.000000,21.522500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.734400,0.000000,21.717400>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<30.734400,0.000000,21.717400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.734400,0.000000,21.717400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.149800,0.000000,21.717400>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,0.000000,0> translate<30.149800,0.000000,21.717400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.180800,0.000000,38.558100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.180800,0.000000,37.583600>}
box{<0,0,-0.050800><0.974500,0.036000,0.050800> rotate<0,-90.000000,0> translate<24.180800,0.000000,37.583600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.180800,0.000000,37.583600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.375600,0.000000,37.388800>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,44.997030,0> translate<24.180800,0.000000,37.583600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.375600,0.000000,37.388800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.765400,0.000000,37.388800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<24.375600,0.000000,37.388800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.765400,0.000000,37.388800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.960300,0.000000,37.583600>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-44.982329,0> translate<24.765400,0.000000,37.388800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.960300,0.000000,37.583600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.960300,0.000000,38.558100>}
box{<0,0,-0.050800><0.974500,0.036000,0.050800> rotate<0,90.000000,0> translate<24.960300,0.000000,38.558100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.129600,0.000000,38.363200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.934700,0.000000,38.558100>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<25.934700,0.000000,38.558100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.934700,0.000000,38.558100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.544900,0.000000,38.558100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<25.544900,0.000000,38.558100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.544900,0.000000,38.558100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.350100,0.000000,38.363200>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-45.011732,0> translate<25.350100,0.000000,38.363200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.350100,0.000000,38.363200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.350100,0.000000,38.168300>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<25.350100,0.000000,38.168300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.350100,0.000000,38.168300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.544900,0.000000,37.973400>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<25.350100,0.000000,38.168300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.544900,0.000000,37.973400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.934700,0.000000,37.973400>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<25.544900,0.000000,37.973400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.934700,0.000000,37.973400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.129600,0.000000,37.778500>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<25.934700,0.000000,37.973400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.129600,0.000000,37.778500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.129600,0.000000,37.583600>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<26.129600,0.000000,37.583600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.129600,0.000000,37.583600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.934700,0.000000,37.388800>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-44.982329,0> translate<25.934700,0.000000,37.388800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.934700,0.000000,37.388800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.544900,0.000000,37.388800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<25.544900,0.000000,37.388800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.544900,0.000000,37.388800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.350100,0.000000,37.583600>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,44.997030,0> translate<25.350100,0.000000,37.583600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.298900,0.000000,38.558100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.519400,0.000000,38.558100>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,0.000000,0> translate<26.519400,0.000000,38.558100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.519400,0.000000,38.558100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.519400,0.000000,37.388800>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,-90.000000,0> translate<26.519400,0.000000,37.388800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.519400,0.000000,37.388800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.298900,0.000000,37.388800>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,0.000000,0> translate<26.519400,0.000000,37.388800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.519400,0.000000,37.973400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.909100,0.000000,37.973400>}
box{<0,0,-0.050800><0.389700,0.036000,0.050800> rotate<0,0.000000,0> translate<26.519400,0.000000,37.973400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.858000,0.000000,37.388800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.247700,0.000000,37.388800>}
box{<0,0,-0.050800><0.389700,0.036000,0.050800> rotate<0,0.000000,0> translate<28.858000,0.000000,37.388800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.052800,0.000000,37.388800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.052800,0.000000,38.558100>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,90.000000,0> translate<29.052800,0.000000,38.558100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.858000,0.000000,38.558100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.247700,0.000000,38.558100>}
box{<0,0,-0.050800><0.389700,0.036000,0.050800> rotate<0,0.000000,0> translate<28.858000,0.000000,38.558100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.417000,0.000000,38.363200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.222100,0.000000,38.558100>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<30.222100,0.000000,38.558100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.222100,0.000000,38.558100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.832300,0.000000,38.558100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<29.832300,0.000000,38.558100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.832300,0.000000,38.558100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.637500,0.000000,38.363200>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-45.011732,0> translate<29.637500,0.000000,38.363200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.637500,0.000000,38.363200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.637500,0.000000,37.583600>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,-90.000000,0> translate<29.637500,0.000000,37.583600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.637500,0.000000,37.583600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.832300,0.000000,37.388800>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,44.997030,0> translate<29.637500,0.000000,37.583600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.832300,0.000000,37.388800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.222100,0.000000,37.388800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<29.832300,0.000000,37.388800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.222100,0.000000,37.388800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.417000,0.000000,37.583600>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-44.982329,0> translate<30.222100,0.000000,37.388800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.755600,0.000000,38.363200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.560700,0.000000,38.558100>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<32.560700,0.000000,38.558100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.560700,0.000000,38.558100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.170900,0.000000,38.558100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<32.170900,0.000000,38.558100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.170900,0.000000,38.558100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.976100,0.000000,38.363200>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-45.011732,0> translate<31.976100,0.000000,38.363200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.976100,0.000000,38.363200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.976100,0.000000,38.168300>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<31.976100,0.000000,38.168300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.976100,0.000000,38.168300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.170900,0.000000,37.973400>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<31.976100,0.000000,38.168300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.170900,0.000000,37.973400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.560700,0.000000,37.973400>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<32.170900,0.000000,37.973400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.560700,0.000000,37.973400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.755600,0.000000,37.778500>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<32.560700,0.000000,37.973400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.755600,0.000000,37.778500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.755600,0.000000,37.583600>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<32.755600,0.000000,37.583600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.755600,0.000000,37.583600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.560700,0.000000,37.388800>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-44.982329,0> translate<32.560700,0.000000,37.388800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.560700,0.000000,37.388800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.170900,0.000000,37.388800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<32.170900,0.000000,37.388800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.170900,0.000000,37.388800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.976100,0.000000,37.583600>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,44.997030,0> translate<31.976100,0.000000,37.583600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.730000,0.000000,38.558100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.340200,0.000000,38.558100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<33.340200,0.000000,38.558100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.340200,0.000000,38.558100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.145400,0.000000,38.363200>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-45.011732,0> translate<33.145400,0.000000,38.363200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.145400,0.000000,38.363200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.145400,0.000000,37.583600>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,-90.000000,0> translate<33.145400,0.000000,37.583600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.145400,0.000000,37.583600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.340200,0.000000,37.388800>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,44.997030,0> translate<33.145400,0.000000,37.583600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.340200,0.000000,37.388800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.730000,0.000000,37.388800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<33.340200,0.000000,37.388800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.730000,0.000000,37.388800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.924900,0.000000,37.583600>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-44.982329,0> translate<33.730000,0.000000,37.388800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.924900,0.000000,37.583600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.924900,0.000000,38.363200>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,90.000000,0> translate<33.924900,0.000000,38.363200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.924900,0.000000,38.363200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.730000,0.000000,38.558100>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<33.730000,0.000000,38.558100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.094200,0.000000,38.363200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.899300,0.000000,38.558100>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<34.899300,0.000000,38.558100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.899300,0.000000,38.558100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.509500,0.000000,38.558100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<34.509500,0.000000,38.558100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.509500,0.000000,38.558100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.314700,0.000000,38.363200>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-45.011732,0> translate<34.314700,0.000000,38.363200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.314700,0.000000,38.363200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.314700,0.000000,37.583600>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,-90.000000,0> translate<34.314700,0.000000,37.583600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.314700,0.000000,37.583600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.509500,0.000000,37.388800>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,44.997030,0> translate<34.314700,0.000000,37.583600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.509500,0.000000,37.388800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.899300,0.000000,37.388800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<34.509500,0.000000,37.388800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.899300,0.000000,37.388800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.094200,0.000000,37.583600>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-44.982329,0> translate<34.899300,0.000000,37.388800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.484000,0.000000,38.558100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.484000,0.000000,37.388800>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,-90.000000,0> translate<35.484000,0.000000,37.388800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.484000,0.000000,37.778500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.263500,0.000000,38.558100>}
box{<0,0,-0.050800><1.102450,0.036000,0.050800> rotate<0,-45.000705,0> translate<35.484000,0.000000,37.778500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.678800,0.000000,37.973400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.263500,0.000000,37.388800>}
box{<0,0,-0.050800><0.826820,0.036000,0.050800> rotate<0,44.992130,0> translate<35.678800,0.000000,37.973400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.432800,0.000000,38.558100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.653300,0.000000,38.558100>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,0.000000,0> translate<36.653300,0.000000,38.558100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.653300,0.000000,38.558100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.653300,0.000000,37.388800>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,-90.000000,0> translate<36.653300,0.000000,37.388800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.653300,0.000000,37.388800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.432800,0.000000,37.388800>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,0.000000,0> translate<36.653300,0.000000,37.388800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.653300,0.000000,37.973400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.043000,0.000000,37.973400>}
box{<0,0,-0.050800><0.389700,0.036000,0.050800> rotate<0,0.000000,0> translate<36.653300,0.000000,37.973400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.212300,0.000000,37.388800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.212300,0.000000,38.558100>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,90.000000,0> translate<38.212300,0.000000,38.558100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.822600,0.000000,38.558100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.602100,0.000000,38.558100>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,0.000000,0> translate<37.822600,0.000000,38.558100> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<49.014000,0.000000,43.357800>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<49.014000,0.000000,45.086400>}
box{<0,0,-0.177800><1.728600,0.036000,0.177800> rotate<0,90.000000,0> translate<49.014000,0.000000,45.086400> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<48.437800,0.000000,45.086400>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<49.590200,0.000000,45.086400>}
box{<0,0,-0.177800><1.152400,0.036000,0.177800> rotate<0,0.000000,0> translate<48.437800,0.000000,45.086400> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<50.355600,0.000000,44.510200>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<50.355600,0.000000,43.645900>}
box{<0,0,-0.177800><0.864300,0.036000,0.177800> rotate<0,-90.000000,0> translate<50.355600,0.000000,43.645900> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<50.355600,0.000000,43.645900>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<50.643700,0.000000,43.357800>}
box{<0,0,-0.177800><0.407435,0.036000,0.177800> rotate<0,44.997030,0> translate<50.355600,0.000000,43.645900> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<50.643700,0.000000,43.357800>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<51.508000,0.000000,43.357800>}
box{<0,0,-0.177800><0.864300,0.036000,0.177800> rotate<0,0.000000,0> translate<50.643700,0.000000,43.357800> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<51.508000,0.000000,43.357800>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<51.508000,0.000000,44.510200>}
box{<0,0,-0.177800><1.152400,0.036000,0.177800> rotate<0,90.000000,0> translate<51.508000,0.000000,44.510200> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<52.561500,0.000000,44.798300>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<52.561500,0.000000,43.645900>}
box{<0,0,-0.177800><1.152400,0.036000,0.177800> rotate<0,-90.000000,0> translate<52.561500,0.000000,43.645900> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<52.561500,0.000000,43.645900>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<52.849600,0.000000,43.357800>}
box{<0,0,-0.177800><0.407435,0.036000,0.177800> rotate<0,44.997030,0> translate<52.561500,0.000000,43.645900> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<52.273400,0.000000,44.510200>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<52.849600,0.000000,44.510200>}
box{<0,0,-0.177800><0.576200,0.036000,0.177800> rotate<0,0.000000,0> translate<52.273400,0.000000,44.510200> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<53.551900,0.000000,44.510200>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<53.840000,0.000000,44.510200>}
box{<0,0,-0.177800><0.288100,0.036000,0.177800> rotate<0,0.000000,0> translate<53.551900,0.000000,44.510200> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<53.840000,0.000000,44.510200>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<53.840000,0.000000,43.357800>}
box{<0,0,-0.177800><1.152400,0.036000,0.177800> rotate<0,-90.000000,0> translate<53.840000,0.000000,43.357800> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<53.551900,0.000000,43.357800>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<54.128100,0.000000,43.357800>}
box{<0,0,-0.177800><0.576200,0.036000,0.177800> rotate<0,0.000000,0> translate<53.551900,0.000000,43.357800> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<53.840000,0.000000,45.374500>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<53.840000,0.000000,45.086400>}
box{<0,0,-0.177800><0.288100,0.036000,0.177800> rotate<0,-90.000000,0> translate<53.840000,0.000000,45.086400> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<54.830400,0.000000,43.357800>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<55.694700,0.000000,43.357800>}
box{<0,0,-0.177800><0.864300,0.036000,0.177800> rotate<0,0.000000,0> translate<54.830400,0.000000,43.357800> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<55.694700,0.000000,43.357800>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<55.982800,0.000000,43.645900>}
box{<0,0,-0.177800><0.407435,0.036000,0.177800> rotate<0,-44.997030,0> translate<55.694700,0.000000,43.357800> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<55.982800,0.000000,43.645900>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<55.694700,0.000000,43.934000>}
box{<0,0,-0.177800><0.407435,0.036000,0.177800> rotate<0,44.997030,0> translate<55.694700,0.000000,43.934000> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<55.694700,0.000000,43.934000>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<55.118500,0.000000,43.934000>}
box{<0,0,-0.177800><0.576200,0.036000,0.177800> rotate<0,0.000000,0> translate<55.118500,0.000000,43.934000> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<55.118500,0.000000,43.934000>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<54.830400,0.000000,44.222100>}
box{<0,0,-0.177800><0.407435,0.036000,0.177800> rotate<0,44.997030,0> translate<54.830400,0.000000,44.222100> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<54.830400,0.000000,44.222100>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<55.118500,0.000000,44.510200>}
box{<0,0,-0.177800><0.407435,0.036000,0.177800> rotate<0,-44.997030,0> translate<54.830400,0.000000,44.222100> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<55.118500,0.000000,44.510200>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<55.982800,0.000000,44.510200>}
box{<0,0,-0.177800><0.864300,0.036000,0.177800> rotate<0,0.000000,0> translate<55.118500,0.000000,44.510200> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<57.900600,0.000000,45.086400>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<57.900600,0.000000,43.357800>}
box{<0,0,-0.177800><1.728600,0.036000,0.177800> rotate<0,-90.000000,0> translate<57.900600,0.000000,43.357800> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<57.900600,0.000000,43.357800>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<57.036300,0.000000,43.357800>}
box{<0,0,-0.177800><0.864300,0.036000,0.177800> rotate<0,0.000000,0> translate<57.036300,0.000000,43.357800> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<57.036300,0.000000,43.357800>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<56.748200,0.000000,43.645900>}
box{<0,0,-0.177800><0.407435,0.036000,0.177800> rotate<0,44.997030,0> translate<56.748200,0.000000,43.645900> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<56.748200,0.000000,43.645900>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<56.748200,0.000000,44.222100>}
box{<0,0,-0.177800><0.576200,0.036000,0.177800> rotate<0,90.000000,0> translate<56.748200,0.000000,44.222100> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<56.748200,0.000000,44.222100>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<57.036300,0.000000,44.510200>}
box{<0,0,-0.177800><0.407435,0.036000,0.177800> rotate<0,-44.997030,0> translate<56.748200,0.000000,44.222100> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<57.036300,0.000000,44.510200>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<57.900600,0.000000,44.510200>}
box{<0,0,-0.177800><0.864300,0.036000,0.177800> rotate<0,0.000000,0> translate<57.036300,0.000000,44.510200> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<58.666000,0.000000,44.510200>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<58.666000,0.000000,43.645900>}
box{<0,0,-0.177800><0.864300,0.036000,0.177800> rotate<0,-90.000000,0> translate<58.666000,0.000000,43.645900> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<58.666000,0.000000,43.645900>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<58.954100,0.000000,43.357800>}
box{<0,0,-0.177800><0.407435,0.036000,0.177800> rotate<0,44.997030,0> translate<58.666000,0.000000,43.645900> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<58.954100,0.000000,43.357800>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<59.818400,0.000000,43.357800>}
box{<0,0,-0.177800><0.864300,0.036000,0.177800> rotate<0,0.000000,0> translate<58.954100,0.000000,43.357800> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<59.818400,0.000000,43.357800>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<59.818400,0.000000,44.510200>}
box{<0,0,-0.177800><1.152400,0.036000,0.177800> rotate<0,90.000000,0> translate<59.818400,0.000000,44.510200> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<60.583800,0.000000,44.510200>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<60.871900,0.000000,44.510200>}
box{<0,0,-0.177800><0.288100,0.036000,0.177800> rotate<0,0.000000,0> translate<60.583800,0.000000,44.510200> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<60.871900,0.000000,44.510200>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<60.871900,0.000000,43.357800>}
box{<0,0,-0.177800><1.152400,0.036000,0.177800> rotate<0,-90.000000,0> translate<60.871900,0.000000,43.357800> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<60.583800,0.000000,43.357800>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<61.160000,0.000000,43.357800>}
box{<0,0,-0.177800><0.576200,0.036000,0.177800> rotate<0,0.000000,0> translate<60.583800,0.000000,43.357800> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<60.871900,0.000000,45.374500>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<60.871900,0.000000,45.086400>}
box{<0,0,-0.177800><0.288100,0.036000,0.177800> rotate<0,-90.000000,0> translate<60.871900,0.000000,45.086400> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<61.862300,0.000000,43.357800>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<61.862300,0.000000,44.510200>}
box{<0,0,-0.177800><1.152400,0.036000,0.177800> rotate<0,90.000000,0> translate<61.862300,0.000000,44.510200> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<61.862300,0.000000,44.510200>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<62.726600,0.000000,44.510200>}
box{<0,0,-0.177800><0.864300,0.036000,0.177800> rotate<0,0.000000,0> translate<61.862300,0.000000,44.510200> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<62.726600,0.000000,44.510200>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<63.014700,0.000000,44.222100>}
box{<0,0,-0.177800><0.407435,0.036000,0.177800> rotate<0,44.997030,0> translate<62.726600,0.000000,44.510200> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<63.014700,0.000000,44.222100>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<63.014700,0.000000,43.357800>}
box{<0,0,-0.177800><0.864300,0.036000,0.177800> rotate<0,-90.000000,0> translate<63.014700,0.000000,43.357800> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<64.068200,0.000000,43.357800>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<64.644400,0.000000,43.357800>}
box{<0,0,-0.177800><0.576200,0.036000,0.177800> rotate<0,0.000000,0> translate<64.068200,0.000000,43.357800> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<64.644400,0.000000,43.357800>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<64.932500,0.000000,43.645900>}
box{<0,0,-0.177800><0.407435,0.036000,0.177800> rotate<0,-44.997030,0> translate<64.644400,0.000000,43.357800> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<64.932500,0.000000,43.645900>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<64.932500,0.000000,44.222100>}
box{<0,0,-0.177800><0.576200,0.036000,0.177800> rotate<0,90.000000,0> translate<64.932500,0.000000,44.222100> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<64.932500,0.000000,44.222100>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<64.644400,0.000000,44.510200>}
box{<0,0,-0.177800><0.407435,0.036000,0.177800> rotate<0,44.997030,0> translate<64.644400,0.000000,44.510200> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<64.644400,0.000000,44.510200>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<64.068200,0.000000,44.510200>}
box{<0,0,-0.177800><0.576200,0.036000,0.177800> rotate<0,0.000000,0> translate<64.068200,0.000000,44.510200> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<64.068200,0.000000,44.510200>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<63.780100,0.000000,44.222100>}
box{<0,0,-0.177800><0.407435,0.036000,0.177800> rotate<0,-44.997030,0> translate<63.780100,0.000000,44.222100> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<63.780100,0.000000,44.222100>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<63.780100,0.000000,43.645900>}
box{<0,0,-0.177800><0.576200,0.036000,0.177800> rotate<0,-90.000000,0> translate<63.780100,0.000000,43.645900> }
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<63.780100,0.000000,43.645900>}
cylinder{<0,0,0><0,0.036000,0>0.177800 translate<64.068200,0.000000,43.357800>}
box{<0,0,-0.177800><0.407435,0.036000,0.177800> rotate<0,44.997030,0> translate<63.780100,0.000000,43.645900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.615800,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.310800,0.000000,42.265800>}
box{<0,0,-0.050800><0.431335,0.036000,0.050800> rotate<0,44.997030,0> translate<48.310800,0.000000,42.265800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.310800,0.000000,42.265800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.310800,0.000000,42.570900>}
box{<0,0,-0.050800><0.305100,0.036000,0.050800> rotate<0,90.000000,0> translate<48.310800,0.000000,42.570900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.310800,0.000000,42.570900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.615800,0.000000,42.875900>}
box{<0,0,-0.050800><0.431335,0.036000,0.050800> rotate<0,-44.997030,0> translate<48.310800,0.000000,42.570900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.544500,0.000000,42.570900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.086900,0.000000,42.570900>}
box{<0,0,-0.050800><0.457600,0.036000,0.050800> rotate<0,0.000000,0> translate<49.086900,0.000000,42.570900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.086900,0.000000,42.570900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.934400,0.000000,42.418300>}
box{<0,0,-0.050800><0.215738,0.036000,0.050800> rotate<0,-45.015808,0> translate<48.934400,0.000000,42.418300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.934400,0.000000,42.418300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.934400,0.000000,42.113300>}
box{<0,0,-0.050800><0.305000,0.036000,0.050800> rotate<0,-90.000000,0> translate<48.934400,0.000000,42.113300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.934400,0.000000,42.113300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.086900,0.000000,41.960800>}
box{<0,0,-0.050800><0.215668,0.036000,0.050800> rotate<0,44.997030,0> translate<48.934400,0.000000,42.113300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.086900,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.544500,0.000000,41.960800>}
box{<0,0,-0.050800><0.457600,0.036000,0.050800> rotate<0,0.000000,0> translate<49.086900,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.869900,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.174900,0.000000,42.265800>}
box{<0,0,-0.050800><0.431335,0.036000,0.050800> rotate<0,-44.997030,0> translate<49.869900,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.174900,0.000000,42.265800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.174900,0.000000,42.570900>}
box{<0,0,-0.050800><0.305100,0.036000,0.050800> rotate<0,90.000000,0> translate<50.174900,0.000000,42.570900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.174900,0.000000,42.570900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.869900,0.000000,42.875900>}
box{<0,0,-0.050800><0.431335,0.036000,0.050800> rotate<0,44.997030,0> translate<49.869900,0.000000,42.875900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.039100,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.429000,0.000000,41.960800>}
box{<0,0,-0.050800><0.610100,0.036000,0.050800> rotate<0,0.000000,0> translate<51.429000,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.429000,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.039100,0.000000,42.570900>}
box{<0,0,-0.050800><0.862812,0.036000,0.050800> rotate<0,-44.997030,0> translate<51.429000,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.039100,0.000000,42.570900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.039100,0.000000,42.723400>}
box{<0,0,-0.050800><0.152500,0.036000,0.050800> rotate<0,90.000000,0> translate<52.039100,0.000000,42.723400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.039100,0.000000,42.723400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.886500,0.000000,42.875900>}
box{<0,0,-0.050800><0.215738,0.036000,0.050800> rotate<0,44.978252,0> translate<51.886500,0.000000,42.875900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.886500,0.000000,42.875900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.581500,0.000000,42.875900>}
box{<0,0,-0.050800><0.305000,0.036000,0.050800> rotate<0,0.000000,0> translate<51.581500,0.000000,42.875900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.581500,0.000000,42.875900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.429000,0.000000,42.723400>}
box{<0,0,-0.050800><0.215668,0.036000,0.050800> rotate<0,-44.997030,0> translate<51.429000,0.000000,42.723400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.364500,0.000000,42.113300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.364500,0.000000,42.723400>}
box{<0,0,-0.050800><0.610100,0.036000,0.050800> rotate<0,90.000000,0> translate<52.364500,0.000000,42.723400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.364500,0.000000,42.723400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.517000,0.000000,42.875900>}
box{<0,0,-0.050800><0.215668,0.036000,0.050800> rotate<0,-44.997030,0> translate<52.364500,0.000000,42.723400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.517000,0.000000,42.875900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.822000,0.000000,42.875900>}
box{<0,0,-0.050800><0.305000,0.036000,0.050800> rotate<0,0.000000,0> translate<52.517000,0.000000,42.875900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.822000,0.000000,42.875900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.974600,0.000000,42.723400>}
box{<0,0,-0.050800><0.215738,0.036000,0.050800> rotate<0,44.978252,0> translate<52.822000,0.000000,42.875900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.974600,0.000000,42.723400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.974600,0.000000,42.113300>}
box{<0,0,-0.050800><0.610100,0.036000,0.050800> rotate<0,-90.000000,0> translate<52.974600,0.000000,42.113300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.974600,0.000000,42.113300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.822000,0.000000,41.960800>}
box{<0,0,-0.050800><0.215738,0.036000,0.050800> rotate<0,-44.978252,0> translate<52.822000,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.822000,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.517000,0.000000,41.960800>}
box{<0,0,-0.050800><0.305000,0.036000,0.050800> rotate<0,0.000000,0> translate<52.517000,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.517000,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.364500,0.000000,42.113300>}
box{<0,0,-0.050800><0.215668,0.036000,0.050800> rotate<0,44.997030,0> translate<52.364500,0.000000,42.113300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.364500,0.000000,42.113300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.974600,0.000000,42.723400>}
box{<0,0,-0.050800><0.862812,0.036000,0.050800> rotate<0,-44.997030,0> translate<52.364500,0.000000,42.113300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.300000,0.000000,42.570900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.605000,0.000000,42.875900>}
box{<0,0,-0.050800><0.431335,0.036000,0.050800> rotate<0,-44.997030,0> translate<53.300000,0.000000,42.570900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.605000,0.000000,42.875900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.605000,0.000000,41.960800>}
box{<0,0,-0.050800><0.915100,0.036000,0.050800> rotate<0,-90.000000,0> translate<53.605000,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.300000,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.910100,0.000000,41.960800>}
box{<0,0,-0.050800><0.610100,0.036000,0.050800> rotate<0,0.000000,0> translate<53.300000,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<54.845600,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<54.235500,0.000000,41.960800>}
box{<0,0,-0.050800><0.610100,0.036000,0.050800> rotate<0,0.000000,0> translate<54.235500,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<54.235500,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<54.845600,0.000000,42.570900>}
box{<0,0,-0.050800><0.862812,0.036000,0.050800> rotate<0,-44.997030,0> translate<54.235500,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<54.845600,0.000000,42.570900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<54.845600,0.000000,42.723400>}
box{<0,0,-0.050800><0.152500,0.036000,0.050800> rotate<0,90.000000,0> translate<54.845600,0.000000,42.723400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<54.845600,0.000000,42.723400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<54.693000,0.000000,42.875900>}
box{<0,0,-0.050800><0.215738,0.036000,0.050800> rotate<0,44.978252,0> translate<54.693000,0.000000,42.875900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<54.693000,0.000000,42.875900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<54.388000,0.000000,42.875900>}
box{<0,0,-0.050800><0.305000,0.036000,0.050800> rotate<0,0.000000,0> translate<54.388000,0.000000,42.875900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<54.388000,0.000000,42.875900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<54.235500,0.000000,42.723400>}
box{<0,0,-0.050800><0.215668,0.036000,0.050800> rotate<0,-44.997030,0> translate<54.235500,0.000000,42.723400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.106500,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.106500,0.000000,42.875900>}
box{<0,0,-0.050800><0.915100,0.036000,0.050800> rotate<0,90.000000,0> translate<56.106500,0.000000,42.875900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.106500,0.000000,42.875900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.564000,0.000000,42.875900>}
box{<0,0,-0.050800><0.457500,0.036000,0.050800> rotate<0,0.000000,0> translate<56.106500,0.000000,42.875900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.564000,0.000000,42.875900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.716600,0.000000,42.723400>}
box{<0,0,-0.050800><0.215738,0.036000,0.050800> rotate<0,44.978252,0> translate<56.564000,0.000000,42.875900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.716600,0.000000,42.723400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.716600,0.000000,42.570900>}
box{<0,0,-0.050800><0.152500,0.036000,0.050800> rotate<0,-90.000000,0> translate<56.716600,0.000000,42.570900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.716600,0.000000,42.570900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.564000,0.000000,42.418300>}
box{<0,0,-0.050800><0.215809,0.036000,0.050800> rotate<0,-44.997030,0> translate<56.564000,0.000000,42.418300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.564000,0.000000,42.418300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.716600,0.000000,42.265800>}
box{<0,0,-0.050800><0.215738,0.036000,0.050800> rotate<0,44.978252,0> translate<56.564000,0.000000,42.418300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.716600,0.000000,42.265800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.716600,0.000000,42.113300>}
box{<0,0,-0.050800><0.152500,0.036000,0.050800> rotate<0,-90.000000,0> translate<56.716600,0.000000,42.113300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.716600,0.000000,42.113300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.564000,0.000000,41.960800>}
box{<0,0,-0.050800><0.215738,0.036000,0.050800> rotate<0,-44.978252,0> translate<56.564000,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.564000,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.106500,0.000000,41.960800>}
box{<0,0,-0.050800><0.457500,0.036000,0.050800> rotate<0,0.000000,0> translate<56.106500,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.106500,0.000000,42.418300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.564000,0.000000,42.418300>}
box{<0,0,-0.050800><0.457500,0.036000,0.050800> rotate<0,0.000000,0> translate<56.106500,0.000000,42.418300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.042000,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.042000,0.000000,42.570900>}
box{<0,0,-0.050800><0.610100,0.036000,0.050800> rotate<0,90.000000,0> translate<57.042000,0.000000,42.570900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.042000,0.000000,42.265800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.347000,0.000000,42.570900>}
box{<0,0,-0.050800><0.431406,0.036000,0.050800> rotate<0,-45.006421,0> translate<57.042000,0.000000,42.265800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.347000,0.000000,42.570900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.499500,0.000000,42.570900>}
box{<0,0,-0.050800><0.152500,0.036000,0.050800> rotate<0,0.000000,0> translate<57.347000,0.000000,42.570900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.974000,0.000000,42.570900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.279000,0.000000,42.570900>}
box{<0,0,-0.050800><0.305000,0.036000,0.050800> rotate<0,0.000000,0> translate<57.974000,0.000000,42.570900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.279000,0.000000,42.570900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.431600,0.000000,42.418300>}
box{<0,0,-0.050800><0.215809,0.036000,0.050800> rotate<0,44.997030,0> translate<58.279000,0.000000,42.570900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.431600,0.000000,42.418300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.431600,0.000000,41.960800>}
box{<0,0,-0.050800><0.457500,0.036000,0.050800> rotate<0,-90.000000,0> translate<58.431600,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.431600,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.974000,0.000000,41.960800>}
box{<0,0,-0.050800><0.457600,0.036000,0.050800> rotate<0,0.000000,0> translate<57.974000,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.974000,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.821500,0.000000,42.113300>}
box{<0,0,-0.050800><0.215668,0.036000,0.050800> rotate<0,44.997030,0> translate<57.821500,0.000000,42.113300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.821500,0.000000,42.113300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.974000,0.000000,42.265800>}
box{<0,0,-0.050800><0.215668,0.036000,0.050800> rotate<0,-44.997030,0> translate<57.821500,0.000000,42.113300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.974000,0.000000,42.265800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.431600,0.000000,42.265800>}
box{<0,0,-0.050800><0.457600,0.036000,0.050800> rotate<0,0.000000,0> translate<57.974000,0.000000,42.265800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.367100,0.000000,42.875900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.367100,0.000000,41.960800>}
box{<0,0,-0.050800><0.915100,0.036000,0.050800> rotate<0,-90.000000,0> translate<59.367100,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.367100,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.909500,0.000000,41.960800>}
box{<0,0,-0.050800><0.457600,0.036000,0.050800> rotate<0,0.000000,0> translate<58.909500,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.909500,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.757000,0.000000,42.113300>}
box{<0,0,-0.050800><0.215668,0.036000,0.050800> rotate<0,44.997030,0> translate<58.757000,0.000000,42.113300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.757000,0.000000,42.113300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.757000,0.000000,42.418300>}
box{<0,0,-0.050800><0.305000,0.036000,0.050800> rotate<0,90.000000,0> translate<58.757000,0.000000,42.418300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.757000,0.000000,42.418300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.909500,0.000000,42.570900>}
box{<0,0,-0.050800><0.215738,0.036000,0.050800> rotate<0,-45.015808,0> translate<58.757000,0.000000,42.418300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.909500,0.000000,42.570900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.367100,0.000000,42.570900>}
box{<0,0,-0.050800><0.457600,0.036000,0.050800> rotate<0,0.000000,0> translate<58.909500,0.000000,42.570900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.150000,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.845000,0.000000,41.960800>}
box{<0,0,-0.050800><0.305000,0.036000,0.050800> rotate<0,0.000000,0> translate<59.845000,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.845000,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.692500,0.000000,42.113300>}
box{<0,0,-0.050800><0.215668,0.036000,0.050800> rotate<0,44.997030,0> translate<59.692500,0.000000,42.113300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.692500,0.000000,42.113300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.692500,0.000000,42.418300>}
box{<0,0,-0.050800><0.305000,0.036000,0.050800> rotate<0,90.000000,0> translate<59.692500,0.000000,42.418300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.692500,0.000000,42.418300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.845000,0.000000,42.570900>}
box{<0,0,-0.050800><0.215738,0.036000,0.050800> rotate<0,-45.015808,0> translate<59.692500,0.000000,42.418300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.845000,0.000000,42.570900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.150000,0.000000,42.570900>}
box{<0,0,-0.050800><0.305000,0.036000,0.050800> rotate<0,0.000000,0> translate<59.845000,0.000000,42.570900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.150000,0.000000,42.570900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.302600,0.000000,42.418300>}
box{<0,0,-0.050800><0.215809,0.036000,0.050800> rotate<0,44.997030,0> translate<60.150000,0.000000,42.570900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.302600,0.000000,42.418300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.302600,0.000000,42.265800>}
box{<0,0,-0.050800><0.152500,0.036000,0.050800> rotate<0,-90.000000,0> translate<60.302600,0.000000,42.265800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.302600,0.000000,42.265800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<59.692500,0.000000,42.265800>}
box{<0,0,-0.050800><0.610100,0.036000,0.050800> rotate<0,0.000000,0> translate<59.692500,0.000000,42.265800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.628000,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.628000,0.000000,42.570900>}
box{<0,0,-0.050800><0.610100,0.036000,0.050800> rotate<0,90.000000,0> translate<60.628000,0.000000,42.570900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.628000,0.000000,42.570900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<61.085500,0.000000,42.570900>}
box{<0,0,-0.050800><0.457500,0.036000,0.050800> rotate<0,0.000000,0> translate<60.628000,0.000000,42.570900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<61.085500,0.000000,42.570900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<61.238100,0.000000,42.418300>}
box{<0,0,-0.050800><0.215809,0.036000,0.050800> rotate<0,44.997030,0> translate<61.085500,0.000000,42.570900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<61.238100,0.000000,42.418300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<61.238100,0.000000,41.960800>}
box{<0,0,-0.050800><0.457500,0.036000,0.050800> rotate<0,-90.000000,0> translate<61.238100,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<62.499000,0.000000,42.875900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<62.499000,0.000000,41.960800>}
box{<0,0,-0.050800><0.915100,0.036000,0.050800> rotate<0,-90.000000,0> translate<62.499000,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<62.499000,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.109100,0.000000,41.960800>}
box{<0,0,-0.050800><0.610100,0.036000,0.050800> rotate<0,0.000000,0> translate<62.499000,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.434500,0.000000,42.570900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.587000,0.000000,42.570900>}
box{<0,0,-0.050800><0.152500,0.036000,0.050800> rotate<0,0.000000,0> translate<63.434500,0.000000,42.570900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.587000,0.000000,42.570900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.587000,0.000000,41.960800>}
box{<0,0,-0.050800><0.610100,0.036000,0.050800> rotate<0,-90.000000,0> translate<63.587000,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.434500,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.739500,0.000000,41.960800>}
box{<0,0,-0.050800><0.305000,0.036000,0.050800> rotate<0,0.000000,0> translate<63.434500,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.587000,0.000000,43.028500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<63.587000,0.000000,42.875900>}
box{<0,0,-0.050800><0.152600,0.036000,0.050800> rotate<0,-90.000000,0> translate<63.587000,0.000000,42.875900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.668200,0.000000,42.570900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.210600,0.000000,42.570900>}
box{<0,0,-0.050800><0.457600,0.036000,0.050800> rotate<0,0.000000,0> translate<64.210600,0.000000,42.570900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.210600,0.000000,42.570900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.058100,0.000000,42.418300>}
box{<0,0,-0.050800><0.215738,0.036000,0.050800> rotate<0,-45.015808,0> translate<64.058100,0.000000,42.418300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.058100,0.000000,42.418300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.058100,0.000000,42.113300>}
box{<0,0,-0.050800><0.305000,0.036000,0.050800> rotate<0,-90.000000,0> translate<64.058100,0.000000,42.113300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.058100,0.000000,42.113300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.210600,0.000000,41.960800>}
box{<0,0,-0.050800><0.215668,0.036000,0.050800> rotate<0,44.997030,0> translate<64.058100,0.000000,42.113300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.210600,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.668200,0.000000,41.960800>}
box{<0,0,-0.050800><0.457600,0.036000,0.050800> rotate<0,0.000000,0> translate<64.210600,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.146100,0.000000,42.570900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.451100,0.000000,42.570900>}
box{<0,0,-0.050800><0.305000,0.036000,0.050800> rotate<0,0.000000,0> translate<65.146100,0.000000,42.570900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.451100,0.000000,42.570900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.603700,0.000000,42.418300>}
box{<0,0,-0.050800><0.215809,0.036000,0.050800> rotate<0,44.997030,0> translate<65.451100,0.000000,42.570900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.603700,0.000000,42.418300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.603700,0.000000,41.960800>}
box{<0,0,-0.050800><0.457500,0.036000,0.050800> rotate<0,-90.000000,0> translate<65.603700,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.603700,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.146100,0.000000,41.960800>}
box{<0,0,-0.050800><0.457600,0.036000,0.050800> rotate<0,0.000000,0> translate<65.146100,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.146100,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.993600,0.000000,42.113300>}
box{<0,0,-0.050800><0.215668,0.036000,0.050800> rotate<0,44.997030,0> translate<64.993600,0.000000,42.113300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<64.993600,0.000000,42.113300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.146100,0.000000,42.265800>}
box{<0,0,-0.050800><0.215668,0.036000,0.050800> rotate<0,-44.997030,0> translate<64.993600,0.000000,42.113300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.146100,0.000000,42.265800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.603700,0.000000,42.265800>}
box{<0,0,-0.050800><0.457600,0.036000,0.050800> rotate<0,0.000000,0> translate<65.146100,0.000000,42.265800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.929100,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.386600,0.000000,41.960800>}
box{<0,0,-0.050800><0.457500,0.036000,0.050800> rotate<0,0.000000,0> translate<65.929100,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.386600,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.539200,0.000000,42.113300>}
box{<0,0,-0.050800><0.215738,0.036000,0.050800> rotate<0,-44.978252,0> translate<66.386600,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.539200,0.000000,42.113300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.386600,0.000000,42.265800>}
box{<0,0,-0.050800><0.215738,0.036000,0.050800> rotate<0,44.978252,0> translate<66.386600,0.000000,42.265800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.386600,0.000000,42.265800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.081600,0.000000,42.265800>}
box{<0,0,-0.050800><0.305000,0.036000,0.050800> rotate<0,0.000000,0> translate<66.081600,0.000000,42.265800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.081600,0.000000,42.265800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.929100,0.000000,42.418300>}
box{<0,0,-0.050800><0.215668,0.036000,0.050800> rotate<0,44.997030,0> translate<65.929100,0.000000,42.418300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.929100,0.000000,42.418300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.081600,0.000000,42.570900>}
box{<0,0,-0.050800><0.215738,0.036000,0.050800> rotate<0,-45.015808,0> translate<65.929100,0.000000,42.418300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.081600,0.000000,42.570900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.539200,0.000000,42.570900>}
box{<0,0,-0.050800><0.457600,0.036000,0.050800> rotate<0,0.000000,0> translate<66.081600,0.000000,42.570900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<67.017100,0.000000,42.723400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<67.017100,0.000000,42.113300>}
box{<0,0,-0.050800><0.610100,0.036000,0.050800> rotate<0,-90.000000,0> translate<67.017100,0.000000,42.113300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<67.017100,0.000000,42.113300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<67.169600,0.000000,41.960800>}
box{<0,0,-0.050800><0.215668,0.036000,0.050800> rotate<0,44.997030,0> translate<67.017100,0.000000,42.113300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.864600,0.000000,42.570900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<67.169600,0.000000,42.570900>}
box{<0,0,-0.050800><0.305000,0.036000,0.050800> rotate<0,0.000000,0> translate<66.864600,0.000000,42.570900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<67.488200,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<67.488200,0.000000,42.570900>}
box{<0,0,-0.050800><0.610100,0.036000,0.050800> rotate<0,90.000000,0> translate<67.488200,0.000000,42.570900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<67.488200,0.000000,42.265800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<67.793200,0.000000,42.570900>}
box{<0,0,-0.050800><0.431406,0.036000,0.050800> rotate<0,-45.006421,0> translate<67.488200,0.000000,42.265800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<67.793200,0.000000,42.570900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<67.945700,0.000000,42.570900>}
box{<0,0,-0.050800><0.152500,0.036000,0.050800> rotate<0,0.000000,0> translate<67.793200,0.000000,42.570900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.420200,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.725200,0.000000,41.960800>}
box{<0,0,-0.050800><0.305000,0.036000,0.050800> rotate<0,0.000000,0> translate<68.420200,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.725200,0.000000,41.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.877800,0.000000,42.113300>}
box{<0,0,-0.050800><0.215738,0.036000,0.050800> rotate<0,-44.978252,0> translate<68.725200,0.000000,41.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.877800,0.000000,42.113300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.877800,0.000000,42.418300>}
box{<0,0,-0.050800><0.305000,0.036000,0.050800> rotate<0,90.000000,0> translate<68.877800,0.000000,42.418300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.877800,0.000000,42.418300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.725200,0.000000,42.570900>}
box{<0,0,-0.050800><0.215809,0.036000,0.050800> rotate<0,44.997030,0> translate<68.725200,0.000000,42.570900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.725200,0.000000,42.570900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.420200,0.000000,42.570900>}
box{<0,0,-0.050800><0.305000,0.036000,0.050800> rotate<0,0.000000,0> translate<68.420200,0.000000,42.570900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.420200,0.000000,42.570900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.267700,0.000000,42.418300>}
box{<0,0,-0.050800><0.215738,0.036000,0.050800> rotate<0,-45.015808,0> translate<68.267700,0.000000,42.418300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.267700,0.000000,42.418300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.267700,0.000000,42.113300>}
box{<0,0,-0.050800><0.305000,0.036000,0.050800> rotate<0,-90.000000,0> translate<68.267700,0.000000,42.113300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.267700,0.000000,42.113300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.420200,0.000000,41.960800>}
box{<0,0,-0.050800><0.215668,0.036000,0.050800> rotate<0,44.997030,0> translate<68.267700,0.000000,42.113300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.298100,0.000000,41.169500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.298100,0.000000,40.800900>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<48.298100,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.298100,0.000000,40.800900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.420900,0.000000,40.678100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<48.298100,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.420900,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.543800,0.000000,40.800900>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<48.420900,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.543800,0.000000,40.800900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.666700,0.000000,40.678100>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<48.543800,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.666700,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.789500,0.000000,40.800900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<48.666700,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.789500,0.000000,40.800900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.789500,0.000000,41.169500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<48.789500,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.046500,0.000000,41.169500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.046500,0.000000,40.800900>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<49.046500,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.046500,0.000000,40.800900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.169300,0.000000,40.678100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<49.046500,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.169300,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.292200,0.000000,40.800900>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<49.169300,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.292200,0.000000,40.800900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.415100,0.000000,40.678100>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<49.292200,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.415100,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.537900,0.000000,40.800900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<49.415100,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.537900,0.000000,40.800900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.537900,0.000000,41.169500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<49.537900,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.794900,0.000000,41.169500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.794900,0.000000,40.800900>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<49.794900,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.794900,0.000000,40.800900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.917700,0.000000,40.678100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<49.794900,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.917700,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.040600,0.000000,40.800900>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<49.917700,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.040600,0.000000,40.800900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.163500,0.000000,40.678100>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<50.040600,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.163500,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.286300,0.000000,40.800900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<50.163500,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.286300,0.000000,40.800900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.286300,0.000000,41.169500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,90.000000,0> translate<50.286300,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.543300,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.543300,0.000000,40.800900>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<50.543300,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.543300,0.000000,40.800900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.666100,0.000000,40.800900>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<50.543300,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.666100,0.000000,40.800900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.666100,0.000000,40.678100>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,-90.000000,0> translate<50.666100,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.666100,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.543300,0.000000,40.678100>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<50.543300,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.040300,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.040300,0.000000,41.292400>}
box{<0,0,-0.038100><0.614300,0.036000,0.038100> rotate<0,90.000000,0> translate<51.040300,0.000000,41.292400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.040300,0.000000,41.292400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.163200,0.000000,41.415300>}
box{<0,0,-0.038100><0.173807,0.036000,0.038100> rotate<0,-44.997030,0> translate<51.040300,0.000000,41.292400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.917500,0.000000,41.046700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.163200,0.000000,41.046700>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,0.000000,0> translate<50.917500,0.000000,41.046700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.416400,0.000000,41.169500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.416400,0.000000,40.800900>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<51.416400,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.416400,0.000000,40.800900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.539200,0.000000,40.678100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<51.416400,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.539200,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.907800,0.000000,40.678100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<51.539200,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.907800,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.907800,0.000000,41.169500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<51.907800,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.164800,0.000000,41.415300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.287600,0.000000,41.415300>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<52.164800,0.000000,41.415300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.287600,0.000000,41.415300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.287600,0.000000,40.678100>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,-90.000000,0> translate<52.287600,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.164800,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.410500,0.000000,40.678100>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,0.000000,0> translate<52.164800,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.663700,0.000000,41.415300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.786500,0.000000,41.415300>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<52.663700,0.000000,41.415300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.786500,0.000000,41.415300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.786500,0.000000,40.678100>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,-90.000000,0> translate<52.786500,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.663700,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.909400,0.000000,40.678100>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,0.000000,0> translate<52.663700,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.285400,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.285400,0.000000,41.292400>}
box{<0,0,-0.038100><0.614300,0.036000,0.038100> rotate<0,90.000000,0> translate<53.285400,0.000000,41.292400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.285400,0.000000,41.292400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.408300,0.000000,41.415300>}
box{<0,0,-0.038100><0.173807,0.036000,0.038100> rotate<0,-44.997030,0> translate<53.285400,0.000000,41.292400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.162600,0.000000,41.046700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.408300,0.000000,41.046700>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,0.000000,0> translate<53.162600,0.000000,41.046700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.784300,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.030100,0.000000,40.678100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<53.784300,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.030100,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.152900,0.000000,40.800900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<54.030100,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.152900,0.000000,40.800900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.152900,0.000000,41.046700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<54.152900,0.000000,41.046700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.152900,0.000000,41.046700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.030100,0.000000,41.169500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<54.030100,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.030100,0.000000,41.169500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.784300,0.000000,41.169500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<53.784300,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.784300,0.000000,41.169500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.661500,0.000000,41.046700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<53.661500,0.000000,41.046700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.661500,0.000000,41.046700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.661500,0.000000,40.800900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<53.661500,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.661500,0.000000,40.800900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.784300,0.000000,40.678100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<53.661500,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.409900,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.409900,0.000000,41.169500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<54.409900,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.409900,0.000000,40.923800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.655600,0.000000,41.169500>}
box{<0,0,-0.038100><0.347472,0.036000,0.038100> rotate<0,-44.997030,0> translate<54.409900,0.000000,40.923800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.655600,0.000000,41.169500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.778500,0.000000,41.169500>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<54.655600,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.524900,0.000000,41.169500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.156300,0.000000,41.169500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<55.156300,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.156300,0.000000,41.169500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.033500,0.000000,41.046700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<55.033500,0.000000,41.046700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.033500,0.000000,41.046700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.033500,0.000000,40.800900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<55.033500,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.033500,0.000000,40.800900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.156300,0.000000,40.678100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<55.033500,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.156300,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.524900,0.000000,40.678100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<55.156300,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.150500,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.904700,0.000000,40.678100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<55.904700,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.904700,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.781900,0.000000,40.800900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<55.781900,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.781900,0.000000,40.800900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.781900,0.000000,41.046700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<55.781900,0.000000,41.046700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.781900,0.000000,41.046700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.904700,0.000000,41.169500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<55.781900,0.000000,41.046700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.904700,0.000000,41.169500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.150500,0.000000,41.169500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<55.904700,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.150500,0.000000,41.169500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.273300,0.000000,41.046700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<56.150500,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.273300,0.000000,41.046700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.273300,0.000000,40.923800>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<56.273300,0.000000,40.923800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.273300,0.000000,40.923800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.781900,0.000000,40.923800>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<55.781900,0.000000,40.923800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.653100,0.000000,41.169500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.898900,0.000000,41.169500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<56.653100,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.898900,0.000000,41.169500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.021700,0.000000,41.046700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<56.898900,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.021700,0.000000,41.046700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.021700,0.000000,40.678100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<57.021700,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.021700,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.653100,0.000000,40.678100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<56.653100,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.653100,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.530300,0.000000,40.800900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<56.530300,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.530300,0.000000,40.800900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.653100,0.000000,40.923800>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<56.530300,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.653100,0.000000,40.923800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.021700,0.000000,40.923800>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<56.653100,0.000000,40.923800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.278700,0.000000,40.432400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.278700,0.000000,41.169500>}
box{<0,0,-0.038100><0.737100,0.036000,0.038100> rotate<0,90.000000,0> translate<57.278700,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.278700,0.000000,41.169500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.647300,0.000000,41.169500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<57.278700,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.647300,0.000000,41.169500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.770100,0.000000,41.046700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<57.647300,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.770100,0.000000,41.046700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.770100,0.000000,40.800900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<57.770100,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.770100,0.000000,40.800900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.647300,0.000000,40.678100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.647300,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.647300,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.278700,0.000000,40.678100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<57.278700,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.027100,0.000000,40.432400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.027100,0.000000,41.169500>}
box{<0,0,-0.038100><0.737100,0.036000,0.038100> rotate<0,90.000000,0> translate<58.027100,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.027100,0.000000,41.169500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.395700,0.000000,41.169500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<58.027100,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.395700,0.000000,41.169500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.518500,0.000000,41.046700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<58.395700,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.518500,0.000000,41.046700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.518500,0.000000,40.800900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<58.518500,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.518500,0.000000,40.800900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.395700,0.000000,40.678100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<58.395700,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.395700,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.027100,0.000000,40.678100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<58.027100,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.775500,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.144100,0.000000,40.678100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<58.775500,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.144100,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.266900,0.000000,40.800900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<59.144100,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.266900,0.000000,40.800900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.144100,0.000000,40.923800>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<59.144100,0.000000,40.923800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.144100,0.000000,40.923800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.898300,0.000000,40.923800>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<58.898300,0.000000,40.923800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.898300,0.000000,40.923800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.775500,0.000000,41.046700>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<58.775500,0.000000,41.046700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.775500,0.000000,41.046700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.898300,0.000000,41.169500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<58.775500,0.000000,41.046700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.898300,0.000000,41.169500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.266900,0.000000,41.169500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<58.898300,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.523900,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.523900,0.000000,40.800900>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<59.523900,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.523900,0.000000,40.800900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.646700,0.000000,40.800900>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<59.523900,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.646700,0.000000,40.800900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.646700,0.000000,40.678100>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,-90.000000,0> translate<59.646700,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.646700,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.523900,0.000000,40.678100>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<59.523900,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.389500,0.000000,41.169500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.020900,0.000000,41.169500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<60.020900,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.020900,0.000000,41.169500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.898100,0.000000,41.046700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<59.898100,0.000000,41.046700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.898100,0.000000,41.046700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.898100,0.000000,40.800900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<59.898100,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.898100,0.000000,40.800900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.020900,0.000000,40.678100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<59.898100,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.020900,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.389500,0.000000,40.678100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<60.020900,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.769300,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.015100,0.000000,40.678100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<60.769300,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.015100,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.137900,0.000000,40.800900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<61.015100,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.137900,0.000000,40.800900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.137900,0.000000,41.046700>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<61.137900,0.000000,41.046700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.137900,0.000000,41.046700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.015100,0.000000,41.169500>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<61.015100,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.015100,0.000000,41.169500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.769300,0.000000,41.169500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<60.769300,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.769300,0.000000,41.169500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.646500,0.000000,41.046700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<60.646500,0.000000,41.046700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.646500,0.000000,41.046700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.646500,0.000000,40.800900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<60.646500,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.646500,0.000000,40.800900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.769300,0.000000,40.678100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<60.646500,0.000000,40.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.394900,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.394900,0.000000,41.169500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<61.394900,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.394900,0.000000,41.169500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.517700,0.000000,41.169500>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<61.394900,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.517700,0.000000,41.169500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.640600,0.000000,41.046700>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<61.517700,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.640600,0.000000,41.046700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.640600,0.000000,40.678100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<61.640600,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.640600,0.000000,41.046700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.763500,0.000000,41.169500>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<61.640600,0.000000,41.046700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.763500,0.000000,41.169500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.886300,0.000000,41.046700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<61.763500,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.886300,0.000000,41.046700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.886300,0.000000,40.678100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<61.886300,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<48.285400,0.000000,38.989700>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<48.285400,0.000000,38.413500>}
box{<0,0,-0.025400><0.576200,0.036000,0.025400> rotate<0,-90.000000,0> translate<48.285400,0.000000,38.413500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<48.285400,0.000000,38.413500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<48.573500,0.000000,38.125400>}
box{<0,0,-0.025400><0.407435,0.036000,0.025400> rotate<0,44.997030,0> translate<48.285400,0.000000,38.413500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<48.573500,0.000000,38.125400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<48.861600,0.000000,38.413500>}
box{<0,0,-0.025400><0.407435,0.036000,0.025400> rotate<0,-44.997030,0> translate<48.573500,0.000000,38.125400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<48.861600,0.000000,38.413500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<48.861600,0.000000,38.989700>}
box{<0,0,-0.025400><0.576200,0.036000,0.025400> rotate<0,90.000000,0> translate<48.861600,0.000000,38.989700> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.703500,0.000000,38.989700>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.127300,0.000000,38.989700>}
box{<0,0,-0.025400><0.576200,0.036000,0.025400> rotate<0,0.000000,0> translate<49.127300,0.000000,38.989700> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.127300,0.000000,38.989700>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.127300,0.000000,38.125400>}
box{<0,0,-0.025400><0.864300,0.036000,0.025400> rotate<0,-90.000000,0> translate<49.127300,0.000000,38.125400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.127300,0.000000,38.125400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.703500,0.000000,38.125400>}
box{<0,0,-0.025400><0.576200,0.036000,0.025400> rotate<0,0.000000,0> translate<49.127300,0.000000,38.125400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.127300,0.000000,38.557500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.415400,0.000000,38.557500>}
box{<0,0,-0.025400><0.288100,0.036000,0.025400> rotate<0,0.000000,0> translate<49.127300,0.000000,38.557500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.969200,0.000000,38.125400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.969200,0.000000,38.989700>}
box{<0,0,-0.025400><0.864300,0.036000,0.025400> rotate<0,90.000000,0> translate<49.969200,0.000000,38.989700> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.969200,0.000000,38.989700>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.401300,0.000000,38.989700>}
box{<0,0,-0.025400><0.432100,0.036000,0.025400> rotate<0,0.000000,0> translate<49.969200,0.000000,38.989700> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.401300,0.000000,38.989700>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.545400,0.000000,38.845600>}
box{<0,0,-0.025400><0.203788,0.036000,0.025400> rotate<0,44.997030,0> translate<50.401300,0.000000,38.989700> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.545400,0.000000,38.845600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.545400,0.000000,38.557500>}
box{<0,0,-0.025400><0.288100,0.036000,0.025400> rotate<0,-90.000000,0> translate<50.545400,0.000000,38.557500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.545400,0.000000,38.557500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.401300,0.000000,38.413500>}
box{<0,0,-0.025400><0.203717,0.036000,0.025400> rotate<0,-44.977144,0> translate<50.401300,0.000000,38.413500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.401300,0.000000,38.413500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.969200,0.000000,38.413500>}
box{<0,0,-0.025400><0.432100,0.036000,0.025400> rotate<0,0.000000,0> translate<49.969200,0.000000,38.413500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.257300,0.000000,38.413500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.545400,0.000000,38.125400>}
box{<0,0,-0.025400><0.407435,0.036000,0.025400> rotate<0,44.997030,0> translate<50.257300,0.000000,38.413500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.387300,0.000000,38.845600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.243200,0.000000,38.989700>}
box{<0,0,-0.025400><0.203788,0.036000,0.025400> rotate<0,44.997030,0> translate<51.243200,0.000000,38.989700> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.243200,0.000000,38.989700>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.955100,0.000000,38.989700>}
box{<0,0,-0.025400><0.288100,0.036000,0.025400> rotate<0,0.000000,0> translate<50.955100,0.000000,38.989700> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.955100,0.000000,38.989700>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.811100,0.000000,38.845600>}
box{<0,0,-0.025400><0.203717,0.036000,0.025400> rotate<0,-45.016916,0> translate<50.811100,0.000000,38.845600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.811100,0.000000,38.845600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.811100,0.000000,38.701600>}
box{<0,0,-0.025400><0.144000,0.036000,0.025400> rotate<0,-90.000000,0> translate<50.811100,0.000000,38.701600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.811100,0.000000,38.701600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.955100,0.000000,38.557500>}
box{<0,0,-0.025400><0.203717,0.036000,0.025400> rotate<0,45.016916,0> translate<50.811100,0.000000,38.701600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.955100,0.000000,38.557500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.243200,0.000000,38.557500>}
box{<0,0,-0.025400><0.288100,0.036000,0.025400> rotate<0,0.000000,0> translate<50.955100,0.000000,38.557500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.243200,0.000000,38.557500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.387300,0.000000,38.413500>}
box{<0,0,-0.025400><0.203717,0.036000,0.025400> rotate<0,44.977144,0> translate<51.243200,0.000000,38.557500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.387300,0.000000,38.413500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.387300,0.000000,38.269400>}
box{<0,0,-0.025400><0.144100,0.036000,0.025400> rotate<0,-90.000000,0> translate<51.387300,0.000000,38.269400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.387300,0.000000,38.269400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.243200,0.000000,38.125400>}
box{<0,0,-0.025400><0.203717,0.036000,0.025400> rotate<0,-44.977144,0> translate<51.243200,0.000000,38.125400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.243200,0.000000,38.125400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.955100,0.000000,38.125400>}
box{<0,0,-0.025400><0.288100,0.036000,0.025400> rotate<0,0.000000,0> translate<50.955100,0.000000,38.125400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.955100,0.000000,38.125400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.811100,0.000000,38.269400>}
box{<0,0,-0.025400><0.203647,0.036000,0.025400> rotate<0,44.997030,0> translate<50.811100,0.000000,38.269400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.653000,0.000000,38.125400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.941100,0.000000,38.125400>}
box{<0,0,-0.025400><0.288100,0.036000,0.025400> rotate<0,0.000000,0> translate<51.653000,0.000000,38.125400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.797000,0.000000,38.125400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.797000,0.000000,38.989700>}
box{<0,0,-0.025400><0.864300,0.036000,0.025400> rotate<0,90.000000,0> translate<51.797000,0.000000,38.989700> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.653000,0.000000,38.989700>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.941100,0.000000,38.989700>}
box{<0,0,-0.025400><0.288100,0.036000,0.025400> rotate<0,0.000000,0> translate<51.653000,0.000000,38.989700> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.646400,0.000000,38.989700>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.358300,0.000000,38.989700>}
box{<0,0,-0.025400><0.288100,0.036000,0.025400> rotate<0,0.000000,0> translate<52.358300,0.000000,38.989700> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.358300,0.000000,38.989700>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.214300,0.000000,38.845600>}
box{<0,0,-0.025400><0.203717,0.036000,0.025400> rotate<0,-45.016916,0> translate<52.214300,0.000000,38.845600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.214300,0.000000,38.845600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.214300,0.000000,38.269400>}
box{<0,0,-0.025400><0.576200,0.036000,0.025400> rotate<0,-90.000000,0> translate<52.214300,0.000000,38.269400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.214300,0.000000,38.269400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.358300,0.000000,38.125400>}
box{<0,0,-0.025400><0.203647,0.036000,0.025400> rotate<0,44.997030,0> translate<52.214300,0.000000,38.269400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.358300,0.000000,38.125400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.646400,0.000000,38.125400>}
box{<0,0,-0.025400><0.288100,0.036000,0.025400> rotate<0,0.000000,0> translate<52.358300,0.000000,38.125400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.646400,0.000000,38.125400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.790500,0.000000,38.269400>}
box{<0,0,-0.025400><0.203717,0.036000,0.025400> rotate<0,-44.977144,0> translate<52.646400,0.000000,38.125400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.790500,0.000000,38.269400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.790500,0.000000,38.845600>}
box{<0,0,-0.025400><0.576200,0.036000,0.025400> rotate<0,90.000000,0> translate<52.790500,0.000000,38.845600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.790500,0.000000,38.845600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.646400,0.000000,38.989700>}
box{<0,0,-0.025400><0.203788,0.036000,0.025400> rotate<0,44.997030,0> translate<52.646400,0.000000,38.989700> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.056200,0.000000,38.125400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.056200,0.000000,38.989700>}
box{<0,0,-0.025400><0.864300,0.036000,0.025400> rotate<0,90.000000,0> translate<53.056200,0.000000,38.989700> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.056200,0.000000,38.989700>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.632400,0.000000,38.125400>}
box{<0,0,-0.025400><1.038759,0.036000,0.025400> rotate<0,56.306216,0> translate<53.056200,0.000000,38.989700> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.632400,0.000000,38.125400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.632400,0.000000,38.989700>}
box{<0,0,-0.025400><0.864300,0.036000,0.025400> rotate<0,90.000000,0> translate<53.632400,0.000000,38.989700> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.898100,0.000000,38.701600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.042100,0.000000,38.701600>}
box{<0,0,-0.025400><0.144000,0.036000,0.025400> rotate<0,0.000000,0> translate<53.898100,0.000000,38.701600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.042100,0.000000,38.701600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.042100,0.000000,38.557500>}
box{<0,0,-0.025400><0.144100,0.036000,0.025400> rotate<0,-90.000000,0> translate<54.042100,0.000000,38.557500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.042100,0.000000,38.557500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.898100,0.000000,38.557500>}
box{<0,0,-0.025400><0.144000,0.036000,0.025400> rotate<0,0.000000,0> translate<53.898100,0.000000,38.557500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.898100,0.000000,38.557500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.898100,0.000000,38.701600>}
box{<0,0,-0.025400><0.144100,0.036000,0.025400> rotate<0,90.000000,0> translate<53.898100,0.000000,38.701600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.898100,0.000000,38.269400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.042100,0.000000,38.269400>}
box{<0,0,-0.025400><0.144000,0.036000,0.025400> rotate<0,0.000000,0> translate<53.898100,0.000000,38.269400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.042100,0.000000,38.269400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.042100,0.000000,38.125400>}
box{<0,0,-0.025400><0.144000,0.036000,0.025400> rotate<0,-90.000000,0> translate<54.042100,0.000000,38.125400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.042100,0.000000,38.125400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.898100,0.000000,38.125400>}
box{<0,0,-0.025400><0.144000,0.036000,0.025400> rotate<0,0.000000,0> translate<53.898100,0.000000,38.125400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.898100,0.000000,38.125400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.898100,0.000000,38.269400>}
box{<0,0,-0.025400><0.144000,0.036000,0.025400> rotate<0,90.000000,0> translate<53.898100,0.000000,38.269400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.160900,0.000000,38.701600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.449000,0.000000,38.989700>}
box{<0,0,-0.025400><0.407435,0.036000,0.025400> rotate<0,-44.997030,0> translate<55.160900,0.000000,38.701600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.449000,0.000000,38.989700>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.449000,0.000000,38.125400>}
box{<0,0,-0.025400><0.864300,0.036000,0.025400> rotate<0,-90.000000,0> translate<55.449000,0.000000,38.125400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.160900,0.000000,38.125400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.737100,0.000000,38.125400>}
box{<0,0,-0.025400><0.576200,0.036000,0.025400> rotate<0,0.000000,0> translate<55.160900,0.000000,38.125400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.002800,0.000000,38.125400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.002800,0.000000,38.269400>}
box{<0,0,-0.025400><0.144000,0.036000,0.025400> rotate<0,90.000000,0> translate<56.002800,0.000000,38.269400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.002800,0.000000,38.269400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.146800,0.000000,38.269400>}
box{<0,0,-0.025400><0.144000,0.036000,0.025400> rotate<0,0.000000,0> translate<56.002800,0.000000,38.269400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.146800,0.000000,38.269400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.146800,0.000000,38.125400>}
box{<0,0,-0.025400><0.144000,0.036000,0.025400> rotate<0,-90.000000,0> translate<56.146800,0.000000,38.125400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.146800,0.000000,38.125400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.002800,0.000000,38.125400>}
box{<0,0,-0.025400><0.144000,0.036000,0.025400> rotate<0,0.000000,0> translate<56.002800,0.000000,38.125400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.999900,0.000000,38.125400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.423700,0.000000,38.125400>}
box{<0,0,-0.025400><0.576200,0.036000,0.025400> rotate<0,0.000000,0> translate<56.423700,0.000000,38.125400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.423700,0.000000,38.125400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.999900,0.000000,38.701600>}
box{<0,0,-0.025400><0.814870,0.036000,0.025400> rotate<0,-44.997030,0> translate<56.423700,0.000000,38.125400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.999900,0.000000,38.701600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.999900,0.000000,38.845600>}
box{<0,0,-0.025400><0.144000,0.036000,0.025400> rotate<0,90.000000,0> translate<56.999900,0.000000,38.845600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.999900,0.000000,38.845600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.855800,0.000000,38.989700>}
box{<0,0,-0.025400><0.203788,0.036000,0.025400> rotate<0,44.997030,0> translate<56.855800,0.000000,38.989700> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.855800,0.000000,38.989700>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.567700,0.000000,38.989700>}
box{<0,0,-0.025400><0.288100,0.036000,0.025400> rotate<0,0.000000,0> translate<56.567700,0.000000,38.989700> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.567700,0.000000,38.989700>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.423700,0.000000,38.845600>}
box{<0,0,-0.025400><0.203717,0.036000,0.025400> rotate<0,-45.016916,0> translate<56.423700,0.000000,38.845600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<58.107500,0.000000,38.125400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<58.107500,0.000000,38.989700>}
box{<0,0,-0.025400><0.864300,0.036000,0.025400> rotate<0,90.000000,0> translate<58.107500,0.000000,38.989700> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<58.107500,0.000000,38.989700>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<58.539600,0.000000,38.989700>}
box{<0,0,-0.025400><0.432100,0.036000,0.025400> rotate<0,0.000000,0> translate<58.107500,0.000000,38.989700> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<58.539600,0.000000,38.989700>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<58.683700,0.000000,38.845600>}
box{<0,0,-0.025400><0.203788,0.036000,0.025400> rotate<0,44.997030,0> translate<58.539600,0.000000,38.989700> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<58.683700,0.000000,38.845600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<58.683700,0.000000,38.557500>}
box{<0,0,-0.025400><0.288100,0.036000,0.025400> rotate<0,-90.000000,0> translate<58.683700,0.000000,38.557500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<58.683700,0.000000,38.557500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<58.539600,0.000000,38.413500>}
box{<0,0,-0.025400><0.203717,0.036000,0.025400> rotate<0,-44.977144,0> translate<58.539600,0.000000,38.413500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<58.539600,0.000000,38.413500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<58.107500,0.000000,38.413500>}
box{<0,0,-0.025400><0.432100,0.036000,0.025400> rotate<0,0.000000,0> translate<58.107500,0.000000,38.413500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<58.395600,0.000000,38.413500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<58.683700,0.000000,38.125400>}
box{<0,0,-0.025400><0.407435,0.036000,0.025400> rotate<0,44.997030,0> translate<58.395600,0.000000,38.413500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<59.525600,0.000000,38.989700>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<58.949400,0.000000,38.989700>}
box{<0,0,-0.025400><0.576200,0.036000,0.025400> rotate<0,0.000000,0> translate<58.949400,0.000000,38.989700> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<58.949400,0.000000,38.989700>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<58.949400,0.000000,38.125400>}
box{<0,0,-0.025400><0.864300,0.036000,0.025400> rotate<0,-90.000000,0> translate<58.949400,0.000000,38.125400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<58.949400,0.000000,38.125400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<59.525600,0.000000,38.125400>}
box{<0,0,-0.025400><0.576200,0.036000,0.025400> rotate<0,0.000000,0> translate<58.949400,0.000000,38.125400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<58.949400,0.000000,38.557500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<59.237500,0.000000,38.557500>}
box{<0,0,-0.025400><0.288100,0.036000,0.025400> rotate<0,0.000000,0> translate<58.949400,0.000000,38.557500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<59.791300,0.000000,38.989700>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<59.791300,0.000000,38.413500>}
box{<0,0,-0.025400><0.576200,0.036000,0.025400> rotate<0,-90.000000,0> translate<59.791300,0.000000,38.413500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<59.791300,0.000000,38.413500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.079400,0.000000,38.125400>}
box{<0,0,-0.025400><0.407435,0.036000,0.025400> rotate<0,44.997030,0> translate<59.791300,0.000000,38.413500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.079400,0.000000,38.125400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.367500,0.000000,38.413500>}
box{<0,0,-0.025400><0.407435,0.036000,0.025400> rotate<0,-44.997030,0> translate<60.079400,0.000000,38.125400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.367500,0.000000,38.413500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.367500,0.000000,38.989700>}
box{<0,0,-0.025400><0.576200,0.036000,0.025400> rotate<0,90.000000,0> translate<60.367500,0.000000,38.989700> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.633200,0.000000,38.701600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.777200,0.000000,38.701600>}
box{<0,0,-0.025400><0.144000,0.036000,0.025400> rotate<0,0.000000,0> translate<60.633200,0.000000,38.701600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.777200,0.000000,38.701600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.777200,0.000000,38.557500>}
box{<0,0,-0.025400><0.144100,0.036000,0.025400> rotate<0,-90.000000,0> translate<60.777200,0.000000,38.557500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.777200,0.000000,38.557500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.633200,0.000000,38.557500>}
box{<0,0,-0.025400><0.144000,0.036000,0.025400> rotate<0,0.000000,0> translate<60.633200,0.000000,38.557500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.633200,0.000000,38.557500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.633200,0.000000,38.701600>}
box{<0,0,-0.025400><0.144100,0.036000,0.025400> rotate<0,90.000000,0> translate<60.633200,0.000000,38.701600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.633200,0.000000,38.269400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.777200,0.000000,38.269400>}
box{<0,0,-0.025400><0.144000,0.036000,0.025400> rotate<0,0.000000,0> translate<60.633200,0.000000,38.269400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.777200,0.000000,38.269400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.777200,0.000000,38.125400>}
box{<0,0,-0.025400><0.144000,0.036000,0.025400> rotate<0,-90.000000,0> translate<60.777200,0.000000,38.125400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.777200,0.000000,38.125400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.633200,0.000000,38.125400>}
box{<0,0,-0.025400><0.144000,0.036000,0.025400> rotate<0,0.000000,0> translate<60.633200,0.000000,38.125400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.633200,0.000000,38.125400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.633200,0.000000,38.269400>}
box{<0,0,-0.025400><0.144000,0.036000,0.025400> rotate<0,90.000000,0> translate<60.633200,0.000000,38.269400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.472200,0.000000,38.845600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.328100,0.000000,38.989700>}
box{<0,0,-0.025400><0.203788,0.036000,0.025400> rotate<0,44.997030,0> translate<62.328100,0.000000,38.989700> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.328100,0.000000,38.989700>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.040000,0.000000,38.989700>}
box{<0,0,-0.025400><0.288100,0.036000,0.025400> rotate<0,0.000000,0> translate<62.040000,0.000000,38.989700> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.040000,0.000000,38.989700>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.896000,0.000000,38.845600>}
box{<0,0,-0.025400><0.203717,0.036000,0.025400> rotate<0,-45.016916,0> translate<61.896000,0.000000,38.845600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.896000,0.000000,38.845600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.896000,0.000000,38.269400>}
box{<0,0,-0.025400><0.576200,0.036000,0.025400> rotate<0,-90.000000,0> translate<61.896000,0.000000,38.269400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.896000,0.000000,38.269400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.040000,0.000000,38.125400>}
box{<0,0,-0.025400><0.203647,0.036000,0.025400> rotate<0,44.997030,0> translate<61.896000,0.000000,38.269400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.040000,0.000000,38.125400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.328100,0.000000,38.125400>}
box{<0,0,-0.025400><0.288100,0.036000,0.025400> rotate<0,0.000000,0> translate<62.040000,0.000000,38.125400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.328100,0.000000,38.125400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.472200,0.000000,38.269400>}
box{<0,0,-0.025400><0.203717,0.036000,0.025400> rotate<0,-44.977144,0> translate<62.328100,0.000000,38.125400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<48.285400,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<48.285400,0.000000,37.567200>}
box{<0,0,-0.025400><0.711800,0.036000,0.025400> rotate<0,90.000000,0> translate<48.285400,0.000000,37.567200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<48.285400,0.000000,37.567200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<48.759900,0.000000,37.567200>}
box{<0,0,-0.025400><0.474500,0.036000,0.025400> rotate<0,0.000000,0> translate<48.285400,0.000000,37.567200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<48.285400,0.000000,37.211300>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<48.522600,0.000000,37.211300>}
box{<0,0,-0.025400><0.237200,0.036000,0.025400> rotate<0,0.000000,0> translate<48.285400,0.000000,37.211300> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<48.987000,0.000000,37.329900>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<48.987000,0.000000,36.974000>}
box{<0,0,-0.025400><0.355900,0.036000,0.025400> rotate<0,-90.000000,0> translate<48.987000,0.000000,36.974000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<48.987000,0.000000,36.974000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.105600,0.000000,36.855400>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,44.997030,0> translate<48.987000,0.000000,36.974000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.105600,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.461500,0.000000,36.855400>}
box{<0,0,-0.025400><0.355900,0.036000,0.025400> rotate<0,0.000000,0> translate<49.105600,0.000000,36.855400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.461500,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.461500,0.000000,37.329900>}
box{<0,0,-0.025400><0.474500,0.036000,0.025400> rotate<0,90.000000,0> translate<49.461500,0.000000,37.329900> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.688600,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.044500,0.000000,36.855400>}
box{<0,0,-0.025400><0.355900,0.036000,0.025400> rotate<0,0.000000,0> translate<49.688600,0.000000,36.855400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.044500,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.163100,0.000000,36.974000>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,-44.997030,0> translate<50.044500,0.000000,36.855400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.163100,0.000000,36.974000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.044500,0.000000,37.092600>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,44.997030,0> translate<50.044500,0.000000,37.092600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.044500,0.000000,37.092600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.807200,0.000000,37.092600>}
box{<0,0,-0.025400><0.237300,0.036000,0.025400> rotate<0,0.000000,0> translate<49.807200,0.000000,37.092600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.807200,0.000000,37.092600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.688600,0.000000,37.211300>}
box{<0,0,-0.025400><0.167796,0.036000,0.025400> rotate<0,45.021173,0> translate<49.688600,0.000000,37.211300> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.688600,0.000000,37.211300>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.807200,0.000000,37.329900>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,-44.997030,0> translate<49.688600,0.000000,37.211300> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<49.807200,0.000000,37.329900>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.163100,0.000000,37.329900>}
box{<0,0,-0.025400><0.355900,0.036000,0.025400> rotate<0,0.000000,0> translate<49.807200,0.000000,37.329900> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.390200,0.000000,37.329900>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.508800,0.000000,37.329900>}
box{<0,0,-0.025400><0.118600,0.036000,0.025400> rotate<0,0.000000,0> translate<50.390200,0.000000,37.329900> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.508800,0.000000,37.329900>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.508800,0.000000,36.855400>}
box{<0,0,-0.025400><0.474500,0.036000,0.025400> rotate<0,-90.000000,0> translate<50.508800,0.000000,36.855400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.390200,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.627400,0.000000,36.855400>}
box{<0,0,-0.025400><0.237200,0.036000,0.025400> rotate<0,0.000000,0> translate<50.390200,0.000000,36.855400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.508800,0.000000,37.685800>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.508800,0.000000,37.567200>}
box{<0,0,-0.025400><0.118600,0.036000,0.025400> rotate<0,-90.000000,0> translate<50.508800,0.000000,37.567200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.976500,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.213800,0.000000,36.855400>}
box{<0,0,-0.025400><0.237300,0.036000,0.025400> rotate<0,0.000000,0> translate<50.976500,0.000000,36.855400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.213800,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.332400,0.000000,36.974000>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,-44.997030,0> translate<51.213800,0.000000,36.855400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.332400,0.000000,36.974000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.332400,0.000000,37.211300>}
box{<0,0,-0.025400><0.237300,0.036000,0.025400> rotate<0,90.000000,0> translate<51.332400,0.000000,37.211300> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.332400,0.000000,37.211300>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.213800,0.000000,37.329900>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,44.997030,0> translate<51.213800,0.000000,37.329900> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.213800,0.000000,37.329900>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.976500,0.000000,37.329900>}
box{<0,0,-0.025400><0.237300,0.036000,0.025400> rotate<0,0.000000,0> translate<50.976500,0.000000,37.329900> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.976500,0.000000,37.329900>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.857900,0.000000,37.211300>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,-44.997030,0> translate<50.857900,0.000000,37.211300> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.857900,0.000000,37.211300>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.857900,0.000000,36.974000>}
box{<0,0,-0.025400><0.237300,0.036000,0.025400> rotate<0,-90.000000,0> translate<50.857900,0.000000,36.974000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.857900,0.000000,36.974000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<50.976500,0.000000,36.855400>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,44.997030,0> translate<50.857900,0.000000,36.974000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.559500,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.559500,0.000000,37.329900>}
box{<0,0,-0.025400><0.474500,0.036000,0.025400> rotate<0,90.000000,0> translate<51.559500,0.000000,37.329900> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.559500,0.000000,37.329900>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.915400,0.000000,37.329900>}
box{<0,0,-0.025400><0.355900,0.036000,0.025400> rotate<0,0.000000,0> translate<51.559500,0.000000,37.329900> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<51.915400,0.000000,37.329900>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.034000,0.000000,37.211300>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,44.997030,0> translate<51.915400,0.000000,37.329900> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.034000,0.000000,37.211300>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.034000,0.000000,36.855400>}
box{<0,0,-0.025400><0.355900,0.036000,0.025400> rotate<0,-90.000000,0> translate<52.034000,0.000000,36.855400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.261100,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.261100,0.000000,37.567200>}
box{<0,0,-0.025400><0.711800,0.036000,0.025400> rotate<0,90.000000,0> translate<52.261100,0.000000,37.567200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.261100,0.000000,37.567200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.617000,0.000000,37.567200>}
box{<0,0,-0.025400><0.355900,0.036000,0.025400> rotate<0,0.000000,0> translate<52.261100,0.000000,37.567200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.617000,0.000000,37.567200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.735600,0.000000,37.448500>}
box{<0,0,-0.025400><0.167796,0.036000,0.025400> rotate<0,45.021173,0> translate<52.617000,0.000000,37.567200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.735600,0.000000,37.448500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.735600,0.000000,37.211300>}
box{<0,0,-0.025400><0.237200,0.036000,0.025400> rotate<0,-90.000000,0> translate<52.735600,0.000000,37.211300> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.735600,0.000000,37.211300>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.617000,0.000000,37.092600>}
box{<0,0,-0.025400><0.167796,0.036000,0.025400> rotate<0,-45.021173,0> translate<52.617000,0.000000,37.092600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.617000,0.000000,37.092600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.261100,0.000000,37.092600>}
box{<0,0,-0.025400><0.355900,0.036000,0.025400> rotate<0,0.000000,0> translate<52.261100,0.000000,37.092600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.437200,0.000000,37.448500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.318600,0.000000,37.567200>}
box{<0,0,-0.025400><0.167796,0.036000,0.025400> rotate<0,45.021173,0> translate<53.318600,0.000000,37.567200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.318600,0.000000,37.567200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.081300,0.000000,37.567200>}
box{<0,0,-0.025400><0.237300,0.036000,0.025400> rotate<0,0.000000,0> translate<53.081300,0.000000,37.567200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.081300,0.000000,37.567200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.962700,0.000000,37.448500>}
box{<0,0,-0.025400><0.167796,0.036000,0.025400> rotate<0,-45.021173,0> translate<52.962700,0.000000,37.448500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.962700,0.000000,37.448500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.962700,0.000000,36.974000>}
box{<0,0,-0.025400><0.474500,0.036000,0.025400> rotate<0,-90.000000,0> translate<52.962700,0.000000,36.974000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<52.962700,0.000000,36.974000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.081300,0.000000,36.855400>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,44.997030,0> translate<52.962700,0.000000,36.974000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.081300,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.318600,0.000000,36.855400>}
box{<0,0,-0.025400><0.237300,0.036000,0.025400> rotate<0,0.000000,0> translate<53.081300,0.000000,36.855400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.318600,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.437200,0.000000,36.974000>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,-44.997030,0> translate<53.318600,0.000000,36.855400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.664300,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.664300,0.000000,37.567200>}
box{<0,0,-0.025400><0.711800,0.036000,0.025400> rotate<0,90.000000,0> translate<53.664300,0.000000,37.567200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.664300,0.000000,37.567200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.020200,0.000000,37.567200>}
box{<0,0,-0.025400><0.355900,0.036000,0.025400> rotate<0,0.000000,0> translate<53.664300,0.000000,37.567200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.020200,0.000000,37.567200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.138800,0.000000,37.448500>}
box{<0,0,-0.025400><0.167796,0.036000,0.025400> rotate<0,45.021173,0> translate<54.020200,0.000000,37.567200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.138800,0.000000,37.448500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.138800,0.000000,37.329900>}
box{<0,0,-0.025400><0.118600,0.036000,0.025400> rotate<0,-90.000000,0> translate<54.138800,0.000000,37.329900> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.138800,0.000000,37.329900>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.020200,0.000000,37.211300>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,-44.997030,0> translate<54.020200,0.000000,37.211300> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.020200,0.000000,37.211300>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.138800,0.000000,37.092600>}
box{<0,0,-0.025400><0.167796,0.036000,0.025400> rotate<0,45.021173,0> translate<54.020200,0.000000,37.211300> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.138800,0.000000,37.092600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.138800,0.000000,36.974000>}
box{<0,0,-0.025400><0.118600,0.036000,0.025400> rotate<0,-90.000000,0> translate<54.138800,0.000000,36.974000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.138800,0.000000,36.974000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.020200,0.000000,36.855400>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,-44.997030,0> translate<54.020200,0.000000,36.855400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.020200,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.664300,0.000000,36.855400>}
box{<0,0,-0.025400><0.355900,0.036000,0.025400> rotate<0,0.000000,0> translate<53.664300,0.000000,36.855400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<53.664300,0.000000,37.211300>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<54.020200,0.000000,37.211300>}
box{<0,0,-0.025400><0.355900,0.036000,0.025400> rotate<0,0.000000,0> translate<53.664300,0.000000,37.211300> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.423400,0.000000,37.567200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.186100,0.000000,37.567200>}
box{<0,0,-0.025400><0.237300,0.036000,0.025400> rotate<0,0.000000,0> translate<55.186100,0.000000,37.567200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.186100,0.000000,37.567200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.067500,0.000000,37.448500>}
box{<0,0,-0.025400><0.167796,0.036000,0.025400> rotate<0,-45.021173,0> translate<55.067500,0.000000,37.448500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.067500,0.000000,37.448500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.067500,0.000000,36.974000>}
box{<0,0,-0.025400><0.474500,0.036000,0.025400> rotate<0,-90.000000,0> translate<55.067500,0.000000,36.974000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.067500,0.000000,36.974000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.186100,0.000000,36.855400>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,44.997030,0> translate<55.067500,0.000000,36.974000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.186100,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.423400,0.000000,36.855400>}
box{<0,0,-0.025400><0.237300,0.036000,0.025400> rotate<0,0.000000,0> translate<55.186100,0.000000,36.855400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.423400,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.542000,0.000000,36.974000>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,-44.997030,0> translate<55.423400,0.000000,36.855400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.542000,0.000000,36.974000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.542000,0.000000,37.448500>}
box{<0,0,-0.025400><0.474500,0.036000,0.025400> rotate<0,90.000000,0> translate<55.542000,0.000000,37.448500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.542000,0.000000,37.448500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.423400,0.000000,37.567200>}
box{<0,0,-0.025400><0.167796,0.036000,0.025400> rotate<0,45.021173,0> translate<55.423400,0.000000,37.567200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.769100,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.769100,0.000000,37.329900>}
box{<0,0,-0.025400><0.474500,0.036000,0.025400> rotate<0,90.000000,0> translate<55.769100,0.000000,37.329900> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<55.769100,0.000000,37.092600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.006300,0.000000,37.329900>}
box{<0,0,-0.025400><0.335522,0.036000,0.025400> rotate<0,-45.009104,0> translate<55.769100,0.000000,37.092600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.006300,0.000000,37.329900>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.125000,0.000000,37.329900>}
box{<0,0,-0.025400><0.118700,0.036000,0.025400> rotate<0,0.000000,0> translate<56.006300,0.000000,37.329900> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.828200,0.000000,37.567200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.828200,0.000000,36.855400>}
box{<0,0,-0.025400><0.711800,0.036000,0.025400> rotate<0,-90.000000,0> translate<56.828200,0.000000,36.855400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.828200,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.472300,0.000000,36.855400>}
box{<0,0,-0.025400><0.355900,0.036000,0.025400> rotate<0,0.000000,0> translate<56.472300,0.000000,36.855400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.472300,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.353700,0.000000,36.974000>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,44.997030,0> translate<56.353700,0.000000,36.974000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.353700,0.000000,36.974000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.353700,0.000000,37.211300>}
box{<0,0,-0.025400><0.237300,0.036000,0.025400> rotate<0,90.000000,0> translate<56.353700,0.000000,37.211300> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.353700,0.000000,37.211300>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.472300,0.000000,37.329900>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,-44.997030,0> translate<56.353700,0.000000,37.211300> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.472300,0.000000,37.329900>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<56.828200,0.000000,37.329900>}
box{<0,0,-0.025400><0.355900,0.036000,0.025400> rotate<0,0.000000,0> translate<56.472300,0.000000,37.329900> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.411200,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.173900,0.000000,36.855400>}
box{<0,0,-0.025400><0.237300,0.036000,0.025400> rotate<0,0.000000,0> translate<57.173900,0.000000,36.855400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.173900,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.055300,0.000000,36.974000>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,44.997030,0> translate<57.055300,0.000000,36.974000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.055300,0.000000,36.974000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.055300,0.000000,37.211300>}
box{<0,0,-0.025400><0.237300,0.036000,0.025400> rotate<0,90.000000,0> translate<57.055300,0.000000,37.211300> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.055300,0.000000,37.211300>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.173900,0.000000,37.329900>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,-44.997030,0> translate<57.055300,0.000000,37.211300> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.173900,0.000000,37.329900>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.411200,0.000000,37.329900>}
box{<0,0,-0.025400><0.237300,0.036000,0.025400> rotate<0,0.000000,0> translate<57.173900,0.000000,37.329900> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.411200,0.000000,37.329900>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.529800,0.000000,37.211300>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,44.997030,0> translate<57.411200,0.000000,37.329900> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.529800,0.000000,37.211300>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.529800,0.000000,37.092600>}
box{<0,0,-0.025400><0.118700,0.036000,0.025400> rotate<0,-90.000000,0> translate<57.529800,0.000000,37.092600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.529800,0.000000,37.092600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.055300,0.000000,37.092600>}
box{<0,0,-0.025400><0.474500,0.036000,0.025400> rotate<0,0.000000,0> translate<57.055300,0.000000,37.092600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.756900,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.756900,0.000000,37.329900>}
box{<0,0,-0.025400><0.474500,0.036000,0.025400> rotate<0,90.000000,0> translate<57.756900,0.000000,37.329900> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.756900,0.000000,37.092600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.994100,0.000000,37.329900>}
box{<0,0,-0.025400><0.335522,0.036000,0.025400> rotate<0,-45.009104,0> translate<57.756900,0.000000,37.092600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<57.994100,0.000000,37.329900>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<58.112800,0.000000,37.329900>}
box{<0,0,-0.025400><0.118700,0.036000,0.025400> rotate<0,0.000000,0> translate<57.994100,0.000000,37.329900> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<59.161700,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<59.161700,0.000000,37.567200>}
box{<0,0,-0.025400><0.711800,0.036000,0.025400> rotate<0,90.000000,0> translate<59.161700,0.000000,37.567200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<59.399000,0.000000,37.567200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<59.399000,0.000000,36.855400>}
box{<0,0,-0.025400><0.711800,0.036000,0.025400> rotate<0,-90.000000,0> translate<59.399000,0.000000,36.855400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<59.043100,0.000000,37.329900>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<59.399000,0.000000,37.329900>}
box{<0,0,-0.025400><0.355900,0.036000,0.025400> rotate<0,0.000000,0> translate<59.043100,0.000000,37.329900> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<59.399000,0.000000,37.329900>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<59.517600,0.000000,37.329900>}
box{<0,0,-0.025400><0.118600,0.036000,0.025400> rotate<0,0.000000,0> translate<59.399000,0.000000,37.329900> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<59.043100,0.000000,37.092600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<59.517600,0.000000,37.092600>}
box{<0,0,-0.025400><0.474500,0.036000,0.025400> rotate<0,0.000000,0> translate<59.043100,0.000000,37.092600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<59.744700,0.000000,37.448500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<59.863300,0.000000,37.567200>}
box{<0,0,-0.025400><0.167796,0.036000,0.025400> rotate<0,-45.021173,0> translate<59.744700,0.000000,37.448500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<59.863300,0.000000,37.567200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.100600,0.000000,37.567200>}
box{<0,0,-0.025400><0.237300,0.036000,0.025400> rotate<0,0.000000,0> translate<59.863300,0.000000,37.567200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.100600,0.000000,37.567200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.219200,0.000000,37.448500>}
box{<0,0,-0.025400><0.167796,0.036000,0.025400> rotate<0,45.021173,0> translate<60.100600,0.000000,37.567200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.219200,0.000000,37.448500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.219200,0.000000,37.329900>}
box{<0,0,-0.025400><0.118600,0.036000,0.025400> rotate<0,-90.000000,0> translate<60.219200,0.000000,37.329900> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.219200,0.000000,37.329900>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.100600,0.000000,37.211300>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,-44.997030,0> translate<60.100600,0.000000,37.211300> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.100600,0.000000,37.211300>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<59.981900,0.000000,37.211300>}
box{<0,0,-0.025400><0.118700,0.036000,0.025400> rotate<0,0.000000,0> translate<59.981900,0.000000,37.211300> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.100600,0.000000,37.211300>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.219200,0.000000,37.092600>}
box{<0,0,-0.025400><0.167796,0.036000,0.025400> rotate<0,45.021173,0> translate<60.100600,0.000000,37.211300> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.219200,0.000000,37.092600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.219200,0.000000,36.974000>}
box{<0,0,-0.025400><0.118600,0.036000,0.025400> rotate<0,-90.000000,0> translate<60.219200,0.000000,36.974000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.219200,0.000000,36.974000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.100600,0.000000,36.855400>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,-44.997030,0> translate<60.100600,0.000000,36.855400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.100600,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<59.863300,0.000000,36.855400>}
box{<0,0,-0.025400><0.237300,0.036000,0.025400> rotate<0,0.000000,0> translate<59.863300,0.000000,36.855400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<59.863300,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<59.744700,0.000000,36.974000>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,44.997030,0> translate<59.744700,0.000000,36.974000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.446300,0.000000,37.448500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.564900,0.000000,37.567200>}
box{<0,0,-0.025400><0.167796,0.036000,0.025400> rotate<0,-45.021173,0> translate<60.446300,0.000000,37.448500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.564900,0.000000,37.567200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.802200,0.000000,37.567200>}
box{<0,0,-0.025400><0.237300,0.036000,0.025400> rotate<0,0.000000,0> translate<60.564900,0.000000,37.567200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.802200,0.000000,37.567200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.920800,0.000000,37.448500>}
box{<0,0,-0.025400><0.167796,0.036000,0.025400> rotate<0,45.021173,0> translate<60.802200,0.000000,37.567200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.920800,0.000000,37.448500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.920800,0.000000,37.329900>}
box{<0,0,-0.025400><0.118600,0.036000,0.025400> rotate<0,-90.000000,0> translate<60.920800,0.000000,37.329900> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.920800,0.000000,37.329900>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.802200,0.000000,37.211300>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,-44.997030,0> translate<60.802200,0.000000,37.211300> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.802200,0.000000,37.211300>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.920800,0.000000,37.092600>}
box{<0,0,-0.025400><0.167796,0.036000,0.025400> rotate<0,45.021173,0> translate<60.802200,0.000000,37.211300> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.920800,0.000000,37.092600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.920800,0.000000,36.974000>}
box{<0,0,-0.025400><0.118600,0.036000,0.025400> rotate<0,-90.000000,0> translate<60.920800,0.000000,36.974000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.920800,0.000000,36.974000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.802200,0.000000,36.855400>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,-44.997030,0> translate<60.802200,0.000000,36.855400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.802200,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.564900,0.000000,36.855400>}
box{<0,0,-0.025400><0.237300,0.036000,0.025400> rotate<0,0.000000,0> translate<60.564900,0.000000,36.855400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.564900,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.446300,0.000000,36.974000>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,44.997030,0> translate<60.446300,0.000000,36.974000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.446300,0.000000,36.974000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.446300,0.000000,37.092600>}
box{<0,0,-0.025400><0.118600,0.036000,0.025400> rotate<0,90.000000,0> translate<60.446300,0.000000,37.092600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.446300,0.000000,37.092600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.564900,0.000000,37.211300>}
box{<0,0,-0.025400><0.167796,0.036000,0.025400> rotate<0,-45.021173,0> translate<60.446300,0.000000,37.092600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.564900,0.000000,37.211300>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.446300,0.000000,37.329900>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,44.997030,0> translate<60.446300,0.000000,37.329900> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.446300,0.000000,37.329900>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.446300,0.000000,37.448500>}
box{<0,0,-0.025400><0.118600,0.036000,0.025400> rotate<0,90.000000,0> translate<60.446300,0.000000,37.448500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.564900,0.000000,37.211300>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<60.802200,0.000000,37.211300>}
box{<0,0,-0.025400><0.237300,0.036000,0.025400> rotate<0,0.000000,0> translate<60.564900,0.000000,37.211300> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.147900,0.000000,37.567200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.622400,0.000000,37.567200>}
box{<0,0,-0.025400><0.474500,0.036000,0.025400> rotate<0,0.000000,0> translate<61.147900,0.000000,37.567200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.622400,0.000000,37.567200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.622400,0.000000,37.448500>}
box{<0,0,-0.025400><0.118700,0.036000,0.025400> rotate<0,-90.000000,0> translate<61.622400,0.000000,37.448500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.622400,0.000000,37.448500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.147900,0.000000,36.974000>}
box{<0,0,-0.025400><0.671044,0.036000,0.025400> rotate<0,-44.997030,0> translate<61.147900,0.000000,36.974000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.147900,0.000000,36.974000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.147900,0.000000,36.855400>}
box{<0,0,-0.025400><0.118600,0.036000,0.025400> rotate<0,-90.000000,0> translate<61.147900,0.000000,36.855400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.324000,0.000000,37.567200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.086700,0.000000,37.448500>}
box{<0,0,-0.025400><0.265332,0.036000,0.025400> rotate<0,-26.572954,0> translate<62.086700,0.000000,37.448500> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.086700,0.000000,37.448500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.849500,0.000000,37.211300>}
box{<0,0,-0.025400><0.335451,0.036000,0.025400> rotate<0,-44.997030,0> translate<61.849500,0.000000,37.211300> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.849500,0.000000,37.211300>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.849500,0.000000,36.974000>}
box{<0,0,-0.025400><0.237300,0.036000,0.025400> rotate<0,-90.000000,0> translate<61.849500,0.000000,36.974000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.849500,0.000000,36.974000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.968100,0.000000,36.855400>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,44.997030,0> translate<61.849500,0.000000,36.974000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.968100,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.205400,0.000000,36.855400>}
box{<0,0,-0.025400><0.237300,0.036000,0.025400> rotate<0,0.000000,0> translate<61.968100,0.000000,36.855400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.205400,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.324000,0.000000,36.974000>}
box{<0,0,-0.025400><0.167726,0.036000,0.025400> rotate<0,-44.997030,0> translate<62.205400,0.000000,36.855400> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.324000,0.000000,36.974000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.324000,0.000000,37.092600>}
box{<0,0,-0.025400><0.118600,0.036000,0.025400> rotate<0,90.000000,0> translate<62.324000,0.000000,37.092600> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.324000,0.000000,37.092600>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.205400,0.000000,37.211300>}
box{<0,0,-0.025400><0.167796,0.036000,0.025400> rotate<0,45.021173,0> translate<62.205400,0.000000,37.211300> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.205400,0.000000,37.211300>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<61.849500,0.000000,37.211300>}
box{<0,0,-0.025400><0.355900,0.036000,0.025400> rotate<0,0.000000,0> translate<61.849500,0.000000,37.211300> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.907000,0.000000,36.855400>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.907000,0.000000,37.567200>}
box{<0,0,-0.025400><0.711800,0.036000,0.025400> rotate<0,90.000000,0> translate<62.907000,0.000000,37.567200> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.907000,0.000000,37.567200>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.551100,0.000000,37.211300>}
box{<0,0,-0.025400><0.503319,0.036000,0.025400> rotate<0,-44.997030,0> translate<62.551100,0.000000,37.211300> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.551100,0.000000,37.211300>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<63.025600,0.000000,37.211300>}
box{<0,0,-0.025400><0.474500,0.036000,0.025400> rotate<0,0.000000,0> translate<62.551100,0.000000,37.211300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.538100,0.000000,32.296100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.851600,0.000000,32.296100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<63.538100,0.000000,32.296100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.694800,0.000000,32.296100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.694800,0.000000,33.236700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<63.694800,0.000000,33.236700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.538100,0.000000,33.236700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.851600,0.000000,33.236700>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<63.538100,0.000000,33.236700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.788700,0.000000,33.079900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.632000,0.000000,33.236700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<64.632000,0.000000,33.236700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.632000,0.000000,33.236700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.318400,0.000000,33.236700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<64.318400,0.000000,33.236700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.318400,0.000000,33.236700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.161700,0.000000,33.079900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<64.161700,0.000000,33.079900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.161700,0.000000,33.079900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.161700,0.000000,32.452800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<64.161700,0.000000,32.452800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.161700,0.000000,32.452800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.318400,0.000000,32.296100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<64.161700,0.000000,32.452800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.318400,0.000000,32.296100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.632000,0.000000,32.296100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<64.318400,0.000000,32.296100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.632000,0.000000,32.296100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.788700,0.000000,32.452800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<64.632000,0.000000,32.296100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.724200,0.000000,33.079900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.567500,0.000000,33.236700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<65.567500,0.000000,33.236700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.567500,0.000000,33.236700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.253900,0.000000,33.236700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<65.253900,0.000000,33.236700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.253900,0.000000,33.236700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.097200,0.000000,33.079900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<65.097200,0.000000,33.079900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.097200,0.000000,33.079900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.097200,0.000000,32.923100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<65.097200,0.000000,32.923100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.097200,0.000000,32.923100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.253900,0.000000,32.766400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<65.097200,0.000000,32.923100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.253900,0.000000,32.766400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.567500,0.000000,32.766400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<65.253900,0.000000,32.766400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.567500,0.000000,32.766400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.724200,0.000000,32.609600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<65.567500,0.000000,32.766400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.724200,0.000000,32.609600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.724200,0.000000,32.452800>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<65.724200,0.000000,32.452800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.724200,0.000000,32.452800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.567500,0.000000,32.296100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<65.567500,0.000000,32.296100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.567500,0.000000,32.296100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.253900,0.000000,32.296100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<65.253900,0.000000,32.296100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.253900,0.000000,32.296100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<65.097200,0.000000,32.452800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<65.097200,0.000000,32.452800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.032700,0.000000,32.296100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.032700,0.000000,33.236700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<66.032700,0.000000,33.236700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.032700,0.000000,33.236700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.503000,0.000000,33.236700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<66.032700,0.000000,33.236700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.503000,0.000000,33.236700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.659700,0.000000,33.079900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<66.503000,0.000000,33.236700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.659700,0.000000,33.079900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.659700,0.000000,32.766400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,-90.000000,0> translate<66.659700,0.000000,32.766400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.659700,0.000000,32.766400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.503000,0.000000,32.609600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<66.503000,0.000000,32.609600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.503000,0.000000,32.609600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<66.032700,0.000000,32.609600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<66.032700,0.000000,32.609600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.714200,0.000000,1.143600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.798800,0.000000,1.143600>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<24.714200,0.000000,1.143600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.256500,0.000000,1.686000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.256500,0.000000,0.601300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.256500,0.000000,0.601300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.625500,0.000000,1.143600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.710100,0.000000,1.143600>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<29.625500,0.000000,1.143600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.380200,0.000000,1.143600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.464800,0.000000,1.143600>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<19.380200,0.000000,1.143600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.922500,0.000000,1.686000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.922500,0.000000,0.601300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.922500,0.000000,0.601300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.291500,0.000000,1.143600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.376100,0.000000,1.143600>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<24.291500,0.000000,1.143600> }
//AD5206 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.272000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.272000,0.000000,35.814000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.272000,0.000000,35.814000> }
object{ARC(0.635000,0.152400,270.000000,450.000000,0.036000) translate<17.272000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.244000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.244000,0.000000,40.386000>}
box{<0,0,-0.076200><4.572000,0.036000,0.076200> rotate<0,90.000000,0> translate<47.244000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.272000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.244000,0.000000,35.814000>}
box{<0,0,-0.076200><29.972000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.272000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.272000,0.000000,40.386000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.244000,0.000000,40.386000>}
box{<0,0,-0.076200><29.972000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.272000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.272000,0.000000,40.386000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.272000,0.000000,38.735000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.272000,0.000000,38.735000> }
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,0.000000,12.827000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,12.827000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.433000,0.000000,12.827000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.814000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.814000,0.000000,13.208000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<35.814000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.211000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,11.684000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.211000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,10.414000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.100000,0.000000,10.414000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,10.414000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.608000,0.000000,10.414000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.100000,0.000000,10.414000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.608000,0.000000,10.414000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.608000,0.000000,12.954000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<38.608000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.608000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,12.954000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.100000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,11.684000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.100000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,11.684000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.497000,0.000000,11.684000> }
difference{
cylinder{<38.862000,0,11.684000><38.862000,0.036000,11.684000>4.140200 translate<0,0.000000,0>}
cylinder{<38.862000,-0.1,11.684000><38.862000,0.135000,11.684000>3.987800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-0.000000,0> translate<39.370000,0.000000,11.684000>}
//D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.954000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.954000,0.000000,11.684000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.954000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.954000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.494000,0.000000,7.620000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.954000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.494000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.494000,0.000000,7.620000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.494000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.494000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.954000,0.000000,11.684000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.954000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,9.652000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.224000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.859000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.589000,0.000000,8.636000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.589000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.589000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,9.652000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-57.990789,0> translate<13.589000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,8.128000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.224000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.859000,0.000000,8.636000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,57.990789,0> translate<14.224000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.859000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,9.652000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.224000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.589000,0.000000,9.652000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.589000,0.000000,9.652000> }
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-270.000000,0> translate<14.224000,0.000000,11.049000>}
box{<-0.952500,0,-0.381000><0.952500,0.036000,0.381000> rotate<0,-270.000000,0> translate<14.224000,0.000000,6.667500>}
box{<-0.952500,0,-0.381000><0.952500,0.036000,0.381000> rotate<0,-270.000000,0> translate<14.224000,0.000000,12.636500>}
//D2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,14.986000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.606000,0.000000,14.986000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,12.446000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.606000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,12.446000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.606000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,14.986000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<26.670000,0.000000,14.986000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.273000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,13.716000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.638000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.622000,0.000000,13.081000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.622000,0.000000,14.351000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<23.622000,0.000000,14.351000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.622000,0.000000,14.351000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,13.716000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,32.003271,0> translate<23.622000,0.000000,14.351000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.114000,0.000000,13.716000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.114000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.622000,0.000000,13.081000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-32.003271,0> translate<23.622000,0.000000,13.081000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,13.081000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,13.716000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.638000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,14.351000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.638000,0.000000,14.351000> }
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-180.000000,0> translate<26.035000,0.000000,13.716000>}
box{<-0.952500,0,-0.381000><0.952500,0.036000,0.381000> rotate<0,-180.000000,0> translate<21.653500,0.000000,13.716000>}
box{<-0.952500,0,-0.381000><0.952500,0.036000,0.381000> rotate<0,-180.000000,0> translate<27.622500,0.000000,13.716000>}
//E$3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.802000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,24.765000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<66.802000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.802000,0.000000,26.670000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<66.802000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.802000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,27.305000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<66.802000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.802000,0.000000,29.210000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<66.802000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.802000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,24.130000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.992000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,24.765000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<62.357000,0.000000,24.765000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,26.035000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.357000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,26.670000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<62.357000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,27.305000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<62.357000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,28.575000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.357000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,29.210000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<62.357000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.802000,0.000000,26.670000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.992000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.802000,0.000000,29.210000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.992000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,28.575000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<67.437000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,26.035000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<67.437000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.802000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,29.845000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<66.802000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.802000,0.000000,31.750000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<66.802000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,29.845000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<62.357000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,31.115000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.357000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,31.750000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<62.357000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.802000,0.000000,31.750000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.992000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,31.115000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<67.437000,0.000000,31.115000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<66.167000,0.000000,25.400000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<63.627000,0.000000,25.400000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<63.627000,0.000000,27.940000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<66.167000,0.000000,27.940000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<63.627000,0.000000,30.480000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<66.167000,0.000000,30.480000>}
//J1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.751000,0.000000,52.578000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.481000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.751000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,51.435000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<39.751000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,50.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.386000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.751000,0.000000,49.022000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<39.751000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,52.578000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<35.306000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.211000,0.000000,52.578000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.941000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.211000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.846000,0.000000,51.435000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<37.211000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.846000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.846000,0.000000,50.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.846000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.846000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.211000,0.000000,49.022000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<37.211000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.211000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,49.022000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.941000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,0.000000,50.165000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<35.306000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.846000,0.000000,51.435000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<37.846000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.846000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,49.022000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<37.846000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.751000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,49.022000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.481000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.861000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.131000,0.000000,52.578000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.861000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.131000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,51.435000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<32.131000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,50.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.766000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.131000,0.000000,49.022000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<32.131000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,52.578000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<32.766000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,52.578000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.401000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,0.000000,51.435000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<34.671000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,0.000000,50.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.306000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,49.022000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<34.671000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,49.022000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.401000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,50.165000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<32.766000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.321000,0.000000,52.578000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<27.686000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.321000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.591000,0.000000,52.578000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.321000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.591000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,51.435000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<29.591000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,50.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.226000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.591000,0.000000,49.022000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<29.591000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.591000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.321000,0.000000,49.022000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.321000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.321000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,50.165000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<27.686000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.861000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,51.435000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<30.226000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.861000,0.000000,49.022000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<30.226000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.131000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.861000,0.000000,49.022000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.861000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,0.000000,52.578000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.241000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,51.435000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<24.511000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,50.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.146000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,0.000000,49.022000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<24.511000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,52.578000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<25.146000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,52.578000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.781000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,51.435000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<27.051000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,50.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.686000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,49.022000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<27.051000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,49.022000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.781000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,50.165000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<25.146000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,50.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.606000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,51.435000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<22.606000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,49.022000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<22.606000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,49.022000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.241000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,52.578000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.021000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.926000,0.000000,51.435000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<42.291000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.926000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.926000,0.000000,50.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.926000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.926000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,49.022000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<42.291000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,51.435000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<40.386000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,49.022000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<40.386000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,49.022000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.021000,0.000000,49.022000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<39.116000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<36.576000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<34.036000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<31.496000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<28.956000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<26.416000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<23.876000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<41.656000,0.000000,50.800000>}
//J2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,4.318000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.785000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,3.175000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<59.055000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,0.762000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<59.055000,0.000000,0.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,4.318000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<59.690000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,4.318000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.325000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,3.175000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<61.595000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.230000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,0.762000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<61.595000,0.000000,0.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,0.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,0.762000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.325000,0.000000,0.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,0.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,1.905000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<59.690000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,4.318000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<54.610000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,4.318000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.245000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,3.175000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<56.515000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.150000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,0.762000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<56.515000,0.000000,0.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,0.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,0.762000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.245000,0.000000,0.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,0.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,1.905000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<54.610000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,3.175000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<57.150000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,0.762000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<57.150000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,0.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,0.762000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.785000,0.000000,0.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.435000,0.000000,4.318000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.165000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.435000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,3.175000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<51.435000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.070000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.435000,0.000000,0.762000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<51.435000,0.000000,0.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,4.318000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<52.070000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,4.318000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.705000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,3.175000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<53.975000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<54.610000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,0.762000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<53.975000,0.000000,0.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,0.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,0.762000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.705000,0.000000,0.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,0.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,1.905000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<52.070000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.530000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,3.175000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<49.530000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,0.762000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<49.530000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.435000,0.000000,0.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,0.762000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.165000,0.000000,0.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,4.318000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.865000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,3.175000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<64.135000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<64.770000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,0.762000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<64.135000,0.000000,0.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,3.175000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<62.230000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,0.762000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<62.230000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,0.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,0.762000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.865000,0.000000,0.762000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<60.960000,0.000000,2.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<58.420000,0.000000,2.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<55.880000,0.000000,2.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<53.340000,0.000000,2.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<50.800000,0.000000,2.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<63.500000,0.000000,2.540000>}
//J3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,52.578000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.325000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,51.435000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<61.595000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,50.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.230000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,49.022000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<61.595000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,52.578000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<57.150000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,52.578000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.785000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,51.435000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<59.055000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,50.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,49.022000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<59.055000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,49.022000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.785000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,50.165000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<57.150000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,51.435000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<59.690000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,49.022000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<59.690000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,49.022000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.325000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,52.578000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.705000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,51.435000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<53.975000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,50.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<54.610000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,49.022000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<53.975000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,52.578000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<54.610000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,52.578000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.245000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,51.435000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<56.515000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,50.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.150000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,49.022000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<56.515000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,49.022000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.245000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,50.165000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<54.610000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,52.578000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<49.530000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.435000,0.000000,52.578000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.165000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.435000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,51.435000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<51.435000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,50.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.070000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.435000,0.000000,49.022000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<51.435000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.435000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,49.022000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.165000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,50.165000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<49.530000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,51.435000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<52.070000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,49.022000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<52.070000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,49.022000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.705000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,52.578000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.085000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,51.435000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<46.355000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,50.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.990000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,49.022000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<46.355000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,52.578000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<46.990000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,52.578000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.625000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,51.435000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<48.895000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,50.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.530000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,49.022000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<48.895000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,49.022000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.625000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,50.165000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<46.990000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,50.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.450000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,51.435000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<44.450000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,49.022000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<44.450000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,49.022000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.085000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,52.578000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.865000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,51.435000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<64.135000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,50.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<64.770000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,49.022000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<64.135000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,52.578000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,51.435000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<62.230000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,49.022000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<62.230000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,49.022000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.865000,0.000000,49.022000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<60.960000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<58.420000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<55.880000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<53.340000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<50.800000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<48.260000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<45.720000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<63.500000,0.000000,50.800000>}
//LEDPWR silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,21.844000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.733000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,20.701000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<24.003000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,19.431000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.638000,0.000000,19.431000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,19.431000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,18.288000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<24.003000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.273000,0.000000,21.844000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<24.638000,0.000000,20.701000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.273000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,21.844000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.273000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.178000,0.000000,20.701000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<26.543000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.178000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.178000,0.000000,19.431000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.178000,0.000000,19.431000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.178000,0.000000,19.431000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,18.288000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<26.543000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.273000,0.000000,18.288000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.273000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.273000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,19.431000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<24.638000,0.000000,19.431000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,21.844000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<19.558000,0.000000,20.701000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.463000,0.000000,21.844000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.193000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.463000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.098000,0.000000,20.701000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<21.463000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.098000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.098000,0.000000,19.431000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.098000,0.000000,19.431000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.098000,0.000000,19.431000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.463000,0.000000,18.288000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<21.463000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.463000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,18.288000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.193000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,19.431000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<19.558000,0.000000,19.431000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.098000,0.000000,20.701000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<22.098000,0.000000,20.701000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.098000,0.000000,19.431000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,18.288000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<22.098000,0.000000,19.431000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,18.288000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.733000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.113000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,21.844000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.113000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,20.701000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<16.383000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,19.431000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.018000,0.000000,19.431000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,19.431000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,18.288000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<16.383000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,0.000000,21.844000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<17.018000,0.000000,20.701000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,21.844000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.653000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,20.701000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<18.923000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,19.431000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.558000,0.000000,19.431000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,19.431000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,18.288000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<18.923000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,0.000000,18.288000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.653000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,19.431000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<17.018000,0.000000,19.431000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,19.431000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.478000,0.000000,19.431000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.113000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,20.701000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<14.478000,0.000000,20.701000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,19.431000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.113000,0.000000,18.288000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<14.478000,0.000000,19.431000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.113000,0.000000,18.288000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.113000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.083000,0.000000,21.844000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.813000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.083000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,20.701000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<29.083000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,19.431000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.718000,0.000000,19.431000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,19.431000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.083000,0.000000,18.288000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<29.083000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.178000,0.000000,20.701000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<27.178000,0.000000,20.701000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.178000,0.000000,19.431000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,18.288000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<27.178000,0.000000,19.431000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.083000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,18.288000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.813000,0.000000,18.288000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<25.908000,0.000000,20.066000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<23.368000,0.000000,20.066000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<20.828000,0.000000,20.066000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<18.288000,0.000000,20.066000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<15.748000,0.000000,20.066000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<28.448000,0.000000,20.066000>}
//OUAZ-SS-105D silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.420000,0.000000,50.854600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.420000,0.000000,35.454600>}
box{<0,0,-0.063500><15.400000,0.036000,0.063500> rotate<0,-90.000000,0> translate<2.420000,0.000000,35.454600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.420000,0.000000,35.454600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.820000,0.000000,35.454600>}
box{<0,0,-0.063500><10.400000,0.036000,0.063500> rotate<0,0.000000,0> translate<2.420000,0.000000,35.454600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.820000,0.000000,35.454600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.820000,0.000000,50.854600>}
box{<0,0,-0.063500><15.400000,0.036000,0.063500> rotate<0,90.000000,0> translate<12.820000,0.000000,50.854600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.820000,0.000000,50.854600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.420000,0.000000,50.854600>}
box{<0,0,-0.063500><10.400000,0.036000,0.063500> rotate<0,0.000000,0> translate<2.420000,0.000000,50.854600> }
//POWER silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,4.318000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.005000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,3.175000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<41.275000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.910000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,0.762000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<41.275000,0.000000,0.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,4.318000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<41.910000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,4.318000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.545000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,3.175000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<43.815000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.450000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,0.762000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<43.815000,0.000000,0.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,0.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,0.762000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.545000,0.000000,0.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,0.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,1.905000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<41.910000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,4.318000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<36.830000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,4.318000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.465000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,3.175000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<38.735000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.370000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,0.762000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<38.735000,0.000000,0.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,0.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,0.762000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.465000,0.000000,0.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,0.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,1.905000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<36.830000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,3.175000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<39.370000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,0.762000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<39.370000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,0.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,0.762000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.005000,0.000000,0.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.655000,0.000000,4.318000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.385000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.655000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,3.175000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<33.655000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.290000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.655000,0.000000,0.762000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<33.655000,0.000000,0.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,4.318000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<34.290000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,4.318000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.925000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,3.175000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<36.195000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.830000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,0.762000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<36.195000,0.000000,0.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,0.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,0.762000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.925000,0.000000,0.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,0.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,1.905000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<34.290000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.750000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,3.175000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<31.750000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,0.762000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<31.750000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.655000,0.000000,0.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,0.762000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.385000,0.000000,0.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,4.318000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.085000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,3.175000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<46.355000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.990000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,0.762000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<46.355000,0.000000,0.762000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,3.175000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-60.941374,0> translate<44.450000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,0.762000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,60.941374,0> translate<44.450000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,0.762000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,0.762000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.085000,0.000000,0.762000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<43.180000,0.000000,2.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<40.640000,0.000000,2.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<38.100000,0.000000,2.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<35.560000,0.000000,2.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<33.020000,0.000000,2.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<45.720000,0.000000,2.540000>}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<49.530000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<49.530000,0.000000,8.128000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,90.000000,0> translate<49.530000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<49.530000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<49.530000,0.000000,12.192000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,-90.000000,0> translate<49.530000,0.000000,12.192000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<50.165000,0.000000,11.684000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<48.895000,0.000000,11.684000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<48.895000,0.000000,8.636000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<50.165000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,11.938000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.895000,0.000000,11.938000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,11.430000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<50.419000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.292000,0.000000,11.303000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,11.430000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<50.292000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,11.430000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.641000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.768000,0.000000,11.303000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,11.430000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<48.641000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.292000,0.000000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,8.890000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<50.292000,0.000000,9.017000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.292000,0.000000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.292000,0.000000,11.303000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.292000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.768000,0.000000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,8.890000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<48.641000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.768000,0.000000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.768000,0.000000,11.303000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,90.000000,0> translate<48.768000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,8.890000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.419000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,8.890000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<48.641000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,8.382000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.895000,0.000000,8.382000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-270.000000,0> translate<49.530000,0.000000,12.065000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-270.000000,0> translate<49.530000,0.000000,8.255000>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<52.070000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<52.070000,0.000000,8.128000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,90.000000,0> translate<52.070000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<52.070000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<52.070000,0.000000,12.192000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,-90.000000,0> translate<52.070000,0.000000,12.192000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<52.705000,0.000000,11.684000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<51.435000,0.000000,11.684000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<51.435000,0.000000,8.636000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<52.705000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.435000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,11.938000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.435000,0.000000,11.938000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,11.430000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.959000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.832000,0.000000,11.303000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,11.430000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<52.832000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,11.430000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.181000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.308000,0.000000,11.303000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,11.430000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<51.181000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.832000,0.000000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,8.890000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<52.832000,0.000000,9.017000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.832000,0.000000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.832000,0.000000,11.303000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,90.000000,0> translate<52.832000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.308000,0.000000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,8.890000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<51.181000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.308000,0.000000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.308000,0.000000,11.303000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,90.000000,0> translate<51.308000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,8.890000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<52.959000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,8.890000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<51.181000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.435000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,8.382000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.435000,0.000000,8.382000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-270.000000,0> translate<52.070000,0.000000,12.065000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-270.000000,0> translate<52.070000,0.000000,8.255000>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<54.610000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<54.610000,0.000000,8.128000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,90.000000,0> translate<54.610000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<54.610000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<54.610000,0.000000,12.192000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,-90.000000,0> translate<54.610000,0.000000,12.192000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<55.245000,0.000000,11.684000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<53.975000,0.000000,11.684000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<53.975000,0.000000,8.636000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<55.245000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,11.938000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.975000,0.000000,11.938000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.499000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.499000,0.000000,11.430000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<55.499000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,11.303000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.499000,0.000000,11.430000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<55.372000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.721000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.721000,0.000000,11.430000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.721000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.848000,0.000000,11.303000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.721000,0.000000,11.430000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<53.721000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.499000,0.000000,8.890000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<55.372000,0.000000,9.017000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,11.303000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,90.000000,0> translate<55.372000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.848000,0.000000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.721000,0.000000,8.890000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<53.721000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.848000,0.000000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.848000,0.000000,11.303000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,90.000000,0> translate<53.848000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.499000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.499000,0.000000,8.890000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<55.499000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.721000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.721000,0.000000,8.890000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<53.721000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,8.382000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.975000,0.000000,8.382000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-270.000000,0> translate<54.610000,0.000000,12.065000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-270.000000,0> translate<54.610000,0.000000,8.255000>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<57.150000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<57.150000,0.000000,8.128000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,90.000000,0> translate<57.150000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<57.150000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<57.150000,0.000000,12.192000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,-90.000000,0> translate<57.150000,0.000000,12.192000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<57.785000,0.000000,11.684000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<56.515000,0.000000,11.684000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<56.515000,0.000000,8.636000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<57.785000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,11.938000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.515000,0.000000,11.938000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.039000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.039000,0.000000,11.430000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<58.039000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,0.000000,11.303000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.039000,0.000000,11.430000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<57.912000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.261000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.261000,0.000000,11.430000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<56.261000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,11.303000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.261000,0.000000,11.430000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<56.261000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,0.000000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.039000,0.000000,8.890000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<57.912000,0.000000,9.017000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,0.000000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,0.000000,11.303000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,90.000000,0> translate<57.912000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.261000,0.000000,8.890000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<56.261000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.388000,0.000000,11.303000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,90.000000,0> translate<56.388000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.039000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.039000,0.000000,8.890000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<58.039000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.261000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.261000,0.000000,8.890000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<56.261000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,8.382000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.515000,0.000000,8.382000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-270.000000,0> translate<57.150000,0.000000,12.065000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-270.000000,0> translate<57.150000,0.000000,8.255000>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<11.430000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<10.922000,0.000000,31.242000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,0.000000,0> translate<10.922000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<6.350000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<6.858000,0.000000,31.242000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,0.000000,0> translate<6.350000,0.000000,31.242000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<7.366000,0.000000,31.877000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<7.366000,0.000000,30.607000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<10.414000,0.000000,30.607000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<10.414000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.112000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.112000,0.000000,31.877000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<7.112000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.366000,0.000000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,0.000000,32.131000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.366000,0.000000,32.131000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,0.000000,32.131000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<7.620000,0.000000,32.131000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.366000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,0.000000,30.353000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.366000,0.000000,30.353000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,0.000000,30.353000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<7.620000,0.000000,30.353000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,32.131000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<10.033000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,32.004000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.747000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,30.353000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<10.033000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,30.480000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.747000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,32.131000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.160000,0.000000,32.131000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,30.353000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.160000,0.000000,30.353000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.668000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.668000,0.000000,31.877000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.668000,0.000000,31.877000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<6.985000,0.000000,31.242000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<10.795000,0.000000,31.242000>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<19.050000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<18.542000,0.000000,29.718000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,0.000000,0> translate<18.542000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<13.970000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<14.478000,0.000000,29.718000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,0.000000,0> translate<13.970000,0.000000,29.718000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<14.986000,0.000000,30.353000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<14.986000,0.000000,29.083000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<18.034000,0.000000,29.083000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<18.034000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.732000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.732000,0.000000,30.353000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.732000,0.000000,30.353000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.986000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,30.607000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.986000,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,30.607000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<15.240000,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.986000,0.000000,28.829000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,28.829000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.986000,0.000000,28.829000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,28.829000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.240000,0.000000,28.829000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,30.607000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<17.653000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,30.480000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.367000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,28.829000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<17.653000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,28.956000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.367000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.034000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,30.607000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.780000,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.034000,0.000000,28.829000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,28.829000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.780000,0.000000,28.829000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.288000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.288000,0.000000,30.353000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.288000,0.000000,30.353000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<14.605000,0.000000,29.718000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<18.415000,0.000000,29.718000>}
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<23.368000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<23.749000,0.000000,25.146000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<23.368000,0.000000,25.146000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<24.257000,0.000000,26.035000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<24.257000,0.000000,24.257000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<30.099000,0.000000,24.257000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<30.099000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,26.035000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.003000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.257000,0.000000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,26.289000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.257000,0.000000,26.289000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.765000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,26.289000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<24.638000,0.000000,26.289000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.257000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,24.003000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.257000,0.000000,24.003000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.765000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,24.003000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<24.638000,0.000000,24.003000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.591000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,26.289000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.591000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.591000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.765000,0.000000,26.162000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.765000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.591000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,24.003000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<29.591000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.591000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.765000,0.000000,24.130000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.765000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.099000,0.000000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,26.289000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.718000,0.000000,26.289000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.099000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,24.003000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.718000,0.000000,24.003000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.353000,0.000000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.353000,0.000000,26.035000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<30.353000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<30.607000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<30.988000,0.000000,25.146000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<30.607000,0.000000,25.146000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-0.000000,0> translate<23.876000,0.000000,25.146000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-0.000000,0> translate<30.480000,0.000000,25.146000>}
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<26.416000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<25.908000,0.000000,29.718000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,0.000000,0> translate<25.908000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<21.336000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<21.844000,0.000000,29.718000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,0.000000,0> translate<21.336000,0.000000,29.718000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<22.352000,0.000000,30.353000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<22.352000,0.000000,29.083000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<25.400000,0.000000,29.083000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<25.400000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.098000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.098000,0.000000,30.353000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.098000,0.000000,30.353000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.352000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,30.607000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.352000,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,30.607000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<22.606000,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.352000,0.000000,28.829000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,28.829000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.352000,0.000000,28.829000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,28.829000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.606000,0.000000,28.829000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.019000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,30.607000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<25.019000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.019000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,30.480000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.733000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.019000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,28.829000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<25.019000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.019000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,28.956000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.733000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.400000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,30.607000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.146000,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.400000,0.000000,28.829000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,28.829000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.146000,0.000000,28.829000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.654000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.654000,0.000000,30.353000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<25.654000,0.000000,30.353000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<21.971000,0.000000,29.718000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<25.781000,0.000000,29.718000>}
//R9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<34.036000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<33.528000,0.000000,29.718000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,0.000000,0> translate<33.528000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<28.956000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<29.464000,0.000000,29.718000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,0.000000,0> translate<28.956000,0.000000,29.718000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<29.972000,0.000000,30.353000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<29.972000,0.000000,29.083000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<33.020000,0.000000,29.083000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<33.020000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,30.353000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.718000,0.000000,30.353000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.972000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,30.607000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.972000,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.353000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,30.607000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<30.226000,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.972000,0.000000,28.829000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,28.829000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.972000,0.000000,28.829000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.353000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,28.829000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<30.226000,0.000000,28.829000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.639000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,30.607000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<32.639000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.639000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.353000,0.000000,30.480000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.353000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.639000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,28.829000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<32.639000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.639000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.353000,0.000000,28.956000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.353000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,30.607000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.766000,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,28.829000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,28.829000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.766000,0.000000,28.829000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.274000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.274000,0.000000,30.353000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.274000,0.000000,30.353000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<29.591000,0.000000,29.718000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<33.401000,0.000000,29.718000>}
//R10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.954000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<13.335000,0.000000,25.146000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<12.954000,0.000000,25.146000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<13.843000,0.000000,26.035000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<13.843000,0.000000,24.257000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<19.685000,0.000000,24.257000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<19.685000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.589000,0.000000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.589000,0.000000,26.035000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.589000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.843000,0.000000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,26.289000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.843000,0.000000,26.289000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,26.289000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<14.224000,0.000000,26.289000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.843000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,24.003000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.843000,0.000000,24.003000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,24.003000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.224000,0.000000,24.003000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.304000,0.000000,26.289000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.177000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,26.162000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.351000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.304000,0.000000,24.003000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<19.177000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,24.130000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.351000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.304000,0.000000,26.289000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.304000,0.000000,26.289000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.304000,0.000000,24.003000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.304000,0.000000,24.003000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.939000,0.000000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.939000,0.000000,26.035000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<19.939000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<20.193000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<20.574000,0.000000,25.146000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<20.193000,0.000000,25.146000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-0.000000,0> translate<13.462000,0.000000,25.146000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-0.000000,0> translate<20.066000,0.000000,25.146000>}
//R11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<67.310000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<66.802000,0.000000,22.860000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,0.000000,0> translate<66.802000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<62.230000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<62.738000,0.000000,22.860000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,0.000000,0> translate<62.230000,0.000000,22.860000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<63.246000,0.000000,23.495000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<63.246000,0.000000,22.225000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<66.294000,0.000000,22.225000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<66.294000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,23.495000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.992000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.246000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,23.749000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.246000,0.000000,23.749000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.627000,0.000000,23.622000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,23.749000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<63.500000,0.000000,23.749000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.246000,0.000000,21.971000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,21.971000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.246000,0.000000,21.971000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.627000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,21.971000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<63.500000,0.000000,21.971000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.913000,0.000000,23.622000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.040000,0.000000,23.749000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<65.913000,0.000000,23.622000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.913000,0.000000,23.622000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.627000,0.000000,23.622000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.627000,0.000000,23.622000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.913000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.040000,0.000000,21.971000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<65.913000,0.000000,22.098000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.913000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.627000,0.000000,22.098000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.627000,0.000000,22.098000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.294000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.040000,0.000000,23.749000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<66.040000,0.000000,23.749000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.294000,0.000000,21.971000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.040000,0.000000,21.971000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<66.040000,0.000000,21.971000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.548000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.548000,0.000000,23.495000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<66.548000,0.000000,23.495000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<62.865000,0.000000,22.860000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<66.675000,0.000000,22.860000>}
//R12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<67.310000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<66.802000,0.000000,19.050000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,0.000000,0> translate<66.802000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<62.230000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<62.738000,0.000000,19.050000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,0.000000,0> translate<62.230000,0.000000,19.050000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<63.246000,0.000000,19.685000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<63.246000,0.000000,18.415000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<66.294000,0.000000,18.415000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<66.294000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,19.685000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.992000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.246000,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,19.939000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.246000,0.000000,19.939000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.627000,0.000000,19.812000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,19.939000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<63.500000,0.000000,19.939000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.246000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,18.161000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.246000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.627000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,18.161000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<63.500000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.913000,0.000000,19.812000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.040000,0.000000,19.939000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<65.913000,0.000000,19.812000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.913000,0.000000,19.812000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.627000,0.000000,19.812000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.627000,0.000000,19.812000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.913000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.040000,0.000000,18.161000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<65.913000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.913000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.627000,0.000000,18.288000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.627000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.294000,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.040000,0.000000,19.939000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<66.040000,0.000000,19.939000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.294000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.040000,0.000000,18.161000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<66.040000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.548000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.548000,0.000000,19.685000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<66.548000,0.000000,19.685000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<62.865000,0.000000,19.050000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<66.675000,0.000000,19.050000>}
//R13 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<67.310000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<66.802000,0.000000,15.240000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,0.000000,0> translate<66.802000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<62.230000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<62.738000,0.000000,15.240000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,0.000000,0> translate<62.230000,0.000000,15.240000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<63.246000,0.000000,15.875000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<63.246000,0.000000,14.605000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<66.294000,0.000000,14.605000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<66.294000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,15.875000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.992000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.246000,0.000000,16.129000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,16.129000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.246000,0.000000,16.129000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.627000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,16.129000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<63.500000,0.000000,16.129000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.246000,0.000000,14.351000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,14.351000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.246000,0.000000,14.351000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.627000,0.000000,14.478000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,14.351000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<63.500000,0.000000,14.351000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.913000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.040000,0.000000,16.129000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<65.913000,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.913000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.627000,0.000000,16.002000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.627000,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.913000,0.000000,14.478000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.040000,0.000000,14.351000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<65.913000,0.000000,14.478000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.913000,0.000000,14.478000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.627000,0.000000,14.478000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.627000,0.000000,14.478000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.294000,0.000000,16.129000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.040000,0.000000,16.129000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<66.040000,0.000000,16.129000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.294000,0.000000,14.351000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.040000,0.000000,14.351000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<66.040000,0.000000,14.351000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.548000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.548000,0.000000,15.875000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<66.548000,0.000000,15.875000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<62.865000,0.000000,15.240000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<66.675000,0.000000,15.240000>}
//R14 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<67.310000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<66.802000,0.000000,11.430000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,0.000000,0> translate<66.802000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<62.230000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<62.738000,0.000000,11.430000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,0.000000,0> translate<62.230000,0.000000,11.430000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<63.246000,0.000000,12.065000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<63.246000,0.000000,10.795000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<66.294000,0.000000,10.795000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<66.294000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,12.065000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.992000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.246000,0.000000,12.319000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,12.319000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.246000,0.000000,12.319000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.627000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,12.319000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<63.500000,0.000000,12.319000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.246000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,10.541000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.246000,0.000000,10.541000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.627000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,10.541000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<63.500000,0.000000,10.541000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.913000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.040000,0.000000,12.319000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<65.913000,0.000000,12.192000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.913000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.627000,0.000000,12.192000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.627000,0.000000,12.192000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.913000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.040000,0.000000,10.541000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<65.913000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.913000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.627000,0.000000,10.668000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.627000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.294000,0.000000,12.319000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.040000,0.000000,12.319000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<66.040000,0.000000,12.319000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.294000,0.000000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.040000,0.000000,10.541000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<66.040000,0.000000,10.541000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.548000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.548000,0.000000,12.065000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<66.548000,0.000000,12.065000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<62.865000,0.000000,11.430000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<66.675000,0.000000,11.430000>}
//R15 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<20.320000,0.000000,53.086000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<20.320000,0.000000,52.578000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,-90.000000,0> translate<20.320000,0.000000,52.578000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<20.320000,0.000000,48.006000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<20.320000,0.000000,48.514000>}
box{<0,0,-0.254000><0.508000,0.036000,0.254000> rotate<0,90.000000,0> translate<20.320000,0.000000,48.514000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<19.685000,0.000000,49.022000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<20.955000,0.000000,49.022000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<20.955000,0.000000,52.070000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<19.685000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,48.768000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,48.768000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.685000,0.000000,48.768000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,49.276000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<19.431000,0.000000,49.276000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,49.403000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,49.276000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.431000,0.000000,49.276000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.209000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.209000,0.000000,49.276000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<21.209000,0.000000,49.276000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,49.403000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.209000,0.000000,49.276000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<21.082000,0.000000,49.403000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,51.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,51.816000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<19.431000,0.000000,51.816000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,51.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,49.403000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.558000,0.000000,49.403000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,51.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.209000,0.000000,51.816000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.082000,0.000000,51.689000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,51.689000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.082000,0.000000,49.403000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.082000,0.000000,49.403000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,51.816000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.431000,0.000000,51.816000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.209000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.209000,0.000000,51.816000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.209000,0.000000,51.816000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,52.324000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,52.324000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.685000,0.000000,52.324000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-90.000000,0> translate<20.320000,0.000000,48.641000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-90.000000,0> translate<20.320000,0.000000,52.451000>}
//SV2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.528000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.528000,0.000000,18.415000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.528000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.528000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,19.050000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-29.052687,0> translate<33.528000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,18.415000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,29.052687,0> translate<35.941000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.528000,0.000000,19.685000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,29.052687,0> translate<33.528000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.528000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.528000,0.000000,20.955000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.528000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.528000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,21.590000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-29.052687,0> translate<33.528000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,20.955000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,29.052687,0> translate<35.941000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,19.685000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.084000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,19.050000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-29.052687,0> translate<35.941000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,16.510000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.671000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.528000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,16.510000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,29.052687,0> translate<33.528000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,17.145000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-29.052687,0> translate<35.941000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,17.145000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.084000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.528000,0.000000,22.225000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,29.052687,0> translate<33.528000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.528000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.528000,0.000000,23.495000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.528000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.528000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,24.130000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-29.052687,0> translate<33.528000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,23.495000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,29.052687,0> translate<35.941000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,22.225000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.084000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,21.590000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-29.052687,0> translate<35.941000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.528000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.528000,0.000000,26.035000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.528000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.528000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,26.670000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-29.052687,0> translate<33.528000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,26.670000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.671000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,26.035000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,29.052687,0> translate<35.941000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.528000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,24.130000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,29.052687,0> translate<33.528000,0.000000,24.765000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,24.765000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-29.052687,0> translate<35.941000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,24.765000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.084000,0.000000,24.765000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<35.306000,0.000000,20.320000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<35.306000,0.000000,17.780000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<35.306000,0.000000,22.860000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<35.306000,0.000000,25.400000>}
//SWITCHES silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,23.495000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<58.928000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,22.860000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-29.052687,0> translate<57.785000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,22.860000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.515000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,23.495000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,29.052687,0> translate<55.372000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,22.225000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,29.052687,0> translate<57.785000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,20.955000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<58.928000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,20.320000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-29.052687,0> translate<57.785000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,20.320000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.515000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,20.955000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,29.052687,0> translate<55.372000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,22.225000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<55.372000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,22.860000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-29.052687,0> translate<55.372000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,27.305000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,29.052687,0> translate<57.785000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,26.035000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<58.928000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,25.400000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-29.052687,0> translate<57.785000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,25.400000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.515000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,26.035000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,29.052687,0> translate<55.372000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,27.305000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<55.372000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,27.940000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-29.052687,0> translate<55.372000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,25.400000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,29.052687,0> translate<57.785000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,24.765000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-29.052687,0> translate<55.372000,0.000000,24.765000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,24.765000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<55.372000,0.000000,24.765000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,31.115000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<58.928000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,30.480000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-29.052687,0> translate<57.785000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,30.480000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.515000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,31.115000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,29.052687,0> translate<55.372000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,29.845000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,29.052687,0> translate<57.785000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,28.575000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<58.928000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,27.940000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-29.052687,0> translate<57.785000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,27.940000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.515000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,28.575000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,29.052687,0> translate<55.372000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,29.845000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<55.372000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,30.480000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-29.052687,0> translate<55.372000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,33.020000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.515000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,33.020000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,29.052687,0> translate<57.785000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,32.385000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-29.052687,0> translate<55.372000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,32.385000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<55.372000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,18.415000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<58.928000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,17.780000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-29.052687,0> translate<57.785000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,17.780000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.515000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,18.415000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,29.052687,0> translate<55.372000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.928000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,20.320000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,29.052687,0> translate<57.785000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,19.685000>}
box{<0,0,-0.076200><1.307545,0.036000,0.076200> rotate<0,-29.052687,0> translate<55.372000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,19.685000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<55.372000,0.000000,19.685000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<57.150000,0.000000,21.590000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<57.150000,0.000000,24.130000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<57.150000,0.000000,26.670000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<57.150000,0.000000,29.210000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<57.150000,0.000000,31.750000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<57.150000,0.000000,19.050000>}
//T1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.497000,0.000000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.307000,0.000000,21.209000>}
box{<0,0,-0.063500><4.190000,0.036000,0.063500> rotate<0,0.000000,0> translate<39.307000,0.000000,21.209000> }
object{ARC(2.386400,0.127000,205.214158,334.785842,0.036000) translate<41.402000,0.000000,19.184700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.284000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.060000,0.000000,19.685000>}
box{<0,0,-0.063500><0.776000,0.036000,0.063500> rotate<0,0.000000,0> translate<42.284000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.744000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.520000,0.000000,19.685000>}
box{<0,0,-0.063500><0.776000,0.036000,0.063500> rotate<0,0.000000,0> translate<39.744000,0.000000,19.685000> }
//T2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.609000,0.000000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.419000,0.000000,24.257000>}
box{<0,0,-0.063500><4.190000,0.036000,0.063500> rotate<0,0.000000,0> translate<46.419000,0.000000,24.257000> }
object{ARC(2.386400,0.127000,205.214158,334.785842,0.036000) translate<48.514000,0.000000,22.232700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.396000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.172000,0.000000,22.733000>}
box{<0,0,-0.063500><0.776000,0.036000,0.063500> rotate<0,0.000000,0> translate<49.396000,0.000000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.856000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.632000,0.000000,22.733000>}
box{<0,0,-0.063500><0.776000,0.036000,0.063500> rotate<0,0.000000,0> translate<46.856000,0.000000,22.733000> }
//T3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.497000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.307000,0.000000,28.575000>}
box{<0,0,-0.063500><4.190000,0.036000,0.063500> rotate<0,0.000000,0> translate<39.307000,0.000000,28.575000> }
object{ARC(2.386400,0.127000,205.214158,334.785842,0.036000) translate<41.402000,0.000000,26.550700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.284000,0.000000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.060000,0.000000,27.051000>}
box{<0,0,-0.063500><0.776000,0.036000,0.063500> rotate<0,0.000000,0> translate<42.284000,0.000000,27.051000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.744000,0.000000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.520000,0.000000,27.051000>}
box{<0,0,-0.063500><0.776000,0.036000,0.063500> rotate<0,0.000000,0> translate<39.744000,0.000000,27.051000> }
//T4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.609000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.419000,0.000000,30.607000>}
box{<0,0,-0.063500><4.190000,0.036000,0.063500> rotate<0,0.000000,0> translate<46.419000,0.000000,30.607000> }
object{ARC(2.386400,0.127000,205.214158,334.785842,0.036000) translate<48.514000,0.000000,28.582700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.396000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.172000,0.000000,29.083000>}
box{<0,0,-0.063500><0.776000,0.036000,0.063500> rotate<0,0.000000,0> translate<49.396000,0.000000,29.083000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.856000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.632000,0.000000,29.083000>}
box{<0,0,-0.063500><0.776000,0.036000,0.063500> rotate<0,0.000000,0> translate<46.856000,0.000000,29.083000> }
//T5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.557000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.143000,0.000000,17.780000>}
box{<0,0,-0.076200><10.414000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.143000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.143000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.557000,0.000000,1.905000>}
box{<0,0,-0.076200><10.414000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.143000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.143000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.143000,0.000000,5.334000>}
box{<0,0,-0.076200><12.446000,0.036000,0.076200> rotate<0,-90.000000,0> translate<1.143000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.143000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.032000,0.000000,5.334000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.143000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.032000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.032000,0.000000,3.810000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<2.032000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.032000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.143000,0.000000,3.810000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.143000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.143000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.143000,0.000000,1.905000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,-90.000000,0> translate<1.143000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.557000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.557000,0.000000,5.334000>}
box{<0,0,-0.076200><12.446000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.557000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.557000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.668000,0.000000,5.334000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.668000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.668000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.668000,0.000000,3.810000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.668000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.668000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.557000,0.000000,3.810000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.668000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.557000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.557000,0.000000,1.905000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.557000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.922000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<1.778000,0.000000,17.145000>}
box{<0,0,-0.025400><9.144000,0.036000,0.025400> rotate<0,0.000000,0> translate<1.778000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<1.778000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<1.778000,0.000000,17.145000>}
box{<0,0,-0.025400><8.255000,0.036000,0.025400> rotate<0,90.000000,0> translate<1.778000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<1.778000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.922000,0.000000,8.890000>}
box{<0,0,-0.025400><9.144000,0.036000,0.025400> rotate<0,0.000000,0> translate<1.778000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.922000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.922000,0.000000,8.890000>}
box{<0,0,-0.025400><8.255000,0.036000,0.025400> rotate<0,-90.000000,0> translate<10.922000,0.000000,8.890000> }
difference{
cylinder{<6.350000,0,5.334000><6.350000,0.036000,5.334000>1.879600 translate<0,0.000000,0>}
cylinder{<6.350000,-0.1,5.334000><6.350000,0.135000,5.334000>1.727200 translate<0,0.000000,0>}}
box{<-0.635000,0,-1.397000><0.635000,0.036000,1.397000> rotate<0,-180.000000,0> translate<8.890000,0.000000,19.177000>}
box{<-0.635000,0,-1.397000><0.635000,0.036000,1.397000> rotate<0,-180.000000,0> translate<6.350000,0.000000,19.177000>}
box{<-0.635000,0,-1.397000><0.635000,0.036000,1.397000> rotate<0,-180.000000,0> translate<3.810000,0.000000,19.177000>}
//X1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.796000,0.000000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.876000,0.000000,8.509000>}
box{<0,0,-0.127000><5.080000,0.036000,0.127000> rotate<0,0.000000,0> translate<18.796000,0.000000,8.509000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.876000,0.000000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.876000,0.000000,7.112000>}
box{<0,0,-0.127000><1.397000,0.036000,0.127000> rotate<0,-90.000000,0> translate<23.876000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.876000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.876000,0.000000,2.159000>}
box{<0,0,-0.127000><4.953000,0.036000,0.127000> rotate<0,-90.000000,0> translate<23.876000,0.000000,2.159000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.876000,0.000000,2.159000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.796000,0.000000,2.159000>}
box{<0,0,-0.127000><5.080000,0.036000,0.127000> rotate<0,0.000000,0> translate<18.796000,0.000000,2.159000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.796000,0.000000,2.159000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.796000,0.000000,7.112000>}
box{<0,0,-0.127000><4.953000,0.036000,0.127000> rotate<0,90.000000,0> translate<18.796000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.796000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.796000,0.000000,8.509000>}
box{<0,0,-0.127000><1.397000,0.036000,0.127000> rotate<0,90.000000,0> translate<18.796000,0.000000,8.509000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.796000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.876000,0.000000,7.112000>}
box{<0,0,-0.127000><5.080000,0.036000,0.127000> rotate<0,0.000000,0> translate<18.796000,0.000000,7.112000> }
//X3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.130000,0.000000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.210000,0.000000,8.509000>}
box{<0,0,-0.127000><5.080000,0.036000,0.127000> rotate<0,0.000000,0> translate<24.130000,0.000000,8.509000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.210000,0.000000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.210000,0.000000,7.112000>}
box{<0,0,-0.127000><1.397000,0.036000,0.127000> rotate<0,-90.000000,0> translate<29.210000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.210000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.210000,0.000000,2.159000>}
box{<0,0,-0.127000><4.953000,0.036000,0.127000> rotate<0,-90.000000,0> translate<29.210000,0.000000,2.159000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.210000,0.000000,2.159000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.130000,0.000000,2.159000>}
box{<0,0,-0.127000><5.080000,0.036000,0.127000> rotate<0,0.000000,0> translate<24.130000,0.000000,2.159000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.130000,0.000000,2.159000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.130000,0.000000,7.112000>}
box{<0,0,-0.127000><4.953000,0.036000,0.127000> rotate<0,90.000000,0> translate<24.130000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.130000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.130000,0.000000,8.509000>}
box{<0,0,-0.127000><1.397000,0.036000,0.127000> rotate<0,90.000000,0> translate<24.130000,0.000000,8.509000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<24.130000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.210000,0.000000,7.112000>}
box{<0,0,-0.127000><5.080000,0.036000,0.127000> rotate<0,0.000000,0> translate<24.130000,0.000000,7.112000> }
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  MASTER_BOARD(-34.925000,0,-27.305000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//OUAZ-SS-105D		OUAZ-SS-105D
//X1	Strike	22-23-2021
//X3	12v In	22-23-2021
