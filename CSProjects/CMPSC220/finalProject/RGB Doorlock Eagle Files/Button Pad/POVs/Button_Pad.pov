//POVRay-File created by 3d41.ulp v20110101
//G:/CMPSC/RGB Doorlock Eagle Files/Sparkfun Button Pad/Boards/Button_Pad.brd
//11/19/2011 9:12:44 PM

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

#declare e3d_environment = on;

#local cam_x = 0;
#local cam_y = 321;
#local cam_z = -115;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -5;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 0;
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

#local lgt1_pos_x = 38;
#local lgt1_pos_y = 57;
#local lgt1_pos_z = 26;
#local lgt1_intense = 0.771719;
#local lgt2_pos_x = -38;
#local lgt2_pos_y = 57;
#local lgt2_pos_z = 26;
#local lgt2_intense = 0.771719;
#local lgt3_pos_x = 38;
#local lgt3_pos_y = 57;
#local lgt3_pos_z = -18;
#local lgt3_intense = 0.771719;
#local lgt4_pos_x = -38;
#local lgt4_pos_y = 57;
#local lgt4_pos_z = -18;
#local lgt4_intense = 0.771719;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 100.330000;
#declare pcb_y_size = 50.038000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(562);
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
	//translate<-50.165000,0,-25.019000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense shadowless}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense shadowless}
#end


#macro BUTTON_PAD(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
//Board
box{<100.508000,0,50.216000><0.178000,-1.500000,0.178000> texture{col_brd}}

//Holes(real)/Parts
cylinder{<37.754000,1,25.216000><37.754000,-5,25.216000>1.500000 texture{col_hls}}
cylinder{<25.254000,1,37.716000><25.254000,-5,37.716000>1.500000 texture{col_hls}}
cylinder{<12.754000,1,25.216000><12.754000,-5,25.216000>1.500000 texture{col_hls}}
cylinder{<25.254000,1,12.716000><25.254000,-5,12.716000>1.500000 texture{col_hls}}
cylinder{<47.754000,1,2.716000><47.754000,-5,2.716000>1.500000 texture{col_hls}}
cylinder{<47.754000,1,47.716000><47.754000,-5,47.716000>1.500000 texture{col_hls}}
cylinder{<2.754000,1,47.716000><2.754000,-5,47.716000>1.500000 texture{col_hls}}
cylinder{<2.754000,1,2.716000><2.754000,-5,2.716000>1.500000 texture{col_hls}}
cylinder{<87.754000,1,25.216000><87.754000,-5,25.216000>1.500000 texture{col_hls}}
cylinder{<75.254000,1,37.716000><75.254000,-5,37.716000>1.500000 texture{col_hls}}
cylinder{<62.754000,1,25.216000><62.754000,-5,25.216000>1.500000 texture{col_hls}}
cylinder{<75.254000,1,12.716000><75.254000,-5,12.716000>1.500000 texture{col_hls}}
cylinder{<97.754000,1,2.716000><97.754000,-5,2.716000>1.500000 texture{col_hls}}
cylinder{<97.754000,1,47.716000><97.754000,-5,47.716000>1.500000 texture{col_hls}}
cylinder{<52.754000,1,47.716000><52.754000,-5,47.716000>1.500000 texture{col_hls}}
cylinder{<52.754000,1,2.716000><52.754000,-5,2.716000>1.500000 texture{col_hls}}
//Holes(real)/Board
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<54.054000,0,25.146000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<48.054000,0,25.146000> texture{col_thl}}
#ifndef(global_pack_D2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<54.054000,0,7.366000> texture{col_thl}}
#ifndef(global_pack_D2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<48.054000,0,7.366000> texture{col_thl}}
#ifndef(global_pack_D5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<27.384000,0,25.146000> texture{col_thl}}
#ifndef(global_pack_D5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<21.384000,0,25.146000> texture{col_thl}}
#ifndef(global_pack_D6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<27.384000,0,7.366000> texture{col_thl}}
#ifndef(global_pack_D6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<21.384000,0,7.366000> texture{col_thl}}
#ifndef(global_pack_D9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<98.604000,0,25.266000> texture{col_thl}}
#ifndef(global_pack_D9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<92.604000,0,25.266000> texture{col_thl}}
#ifndef(global_pack_D10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<92.154000,0,2.286000> texture{col_thl}}
#ifndef(global_pack_D10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<86.154000,0,2.286000> texture{col_thl}}
#ifndef(global_pack_D13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<78.184000,0,25.146000> texture{col_thl}}
#ifndef(global_pack_D13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<72.184000,0,25.146000> texture{col_thl}}
#ifndef(global_pack_D14) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<78.184000,0,7.366000> texture{col_thl}}
#ifndef(global_pack_D14) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<72.184000,0,7.366000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<3.429000,0,30.226000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<3.429000,0,32.766000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<3.429000,0,35.306000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<3.429000,0,37.846000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<3.429000,0,12.446000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<3.429000,0,14.986000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<3.429000,0,17.526000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<3.429000,0,20.066000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,0+global_tmp,0) rotate<0,-0.000000,0>translate<25.654000,0,46.736000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<28.194000,0,46.736000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,0+global_tmp,0) rotate<0,-0.000000,0>translate<20.574000,0,46.736000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<23.114000,0,46.736000> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,0+global_tmp,0) rotate<0,-0.000000,0>translate<76.454000,0,46.736000> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<78.994000,0,46.736000> texture{col_thl}}
#ifndef(global_pack_JP8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,0+global_tmp,0) rotate<0,-0.000000,0>translate<71.374000,0,46.736000> texture{col_thl}}
#ifndef(global_pack_JP8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<73.914000,0,46.736000> texture{col_thl}}
#ifndef(global_pack_P3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<36.754000,0,12.716000> texture{col_thl}}
#ifndef(global_pack_P3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<11.754000,0,12.716000> texture{col_thl}}
#ifndef(global_pack_P3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<36.754000,0,37.716000> texture{col_thl}}
#ifndef(global_pack_P3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<11.754000,0,37.716000> texture{col_thl}}
#ifndef(global_pack_P3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<38.754000,0,12.716000> texture{col_thl}}
#ifndef(global_pack_P3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<13.754000,0,12.716000> texture{col_thl}}
#ifndef(global_pack_P3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<38.754000,0,37.716000> texture{col_thl}}
#ifndef(global_pack_P3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<13.754000,0,37.716000> texture{col_thl}}
#ifndef(global_pack_P3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<34.754000,0,12.716000> texture{col_thl}}
#ifndef(global_pack_P3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<9.754000,0,12.716000> texture{col_thl}}
#ifndef(global_pack_P3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<34.754000,0,37.716000> texture{col_thl}}
#ifndef(global_pack_P3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<9.754000,0,37.716000> texture{col_thl}}
#ifndef(global_pack_P3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<40.754000,0,12.716000> texture{col_thl}}
#ifndef(global_pack_P3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<15.754000,0,12.716000> texture{col_thl}}
#ifndef(global_pack_P3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<40.754000,0,37.716000> texture{col_thl}}
#ifndef(global_pack_P3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<15.754000,0,37.716000> texture{col_thl}}
#ifndef(global_pack_P3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<44.966000,0,15.729000> texture{col_thl}}
#ifndef(global_pack_P3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<42.426000,0,13.697000> texture{col_thl}}
#ifndef(global_pack_P3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<19.966000,0,15.729000> texture{col_thl}}
#ifndef(global_pack_P3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<17.426000,0,13.697000> texture{col_thl}}
#ifndef(global_pack_P3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<44.966000,0,40.729000> texture{col_thl}}
#ifndef(global_pack_P3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<42.426000,0,38.697000> texture{col_thl}}
#ifndef(global_pack_P3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<19.966000,0,40.729000> texture{col_thl}}
#ifndef(global_pack_P3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<17.426000,0,38.697000> texture{col_thl}}
#ifndef(global_pack_P4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<86.754000,0,12.716000> texture{col_thl}}
#ifndef(global_pack_P4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<61.754000,0,12.716000> texture{col_thl}}
#ifndef(global_pack_P4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<86.754000,0,37.716000> texture{col_thl}}
#ifndef(global_pack_P4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<61.754000,0,37.716000> texture{col_thl}}
#ifndef(global_pack_P4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<88.754000,0,12.716000> texture{col_thl}}
#ifndef(global_pack_P4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<63.754000,0,12.716000> texture{col_thl}}
#ifndef(global_pack_P4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<88.754000,0,37.716000> texture{col_thl}}
#ifndef(global_pack_P4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<63.754000,0,37.716000> texture{col_thl}}
#ifndef(global_pack_P4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<84.754000,0,12.716000> texture{col_thl}}
#ifndef(global_pack_P4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<59.754000,0,12.716000> texture{col_thl}}
#ifndef(global_pack_P4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<84.754000,0,37.716000> texture{col_thl}}
#ifndef(global_pack_P4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<59.754000,0,37.716000> texture{col_thl}}
#ifndef(global_pack_P4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<90.754000,0,12.716000> texture{col_thl}}
#ifndef(global_pack_P4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<65.754000,0,12.716000> texture{col_thl}}
#ifndef(global_pack_P4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<90.754000,0,37.716000> texture{col_thl}}
#ifndef(global_pack_P4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<65.754000,0,37.716000> texture{col_thl}}
#ifndef(global_pack_P4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<94.966000,0,15.729000> texture{col_thl}}
#ifndef(global_pack_P4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<92.426000,0,13.697000> texture{col_thl}}
#ifndef(global_pack_P4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<69.966000,0,15.729000> texture{col_thl}}
#ifndef(global_pack_P4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<67.426000,0,13.697000> texture{col_thl}}
#ifndef(global_pack_P4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<94.966000,0,40.729000> texture{col_thl}}
#ifndef(global_pack_P4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<92.426000,0,38.697000> texture{col_thl}}
#ifndef(global_pack_P4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<69.966000,0,40.729000> texture{col_thl}}
#ifndef(global_pack_P4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.108000,0.600000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<67.426000,0,38.697000> texture{col_thl}}
//Pads/Vias
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<34.544000,0,46.736000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<61.214000,0,46.736000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<85.344000,0,46.736000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<11.684000,0,46.736000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<35.814000,0,21.336000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<61.214000,0,21.336000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<85.344000,0,21.336000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<32.004000,0,46.736000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<58.674000,0,46.736000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<9.144000,0,46.736000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<82.804000,0,46.736000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<81.534000,0,22.606000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<57.404000,0,22.606000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<32.004000,0,22.606000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<43.434000,0,27.686000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<42.418000,0,4.953000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<17.399000,0,27.559000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<17.399000,0,5.207000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<67.564000,0,27.686000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<67.437000,0,4.826000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<16.764000,0,25.146000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<42.164000,0,25.146000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<66.294000,0,25.146000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<90.805000,0,27.686000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<66.040000,0,0.254000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<41.402000,0,0.254000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<16.002000,0,0.254000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<90.043000,0,0.254000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<44.704000,0,28.956000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<19.939000,0,28.956000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<70.104000,0,28.956000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<94.996000,0,28.956000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<20.066000,0,3.556000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<43.434000,0,3.556000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<69.977000,0,3.556000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<94.234000,0,3.556000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,1,0) translate<90.424000,0,48.006000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.524000,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.524000,-1.535000,13.208000>}
box{<0,0,-0.152400><3.302000,0.035000,0.152400> rotate<0,90.000000,0> translate<1.524000,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.524000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.524000,-1.535000,30.861000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,90.000000,0> translate<1.524000,-1.535000,30.861000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.778000,0.000000,17.399000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.778000,0.000000,18.923000>}
box{<0,0,-0.152400><1.524000,0.035000,0.152400> rotate<0,90.000000,0> translate<1.778000,0.000000,18.923000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.524000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.794000,-1.535000,27.686000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<1.524000,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.778000,0.000000,17.399000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.921000,0.000000,16.256000>}
box{<0,0,-0.152400><1.616446,0.035000,0.152400> rotate<0,44.997030,0> translate<1.778000,0.000000,17.399000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.778000,0.000000,18.923000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.048000,0.000000,20.193000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<1.778000,0.000000,18.923000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.048000,0.000000,20.193000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.175000,0.000000,20.066000>}
box{<0,0,-0.152400><0.179605,0.035000,0.152400> rotate<0,44.997030,0> translate<3.048000,0.000000,20.193000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.524000,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.302000,-1.535000,14.986000>}
box{<0,0,-0.152400><2.514472,0.035000,0.152400> rotate<0,-44.997030,0> translate<1.524000,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.429000,-1.535000,10.541000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.429000,-1.535000,12.446000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,90.000000,0> translate<3.429000,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.302000,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.429000,-1.535000,14.986000>}
box{<0,0,-0.152400><0.127000,0.035000,0.152400> rotate<0,0.000000,0> translate<3.302000,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.175000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.429000,0.000000,20.066000>}
box{<0,0,-0.152400><0.254000,0.035000,0.152400> rotate<0,0.000000,0> translate<3.175000,0.000000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.429000,-1.535000,20.066000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.429000,-1.535000,20.193000>}
box{<0,0,-0.152400><0.127000,0.035000,0.152400> rotate<0,90.000000,0> translate<3.429000,-1.535000,20.193000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.524000,-1.535000,30.861000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.429000,-1.535000,32.766000>}
box{<0,0,-0.152400><2.694077,0.035000,0.152400> rotate<0,-44.997030,0> translate<1.524000,-1.535000,30.861000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.429000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.556000,0.000000,35.179000>}
box{<0,0,-0.152400><0.179605,0.035000,0.152400> rotate<0,44.997030,0> translate<3.429000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.429000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.559000,0.000000,37.716000>}
box{<0,0,-0.152400><0.183848,0.035000,0.152400> rotate<0,44.997030,0> translate<3.429000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.921000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.334000,0.000000,16.256000>}
box{<0,0,-0.152400><2.413000,0.035000,0.152400> rotate<0,0.000000,0> translate<2.921000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.429000,-1.535000,20.193000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.842000,-1.535000,22.606000>}
box{<0,0,-0.152400><3.412497,0.035000,0.152400> rotate<0,-44.997030,0> translate<3.429000,-1.535000,20.193000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.429000,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.239000,-1.535000,21.336000>}
box{<0,0,-0.152400><5.388154,0.035000,0.152400> rotate<0,-44.997030,0> translate<3.429000,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.429000,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.874000,-1.535000,30.226000>}
box{<0,0,-0.152400><4.445000,0.035000,0.152400> rotate<0,0.000000,0> translate<3.429000,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.429000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.001000,0.000000,17.526000>}
box{<0,0,-0.152400><4.572000,0.035000,0.152400> rotate<0,0.000000,0> translate<3.429000,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.334000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.874000,0.000000,12.716000>}
box{<0,0,-0.152400><5.006316,0.035000,0.152400> rotate<0,44.997030,0> translate<5.334000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.874000,-1.535000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.144000,-1.535000,28.956000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<7.874000,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.874000,0.000000,12.716000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.754000,0.000000,12.716000>}
box{<0,0,-0.152400><0.880000,0.035000,0.152400> rotate<0,0.000000,0> translate<8.874000,0.000000,12.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.559000,0.000000,37.716000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.754000,0.000000,37.716000>}
box{<0,0,-0.152400><6.195000,0.035000,0.152400> rotate<0,0.000000,0> translate<3.559000,0.000000,37.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.144000,0.000000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.754000,0.000000,46.126000>}
box{<0,0,-0.152400><0.862670,0.035000,0.152400> rotate<0,44.997030,0> translate<9.144000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.754000,0.000000,37.716000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.754000,0.000000,46.126000>}
box{<0,0,-0.152400><8.410000,0.035000,0.152400> rotate<0,90.000000,0> translate<9.754000,0.000000,46.126000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.556000,0.000000,35.179000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.160000,0.000000,35.179000>}
box{<0,0,-0.152400><6.604000,0.035000,0.152400> rotate<0,0.000000,0> translate<3.556000,0.000000,35.179000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.429000,-1.535000,10.541000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.414000,-1.535000,3.556000>}
box{<0,0,-0.152400><9.878282,0.035000,0.152400> rotate<0,44.997030,0> translate<3.429000,-1.535000,10.541000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.414000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.414000,0.000000,29.210000>}
box{<0,0,-0.152400><6.604000,0.035000,0.152400> rotate<0,90.000000,0> translate<10.414000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.144000,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.414000,-1.535000,48.006000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<9.144000,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.524000,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.176000,-1.535000,0.254000>}
box{<0,0,-0.152400><13.649989,0.035000,0.152400> rotate<0,44.997030,0> translate<1.524000,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.684000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.684000,0.000000,46.736000>}
box{<0,0,-0.152400><8.890000,0.035000,0.152400> rotate<0,90.000000,0> translate<11.684000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.754000,0.000000,13.773000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.754000,0.000000,12.716000>}
box{<0,0,-0.152400><1.057000,0.035000,0.152400> rotate<0,-90.000000,0> translate<11.754000,0.000000,12.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.001000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.754000,0.000000,13.773000>}
box{<0,0,-0.152400><5.307543,0.035000,0.152400> rotate<0,44.997030,0> translate<8.001000,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.160000,0.000000,35.179000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.754000,0.000000,36.773000>}
box{<0,0,-0.152400><2.254256,0.035000,0.152400> rotate<0,-44.997030,0> translate<10.160000,0.000000,35.179000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.754000,0.000000,36.773000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.754000,0.000000,37.716000>}
box{<0,0,-0.152400><0.943000,0.035000,0.152400> rotate<0,90.000000,0> translate<11.754000,0.000000,37.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.684000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.754000,0.000000,37.776000>}
box{<0,0,-0.152400><0.098995,0.035000,0.152400> rotate<0,44.997030,0> translate<11.684000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.754000,0.000000,37.716000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.754000,0.000000,37.776000>}
box{<0,0,-0.152400><0.060000,0.035000,0.152400> rotate<0,90.000000,0> translate<11.754000,0.000000,37.776000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.414000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.716000,0.000000,32.512000>}
box{<0,0,-0.152400><4.669733,0.035000,0.152400> rotate<0,-44.997030,0> translate<10.414000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.716000,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.716000,0.000000,37.338000>}
box{<0,0,-0.152400><4.826000,0.035000,0.152400> rotate<0,90.000000,0> translate<13.716000,0.000000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.716000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.732000,0.000000,12.716000>}
box{<0,0,-0.152400><0.022627,0.035000,0.152400> rotate<0,-44.997030,0> translate<13.716000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.716000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.754000,0.000000,12.662000>}
box{<0,0,-0.152400><0.053740,0.035000,0.152400> rotate<0,44.997030,0> translate<13.716000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.732000,0.000000,12.716000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.754000,0.000000,12.716000>}
box{<0,0,-0.152400><0.022000,0.035000,0.152400> rotate<0,0.000000,0> translate<13.732000,0.000000,12.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.414000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.754000,0.000000,19.266000>}
box{<0,0,-0.152400><4.723473,0.035000,0.152400> rotate<0,44.997030,0> translate<10.414000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.754000,0.000000,12.716000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.754000,0.000000,19.266000>}
box{<0,0,-0.152400><6.550000,0.035000,0.152400> rotate<0,90.000000,0> translate<13.754000,0.000000,19.266000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.754000,0.000000,37.716000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.754000,0.000000,39.916000>}
box{<0,0,-0.152400><2.200000,0.035000,0.152400> rotate<0,90.000000,0> translate<13.754000,0.000000,39.916000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.754000,0.000000,37.716000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.846000,0.000000,37.716000>}
box{<0,0,-0.152400><0.092000,0.035000,0.152400> rotate<0,0.000000,0> translate<13.754000,0.000000,37.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.716000,0.000000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.970000,0.000000,37.592000>}
box{<0,0,-0.152400><0.359210,0.035000,0.152400> rotate<0,-44.997030,0> translate<13.716000,0.000000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.846000,0.000000,37.716000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.970000,0.000000,37.592000>}
box{<0,0,-0.152400><0.175362,0.035000,0.152400> rotate<0,44.997030,0> translate<13.846000,0.000000,37.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.794000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.224000,-1.535000,27.686000>}
box{<0,0,-0.152400><11.430000,0.035000,0.152400> rotate<0,0.000000,0> translate<2.794000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.754000,0.000000,0.629000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.754000,0.000000,12.716000>}
box{<0,0,-0.152400><12.087000,0.035000,0.152400> rotate<0,90.000000,0> translate<15.754000,0.000000,12.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.754000,0.000000,26.156000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.754000,0.000000,37.716000>}
box{<0,0,-0.152400><11.560000,0.035000,0.152400> rotate<0,90.000000,0> translate<15.754000,0.000000,37.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.176000,-1.535000,0.254000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.002000,-1.535000,0.254000>}
box{<0,0,-0.152400><4.826000,0.035000,0.152400> rotate<0,0.000000,0> translate<11.176000,-1.535000,0.254000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.754000,0.000000,0.629000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.002000,0.000000,0.381000>}
box{<0,0,-0.152400><0.350725,0.035000,0.152400> rotate<0,44.997030,0> translate<15.754000,0.000000,0.629000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.002000,0.000000,0.254000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.002000,0.000000,0.381000>}
box{<0,0,-0.152400><0.127000,0.035000,0.152400> rotate<0,90.000000,0> translate<16.002000,0.000000,0.381000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.224000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.764000,-1.535000,25.146000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,44.997030,0> translate<14.224000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.754000,0.000000,26.156000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.764000,0.000000,25.146000>}
box{<0,0,-0.152400><1.428356,0.035000,0.152400> rotate<0,44.997030,0> translate<15.754000,0.000000,26.156000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.684000,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.764000,-1.535000,46.736000>}
box{<0,0,-0.152400><5.080000,0.035000,0.152400> rotate<0,0.000000,0> translate<11.684000,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.399000,0.000000,5.207000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.399000,0.000000,13.716000>}
box{<0,0,-0.152400><8.509000,0.035000,0.152400> rotate<0,90.000000,0> translate<17.399000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.399000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.399000,0.000000,38.608000>}
box{<0,0,-0.152400><11.049000,0.035000,0.152400> rotate<0,90.000000,0> translate<17.399000,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.399000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.418000,0.000000,13.697000>}
box{<0,0,-0.152400><0.026870,0.035000,0.152400> rotate<0,44.997030,0> translate<17.399000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.418000,0.000000,13.697000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.426000,0.000000,13.697000>}
box{<0,0,-0.152400><0.008000,0.035000,0.152400> rotate<0,0.000000,0> translate<17.418000,0.000000,13.697000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.399000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.426000,0.000000,38.635000>}
box{<0,0,-0.152400><0.038184,0.035000,0.152400> rotate<0,-44.997030,0> translate<17.399000,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.426000,0.000000,38.635000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.426000,0.000000,38.697000>}
box{<0,0,-0.152400><0.062000,0.035000,0.152400> rotate<0,90.000000,0> translate<17.426000,0.000000,38.697000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.399000,-1.535000,27.559000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.526000,-1.535000,27.432000>}
box{<0,0,-0.152400><0.179605,0.035000,0.152400> rotate<0,44.997030,0> translate<17.399000,-1.535000,27.559000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.526000,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,-1.535000,27.686000>}
box{<0,0,-0.152400><0.359210,0.035000,0.152400> rotate<0,-44.997030,0> translate<17.526000,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.764000,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.034000,-1.535000,23.876000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<16.764000,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.764000,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.034000,-1.535000,45.466000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<16.764000,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.144000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.939000,-1.535000,28.956000>}
box{<0,0,-0.152400><10.795000,0.035000,0.152400> rotate<0,0.000000,0> translate<9.144000,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.939000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.939000,0.000000,40.640000>}
box{<0,0,-0.152400><11.684000,0.035000,0.152400> rotate<0,90.000000,0> translate<19.939000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.966000,0.000000,4.164000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.966000,0.000000,15.729000>}
box{<0,0,-0.152400><11.565000,0.035000,0.152400> rotate<0,90.000000,0> translate<19.966000,0.000000,15.729000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.939000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.966000,0.000000,40.667000>}
box{<0,0,-0.152400><0.038184,0.035000,0.152400> rotate<0,-44.997030,0> translate<19.939000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.966000,0.000000,40.667000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.966000,0.000000,40.729000>}
box{<0,0,-0.152400><0.062000,0.035000,0.152400> rotate<0,90.000000,0> translate<19.966000,0.000000,40.729000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.414000,-1.535000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.066000,-1.535000,3.556000>}
box{<0,0,-0.152400><9.652000,0.035000,0.152400> rotate<0,0.000000,0> translate<10.414000,-1.535000,3.556000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.966000,0.000000,4.164000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.066000,0.000000,3.556000>}
box{<0,0,-0.152400><0.616169,0.035000,0.152400> rotate<0,80.654651,0> translate<19.966000,0.000000,4.164000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.754000,0.000000,39.916000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.574000,0.000000,46.736000>}
box{<0,0,-0.152400><9.644936,0.035000,0.152400> rotate<0,-44.997030,0> translate<13.754000,0.000000,39.916000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.336000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.384000,0.000000,7.318000>}
box{<0,0,-0.152400><0.067882,0.035000,0.152400> rotate<0,44.997030,0> translate<21.336000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.336000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.384000,0.000000,7.366000>}
box{<0,0,-0.152400><0.048000,0.035000,0.152400> rotate<0,0.000000,0> translate<21.336000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.336000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.384000,0.000000,7.414000>}
box{<0,0,-0.152400><0.067882,0.035000,0.152400> rotate<0,-44.997030,0> translate<21.336000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.384000,0.000000,7.414000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.384000,0.000000,25.146000>}
box{<0,0,-0.152400><17.732000,0.035000,0.152400> rotate<0,90.000000,0> translate<21.384000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.384000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.384000,0.000000,42.466000>}
box{<0,0,-0.152400><17.320000,0.035000,0.152400> rotate<0,90.000000,0> translate<21.384000,0.000000,42.466000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.384000,0.000000,42.466000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.114000,0.000000,44.196000>}
box{<0,0,-0.152400><2.446589,0.035000,0.152400> rotate<0,-44.997030,0> translate<21.384000,0.000000,42.466000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.114000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.114000,0.000000,46.736000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,90.000000,0> translate<23.114000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.654000,-1.535000,27.686000>}
box{<0,0,-0.152400><7.874000,0.035000,0.152400> rotate<0,0.000000,0> translate<17.780000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.654000,0.000000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.654000,0.000000,46.736000>}
box{<0,0,-0.152400><5.080000,0.035000,0.152400> rotate<0,90.000000,0> translate<25.654000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.399000,-1.535000,5.207000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.781000,-1.535000,5.207000>}
box{<0,0,-0.152400><8.382000,0.035000,0.152400> rotate<0,0.000000,0> translate<17.399000,-1.535000,5.207000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.781000,-1.535000,5.207000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.384000,-1.535000,6.810000>}
box{<0,0,-0.152400><2.266984,0.035000,0.152400> rotate<0,-44.997030,0> translate<25.781000,-1.535000,5.207000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.384000,-1.535000,6.810000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.384000,-1.535000,7.366000>}
box{<0,0,-0.152400><0.556000,0.035000,0.152400> rotate<0,90.000000,0> translate<27.384000,-1.535000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.384000,-1.535000,25.956000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.384000,-1.535000,25.146000>}
box{<0,0,-0.152400><0.810000,0.035000,0.152400> rotate<0,-90.000000,0> translate<27.384000,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.654000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.384000,-1.535000,25.956000>}
box{<0,0,-0.152400><2.446589,0.035000,0.152400> rotate<0,44.997030,0> translate<25.654000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.194000,0.000000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.464000,0.000000,48.006000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<28.194000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.034000,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.734000,-1.535000,23.876000>}
box{<0,0,-0.152400><12.700000,0.035000,0.152400> rotate<0,0.000000,0> translate<18.034000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.414000,-1.535000,48.006000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.734000,-1.535000,48.006000>}
box{<0,0,-0.152400><20.320000,0.035000,0.152400> rotate<0,0.000000,0> translate<10.414000,-1.535000,48.006000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.842000,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.004000,-1.535000,22.606000>}
box{<0,0,-0.152400><26.162000,0.035000,0.152400> rotate<0,0.000000,0> translate<5.842000,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.034000,-1.535000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.004000,-1.535000,45.466000>}
box{<0,0,-0.152400><13.970000,0.035000,0.152400> rotate<0,0.000000,0> translate<18.034000,-1.535000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.734000,-1.535000,48.006000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.004000,-1.535000,46.736000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<30.734000,-1.535000,48.006000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.004000,-1.535000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.274000,-1.535000,46.736000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<32.004000,-1.535000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.004000,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.274000,-1.535000,48.006000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<32.004000,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.734000,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.544000,-1.535000,27.686000>}
box{<0,0,-0.152400><5.388154,0.035000,0.152400> rotate<0,-44.997030,0> translate<30.734000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.544000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.544000,0.000000,27.686000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,90.000000,0> translate<34.544000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.274000,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.544000,-1.535000,46.736000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<33.274000,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.754000,0.000000,19.856000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.754000,0.000000,12.716000>}
box{<0,0,-0.152400><7.140000,0.035000,0.152400> rotate<0,-90.000000,0> translate<34.754000,0.000000,12.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.004000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.754000,0.000000,19.856000>}
box{<0,0,-0.152400><3.889087,0.035000,0.152400> rotate<0,44.997030,0> translate<32.004000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.754000,0.000000,43.986000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.754000,0.000000,37.716000>}
box{<0,0,-0.152400><6.270000,0.035000,0.152400> rotate<0,-90.000000,0> translate<34.754000,0.000000,37.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.004000,0.000000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.754000,0.000000,43.986000>}
box{<0,0,-0.152400><3.889087,0.035000,0.152400> rotate<0,44.997030,0> translate<32.004000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.239000,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.814000,-1.535000,21.336000>}
box{<0,0,-0.152400><28.575000,0.035000,0.152400> rotate<0,0.000000,0> translate<7.239000,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.754000,0.000000,20.396000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.754000,0.000000,12.716000>}
box{<0,0,-0.152400><7.680000,0.035000,0.152400> rotate<0,-90.000000,0> translate<36.754000,0.000000,12.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.814000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.754000,0.000000,20.396000>}
box{<0,0,-0.152400><1.329361,0.035000,0.152400> rotate<0,44.997030,0> translate<35.814000,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.754000,0.000000,44.526000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.754000,0.000000,37.716000>}
box{<0,0,-0.152400><6.810000,0.035000,0.152400> rotate<0,-90.000000,0> translate<36.754000,0.000000,37.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.544000,0.000000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.754000,0.000000,44.526000>}
box{<0,0,-0.152400><3.125412,0.035000,0.152400> rotate<0,44.997030,0> translate<34.544000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.654000,0.000000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.084000,0.000000,30.226000>}
box{<0,0,-0.152400><16.164461,0.035000,0.152400> rotate<0,44.997030,0> translate<25.654000,0.000000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.544000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.084000,0.000000,30.226000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,-44.997030,0> translate<34.544000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.084000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.608000,0.000000,31.750000>}
box{<0,0,-0.152400><2.155261,0.035000,0.152400> rotate<0,-44.997030,0> translate<37.084000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.608000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.608000,0.000000,37.465000>}
box{<0,0,-0.152400><5.715000,0.035000,0.152400> rotate<0,90.000000,0> translate<38.608000,0.000000,37.465000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.735000,0.000000,12.827000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.754000,0.000000,12.808000>}
box{<0,0,-0.152400><0.026870,0.035000,0.152400> rotate<0,44.997030,0> translate<38.735000,0.000000,12.827000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.754000,0.000000,12.716000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.754000,0.000000,12.808000>}
box{<0,0,-0.152400><0.092000,0.035000,0.152400> rotate<0,90.000000,0> translate<38.754000,0.000000,12.808000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.544000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.754000,0.000000,19.666000>}
box{<0,0,-0.152400><5.953839,0.035000,0.152400> rotate<0,44.997030,0> translate<34.544000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.754000,0.000000,12.808000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.754000,0.000000,19.666000>}
box{<0,0,-0.152400><6.858000,0.035000,0.152400> rotate<0,90.000000,0> translate<38.754000,0.000000,19.666000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.608000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.754000,0.000000,37.611000>}
box{<0,0,-0.152400><0.206475,0.035000,0.152400> rotate<0,-44.997030,0> translate<38.608000,0.000000,37.465000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.754000,0.000000,37.611000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.754000,0.000000,37.716000>}
box{<0,0,-0.152400><0.105000,0.035000,0.152400> rotate<0,90.000000,0> translate<38.754000,0.000000,37.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.544000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.624000,-1.535000,27.686000>}
box{<0,0,-0.152400><5.080000,0.035000,0.152400> rotate<0,0.000000,0> translate<34.544000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.754000,0.000000,0.902000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.754000,0.000000,12.716000>}
box{<0,0,-0.152400><11.814000,0.035000,0.152400> rotate<0,90.000000,0> translate<40.754000,0.000000,12.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.754000,0.000000,26.556000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.754000,0.000000,37.716000>}
box{<0,0,-0.152400><11.160000,0.035000,0.152400> rotate<0,90.000000,0> translate<40.754000,0.000000,37.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.464000,0.000000,48.006000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.894000,0.000000,48.006000>}
box{<0,0,-0.152400><11.430000,0.035000,0.152400> rotate<0,0.000000,0> translate<29.464000,0.000000,48.006000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.002000,-1.535000,0.254000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.402000,-1.535000,0.254000>}
box{<0,0,-0.152400><25.400000,0.035000,0.152400> rotate<0,0.000000,0> translate<16.002000,-1.535000,0.254000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.754000,0.000000,0.902000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.402000,0.000000,0.254000>}
box{<0,0,-0.152400><0.916410,0.035000,0.152400> rotate<0,44.997030,0> translate<40.754000,0.000000,0.902000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.624000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.164000,-1.535000,25.146000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,44.997030,0> translate<39.624000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.754000,0.000000,26.556000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.164000,0.000000,25.146000>}
box{<0,0,-0.152400><1.994041,0.035000,0.152400> rotate<0,44.997030,0> translate<40.754000,0.000000,26.556000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.544000,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.164000,-1.535000,46.736000>}
box{<0,0,-0.152400><7.620000,0.035000,0.152400> rotate<0,0.000000,0> translate<34.544000,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.418000,-1.535000,4.953000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.418000,-1.535000,5.080000>}
box{<0,0,-0.152400><0.127000,0.035000,0.152400> rotate<0,90.000000,0> translate<42.418000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.418000,0.000000,4.953000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.418000,0.000000,13.716000>}
box{<0,0,-0.152400><8.763000,0.035000,0.152400> rotate<0,90.000000,0> translate<42.418000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.426000,0.000000,13.708000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.426000,0.000000,13.697000>}
box{<0,0,-0.152400><0.011000,0.035000,0.152400> rotate<0,-90.000000,0> translate<42.426000,0.000000,13.697000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.418000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.426000,0.000000,13.708000>}
box{<0,0,-0.152400><0.011314,0.035000,0.152400> rotate<0,44.997030,0> translate<42.418000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.426000,0.000000,28.694000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.426000,0.000000,38.697000>}
box{<0,0,-0.152400><10.003000,0.035000,0.152400> rotate<0,90.000000,0> translate<42.426000,0.000000,38.697000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.066000,-1.535000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.434000,-1.535000,3.556000>}
box{<0,0,-0.406400><23.368000,0.035000,0.406400> rotate<0,0.000000,0> translate<20.066000,-1.535000,3.556000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.164000,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.434000,-1.535000,23.876000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<42.164000,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.426000,0.000000,28.694000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.434000,0.000000,27.686000>}
box{<0,0,-0.152400><1.425527,0.035000,0.152400> rotate<0,44.997030,0> translate<42.426000,0.000000,28.694000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.274000,-1.535000,48.006000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.434000,-1.535000,48.006000>}
box{<0,0,-0.152400><10.160000,0.035000,0.152400> rotate<0,0.000000,0> translate<33.274000,-1.535000,48.006000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.939000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.704000,-1.535000,28.956000>}
box{<0,0,-0.152400><24.765000,0.035000,0.152400> rotate<0,0.000000,0> translate<19.939000,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.164000,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.704000,-1.535000,44.196000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,44.997030,0> translate<42.164000,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.434000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.966000,0.000000,5.088000>}
box{<0,0,-0.152400><2.166575,0.035000,0.152400> rotate<0,-44.997030,0> translate<43.434000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.966000,0.000000,5.088000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.966000,0.000000,15.729000>}
box{<0,0,-0.152400><10.641000,0.035000,0.152400> rotate<0,90.000000,0> translate<44.966000,0.000000,15.729000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.704000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.966000,0.000000,29.218000>}
box{<0,0,-0.152400><0.370524,0.035000,0.152400> rotate<0,-44.997030,0> translate<44.704000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.966000,0.000000,29.218000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.966000,0.000000,40.729000>}
box{<0,0,-0.152400><11.511000,0.035000,0.152400> rotate<0,90.000000,0> translate<44.966000,0.000000,40.729000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.434000,-1.535000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.466000,-1.535000,5.588000>}
box{<0,0,-0.152400><2.873682,0.035000,0.152400> rotate<0,-44.997030,0> translate<43.434000,-1.535000,3.556000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.418000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.974000,-1.535000,8.636000>}
box{<0,0,-0.152400><5.028943,0.035000,0.152400> rotate<0,-44.997030,0> translate<42.418000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.434000,-1.535000,48.006000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.974000,-1.535000,45.466000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,44.997030,0> translate<43.434000,-1.535000,48.006000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.894000,0.000000,48.006000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.006000,0.000000,40.894000>}
box{<0,0,-0.152400><10.057887,0.035000,0.152400> rotate<0,44.997030,0> translate<40.894000,0.000000,48.006000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.006000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.006000,0.000000,40.894000>}
box{<0,0,-0.152400><15.748000,0.035000,0.152400> rotate<0,90.000000,0> translate<48.006000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.054000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.054000,0.000000,7.160000>}
box{<0,0,-0.152400><0.206000,0.035000,0.152400> rotate<0,-90.000000,0> translate<48.054000,0.000000,7.160000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.006000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.054000,0.000000,25.098000>}
box{<0,0,-0.152400><0.067882,0.035000,0.152400> rotate<0,44.997030,0> translate<48.006000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.054000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.054000,0.000000,25.098000>}
box{<0,0,-0.152400><17.732000,0.035000,0.152400> rotate<0,90.000000,0> translate<48.054000,0.000000,25.098000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.006000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.054000,0.000000,25.146000>}
box{<0,0,-0.152400><0.048000,0.035000,0.152400> rotate<0,0.000000,0> translate<48.006000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.434000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.070000,-1.535000,27.686000>}
box{<0,0,-0.152400><8.636000,0.035000,0.152400> rotate<0,0.000000,0> translate<43.434000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.974000,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.832000,-1.535000,8.636000>}
box{<0,0,-0.152400><6.858000,0.035000,0.152400> rotate<0,0.000000,0> translate<45.974000,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.070000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.004000,-1.535000,25.752000>}
box{<0,0,-0.152400><2.735089,0.035000,0.152400> rotate<0,44.997030,0> translate<52.070000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.004000,-1.535000,25.752000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.054000,-1.535000,25.146000>}
box{<0,0,-0.152400><0.608059,0.035000,0.152400> rotate<0,85.277681,0> translate<54.004000,-1.535000,25.752000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.466000,-1.535000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.102000,-1.535000,5.588000>}
box{<0,0,-0.152400><8.636000,0.035000,0.152400> rotate<0,0.000000,0> translate<45.466000,-1.535000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.832000,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.102000,-1.535000,7.366000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<52.832000,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.054000,-1.535000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.102000,-1.535000,7.366000>}
box{<0,0,-0.152400><0.048000,0.035000,0.152400> rotate<0,0.000000,0> translate<54.054000,-1.535000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.102000,-1.535000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.134000,-1.535000,3.556000>}
box{<0,0,-0.152400><2.873682,0.035000,0.152400> rotate<0,44.997030,0> translate<54.102000,-1.535000,5.588000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.434000,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.134000,-1.535000,23.876000>}
box{<0,0,-0.152400><12.700000,0.035000,0.152400> rotate<0,0.000000,0> translate<43.434000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.004000,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.404000,-1.535000,22.606000>}
box{<0,0,-0.152400><25.400000,0.035000,0.152400> rotate<0,0.000000,0> translate<32.004000,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.704000,-1.535000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.404000,-1.535000,44.196000>}
box{<0,0,-0.152400><12.700000,0.035000,0.152400> rotate<0,0.000000,0> translate<44.704000,-1.535000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.974000,-1.535000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.404000,-1.535000,45.466000>}
box{<0,0,-0.152400><11.430000,0.035000,0.152400> rotate<0,0.000000,0> translate<45.974000,-1.535000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.404000,-1.535000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.674000,-1.535000,45.466000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<57.404000,-1.535000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.404000,-1.535000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.674000,-1.535000,46.736000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<57.404000,-1.535000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.754000,0.000000,20.256000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.754000,0.000000,12.716000>}
box{<0,0,-0.152400><7.540000,0.035000,0.152400> rotate<0,-90.000000,0> translate<59.754000,0.000000,12.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.404000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.754000,0.000000,20.256000>}
box{<0,0,-0.152400><3.323402,0.035000,0.152400> rotate<0,44.997030,0> translate<57.404000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.754000,0.000000,45.656000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.754000,0.000000,37.716000>}
box{<0,0,-0.152400><7.940000,0.035000,0.152400> rotate<0,-90.000000,0> translate<59.754000,0.000000,37.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.674000,0.000000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.754000,0.000000,45.656000>}
box{<0,0,-0.152400><1.527351,0.035000,0.152400> rotate<0,44.997030,0> translate<58.674000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.134000,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.944000,-1.535000,27.686000>}
box{<0,0,-0.152400><5.388154,0.035000,0.152400> rotate<0,-44.997030,0> translate<56.134000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.944000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.944000,0.000000,27.686000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,90.000000,0> translate<59.944000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.674000,-1.535000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.944000,-1.535000,45.466000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<58.674000,-1.535000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.674000,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.944000,-1.535000,48.006000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<58.674000,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.814000,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.214000,-1.535000,21.336000>}
box{<0,0,-0.152400><25.400000,0.035000,0.152400> rotate<0,0.000000,0> translate<35.814000,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.944000,-1.535000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.214000,-1.535000,46.736000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<59.944000,-1.535000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.754000,0.000000,20.796000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.754000,0.000000,12.716000>}
box{<0,0,-0.152400><8.080000,0.035000,0.152400> rotate<0,-90.000000,0> translate<61.754000,0.000000,12.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.214000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.754000,0.000000,20.796000>}
box{<0,0,-0.152400><0.763675,0.035000,0.152400> rotate<0,44.997030,0> translate<61.214000,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.754000,0.000000,46.196000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.754000,0.000000,37.716000>}
box{<0,0,-0.152400><8.480000,0.035000,0.152400> rotate<0,-90.000000,0> translate<61.754000,0.000000,37.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.214000,0.000000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.754000,0.000000,46.196000>}
box{<0,0,-0.152400><0.763675,0.035000,0.152400> rotate<0,44.997030,0> translate<61.214000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.627000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.754000,0.000000,12.700000>}
box{<0,0,-0.152400><0.179605,0.035000,0.152400> rotate<0,-44.997030,0> translate<63.627000,0.000000,12.573000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.754000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.754000,0.000000,12.716000>}
box{<0,0,-0.152400><0.016000,0.035000,0.152400> rotate<0,90.000000,0> translate<63.754000,0.000000,12.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.944000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.754000,0.000000,20.066000>}
box{<0,0,-0.152400><5.388154,0.035000,0.152400> rotate<0,44.997030,0> translate<59.944000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.754000,0.000000,12.716000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.754000,0.000000,20.066000>}
box{<0,0,-0.152400><7.350000,0.035000,0.152400> rotate<0,90.000000,0> translate<63.754000,0.000000,20.066000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.944000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.754000,-1.535000,27.686000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,0.000000,0> translate<59.944000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.944000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.754000,0.000000,31.496000>}
box{<0,0,-0.152400><5.388154,0.035000,0.152400> rotate<0,-44.997030,0> translate<59.944000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.754000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.754000,0.000000,37.716000>}
box{<0,0,-0.152400><6.220000,0.035000,0.152400> rotate<0,90.000000,0> translate<63.754000,0.000000,37.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.754000,0.000000,37.716000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.754000,0.000000,39.116000>}
box{<0,0,-0.152400><1.400000,0.035000,0.152400> rotate<0,90.000000,0> translate<63.754000,0.000000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.214000,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.024000,-1.535000,46.736000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,0.000000,0> translate<61.214000,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.754000,0.000000,0.540000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.754000,0.000000,12.716000>}
box{<0,0,-0.152400><12.176000,0.035000,0.152400> rotate<0,90.000000,0> translate<65.754000,0.000000,12.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.754000,0.000000,25.686000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.754000,0.000000,37.716000>}
box{<0,0,-0.152400><12.030000,0.035000,0.152400> rotate<0,90.000000,0> translate<65.754000,0.000000,37.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.402000,-1.535000,0.254000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.040000,-1.535000,0.254000>}
box{<0,0,-0.152400><24.638000,0.035000,0.152400> rotate<0,0.000000,0> translate<41.402000,-1.535000,0.254000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.754000,0.000000,0.540000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.040000,0.000000,0.254000>}
box{<0,0,-0.152400><0.404465,0.035000,0.152400> rotate<0,44.997030,0> translate<65.754000,0.000000,0.540000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.294000,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.294000,-1.535000,25.019000>}
box{<0,0,-0.152400><0.127000,0.035000,0.152400> rotate<0,-90.000000,0> translate<66.294000,-1.535000,25.019000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.754000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.294000,-1.535000,25.146000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,44.997030,0> translate<63.754000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.754000,0.000000,25.686000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.294000,0.000000,25.146000>}
box{<0,0,-0.152400><0.763675,0.035000,0.152400> rotate<0,44.997030,0> translate<65.754000,0.000000,25.686000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.024000,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.294000,-1.535000,45.466000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<65.024000,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.294000,-1.535000,25.019000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.421000,-1.535000,25.019000>}
box{<0,0,-0.152400><0.127000,0.035000,0.152400> rotate<0,0.000000,0> translate<66.294000,-1.535000,25.019000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.294000,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.421000,-1.535000,25.019000>}
box{<0,0,-0.152400><0.179605,0.035000,0.152400> rotate<0,44.997030,0> translate<66.294000,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.426000,0.000000,4.837000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.426000,0.000000,13.697000>}
box{<0,0,-0.152400><8.860000,0.035000,0.152400> rotate<0,90.000000,0> translate<67.426000,0.000000,13.697000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.426000,0.000000,38.619000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.426000,0.000000,38.697000>}
box{<0,0,-0.152400><0.078000,0.035000,0.152400> rotate<0,90.000000,0> translate<67.426000,0.000000,38.697000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.426000,0.000000,4.837000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.437000,0.000000,4.826000>}
box{<0,0,-0.152400><0.015556,0.035000,0.152400> rotate<0,44.997030,0> translate<67.426000,0.000000,4.837000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.421000,-1.535000,25.019000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.564000,-1.535000,23.876000>}
box{<0,0,-0.152400><1.616446,0.035000,0.152400> rotate<0,44.997030,0> translate<66.421000,-1.535000,25.019000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.426000,0.000000,38.619000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.564000,0.000000,38.481000>}
box{<0,0,-0.152400><0.195161,0.035000,0.152400> rotate<0,44.997030,0> translate<67.426000,0.000000,38.619000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.564000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.564000,0.000000,38.481000>}
box{<0,0,-0.152400><10.795000,0.035000,0.152400> rotate<0,90.000000,0> translate<67.564000,0.000000,38.481000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.564000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.691000,-1.535000,27.813000>}
box{<0,0,-0.152400><0.179605,0.035000,0.152400> rotate<0,-44.997030,0> translate<67.564000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.691000,-1.535000,27.813000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.818000,-1.535000,27.686000>}
box{<0,0,-0.152400><0.179605,0.035000,0.152400> rotate<0,44.997030,0> translate<67.691000,-1.535000,27.813000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.966000,0.000000,4.964000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.966000,0.000000,15.729000>}
box{<0,0,-0.152400><10.765000,0.035000,0.152400> rotate<0,90.000000,0> translate<69.966000,0.000000,15.729000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.966000,0.000000,29.094000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.966000,0.000000,40.729000>}
box{<0,0,-0.152400><11.635000,0.035000,0.152400> rotate<0,90.000000,0> translate<69.966000,0.000000,40.729000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.134000,-1.535000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.977000,-1.535000,3.556000>}
box{<0,0,-0.152400><13.843000,0.035000,0.152400> rotate<0,0.000000,0> translate<56.134000,-1.535000,3.556000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.966000,0.000000,4.964000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.977000,0.000000,3.556000>}
box{<0,0,-0.152400><1.408043,0.035000,0.152400> rotate<0,89.546476,0> translate<69.966000,0.000000,4.964000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.704000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.104000,-1.535000,28.956000>}
box{<0,0,-0.152400><25.400000,0.035000,0.152400> rotate<0,0.000000,0> translate<44.704000,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.966000,0.000000,29.094000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.104000,0.000000,28.956000>}
box{<0,0,-0.152400><0.195161,0.035000,0.152400> rotate<0,44.997030,0> translate<69.966000,0.000000,29.094000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.754000,0.000000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.374000,0.000000,46.736000>}
box{<0,0,-0.152400><10.776307,0.035000,0.152400> rotate<0,-44.997030,0> translate<63.754000,0.000000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.136000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.184000,0.000000,7.366000>}
box{<0,0,-0.152400><0.048000,0.035000,0.152400> rotate<0,0.000000,0> translate<72.136000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.136000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.184000,0.000000,7.414000>}
box{<0,0,-0.152400><0.067882,0.035000,0.152400> rotate<0,-44.997030,0> translate<72.136000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.184000,0.000000,7.414000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.184000,0.000000,25.146000>}
box{<0,0,-0.152400><17.732000,0.035000,0.152400> rotate<0,90.000000,0> translate<72.184000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.184000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.184000,0.000000,45.006000>}
box{<0,0,-0.152400><19.860000,0.035000,0.152400> rotate<0,90.000000,0> translate<72.184000,0.000000,45.006000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.184000,0.000000,45.006000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<73.914000,0.000000,46.736000>}
box{<0,0,-0.152400><2.446589,0.035000,0.152400> rotate<0,-44.997030,0> translate<72.184000,0.000000,45.006000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.437000,-1.535000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.692000,-1.535000,4.826000>}
box{<0,0,-0.152400><8.255000,0.035000,0.152400> rotate<0,0.000000,0> translate<67.437000,-1.535000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.818000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.454000,-1.535000,27.686000>}
box{<0,0,-0.152400><8.636000,0.035000,0.152400> rotate<0,0.000000,0> translate<67.818000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.454000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.454000,0.000000,46.736000>}
box{<0,0,-0.152400><4.318000,0.035000,0.152400> rotate<0,90.000000,0> translate<76.454000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<78.184000,-1.535000,25.956000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<78.184000,-1.535000,25.146000>}
box{<0,0,-0.152400><0.810000,0.035000,0.152400> rotate<0,-90.000000,0> translate<78.184000,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.454000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<78.184000,-1.535000,25.956000>}
box{<0,0,-0.152400><2.446589,0.035000,0.152400> rotate<0,44.997030,0> translate<76.454000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.692000,-1.535000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<78.232000,-1.535000,7.366000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,-44.997030,0> translate<75.692000,-1.535000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<78.184000,-1.535000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<78.232000,-1.535000,7.366000>}
box{<0,0,-0.152400><0.048000,0.035000,0.152400> rotate<0,0.000000,0> translate<78.184000,-1.535000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.564000,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<80.264000,-1.535000,23.876000>}
box{<0,0,-0.152400><12.700000,0.035000,0.152400> rotate<0,0.000000,0> translate<67.564000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<78.994000,0.000000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<80.264000,0.000000,48.006000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<78.994000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.404000,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<81.534000,-1.535000,22.606000>}
box{<0,0,-0.152400><24.130000,0.035000,0.152400> rotate<0,0.000000,0> translate<57.404000,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.944000,-1.535000,48.006000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<81.534000,-1.535000,48.006000>}
box{<0,0,-0.152400><21.590000,0.035000,0.152400> rotate<0,0.000000,0> translate<59.944000,-1.535000,48.006000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.294000,-1.535000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<82.804000,-1.535000,45.466000>}
box{<0,0,-0.152400><16.510000,0.035000,0.152400> rotate<0,0.000000,0> translate<66.294000,-1.535000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<81.534000,-1.535000,48.006000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<82.804000,-1.535000,46.736000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<81.534000,-1.535000,48.006000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<80.264000,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<84.074000,-1.535000,27.686000>}
box{<0,0,-0.152400><5.388154,0.035000,0.152400> rotate<0,-44.997030,0> translate<80.264000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<84.074000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<84.074000,0.000000,28.321000>}
box{<0,0,-0.152400><4.445000,0.035000,0.152400> rotate<0,90.000000,0> translate<84.074000,0.000000,28.321000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<82.804000,-1.535000,45.466000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<84.074000,-1.535000,46.736000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<82.804000,-1.535000,45.466000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<84.754000,0.000000,19.386000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<84.754000,0.000000,12.716000>}
box{<0,0,-0.152400><6.670000,0.035000,0.152400> rotate<0,-90.000000,0> translate<84.754000,0.000000,12.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<81.534000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<84.754000,0.000000,19.386000>}
box{<0,0,-0.152400><4.553768,0.035000,0.152400> rotate<0,44.997030,0> translate<81.534000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<84.754000,0.000000,37.716000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<84.757000,0.000000,37.719000>}
box{<0,0,-0.152400><0.004243,0.035000,0.152400> rotate<0,-44.997030,0> translate<84.754000,0.000000,37.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<84.757000,0.000000,37.719000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<84.836000,0.000000,37.719000>}
box{<0,0,-0.152400><0.079000,0.035000,0.152400> rotate<0,0.000000,0> translate<84.757000,0.000000,37.719000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<84.836000,0.000000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<84.836000,0.000000,37.719000>}
box{<0,0,-0.152400><6.985000,0.035000,0.152400> rotate<0,-90.000000,0> translate<84.836000,0.000000,37.719000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<82.804000,0.000000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<84.836000,0.000000,44.704000>}
box{<0,0,-0.152400><2.873682,0.035000,0.152400> rotate<0,44.997030,0> translate<82.804000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.214000,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<85.344000,-1.535000,21.336000>}
box{<0,0,-0.152400><24.130000,0.035000,0.152400> rotate<0,0.000000,0> translate<61.214000,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<84.074000,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<85.344000,-1.535000,46.736000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<84.074000,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<86.754000,0.000000,45.326000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<86.754000,0.000000,37.716000>}
box{<0,0,-0.152400><7.610000,0.035000,0.152400> rotate<0,-90.000000,0> translate<86.754000,0.000000,37.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<85.344000,0.000000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<86.754000,0.000000,45.326000>}
box{<0,0,-0.152400><1.994041,0.035000,0.152400> rotate<0,44.997030,0> translate<85.344000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<86.754000,0.000000,12.716000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<86.865000,0.000000,12.827000>}
box{<0,0,-0.152400><0.156978,0.035000,0.152400> rotate<0,-44.997030,0> translate<86.754000,0.000000,12.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<86.865000,0.000000,12.827000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<86.868000,0.000000,12.827000>}
box{<0,0,-0.152400><0.003000,0.035000,0.152400> rotate<0,0.000000,0> translate<86.865000,0.000000,12.827000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<86.868000,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<86.868000,0.000000,12.827000>}
box{<0,0,-0.152400><6.985000,0.035000,0.152400> rotate<0,-90.000000,0> translate<86.868000,0.000000,12.827000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<85.344000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<86.868000,0.000000,19.812000>}
box{<0,0,-0.152400><2.155261,0.035000,0.152400> rotate<0,44.997030,0> translate<85.344000,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.454000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<87.312500,0.000000,31.559500>}
box{<0,0,-0.152400><15.356238,0.035000,0.152400> rotate<0,44.997030,0> translate<76.454000,0.000000,42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<84.074000,0.000000,28.321000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<87.312500,0.000000,31.559500>}
box{<0,0,-0.152400><4.579931,0.035000,0.152400> rotate<0,-44.997030,0> translate<84.074000,0.000000,28.321000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<87.312500,0.000000,31.559500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<88.646000,0.000000,32.893000>}
box{<0,0,-0.152400><1.885854,0.035000,0.152400> rotate<0,-44.997030,0> translate<87.312500,0.000000,31.559500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<88.646000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<88.646000,0.000000,37.719000>}
box{<0,0,-0.152400><4.826000,0.035000,0.152400> rotate<0,90.000000,0> translate<88.646000,0.000000,37.719000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<88.646000,0.000000,37.719000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<88.649000,0.000000,37.716000>}
box{<0,0,-0.152400><0.004243,0.035000,0.152400> rotate<0,44.997030,0> translate<88.646000,0.000000,37.719000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<88.646000,0.000000,12.827000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<88.754000,0.000000,12.719000>}
box{<0,0,-0.152400><0.152735,0.035000,0.152400> rotate<0,44.997030,0> translate<88.646000,0.000000,12.827000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<88.754000,0.000000,12.716000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<88.754000,0.000000,12.719000>}
box{<0,0,-0.152400><0.003000,0.035000,0.152400> rotate<0,90.000000,0> translate<88.754000,0.000000,12.719000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<84.074000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<88.754000,0.000000,19.196000>}
box{<0,0,-0.152400><6.618519,0.035000,0.152400> rotate<0,44.997030,0> translate<84.074000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<88.754000,0.000000,12.716000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<88.754000,0.000000,19.196000>}
box{<0,0,-0.152400><6.480000,0.035000,0.152400> rotate<0,90.000000,0> translate<88.754000,0.000000,19.196000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<88.649000,0.000000,37.716000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<88.754000,0.000000,37.716000>}
box{<0,0,-0.152400><0.105000,0.035000,0.152400> rotate<0,0.000000,0> translate<88.649000,0.000000,37.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<86.154000,-1.535000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<90.424000,-1.535000,2.286000>}
box{<0,0,-0.152400><4.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<86.154000,-1.535000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<80.264000,0.000000,48.006000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<90.424000,0.000000,48.006000>}
box{<0,0,-0.152400><10.160000,0.035000,0.152400> rotate<0,0.000000,0> translate<80.264000,0.000000,48.006000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<90.043000,0.000000,0.254000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<90.754000,0.000000,0.965000>}
box{<0,0,-0.152400><1.005506,0.035000,0.152400> rotate<0,-44.997030,0> translate<90.043000,0.000000,0.254000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<90.754000,0.000000,0.965000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<90.754000,0.000000,12.716000>}
box{<0,0,-0.152400><11.751000,0.035000,0.152400> rotate<0,90.000000,0> translate<90.754000,0.000000,12.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<90.754000,0.000000,37.716000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<90.757000,0.000000,37.719000>}
box{<0,0,-0.152400><0.004243,0.035000,0.152400> rotate<0,-44.997030,0> translate<90.754000,0.000000,37.716000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<84.074000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<90.805000,-1.535000,27.686000>}
box{<0,0,-0.152400><6.731000,0.035000,0.152400> rotate<0,0.000000,0> translate<84.074000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<90.757000,0.000000,37.719000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<90.805000,0.000000,37.719000>}
box{<0,0,-0.152400><0.048000,0.035000,0.152400> rotate<0,0.000000,0> translate<90.757000,0.000000,37.719000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<90.805000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<90.805000,0.000000,37.719000>}
box{<0,0,-0.152400><10.033000,0.035000,0.152400> rotate<0,90.000000,0> translate<90.805000,0.000000,37.719000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<90.424000,-1.535000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<91.694000,-1.535000,1.016000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<90.424000,-1.535000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<92.075000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<92.154000,0.000000,2.286000>}
box{<0,0,-0.152400><0.079000,0.035000,0.152400> rotate<0,0.000000,0> translate<92.075000,0.000000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<92.329000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<92.329000,0.000000,38.481000>}
box{<0,0,-0.152400><10.414000,0.035000,0.152400> rotate<0,90.000000,0> translate<92.329000,0.000000,38.481000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<92.075000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<92.426000,0.000000,2.637000>}
box{<0,0,-0.152400><0.496389,0.035000,0.152400> rotate<0,-44.997030,0> translate<92.075000,0.000000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<92.426000,0.000000,2.637000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<92.426000,0.000000,13.697000>}
box{<0,0,-0.152400><11.060000,0.035000,0.152400> rotate<0,90.000000,0> translate<92.426000,0.000000,13.697000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<92.329000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<92.426000,0.000000,38.578000>}
box{<0,0,-0.152400><0.137179,0.035000,0.152400> rotate<0,-44.997030,0> translate<92.329000,0.000000,38.481000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<92.426000,0.000000,38.578000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<92.426000,0.000000,38.697000>}
box{<0,0,-0.152400><0.119000,0.035000,0.152400> rotate<0,90.000000,0> translate<92.426000,0.000000,38.697000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.977000,-1.535000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<94.234000,-1.535000,3.556000>}
box{<0,0,-0.152400><24.257000,0.035000,0.152400> rotate<0,0.000000,0> translate<69.977000,-1.535000,3.556000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<94.234000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<94.966000,0.000000,4.288000>}
box{<0,0,-0.152400><1.035204,0.035000,0.152400> rotate<0,-44.997030,0> translate<94.234000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<94.966000,0.000000,4.288000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<94.966000,0.000000,15.729000>}
box{<0,0,-0.152400><11.441000,0.035000,0.152400> rotate<0,90.000000,0> translate<94.966000,0.000000,15.729000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<94.966000,0.000000,28.986000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<94.966000,0.000000,40.729000>}
box{<0,0,-0.152400><11.743000,0.035000,0.152400> rotate<0,90.000000,0> translate<94.966000,0.000000,40.729000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.104000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<94.996000,-1.535000,28.956000>}
box{<0,0,-0.152400><24.892000,0.035000,0.152400> rotate<0,0.000000,0> translate<70.104000,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<94.966000,0.000000,28.986000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<94.996000,0.000000,28.956000>}
box{<0,0,-0.152400><0.042426,0.035000,0.152400> rotate<0,44.997030,0> translate<94.966000,0.000000,28.986000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<92.329000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<95.130000,0.000000,25.266000>}
box{<0,0,-0.152400><3.961212,0.035000,0.152400> rotate<0,44.997030,0> translate<92.329000,0.000000,28.067000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<91.694000,-1.535000,1.016000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<95.504000,-1.535000,1.016000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,0.000000,0> translate<91.694000,-1.535000,1.016000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<95.504000,-1.535000,1.016000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<95.504000,-1.535000,4.826000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,90.000000,0> translate<95.504000,-1.535000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<92.604000,-1.535000,25.266000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<96.767000,-1.535000,25.266000>}
box{<0,0,-0.152400><4.163000,0.035000,0.152400> rotate<0,0.000000,0> translate<92.604000,-1.535000,25.266000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<95.504000,-1.535000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<96.774000,-1.535000,6.096000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<95.504000,-1.535000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<96.767000,-1.535000,25.266000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<96.774000,-1.535000,25.273000>}
box{<0,0,-0.152400><0.009899,0.035000,0.152400> rotate<0,-44.997030,0> translate<96.767000,-1.535000,25.266000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<96.774000,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<96.774000,-1.535000,25.273000>}
box{<0,0,-0.152400><19.177000,0.035000,0.152400> rotate<0,90.000000,0> translate<96.774000,-1.535000,25.273000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<90.424000,-1.535000,48.006000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<96.774000,-1.535000,41.656000>}
box{<0,0,-0.152400><8.980256,0.035000,0.152400> rotate<0,44.997030,0> translate<90.424000,-1.535000,48.006000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<96.774000,-1.535000,25.273000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<96.774000,-1.535000,41.656000>}
box{<0,0,-0.152400><16.383000,0.035000,0.152400> rotate<0,90.000000,0> translate<96.774000,-1.535000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<95.130000,0.000000,25.266000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<98.604000,0.000000,25.266000>}
box{<0,0,-0.152400><3.474000,0.035000,0.152400> rotate<0,0.000000,0> translate<95.130000,0.000000,25.266000> }
//Text
//Rect
union{
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<43.554000,-1.537000,42.716000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<42.054000,-1.537000,41.216000>}
box{<0,0,-0.127000><2.121320,0.037000,0.127000> rotate<0,-44.997030,0> translate<42.054000,-1.537000,41.216000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<41.904000,-1.537000,40.096000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<43.824000,-1.537000,41.376000>}
box{<0,0,-0.127000><2.307553,0.037000,0.127000> rotate<0,-33.687844,0> translate<41.904000,-1.537000,40.096000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<44.894000,-1.537000,40.756000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<42.834000,-1.537000,39.716000>}
box{<0,0,-0.127000><2.307639,0.037000,0.127000> rotate<0,-26.785359,0> translate<42.834000,-1.537000,39.716000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<45.534000,-1.537000,38.226000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<43.234000,-1.537000,38.086000>}
box{<0,0,-0.127000><2.304257,0.037000,0.127000> rotate<0,-3.483042,0> translate<43.234000,-1.537000,38.086000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<42.514000,-1.537000,37.106000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<44.814000,-1.537000,36.966000>}
box{<0,0,-0.127000><2.304257,0.037000,0.127000> rotate<0,3.483042,0> translate<42.514000,-1.537000,37.106000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<45.214000,-1.537000,35.736000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<42.944000,-1.537000,36.246000>}
box{<0,0,-0.127000><2.326585,0.037000,0.127000> rotate<0,12.661528,0> translate<42.944000,-1.537000,36.246000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<42.064000,-1.537000,35.636000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<44.064000,-1.537000,34.696000>}
box{<0,0,-0.127000><2.209887,0.037000,0.127000> rotate<0,25.171863,0> translate<42.064000,-1.537000,35.636000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<44.124000,-1.537000,33.466000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<42.224000,-1.537000,34.586000>}
box{<0,0,-0.127000><2.205538,0.037000,0.127000> rotate<0,30.516217,0> translate<42.224000,-1.537000,34.586000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<41.124000,-1.537000,34.346000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<42.974000,-1.537000,32.796000>}
box{<0,0,-0.127000><2.413504,0.037000,0.127000> rotate<0,39.954912,0> translate<41.124000,-1.537000,34.346000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<42.144000,-1.537000,31.546000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<40.814000,-1.537000,33.346000>}
box{<0,0,-0.127000><2.238057,0.037000,0.127000> rotate<0,53.536183,0> translate<40.814000,-1.537000,33.346000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<39.794000,-1.537000,33.496000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<40.784000,-1.537000,31.406000>}
box{<0,0,-0.127000><2.312618,0.037000,0.127000> rotate<0,64.649557,0> translate<39.794000,-1.537000,33.496000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<40.084000,-1.537000,30.636000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<39.344000,-1.537000,32.766000>}
box{<0,0,-0.127000><2.254884,0.037000,0.127000> rotate<0,70.837186,0> translate<39.344000,-1.537000,32.766000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<38.424000,-1.537000,33.146000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<38.764000,-1.537000,30.876000>}
box{<0,0,-0.127000><2.295321,0.037000,0.127000> rotate<0,81.476200,0> translate<38.424000,-1.537000,33.146000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<37.834000,-1.537000,30.276000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<37.764000,-1.537000,32.506000>}
box{<0,0,-0.127000><2.231098,0.037000,0.127000> rotate<0,88.196247,0> translate<37.764000,-1.537000,32.506000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<37.064000,-1.537000,33.256000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<36.614000,-1.537000,30.956000>}
box{<0,0,-0.127000><2.343608,0.037000,0.127000> rotate<0,-78.924588,0> translate<36.614000,-1.537000,30.956000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<35.464000,-1.537000,30.906000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<36.204000,-1.537000,32.836000>}
box{<0,0,-0.127000><2.067003,0.037000,0.127000> rotate<0,-69.017638,0> translate<35.464000,-1.537000,30.906000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<35.644000,-1.537000,33.816000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<34.424000,-1.537000,31.726000>}
box{<0,0,-0.127000><2.420021,0.037000,0.127000> rotate<0,-59.722579,0> translate<34.424000,-1.537000,31.726000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<33.514000,-1.537000,31.916000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<34.684000,-1.537000,33.656000>}
box{<0,0,-0.127000><2.096783,0.037000,0.127000> rotate<0,-56.078868,0> translate<33.514000,-1.537000,31.916000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<34.554000,-1.537000,34.776000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<33.044000,-1.537000,33.196000>}
box{<0,0,-0.127000><2.185521,0.037000,0.127000> rotate<0,-46.294685,0> translate<33.044000,-1.537000,33.196000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<31.884000,-1.537000,33.656000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<33.614000,-1.537000,34.936000>}
box{<0,0,-0.127000><2.152046,0.037000,0.127000> rotate<0,-36.494752,0> translate<31.884000,-1.537000,33.656000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<33.754000,-1.537000,36.116000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<31.694000,-1.537000,35.096000>}
box{<0,0,-0.127000><2.298695,0.037000,0.127000> rotate<0,-26.340373,0> translate<31.694000,-1.537000,35.096000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<30.834000,-1.537000,35.896000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<33.004000,-1.537000,36.596000>}
box{<0,0,-0.127000><2.280110,0.037000,0.127000> rotate<0,-17.877517,0> translate<30.834000,-1.537000,35.896000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<33.454000,-1.537000,37.286000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<31.184000,-1.537000,37.126000>}
box{<0,0,-0.127000><2.275632,0.037000,0.127000> rotate<0,-4.031535,0> translate<31.184000,-1.537000,37.126000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<30.674000,-1.537000,37.956000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<32.874000,-1.537000,37.986000>}
box{<0,0,-0.127000><2.200205,0.037000,0.127000> rotate<0,-0.781206,0> translate<30.674000,-1.537000,37.956000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<33.644000,-1.537000,38.576000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<31.244000,-1.537000,38.896000>}
box{<0,0,-0.127000><2.421239,0.037000,0.127000> rotate<0,7.594142,0> translate<31.244000,-1.537000,38.896000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<30.944000,-1.537000,39.956000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<33.164000,-1.537000,39.536000>}
box{<0,0,-0.127000><2.259380,0.037000,0.127000> rotate<0,10.712416,0> translate<30.944000,-1.537000,39.956000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<34.074000,-1.537000,39.876000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<31.854000,-1.537000,40.866000>}
box{<0,0,-0.127000><2.430741,0.037000,0.127000> rotate<0,24.032702,0> translate<31.854000,-1.537000,40.866000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<31.904000,-1.537000,41.836000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<33.914000,-1.537000,40.766000>}
box{<0,0,-0.127000><2.277060,0.037000,0.127000> rotate<0,28.026233,0> translate<31.904000,-1.537000,41.836000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<34.874000,-1.537000,40.976000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<33.044000,-1.537000,42.416000>}
box{<0,0,-0.127000><2.328626,0.037000,0.127000> rotate<0,38.196164,0> translate<33.044000,-1.537000,42.416000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<33.534000,-1.537000,43.626000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<35.084000,-1.537000,41.856000>}
box{<0,0,-0.127000><2.352743,0.037000,0.127000> rotate<0,48.787946,0> translate<33.534000,-1.537000,43.626000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<36.074000,-1.537000,41.806000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<34.714000,-1.537000,43.726000>}
box{<0,0,-0.127000><2.352871,0.037000,0.127000> rotate<0,54.685177,0> translate<34.714000,-1.537000,43.726000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<35.724000,-1.537000,44.746000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<36.554000,-1.537000,42.736000>}
box{<0,0,-0.127000><2.174626,0.037000,0.127000> rotate<0,67.558082,0> translate<35.724000,-1.537000,44.746000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<37.464000,-1.537000,42.336000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<36.954000,-1.537000,44.506000>}
box{<0,0,-0.127000><2.229125,0.037000,0.127000> rotate<0,76.769131,0> translate<36.954000,-1.537000,44.506000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<40.964000,-1.537000,41.266000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<42.494000,-1.537000,42.956000>}
box{<0,0,-0.127000><2.279693,0.037000,0.127000> rotate<0,-47.841498,0> translate<40.964000,-1.537000,41.266000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<42.064000,-1.537000,43.916000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<40.644000,-1.537000,42.076000>}
box{<0,0,-0.127000><2.324220,0.037000,0.127000> rotate<0,-52.337771,0> translate<40.644000,-1.537000,42.076000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<39.794000,-1.537000,42.016000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<40.904000,-1.537000,43.996000>}
box{<0,0,-0.127000><2.269912,0.037000,0.127000> rotate<0,-60.720738,0> translate<39.794000,-1.537000,42.016000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<40.214000,-1.537000,44.826000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<39.374000,-1.537000,42.896000>}
box{<0,0,-0.127000><2.104875,0.037000,0.127000> rotate<0,-66.475340,0> translate<39.374000,-1.537000,42.896000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<38.664000,-1.537000,42.286000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<39.044000,-1.537000,44.666000>}
box{<0,0,-0.127000><2.410145,0.037000,0.127000> rotate<0,-80.923161,0> translate<38.664000,-1.537000,42.286000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<38.054000,-1.537000,45.176000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<38.054000,-1.537000,43.086000>}
box{<0,0,-0.127000><2.090000,0.037000,0.127000> rotate<0,-90.000000,0> translate<38.054000,-1.537000,43.086000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<42.514000,-1.537000,38.716000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<44.844000,-1.537000,39.456000>}
box{<0,0,-0.127000><2.444688,0.037000,0.127000> rotate<0,-17.618507,0> translate<42.514000,-1.537000,38.716000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<18.554000,-1.537000,42.716000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<17.054000,-1.537000,41.216000>}
box{<0,0,-0.127000><2.121320,0.037000,0.127000> rotate<0,-44.997030,0> translate<17.054000,-1.537000,41.216000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<16.904000,-1.537000,40.096000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<18.824000,-1.537000,41.376000>}
box{<0,0,-0.127000><2.307553,0.037000,0.127000> rotate<0,-33.687844,0> translate<16.904000,-1.537000,40.096000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<19.894000,-1.537000,40.756000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<17.834000,-1.537000,39.716000>}
box{<0,0,-0.127000><2.307639,0.037000,0.127000> rotate<0,-26.785359,0> translate<17.834000,-1.537000,39.716000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<20.534000,-1.537000,38.226000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<18.234000,-1.537000,38.086000>}
box{<0,0,-0.127000><2.304257,0.037000,0.127000> rotate<0,-3.483042,0> translate<18.234000,-1.537000,38.086000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<17.514000,-1.537000,37.106000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<19.814000,-1.537000,36.966000>}
box{<0,0,-0.127000><2.304257,0.037000,0.127000> rotate<0,3.483042,0> translate<17.514000,-1.537000,37.106000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<20.214000,-1.537000,35.736000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<17.944000,-1.537000,36.246000>}
box{<0,0,-0.127000><2.326585,0.037000,0.127000> rotate<0,12.661528,0> translate<17.944000,-1.537000,36.246000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<17.064000,-1.537000,35.636000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<19.064000,-1.537000,34.696000>}
box{<0,0,-0.127000><2.209887,0.037000,0.127000> rotate<0,25.171863,0> translate<17.064000,-1.537000,35.636000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<19.124000,-1.537000,33.466000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<17.224000,-1.537000,34.586000>}
box{<0,0,-0.127000><2.205538,0.037000,0.127000> rotate<0,30.516217,0> translate<17.224000,-1.537000,34.586000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<16.124000,-1.537000,34.346000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<17.974000,-1.537000,32.796000>}
box{<0,0,-0.127000><2.413504,0.037000,0.127000> rotate<0,39.954912,0> translate<16.124000,-1.537000,34.346000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<17.144000,-1.537000,31.546000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<15.814000,-1.537000,33.346000>}
box{<0,0,-0.127000><2.238057,0.037000,0.127000> rotate<0,53.536183,0> translate<15.814000,-1.537000,33.346000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<14.794000,-1.537000,33.496000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<15.784000,-1.537000,31.406000>}
box{<0,0,-0.127000><2.312618,0.037000,0.127000> rotate<0,64.649557,0> translate<14.794000,-1.537000,33.496000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<15.084000,-1.537000,30.636000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<14.344000,-1.537000,32.766000>}
box{<0,0,-0.127000><2.254884,0.037000,0.127000> rotate<0,70.837186,0> translate<14.344000,-1.537000,32.766000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<13.424000,-1.537000,33.146000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<13.764000,-1.537000,30.876000>}
box{<0,0,-0.127000><2.295321,0.037000,0.127000> rotate<0,81.476200,0> translate<13.424000,-1.537000,33.146000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<12.834000,-1.537000,30.276000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<12.764000,-1.537000,32.506000>}
box{<0,0,-0.127000><2.231098,0.037000,0.127000> rotate<0,88.196247,0> translate<12.764000,-1.537000,32.506000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<12.064000,-1.537000,33.256000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<11.614000,-1.537000,30.956000>}
box{<0,0,-0.127000><2.343608,0.037000,0.127000> rotate<0,-78.924588,0> translate<11.614000,-1.537000,30.956000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<10.464000,-1.537000,30.906000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<11.204000,-1.537000,32.836000>}
box{<0,0,-0.127000><2.067003,0.037000,0.127000> rotate<0,-69.017638,0> translate<10.464000,-1.537000,30.906000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<10.644000,-1.537000,33.816000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<9.424000,-1.537000,31.726000>}
box{<0,0,-0.127000><2.420021,0.037000,0.127000> rotate<0,-59.722579,0> translate<9.424000,-1.537000,31.726000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<8.514000,-1.537000,31.916000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<9.684000,-1.537000,33.656000>}
box{<0,0,-0.127000><2.096783,0.037000,0.127000> rotate<0,-56.078868,0> translate<8.514000,-1.537000,31.916000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<9.554000,-1.537000,34.776000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<8.044000,-1.537000,33.196000>}
box{<0,0,-0.127000><2.185521,0.037000,0.127000> rotate<0,-46.294685,0> translate<8.044000,-1.537000,33.196000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<6.884000,-1.537000,33.656000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<8.614000,-1.537000,34.936000>}
box{<0,0,-0.127000><2.152046,0.037000,0.127000> rotate<0,-36.494752,0> translate<6.884000,-1.537000,33.656000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<8.754000,-1.537000,36.116000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<6.694000,-1.537000,35.096000>}
box{<0,0,-0.127000><2.298695,0.037000,0.127000> rotate<0,-26.340373,0> translate<6.694000,-1.537000,35.096000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<5.834000,-1.537000,35.896000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<8.004000,-1.537000,36.596000>}
box{<0,0,-0.127000><2.280110,0.037000,0.127000> rotate<0,-17.877517,0> translate<5.834000,-1.537000,35.896000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<8.454000,-1.537000,37.286000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<6.184000,-1.537000,37.126000>}
box{<0,0,-0.127000><2.275632,0.037000,0.127000> rotate<0,-4.031535,0> translate<6.184000,-1.537000,37.126000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<5.674000,-1.537000,37.956000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<7.874000,-1.537000,37.986000>}
box{<0,0,-0.127000><2.200205,0.037000,0.127000> rotate<0,-0.781206,0> translate<5.674000,-1.537000,37.956000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<8.644000,-1.537000,38.576000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<6.244000,-1.537000,38.896000>}
box{<0,0,-0.127000><2.421239,0.037000,0.127000> rotate<0,7.594142,0> translate<6.244000,-1.537000,38.896000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<5.944000,-1.537000,39.956000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<8.164000,-1.537000,39.536000>}
box{<0,0,-0.127000><2.259380,0.037000,0.127000> rotate<0,10.712416,0> translate<5.944000,-1.537000,39.956000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<9.074000,-1.537000,39.876000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<6.854000,-1.537000,40.866000>}
box{<0,0,-0.127000><2.430741,0.037000,0.127000> rotate<0,24.032702,0> translate<6.854000,-1.537000,40.866000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<6.904000,-1.537000,41.836000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<8.914000,-1.537000,40.766000>}
box{<0,0,-0.127000><2.277060,0.037000,0.127000> rotate<0,28.026233,0> translate<6.904000,-1.537000,41.836000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<9.874000,-1.537000,40.976000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<8.044000,-1.537000,42.416000>}
box{<0,0,-0.127000><2.328626,0.037000,0.127000> rotate<0,38.196164,0> translate<8.044000,-1.537000,42.416000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<8.534000,-1.537000,43.626000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<10.084000,-1.537000,41.856000>}
box{<0,0,-0.127000><2.352743,0.037000,0.127000> rotate<0,48.787946,0> translate<8.534000,-1.537000,43.626000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<11.074000,-1.537000,41.806000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<9.714000,-1.537000,43.726000>}
box{<0,0,-0.127000><2.352871,0.037000,0.127000> rotate<0,54.685177,0> translate<9.714000,-1.537000,43.726000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<10.724000,-1.537000,44.746000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<11.554000,-1.537000,42.736000>}
box{<0,0,-0.127000><2.174626,0.037000,0.127000> rotate<0,67.558082,0> translate<10.724000,-1.537000,44.746000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<12.464000,-1.537000,42.336000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<11.954000,-1.537000,44.506000>}
box{<0,0,-0.127000><2.229125,0.037000,0.127000> rotate<0,76.769131,0> translate<11.954000,-1.537000,44.506000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<15.964000,-1.537000,41.266000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<17.494000,-1.537000,42.956000>}
box{<0,0,-0.127000><2.279693,0.037000,0.127000> rotate<0,-47.841498,0> translate<15.964000,-1.537000,41.266000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<17.064000,-1.537000,43.916000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<15.644000,-1.537000,42.076000>}
box{<0,0,-0.127000><2.324220,0.037000,0.127000> rotate<0,-52.337771,0> translate<15.644000,-1.537000,42.076000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<14.794000,-1.537000,42.016000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<15.904000,-1.537000,43.996000>}
box{<0,0,-0.127000><2.269912,0.037000,0.127000> rotate<0,-60.720738,0> translate<14.794000,-1.537000,42.016000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<15.214000,-1.537000,44.826000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<14.374000,-1.537000,42.896000>}
box{<0,0,-0.127000><2.104875,0.037000,0.127000> rotate<0,-66.475340,0> translate<14.374000,-1.537000,42.896000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<13.664000,-1.537000,42.286000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<14.044000,-1.537000,44.666000>}
box{<0,0,-0.127000><2.410145,0.037000,0.127000> rotate<0,-80.923161,0> translate<13.664000,-1.537000,42.286000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<13.054000,-1.537000,45.176000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<13.054000,-1.537000,43.086000>}
box{<0,0,-0.127000><2.090000,0.037000,0.127000> rotate<0,-90.000000,0> translate<13.054000,-1.537000,43.086000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<17.514000,-1.537000,38.716000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<19.844000,-1.537000,39.456000>}
box{<0,0,-0.127000><2.444688,0.037000,0.127000> rotate<0,-17.618507,0> translate<17.514000,-1.537000,38.716000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<43.554000,-1.537000,17.716000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<42.054000,-1.537000,16.216000>}
box{<0,0,-0.127000><2.121320,0.037000,0.127000> rotate<0,-44.997030,0> translate<42.054000,-1.537000,16.216000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<41.904000,-1.537000,15.096000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<43.824000,-1.537000,16.376000>}
box{<0,0,-0.127000><2.307553,0.037000,0.127000> rotate<0,-33.687844,0> translate<41.904000,-1.537000,15.096000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<44.894000,-1.537000,15.756000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<42.834000,-1.537000,14.716000>}
box{<0,0,-0.127000><2.307639,0.037000,0.127000> rotate<0,-26.785359,0> translate<42.834000,-1.537000,14.716000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<45.534000,-1.537000,13.226000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<43.234000,-1.537000,13.086000>}
box{<0,0,-0.127000><2.304257,0.037000,0.127000> rotate<0,-3.483042,0> translate<43.234000,-1.537000,13.086000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<42.514000,-1.537000,12.106000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<44.814000,-1.537000,11.966000>}
box{<0,0,-0.127000><2.304257,0.037000,0.127000> rotate<0,3.483042,0> translate<42.514000,-1.537000,12.106000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<45.214000,-1.537000,10.736000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<42.944000,-1.537000,11.246000>}
box{<0,0,-0.127000><2.326585,0.037000,0.127000> rotate<0,12.661528,0> translate<42.944000,-1.537000,11.246000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<42.064000,-1.537000,10.636000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<44.064000,-1.537000,9.696000>}
box{<0,0,-0.127000><2.209887,0.037000,0.127000> rotate<0,25.171863,0> translate<42.064000,-1.537000,10.636000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<44.124000,-1.537000,8.466000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<42.224000,-1.537000,9.586000>}
box{<0,0,-0.127000><2.205538,0.037000,0.127000> rotate<0,30.516217,0> translate<42.224000,-1.537000,9.586000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<41.124000,-1.537000,9.346000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<42.974000,-1.537000,7.796000>}
box{<0,0,-0.127000><2.413504,0.037000,0.127000> rotate<0,39.954912,0> translate<41.124000,-1.537000,9.346000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<42.144000,-1.537000,6.546000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<40.814000,-1.537000,8.346000>}
box{<0,0,-0.127000><2.238057,0.037000,0.127000> rotate<0,53.536183,0> translate<40.814000,-1.537000,8.346000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<39.794000,-1.537000,8.496000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<40.784000,-1.537000,6.406000>}
box{<0,0,-0.127000><2.312618,0.037000,0.127000> rotate<0,64.649557,0> translate<39.794000,-1.537000,8.496000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<40.084000,-1.537000,5.636000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<39.344000,-1.537000,7.766000>}
box{<0,0,-0.127000><2.254884,0.037000,0.127000> rotate<0,70.837186,0> translate<39.344000,-1.537000,7.766000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<38.424000,-1.537000,8.146000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<38.764000,-1.537000,5.876000>}
box{<0,0,-0.127000><2.295321,0.037000,0.127000> rotate<0,81.476200,0> translate<38.424000,-1.537000,8.146000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<37.834000,-1.537000,5.276000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<37.764000,-1.537000,7.506000>}
box{<0,0,-0.127000><2.231098,0.037000,0.127000> rotate<0,88.196247,0> translate<37.764000,-1.537000,7.506000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<37.064000,-1.537000,8.256000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<36.614000,-1.537000,5.956000>}
box{<0,0,-0.127000><2.343608,0.037000,0.127000> rotate<0,-78.924588,0> translate<36.614000,-1.537000,5.956000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<35.464000,-1.537000,5.906000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<36.204000,-1.537000,7.836000>}
box{<0,0,-0.127000><2.067003,0.037000,0.127000> rotate<0,-69.017638,0> translate<35.464000,-1.537000,5.906000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<35.644000,-1.537000,8.816000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<34.424000,-1.537000,6.726000>}
box{<0,0,-0.127000><2.420021,0.037000,0.127000> rotate<0,-59.722579,0> translate<34.424000,-1.537000,6.726000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<33.514000,-1.537000,6.916000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<34.684000,-1.537000,8.656000>}
box{<0,0,-0.127000><2.096783,0.037000,0.127000> rotate<0,-56.078868,0> translate<33.514000,-1.537000,6.916000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<34.554000,-1.537000,9.776000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<33.044000,-1.537000,8.196000>}
box{<0,0,-0.127000><2.185521,0.037000,0.127000> rotate<0,-46.294685,0> translate<33.044000,-1.537000,8.196000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<31.884000,-1.537000,8.656000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<33.614000,-1.537000,9.936000>}
box{<0,0,-0.127000><2.152046,0.037000,0.127000> rotate<0,-36.494752,0> translate<31.884000,-1.537000,8.656000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<33.754000,-1.537000,11.116000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<31.694000,-1.537000,10.096000>}
box{<0,0,-0.127000><2.298695,0.037000,0.127000> rotate<0,-26.340373,0> translate<31.694000,-1.537000,10.096000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<30.834000,-1.537000,10.896000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<33.004000,-1.537000,11.596000>}
box{<0,0,-0.127000><2.280110,0.037000,0.127000> rotate<0,-17.877517,0> translate<30.834000,-1.537000,10.896000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<33.454000,-1.537000,12.286000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<31.184000,-1.537000,12.126000>}
box{<0,0,-0.127000><2.275632,0.037000,0.127000> rotate<0,-4.031535,0> translate<31.184000,-1.537000,12.126000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<30.674000,-1.537000,12.956000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<32.874000,-1.537000,12.986000>}
box{<0,0,-0.127000><2.200205,0.037000,0.127000> rotate<0,-0.781206,0> translate<30.674000,-1.537000,12.956000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<33.644000,-1.537000,13.576000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<31.244000,-1.537000,13.896000>}
box{<0,0,-0.127000><2.421239,0.037000,0.127000> rotate<0,7.594142,0> translate<31.244000,-1.537000,13.896000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<30.944000,-1.537000,14.956000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<33.164000,-1.537000,14.536000>}
box{<0,0,-0.127000><2.259380,0.037000,0.127000> rotate<0,10.712416,0> translate<30.944000,-1.537000,14.956000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<34.074000,-1.537000,14.876000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<31.854000,-1.537000,15.866000>}
box{<0,0,-0.127000><2.430741,0.037000,0.127000> rotate<0,24.032702,0> translate<31.854000,-1.537000,15.866000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<31.904000,-1.537000,16.836000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<33.914000,-1.537000,15.766000>}
box{<0,0,-0.127000><2.277060,0.037000,0.127000> rotate<0,28.026233,0> translate<31.904000,-1.537000,16.836000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<34.874000,-1.537000,15.976000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<33.044000,-1.537000,17.416000>}
box{<0,0,-0.127000><2.328626,0.037000,0.127000> rotate<0,38.196164,0> translate<33.044000,-1.537000,17.416000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<33.534000,-1.537000,18.626000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<35.084000,-1.537000,16.856000>}
box{<0,0,-0.127000><2.352743,0.037000,0.127000> rotate<0,48.787946,0> translate<33.534000,-1.537000,18.626000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<36.074000,-1.537000,16.806000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<34.714000,-1.537000,18.726000>}
box{<0,0,-0.127000><2.352871,0.037000,0.127000> rotate<0,54.685177,0> translate<34.714000,-1.537000,18.726000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<35.724000,-1.537000,19.746000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<36.554000,-1.537000,17.736000>}
box{<0,0,-0.127000><2.174626,0.037000,0.127000> rotate<0,67.558082,0> translate<35.724000,-1.537000,19.746000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<37.464000,-1.537000,17.336000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<36.954000,-1.537000,19.506000>}
box{<0,0,-0.127000><2.229125,0.037000,0.127000> rotate<0,76.769131,0> translate<36.954000,-1.537000,19.506000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<40.964000,-1.537000,16.266000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<42.494000,-1.537000,17.956000>}
box{<0,0,-0.127000><2.279693,0.037000,0.127000> rotate<0,-47.841498,0> translate<40.964000,-1.537000,16.266000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<42.064000,-1.537000,18.916000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<40.644000,-1.537000,17.076000>}
box{<0,0,-0.127000><2.324220,0.037000,0.127000> rotate<0,-52.337771,0> translate<40.644000,-1.537000,17.076000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<39.794000,-1.537000,17.016000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<40.904000,-1.537000,18.996000>}
box{<0,0,-0.127000><2.269912,0.037000,0.127000> rotate<0,-60.720738,0> translate<39.794000,-1.537000,17.016000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<40.214000,-1.537000,19.826000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<39.374000,-1.537000,17.896000>}
box{<0,0,-0.127000><2.104875,0.037000,0.127000> rotate<0,-66.475340,0> translate<39.374000,-1.537000,17.896000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<38.664000,-1.537000,17.286000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<39.044000,-1.537000,19.666000>}
box{<0,0,-0.127000><2.410145,0.037000,0.127000> rotate<0,-80.923161,0> translate<38.664000,-1.537000,17.286000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<38.054000,-1.537000,20.176000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<38.054000,-1.537000,18.086000>}
box{<0,0,-0.127000><2.090000,0.037000,0.127000> rotate<0,-90.000000,0> translate<38.054000,-1.537000,18.086000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<42.514000,-1.537000,13.716000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<44.844000,-1.537000,14.456000>}
box{<0,0,-0.127000><2.444688,0.037000,0.127000> rotate<0,-17.618507,0> translate<42.514000,-1.537000,13.716000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<18.554000,-1.537000,17.716000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<17.054000,-1.537000,16.216000>}
box{<0,0,-0.127000><2.121320,0.037000,0.127000> rotate<0,-44.997030,0> translate<17.054000,-1.537000,16.216000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<16.904000,-1.537000,15.096000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<18.824000,-1.537000,16.376000>}
box{<0,0,-0.127000><2.307553,0.037000,0.127000> rotate<0,-33.687844,0> translate<16.904000,-1.537000,15.096000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<19.894000,-1.537000,15.756000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<17.834000,-1.537000,14.716000>}
box{<0,0,-0.127000><2.307639,0.037000,0.127000> rotate<0,-26.785359,0> translate<17.834000,-1.537000,14.716000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<20.534000,-1.537000,13.226000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<18.234000,-1.537000,13.086000>}
box{<0,0,-0.127000><2.304257,0.037000,0.127000> rotate<0,-3.483042,0> translate<18.234000,-1.537000,13.086000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<17.514000,-1.537000,12.106000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<19.814000,-1.537000,11.966000>}
box{<0,0,-0.127000><2.304257,0.037000,0.127000> rotate<0,3.483042,0> translate<17.514000,-1.537000,12.106000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<20.214000,-1.537000,10.736000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<17.944000,-1.537000,11.246000>}
box{<0,0,-0.127000><2.326585,0.037000,0.127000> rotate<0,12.661528,0> translate<17.944000,-1.537000,11.246000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<17.064000,-1.537000,10.636000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<19.064000,-1.537000,9.696000>}
box{<0,0,-0.127000><2.209887,0.037000,0.127000> rotate<0,25.171863,0> translate<17.064000,-1.537000,10.636000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<19.124000,-1.537000,8.466000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<17.224000,-1.537000,9.586000>}
box{<0,0,-0.127000><2.205538,0.037000,0.127000> rotate<0,30.516217,0> translate<17.224000,-1.537000,9.586000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<16.124000,-1.537000,9.346000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<17.974000,-1.537000,7.796000>}
box{<0,0,-0.127000><2.413504,0.037000,0.127000> rotate<0,39.954912,0> translate<16.124000,-1.537000,9.346000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<17.144000,-1.537000,6.546000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<15.814000,-1.537000,8.346000>}
box{<0,0,-0.127000><2.238057,0.037000,0.127000> rotate<0,53.536183,0> translate<15.814000,-1.537000,8.346000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<14.794000,-1.537000,8.496000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<15.784000,-1.537000,6.406000>}
box{<0,0,-0.127000><2.312618,0.037000,0.127000> rotate<0,64.649557,0> translate<14.794000,-1.537000,8.496000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<15.084000,-1.537000,5.636000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<14.344000,-1.537000,7.766000>}
box{<0,0,-0.127000><2.254884,0.037000,0.127000> rotate<0,70.837186,0> translate<14.344000,-1.537000,7.766000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<13.424000,-1.537000,8.146000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<13.764000,-1.537000,5.876000>}
box{<0,0,-0.127000><2.295321,0.037000,0.127000> rotate<0,81.476200,0> translate<13.424000,-1.537000,8.146000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<12.834000,-1.537000,5.276000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<12.764000,-1.537000,7.506000>}
box{<0,0,-0.127000><2.231098,0.037000,0.127000> rotate<0,88.196247,0> translate<12.764000,-1.537000,7.506000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<12.064000,-1.537000,8.256000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<11.614000,-1.537000,5.956000>}
box{<0,0,-0.127000><2.343608,0.037000,0.127000> rotate<0,-78.924588,0> translate<11.614000,-1.537000,5.956000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<10.464000,-1.537000,5.906000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<11.204000,-1.537000,7.836000>}
box{<0,0,-0.127000><2.067003,0.037000,0.127000> rotate<0,-69.017638,0> translate<10.464000,-1.537000,5.906000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<10.644000,-1.537000,8.816000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<9.424000,-1.537000,6.726000>}
box{<0,0,-0.127000><2.420021,0.037000,0.127000> rotate<0,-59.722579,0> translate<9.424000,-1.537000,6.726000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<8.514000,-1.537000,6.916000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<9.684000,-1.537000,8.656000>}
box{<0,0,-0.127000><2.096783,0.037000,0.127000> rotate<0,-56.078868,0> translate<8.514000,-1.537000,6.916000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<9.554000,-1.537000,9.776000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<8.044000,-1.537000,8.196000>}
box{<0,0,-0.127000><2.185521,0.037000,0.127000> rotate<0,-46.294685,0> translate<8.044000,-1.537000,8.196000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<6.884000,-1.537000,8.656000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<8.614000,-1.537000,9.936000>}
box{<0,0,-0.127000><2.152046,0.037000,0.127000> rotate<0,-36.494752,0> translate<6.884000,-1.537000,8.656000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<8.754000,-1.537000,11.116000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<6.694000,-1.537000,10.096000>}
box{<0,0,-0.127000><2.298695,0.037000,0.127000> rotate<0,-26.340373,0> translate<6.694000,-1.537000,10.096000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<5.834000,-1.537000,10.896000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<8.004000,-1.537000,11.596000>}
box{<0,0,-0.127000><2.280110,0.037000,0.127000> rotate<0,-17.877517,0> translate<5.834000,-1.537000,10.896000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<8.454000,-1.537000,12.286000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<6.184000,-1.537000,12.126000>}
box{<0,0,-0.127000><2.275632,0.037000,0.127000> rotate<0,-4.031535,0> translate<6.184000,-1.537000,12.126000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<5.674000,-1.537000,12.956000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<7.874000,-1.537000,12.986000>}
box{<0,0,-0.127000><2.200205,0.037000,0.127000> rotate<0,-0.781206,0> translate<5.674000,-1.537000,12.956000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<8.644000,-1.537000,13.576000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<6.244000,-1.537000,13.896000>}
box{<0,0,-0.127000><2.421239,0.037000,0.127000> rotate<0,7.594142,0> translate<6.244000,-1.537000,13.896000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<5.944000,-1.537000,14.956000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<8.164000,-1.537000,14.536000>}
box{<0,0,-0.127000><2.259380,0.037000,0.127000> rotate<0,10.712416,0> translate<5.944000,-1.537000,14.956000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<9.074000,-1.537000,14.876000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<6.854000,-1.537000,15.866000>}
box{<0,0,-0.127000><2.430741,0.037000,0.127000> rotate<0,24.032702,0> translate<6.854000,-1.537000,15.866000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<6.904000,-1.537000,16.836000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<8.914000,-1.537000,15.766000>}
box{<0,0,-0.127000><2.277060,0.037000,0.127000> rotate<0,28.026233,0> translate<6.904000,-1.537000,16.836000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<9.874000,-1.537000,15.976000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<8.044000,-1.537000,17.416000>}
box{<0,0,-0.127000><2.328626,0.037000,0.127000> rotate<0,38.196164,0> translate<8.044000,-1.537000,17.416000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<8.534000,-1.537000,18.626000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<10.084000,-1.537000,16.856000>}
box{<0,0,-0.127000><2.352743,0.037000,0.127000> rotate<0,48.787946,0> translate<8.534000,-1.537000,18.626000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<11.074000,-1.537000,16.806000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<9.714000,-1.537000,18.726000>}
box{<0,0,-0.127000><2.352871,0.037000,0.127000> rotate<0,54.685177,0> translate<9.714000,-1.537000,18.726000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<10.724000,-1.537000,19.746000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<11.554000,-1.537000,17.736000>}
box{<0,0,-0.127000><2.174626,0.037000,0.127000> rotate<0,67.558082,0> translate<10.724000,-1.537000,19.746000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<12.464000,-1.537000,17.336000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<11.954000,-1.537000,19.506000>}
box{<0,0,-0.127000><2.229125,0.037000,0.127000> rotate<0,76.769131,0> translate<11.954000,-1.537000,19.506000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<15.964000,-1.537000,16.266000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<17.494000,-1.537000,17.956000>}
box{<0,0,-0.127000><2.279693,0.037000,0.127000> rotate<0,-47.841498,0> translate<15.964000,-1.537000,16.266000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<17.064000,-1.537000,18.916000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<15.644000,-1.537000,17.076000>}
box{<0,0,-0.127000><2.324220,0.037000,0.127000> rotate<0,-52.337771,0> translate<15.644000,-1.537000,17.076000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<14.794000,-1.537000,17.016000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<15.904000,-1.537000,18.996000>}
box{<0,0,-0.127000><2.269912,0.037000,0.127000> rotate<0,-60.720738,0> translate<14.794000,-1.537000,17.016000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<15.214000,-1.537000,19.826000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<14.374000,-1.537000,17.896000>}
box{<0,0,-0.127000><2.104875,0.037000,0.127000> rotate<0,-66.475340,0> translate<14.374000,-1.537000,17.896000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<13.664000,-1.537000,17.286000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<14.044000,-1.537000,19.666000>}
box{<0,0,-0.127000><2.410145,0.037000,0.127000> rotate<0,-80.923161,0> translate<13.664000,-1.537000,17.286000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<13.054000,-1.537000,20.176000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<13.054000,-1.537000,18.086000>}
box{<0,0,-0.127000><2.090000,0.037000,0.127000> rotate<0,-90.000000,0> translate<13.054000,-1.537000,18.086000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<17.514000,-1.537000,13.716000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<19.844000,-1.537000,14.456000>}
box{<0,0,-0.127000><2.444688,0.037000,0.127000> rotate<0,-17.618507,0> translate<17.514000,-1.537000,13.716000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<93.554000,-1.537000,42.716000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<92.054000,-1.537000,41.216000>}
box{<0,0,-0.127000><2.121320,0.037000,0.127000> rotate<0,-44.997030,0> translate<92.054000,-1.537000,41.216000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<91.904000,-1.537000,40.096000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<93.824000,-1.537000,41.376000>}
box{<0,0,-0.127000><2.307553,0.037000,0.127000> rotate<0,-33.687844,0> translate<91.904000,-1.537000,40.096000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<94.894000,-1.537000,40.756000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<92.834000,-1.537000,39.716000>}
box{<0,0,-0.127000><2.307639,0.037000,0.127000> rotate<0,-26.785359,0> translate<92.834000,-1.537000,39.716000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<95.534000,-1.537000,38.226000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<93.234000,-1.537000,38.086000>}
box{<0,0,-0.127000><2.304257,0.037000,0.127000> rotate<0,-3.483042,0> translate<93.234000,-1.537000,38.086000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<92.514000,-1.537000,37.106000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<94.814000,-1.537000,36.966000>}
box{<0,0,-0.127000><2.304257,0.037000,0.127000> rotate<0,3.483042,0> translate<92.514000,-1.537000,37.106000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<95.214000,-1.537000,35.736000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<92.944000,-1.537000,36.246000>}
box{<0,0,-0.127000><2.326585,0.037000,0.127000> rotate<0,12.661528,0> translate<92.944000,-1.537000,36.246000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<92.064000,-1.537000,35.636000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<94.064000,-1.537000,34.696000>}
box{<0,0,-0.127000><2.209887,0.037000,0.127000> rotate<0,25.171863,0> translate<92.064000,-1.537000,35.636000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<94.124000,-1.537000,33.466000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<92.224000,-1.537000,34.586000>}
box{<0,0,-0.127000><2.205538,0.037000,0.127000> rotate<0,30.516217,0> translate<92.224000,-1.537000,34.586000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<91.124000,-1.537000,34.346000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<92.974000,-1.537000,32.796000>}
box{<0,0,-0.127000><2.413504,0.037000,0.127000> rotate<0,39.954912,0> translate<91.124000,-1.537000,34.346000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<92.144000,-1.537000,31.546000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<90.814000,-1.537000,33.346000>}
box{<0,0,-0.127000><2.238057,0.037000,0.127000> rotate<0,53.536183,0> translate<90.814000,-1.537000,33.346000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<89.794000,-1.537000,33.496000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<90.784000,-1.537000,31.406000>}
box{<0,0,-0.127000><2.312618,0.037000,0.127000> rotate<0,64.649557,0> translate<89.794000,-1.537000,33.496000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<90.084000,-1.537000,30.636000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<89.344000,-1.537000,32.766000>}
box{<0,0,-0.127000><2.254884,0.037000,0.127000> rotate<0,70.837186,0> translate<89.344000,-1.537000,32.766000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<88.424000,-1.537000,33.146000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<88.764000,-1.537000,30.876000>}
box{<0,0,-0.127000><2.295321,0.037000,0.127000> rotate<0,81.476200,0> translate<88.424000,-1.537000,33.146000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<87.834000,-1.537000,30.276000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<87.764000,-1.537000,32.506000>}
box{<0,0,-0.127000><2.231098,0.037000,0.127000> rotate<0,88.196247,0> translate<87.764000,-1.537000,32.506000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<87.064000,-1.537000,33.256000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<86.614000,-1.537000,30.956000>}
box{<0,0,-0.127000><2.343608,0.037000,0.127000> rotate<0,-78.924588,0> translate<86.614000,-1.537000,30.956000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<85.464000,-1.537000,30.906000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<86.204000,-1.537000,32.836000>}
box{<0,0,-0.127000><2.067003,0.037000,0.127000> rotate<0,-69.017638,0> translate<85.464000,-1.537000,30.906000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<85.644000,-1.537000,33.816000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<84.424000,-1.537000,31.726000>}
box{<0,0,-0.127000><2.420021,0.037000,0.127000> rotate<0,-59.722579,0> translate<84.424000,-1.537000,31.726000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<83.514000,-1.537000,31.916000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<84.684000,-1.537000,33.656000>}
box{<0,0,-0.127000><2.096783,0.037000,0.127000> rotate<0,-56.078868,0> translate<83.514000,-1.537000,31.916000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<84.554000,-1.537000,34.776000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<83.044000,-1.537000,33.196000>}
box{<0,0,-0.127000><2.185521,0.037000,0.127000> rotate<0,-46.294685,0> translate<83.044000,-1.537000,33.196000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<81.884000,-1.537000,33.656000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<83.614000,-1.537000,34.936000>}
box{<0,0,-0.127000><2.152046,0.037000,0.127000> rotate<0,-36.494752,0> translate<81.884000,-1.537000,33.656000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<83.754000,-1.537000,36.116000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<81.694000,-1.537000,35.096000>}
box{<0,0,-0.127000><2.298695,0.037000,0.127000> rotate<0,-26.340373,0> translate<81.694000,-1.537000,35.096000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<80.834000,-1.537000,35.896000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<83.004000,-1.537000,36.596000>}
box{<0,0,-0.127000><2.280110,0.037000,0.127000> rotate<0,-17.877517,0> translate<80.834000,-1.537000,35.896000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<83.454000,-1.537000,37.286000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<81.184000,-1.537000,37.126000>}
box{<0,0,-0.127000><2.275632,0.037000,0.127000> rotate<0,-4.031535,0> translate<81.184000,-1.537000,37.126000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<80.674000,-1.537000,37.956000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<82.874000,-1.537000,37.986000>}
box{<0,0,-0.127000><2.200205,0.037000,0.127000> rotate<0,-0.781206,0> translate<80.674000,-1.537000,37.956000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<83.644000,-1.537000,38.576000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<81.244000,-1.537000,38.896000>}
box{<0,0,-0.127000><2.421239,0.037000,0.127000> rotate<0,7.594142,0> translate<81.244000,-1.537000,38.896000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<80.944000,-1.537000,39.956000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<83.164000,-1.537000,39.536000>}
box{<0,0,-0.127000><2.259380,0.037000,0.127000> rotate<0,10.712416,0> translate<80.944000,-1.537000,39.956000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<84.074000,-1.537000,39.876000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<81.854000,-1.537000,40.866000>}
box{<0,0,-0.127000><2.430741,0.037000,0.127000> rotate<0,24.032702,0> translate<81.854000,-1.537000,40.866000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<81.904000,-1.537000,41.836000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<83.914000,-1.537000,40.766000>}
box{<0,0,-0.127000><2.277060,0.037000,0.127000> rotate<0,28.026233,0> translate<81.904000,-1.537000,41.836000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<84.874000,-1.537000,40.976000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<83.044000,-1.537000,42.416000>}
box{<0,0,-0.127000><2.328626,0.037000,0.127000> rotate<0,38.196164,0> translate<83.044000,-1.537000,42.416000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<83.534000,-1.537000,43.626000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<85.084000,-1.537000,41.856000>}
box{<0,0,-0.127000><2.352743,0.037000,0.127000> rotate<0,48.787946,0> translate<83.534000,-1.537000,43.626000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<86.074000,-1.537000,41.806000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<84.714000,-1.537000,43.726000>}
box{<0,0,-0.127000><2.352871,0.037000,0.127000> rotate<0,54.685177,0> translate<84.714000,-1.537000,43.726000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<85.724000,-1.537000,44.746000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<86.554000,-1.537000,42.736000>}
box{<0,0,-0.127000><2.174626,0.037000,0.127000> rotate<0,67.558082,0> translate<85.724000,-1.537000,44.746000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<87.464000,-1.537000,42.336000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<86.954000,-1.537000,44.506000>}
box{<0,0,-0.127000><2.229125,0.037000,0.127000> rotate<0,76.769131,0> translate<86.954000,-1.537000,44.506000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<90.964000,-1.537000,41.266000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<92.494000,-1.537000,42.956000>}
box{<0,0,-0.127000><2.279693,0.037000,0.127000> rotate<0,-47.841498,0> translate<90.964000,-1.537000,41.266000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<92.064000,-1.537000,43.916000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<90.644000,-1.537000,42.076000>}
box{<0,0,-0.127000><2.324220,0.037000,0.127000> rotate<0,-52.337771,0> translate<90.644000,-1.537000,42.076000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<89.794000,-1.537000,42.016000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<90.904000,-1.537000,43.996000>}
box{<0,0,-0.127000><2.269912,0.037000,0.127000> rotate<0,-60.720738,0> translate<89.794000,-1.537000,42.016000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<90.214000,-1.537000,44.826000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<89.374000,-1.537000,42.896000>}
box{<0,0,-0.127000><2.104875,0.037000,0.127000> rotate<0,-66.475340,0> translate<89.374000,-1.537000,42.896000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<88.664000,-1.537000,42.286000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<89.044000,-1.537000,44.666000>}
box{<0,0,-0.127000><2.410145,0.037000,0.127000> rotate<0,-80.923161,0> translate<88.664000,-1.537000,42.286000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<88.054000,-1.537000,45.176000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<88.054000,-1.537000,43.086000>}
box{<0,0,-0.127000><2.090000,0.037000,0.127000> rotate<0,-90.000000,0> translate<88.054000,-1.537000,43.086000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<92.514000,-1.537000,38.716000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<94.844000,-1.537000,39.456000>}
box{<0,0,-0.127000><2.444688,0.037000,0.127000> rotate<0,-17.618507,0> translate<92.514000,-1.537000,38.716000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<68.554000,-1.537000,42.716000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<67.054000,-1.537000,41.216000>}
box{<0,0,-0.127000><2.121320,0.037000,0.127000> rotate<0,-44.997030,0> translate<67.054000,-1.537000,41.216000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<66.904000,-1.537000,40.096000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<68.824000,-1.537000,41.376000>}
box{<0,0,-0.127000><2.307553,0.037000,0.127000> rotate<0,-33.687844,0> translate<66.904000,-1.537000,40.096000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<69.894000,-1.537000,40.756000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<67.834000,-1.537000,39.716000>}
box{<0,0,-0.127000><2.307639,0.037000,0.127000> rotate<0,-26.785359,0> translate<67.834000,-1.537000,39.716000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<70.534000,-1.537000,38.226000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<68.234000,-1.537000,38.086000>}
box{<0,0,-0.127000><2.304257,0.037000,0.127000> rotate<0,-3.483042,0> translate<68.234000,-1.537000,38.086000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<67.514000,-1.537000,37.106000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<69.814000,-1.537000,36.966000>}
box{<0,0,-0.127000><2.304257,0.037000,0.127000> rotate<0,3.483042,0> translate<67.514000,-1.537000,37.106000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<70.214000,-1.537000,35.736000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<67.944000,-1.537000,36.246000>}
box{<0,0,-0.127000><2.326585,0.037000,0.127000> rotate<0,12.661528,0> translate<67.944000,-1.537000,36.246000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<67.064000,-1.537000,35.636000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<69.064000,-1.537000,34.696000>}
box{<0,0,-0.127000><2.209887,0.037000,0.127000> rotate<0,25.171863,0> translate<67.064000,-1.537000,35.636000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<69.124000,-1.537000,33.466000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<67.224000,-1.537000,34.586000>}
box{<0,0,-0.127000><2.205538,0.037000,0.127000> rotate<0,30.516217,0> translate<67.224000,-1.537000,34.586000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<66.124000,-1.537000,34.346000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<67.974000,-1.537000,32.796000>}
box{<0,0,-0.127000><2.413504,0.037000,0.127000> rotate<0,39.954912,0> translate<66.124000,-1.537000,34.346000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<67.144000,-1.537000,31.546000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<65.814000,-1.537000,33.346000>}
box{<0,0,-0.127000><2.238057,0.037000,0.127000> rotate<0,53.536183,0> translate<65.814000,-1.537000,33.346000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<64.794000,-1.537000,33.496000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<65.784000,-1.537000,31.406000>}
box{<0,0,-0.127000><2.312618,0.037000,0.127000> rotate<0,64.649557,0> translate<64.794000,-1.537000,33.496000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<65.084000,-1.537000,30.636000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<64.344000,-1.537000,32.766000>}
box{<0,0,-0.127000><2.254884,0.037000,0.127000> rotate<0,70.837186,0> translate<64.344000,-1.537000,32.766000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<63.424000,-1.537000,33.146000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<63.764000,-1.537000,30.876000>}
box{<0,0,-0.127000><2.295321,0.037000,0.127000> rotate<0,81.476200,0> translate<63.424000,-1.537000,33.146000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<62.834000,-1.537000,30.276000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<62.764000,-1.537000,32.506000>}
box{<0,0,-0.127000><2.231098,0.037000,0.127000> rotate<0,88.196247,0> translate<62.764000,-1.537000,32.506000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<62.064000,-1.537000,33.256000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<61.614000,-1.537000,30.956000>}
box{<0,0,-0.127000><2.343608,0.037000,0.127000> rotate<0,-78.924588,0> translate<61.614000,-1.537000,30.956000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<60.464000,-1.537000,30.906000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<61.204000,-1.537000,32.836000>}
box{<0,0,-0.127000><2.067003,0.037000,0.127000> rotate<0,-69.017638,0> translate<60.464000,-1.537000,30.906000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<60.644000,-1.537000,33.816000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<59.424000,-1.537000,31.726000>}
box{<0,0,-0.127000><2.420021,0.037000,0.127000> rotate<0,-59.722579,0> translate<59.424000,-1.537000,31.726000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<58.514000,-1.537000,31.916000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<59.684000,-1.537000,33.656000>}
box{<0,0,-0.127000><2.096783,0.037000,0.127000> rotate<0,-56.078868,0> translate<58.514000,-1.537000,31.916000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<59.554000,-1.537000,34.776000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<58.044000,-1.537000,33.196000>}
box{<0,0,-0.127000><2.185521,0.037000,0.127000> rotate<0,-46.294685,0> translate<58.044000,-1.537000,33.196000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<56.884000,-1.537000,33.656000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<58.614000,-1.537000,34.936000>}
box{<0,0,-0.127000><2.152046,0.037000,0.127000> rotate<0,-36.494752,0> translate<56.884000,-1.537000,33.656000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<58.754000,-1.537000,36.116000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<56.694000,-1.537000,35.096000>}
box{<0,0,-0.127000><2.298695,0.037000,0.127000> rotate<0,-26.340373,0> translate<56.694000,-1.537000,35.096000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<55.834000,-1.537000,35.896000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<58.004000,-1.537000,36.596000>}
box{<0,0,-0.127000><2.280110,0.037000,0.127000> rotate<0,-17.877517,0> translate<55.834000,-1.537000,35.896000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<58.454000,-1.537000,37.286000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<56.184000,-1.537000,37.126000>}
box{<0,0,-0.127000><2.275632,0.037000,0.127000> rotate<0,-4.031535,0> translate<56.184000,-1.537000,37.126000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<55.674000,-1.537000,37.956000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<57.874000,-1.537000,37.986000>}
box{<0,0,-0.127000><2.200205,0.037000,0.127000> rotate<0,-0.781206,0> translate<55.674000,-1.537000,37.956000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<58.644000,-1.537000,38.576000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<56.244000,-1.537000,38.896000>}
box{<0,0,-0.127000><2.421239,0.037000,0.127000> rotate<0,7.594142,0> translate<56.244000,-1.537000,38.896000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<55.944000,-1.537000,39.956000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<58.164000,-1.537000,39.536000>}
box{<0,0,-0.127000><2.259380,0.037000,0.127000> rotate<0,10.712416,0> translate<55.944000,-1.537000,39.956000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<59.074000,-1.537000,39.876000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<56.854000,-1.537000,40.866000>}
box{<0,0,-0.127000><2.430741,0.037000,0.127000> rotate<0,24.032702,0> translate<56.854000,-1.537000,40.866000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<56.904000,-1.537000,41.836000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<58.914000,-1.537000,40.766000>}
box{<0,0,-0.127000><2.277060,0.037000,0.127000> rotate<0,28.026233,0> translate<56.904000,-1.537000,41.836000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<59.874000,-1.537000,40.976000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<58.044000,-1.537000,42.416000>}
box{<0,0,-0.127000><2.328626,0.037000,0.127000> rotate<0,38.196164,0> translate<58.044000,-1.537000,42.416000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<58.534000,-1.537000,43.626000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<60.084000,-1.537000,41.856000>}
box{<0,0,-0.127000><2.352743,0.037000,0.127000> rotate<0,48.787946,0> translate<58.534000,-1.537000,43.626000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<61.074000,-1.537000,41.806000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<59.714000,-1.537000,43.726000>}
box{<0,0,-0.127000><2.352871,0.037000,0.127000> rotate<0,54.685177,0> translate<59.714000,-1.537000,43.726000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<60.724000,-1.537000,44.746000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<61.554000,-1.537000,42.736000>}
box{<0,0,-0.127000><2.174626,0.037000,0.127000> rotate<0,67.558082,0> translate<60.724000,-1.537000,44.746000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<62.464000,-1.537000,42.336000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<61.954000,-1.537000,44.506000>}
box{<0,0,-0.127000><2.229125,0.037000,0.127000> rotate<0,76.769131,0> translate<61.954000,-1.537000,44.506000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<65.964000,-1.537000,41.266000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<67.494000,-1.537000,42.956000>}
box{<0,0,-0.127000><2.279693,0.037000,0.127000> rotate<0,-47.841498,0> translate<65.964000,-1.537000,41.266000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<67.064000,-1.537000,43.916000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<65.644000,-1.537000,42.076000>}
box{<0,0,-0.127000><2.324220,0.037000,0.127000> rotate<0,-52.337771,0> translate<65.644000,-1.537000,42.076000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<64.794000,-1.537000,42.016000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<65.904000,-1.537000,43.996000>}
box{<0,0,-0.127000><2.269912,0.037000,0.127000> rotate<0,-60.720738,0> translate<64.794000,-1.537000,42.016000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<65.214000,-1.537000,44.826000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<64.374000,-1.537000,42.896000>}
box{<0,0,-0.127000><2.104875,0.037000,0.127000> rotate<0,-66.475340,0> translate<64.374000,-1.537000,42.896000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<63.664000,-1.537000,42.286000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<64.044000,-1.537000,44.666000>}
box{<0,0,-0.127000><2.410145,0.037000,0.127000> rotate<0,-80.923161,0> translate<63.664000,-1.537000,42.286000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<63.054000,-1.537000,45.176000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<63.054000,-1.537000,43.086000>}
box{<0,0,-0.127000><2.090000,0.037000,0.127000> rotate<0,-90.000000,0> translate<63.054000,-1.537000,43.086000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<67.514000,-1.537000,38.716000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<69.844000,-1.537000,39.456000>}
box{<0,0,-0.127000><2.444688,0.037000,0.127000> rotate<0,-17.618507,0> translate<67.514000,-1.537000,38.716000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<93.554000,-1.537000,17.716000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<92.054000,-1.537000,16.216000>}
box{<0,0,-0.127000><2.121320,0.037000,0.127000> rotate<0,-44.997030,0> translate<92.054000,-1.537000,16.216000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<91.904000,-1.537000,15.096000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<93.824000,-1.537000,16.376000>}
box{<0,0,-0.127000><2.307553,0.037000,0.127000> rotate<0,-33.687844,0> translate<91.904000,-1.537000,15.096000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<94.894000,-1.537000,15.756000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<92.834000,-1.537000,14.716000>}
box{<0,0,-0.127000><2.307639,0.037000,0.127000> rotate<0,-26.785359,0> translate<92.834000,-1.537000,14.716000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<95.534000,-1.537000,13.226000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<93.234000,-1.537000,13.086000>}
box{<0,0,-0.127000><2.304257,0.037000,0.127000> rotate<0,-3.483042,0> translate<93.234000,-1.537000,13.086000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<92.514000,-1.537000,12.106000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<94.814000,-1.537000,11.966000>}
box{<0,0,-0.127000><2.304257,0.037000,0.127000> rotate<0,3.483042,0> translate<92.514000,-1.537000,12.106000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<95.214000,-1.537000,10.736000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<92.944000,-1.537000,11.246000>}
box{<0,0,-0.127000><2.326585,0.037000,0.127000> rotate<0,12.661528,0> translate<92.944000,-1.537000,11.246000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<92.064000,-1.537000,10.636000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<94.064000,-1.537000,9.696000>}
box{<0,0,-0.127000><2.209887,0.037000,0.127000> rotate<0,25.171863,0> translate<92.064000,-1.537000,10.636000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<94.124000,-1.537000,8.466000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<92.224000,-1.537000,9.586000>}
box{<0,0,-0.127000><2.205538,0.037000,0.127000> rotate<0,30.516217,0> translate<92.224000,-1.537000,9.586000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<91.124000,-1.537000,9.346000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<92.974000,-1.537000,7.796000>}
box{<0,0,-0.127000><2.413504,0.037000,0.127000> rotate<0,39.954912,0> translate<91.124000,-1.537000,9.346000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<92.144000,-1.537000,6.546000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<90.814000,-1.537000,8.346000>}
box{<0,0,-0.127000><2.238057,0.037000,0.127000> rotate<0,53.536183,0> translate<90.814000,-1.537000,8.346000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<89.794000,-1.537000,8.496000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<90.784000,-1.537000,6.406000>}
box{<0,0,-0.127000><2.312618,0.037000,0.127000> rotate<0,64.649557,0> translate<89.794000,-1.537000,8.496000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<90.084000,-1.537000,5.636000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<89.344000,-1.537000,7.766000>}
box{<0,0,-0.127000><2.254884,0.037000,0.127000> rotate<0,70.837186,0> translate<89.344000,-1.537000,7.766000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<88.424000,-1.537000,8.146000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<88.764000,-1.537000,5.876000>}
box{<0,0,-0.127000><2.295321,0.037000,0.127000> rotate<0,81.476200,0> translate<88.424000,-1.537000,8.146000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<87.834000,-1.537000,5.276000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<87.764000,-1.537000,7.506000>}
box{<0,0,-0.127000><2.231098,0.037000,0.127000> rotate<0,88.196247,0> translate<87.764000,-1.537000,7.506000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<87.064000,-1.537000,8.256000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<86.614000,-1.537000,5.956000>}
box{<0,0,-0.127000><2.343608,0.037000,0.127000> rotate<0,-78.924588,0> translate<86.614000,-1.537000,5.956000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<85.464000,-1.537000,5.906000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<86.204000,-1.537000,7.836000>}
box{<0,0,-0.127000><2.067003,0.037000,0.127000> rotate<0,-69.017638,0> translate<85.464000,-1.537000,5.906000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<85.644000,-1.537000,8.816000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<84.424000,-1.537000,6.726000>}
box{<0,0,-0.127000><2.420021,0.037000,0.127000> rotate<0,-59.722579,0> translate<84.424000,-1.537000,6.726000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<83.514000,-1.537000,6.916000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<84.684000,-1.537000,8.656000>}
box{<0,0,-0.127000><2.096783,0.037000,0.127000> rotate<0,-56.078868,0> translate<83.514000,-1.537000,6.916000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<84.554000,-1.537000,9.776000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<83.044000,-1.537000,8.196000>}
box{<0,0,-0.127000><2.185521,0.037000,0.127000> rotate<0,-46.294685,0> translate<83.044000,-1.537000,8.196000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<81.884000,-1.537000,8.656000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<83.614000,-1.537000,9.936000>}
box{<0,0,-0.127000><2.152046,0.037000,0.127000> rotate<0,-36.494752,0> translate<81.884000,-1.537000,8.656000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<83.754000,-1.537000,11.116000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<81.694000,-1.537000,10.096000>}
box{<0,0,-0.127000><2.298695,0.037000,0.127000> rotate<0,-26.340373,0> translate<81.694000,-1.537000,10.096000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<80.834000,-1.537000,10.896000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<83.004000,-1.537000,11.596000>}
box{<0,0,-0.127000><2.280110,0.037000,0.127000> rotate<0,-17.877517,0> translate<80.834000,-1.537000,10.896000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<83.454000,-1.537000,12.286000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<81.184000,-1.537000,12.126000>}
box{<0,0,-0.127000><2.275632,0.037000,0.127000> rotate<0,-4.031535,0> translate<81.184000,-1.537000,12.126000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<80.674000,-1.537000,12.956000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<82.874000,-1.537000,12.986000>}
box{<0,0,-0.127000><2.200205,0.037000,0.127000> rotate<0,-0.781206,0> translate<80.674000,-1.537000,12.956000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<83.644000,-1.537000,13.576000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<81.244000,-1.537000,13.896000>}
box{<0,0,-0.127000><2.421239,0.037000,0.127000> rotate<0,7.594142,0> translate<81.244000,-1.537000,13.896000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<80.944000,-1.537000,14.956000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<83.164000,-1.537000,14.536000>}
box{<0,0,-0.127000><2.259380,0.037000,0.127000> rotate<0,10.712416,0> translate<80.944000,-1.537000,14.956000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<84.074000,-1.537000,14.876000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<81.854000,-1.537000,15.866000>}
box{<0,0,-0.127000><2.430741,0.037000,0.127000> rotate<0,24.032702,0> translate<81.854000,-1.537000,15.866000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<81.904000,-1.537000,16.836000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<83.914000,-1.537000,15.766000>}
box{<0,0,-0.127000><2.277060,0.037000,0.127000> rotate<0,28.026233,0> translate<81.904000,-1.537000,16.836000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<84.874000,-1.537000,15.976000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<83.044000,-1.537000,17.416000>}
box{<0,0,-0.127000><2.328626,0.037000,0.127000> rotate<0,38.196164,0> translate<83.044000,-1.537000,17.416000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<83.534000,-1.537000,18.626000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<85.084000,-1.537000,16.856000>}
box{<0,0,-0.127000><2.352743,0.037000,0.127000> rotate<0,48.787946,0> translate<83.534000,-1.537000,18.626000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<86.074000,-1.537000,16.806000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<84.714000,-1.537000,18.726000>}
box{<0,0,-0.127000><2.352871,0.037000,0.127000> rotate<0,54.685177,0> translate<84.714000,-1.537000,18.726000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<85.724000,-1.537000,19.746000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<86.554000,-1.537000,17.736000>}
box{<0,0,-0.127000><2.174626,0.037000,0.127000> rotate<0,67.558082,0> translate<85.724000,-1.537000,19.746000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<87.464000,-1.537000,17.336000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<86.954000,-1.537000,19.506000>}
box{<0,0,-0.127000><2.229125,0.037000,0.127000> rotate<0,76.769131,0> translate<86.954000,-1.537000,19.506000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<90.964000,-1.537000,16.266000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<92.494000,-1.537000,17.956000>}
box{<0,0,-0.127000><2.279693,0.037000,0.127000> rotate<0,-47.841498,0> translate<90.964000,-1.537000,16.266000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<92.064000,-1.537000,18.916000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<90.644000,-1.537000,17.076000>}
box{<0,0,-0.127000><2.324220,0.037000,0.127000> rotate<0,-52.337771,0> translate<90.644000,-1.537000,17.076000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<89.794000,-1.537000,17.016000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<90.904000,-1.537000,18.996000>}
box{<0,0,-0.127000><2.269912,0.037000,0.127000> rotate<0,-60.720738,0> translate<89.794000,-1.537000,17.016000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<90.214000,-1.537000,19.826000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<89.374000,-1.537000,17.896000>}
box{<0,0,-0.127000><2.104875,0.037000,0.127000> rotate<0,-66.475340,0> translate<89.374000,-1.537000,17.896000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<88.664000,-1.537000,17.286000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<89.044000,-1.537000,19.666000>}
box{<0,0,-0.127000><2.410145,0.037000,0.127000> rotate<0,-80.923161,0> translate<88.664000,-1.537000,17.286000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<88.054000,-1.537000,20.176000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<88.054000,-1.537000,18.086000>}
box{<0,0,-0.127000><2.090000,0.037000,0.127000> rotate<0,-90.000000,0> translate<88.054000,-1.537000,18.086000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<92.514000,-1.537000,13.716000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<94.844000,-1.537000,14.456000>}
box{<0,0,-0.127000><2.444688,0.037000,0.127000> rotate<0,-17.618507,0> translate<92.514000,-1.537000,13.716000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<68.554000,-1.537000,17.716000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<67.054000,-1.537000,16.216000>}
box{<0,0,-0.127000><2.121320,0.037000,0.127000> rotate<0,-44.997030,0> translate<67.054000,-1.537000,16.216000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<66.904000,-1.537000,15.096000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<68.824000,-1.537000,16.376000>}
box{<0,0,-0.127000><2.307553,0.037000,0.127000> rotate<0,-33.687844,0> translate<66.904000,-1.537000,15.096000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<69.894000,-1.537000,15.756000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<67.834000,-1.537000,14.716000>}
box{<0,0,-0.127000><2.307639,0.037000,0.127000> rotate<0,-26.785359,0> translate<67.834000,-1.537000,14.716000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<70.534000,-1.537000,13.226000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<68.234000,-1.537000,13.086000>}
box{<0,0,-0.127000><2.304257,0.037000,0.127000> rotate<0,-3.483042,0> translate<68.234000,-1.537000,13.086000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<67.514000,-1.537000,12.106000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<69.814000,-1.537000,11.966000>}
box{<0,0,-0.127000><2.304257,0.037000,0.127000> rotate<0,3.483042,0> translate<67.514000,-1.537000,12.106000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<70.214000,-1.537000,10.736000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<67.944000,-1.537000,11.246000>}
box{<0,0,-0.127000><2.326585,0.037000,0.127000> rotate<0,12.661528,0> translate<67.944000,-1.537000,11.246000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<67.064000,-1.537000,10.636000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<69.064000,-1.537000,9.696000>}
box{<0,0,-0.127000><2.209887,0.037000,0.127000> rotate<0,25.171863,0> translate<67.064000,-1.537000,10.636000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<69.124000,-1.537000,8.466000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<67.224000,-1.537000,9.586000>}
box{<0,0,-0.127000><2.205538,0.037000,0.127000> rotate<0,30.516217,0> translate<67.224000,-1.537000,9.586000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<66.124000,-1.537000,9.346000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<67.974000,-1.537000,7.796000>}
box{<0,0,-0.127000><2.413504,0.037000,0.127000> rotate<0,39.954912,0> translate<66.124000,-1.537000,9.346000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<67.144000,-1.537000,6.546000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<65.814000,-1.537000,8.346000>}
box{<0,0,-0.127000><2.238057,0.037000,0.127000> rotate<0,53.536183,0> translate<65.814000,-1.537000,8.346000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<64.794000,-1.537000,8.496000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<65.784000,-1.537000,6.406000>}
box{<0,0,-0.127000><2.312618,0.037000,0.127000> rotate<0,64.649557,0> translate<64.794000,-1.537000,8.496000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<65.084000,-1.537000,5.636000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<64.344000,-1.537000,7.766000>}
box{<0,0,-0.127000><2.254884,0.037000,0.127000> rotate<0,70.837186,0> translate<64.344000,-1.537000,7.766000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<63.424000,-1.537000,8.146000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<63.764000,-1.537000,5.876000>}
box{<0,0,-0.127000><2.295321,0.037000,0.127000> rotate<0,81.476200,0> translate<63.424000,-1.537000,8.146000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<62.834000,-1.537000,5.276000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<62.764000,-1.537000,7.506000>}
box{<0,0,-0.127000><2.231098,0.037000,0.127000> rotate<0,88.196247,0> translate<62.764000,-1.537000,7.506000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<62.064000,-1.537000,8.256000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<61.614000,-1.537000,5.956000>}
box{<0,0,-0.127000><2.343608,0.037000,0.127000> rotate<0,-78.924588,0> translate<61.614000,-1.537000,5.956000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<60.464000,-1.537000,5.906000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<61.204000,-1.537000,7.836000>}
box{<0,0,-0.127000><2.067003,0.037000,0.127000> rotate<0,-69.017638,0> translate<60.464000,-1.537000,5.906000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<60.644000,-1.537000,8.816000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<59.424000,-1.537000,6.726000>}
box{<0,0,-0.127000><2.420021,0.037000,0.127000> rotate<0,-59.722579,0> translate<59.424000,-1.537000,6.726000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<58.514000,-1.537000,6.916000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<59.684000,-1.537000,8.656000>}
box{<0,0,-0.127000><2.096783,0.037000,0.127000> rotate<0,-56.078868,0> translate<58.514000,-1.537000,6.916000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<59.554000,-1.537000,9.776000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<58.044000,-1.537000,8.196000>}
box{<0,0,-0.127000><2.185521,0.037000,0.127000> rotate<0,-46.294685,0> translate<58.044000,-1.537000,8.196000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<56.884000,-1.537000,8.656000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<58.614000,-1.537000,9.936000>}
box{<0,0,-0.127000><2.152046,0.037000,0.127000> rotate<0,-36.494752,0> translate<56.884000,-1.537000,8.656000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<58.754000,-1.537000,11.116000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<56.694000,-1.537000,10.096000>}
box{<0,0,-0.127000><2.298695,0.037000,0.127000> rotate<0,-26.340373,0> translate<56.694000,-1.537000,10.096000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<55.834000,-1.537000,10.896000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<58.004000,-1.537000,11.596000>}
box{<0,0,-0.127000><2.280110,0.037000,0.127000> rotate<0,-17.877517,0> translate<55.834000,-1.537000,10.896000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<58.454000,-1.537000,12.286000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<56.184000,-1.537000,12.126000>}
box{<0,0,-0.127000><2.275632,0.037000,0.127000> rotate<0,-4.031535,0> translate<56.184000,-1.537000,12.126000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<55.674000,-1.537000,12.956000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<57.874000,-1.537000,12.986000>}
box{<0,0,-0.127000><2.200205,0.037000,0.127000> rotate<0,-0.781206,0> translate<55.674000,-1.537000,12.956000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<58.644000,-1.537000,13.576000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<56.244000,-1.537000,13.896000>}
box{<0,0,-0.127000><2.421239,0.037000,0.127000> rotate<0,7.594142,0> translate<56.244000,-1.537000,13.896000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<55.944000,-1.537000,14.956000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<58.164000,-1.537000,14.536000>}
box{<0,0,-0.127000><2.259380,0.037000,0.127000> rotate<0,10.712416,0> translate<55.944000,-1.537000,14.956000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<59.074000,-1.537000,14.876000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<56.854000,-1.537000,15.866000>}
box{<0,0,-0.127000><2.430741,0.037000,0.127000> rotate<0,24.032702,0> translate<56.854000,-1.537000,15.866000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<56.904000,-1.537000,16.836000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<58.914000,-1.537000,15.766000>}
box{<0,0,-0.127000><2.277060,0.037000,0.127000> rotate<0,28.026233,0> translate<56.904000,-1.537000,16.836000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<59.874000,-1.537000,15.976000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<58.044000,-1.537000,17.416000>}
box{<0,0,-0.127000><2.328626,0.037000,0.127000> rotate<0,38.196164,0> translate<58.044000,-1.537000,17.416000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<58.534000,-1.537000,18.626000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<60.084000,-1.537000,16.856000>}
box{<0,0,-0.127000><2.352743,0.037000,0.127000> rotate<0,48.787946,0> translate<58.534000,-1.537000,18.626000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<61.074000,-1.537000,16.806000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<59.714000,-1.537000,18.726000>}
box{<0,0,-0.127000><2.352871,0.037000,0.127000> rotate<0,54.685177,0> translate<59.714000,-1.537000,18.726000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<60.724000,-1.537000,19.746000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<61.554000,-1.537000,17.736000>}
box{<0,0,-0.127000><2.174626,0.037000,0.127000> rotate<0,67.558082,0> translate<60.724000,-1.537000,19.746000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<62.464000,-1.537000,17.336000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<61.954000,-1.537000,19.506000>}
box{<0,0,-0.127000><2.229125,0.037000,0.127000> rotate<0,76.769131,0> translate<61.954000,-1.537000,19.506000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<65.964000,-1.537000,16.266000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<67.494000,-1.537000,17.956000>}
box{<0,0,-0.127000><2.279693,0.037000,0.127000> rotate<0,-47.841498,0> translate<65.964000,-1.537000,16.266000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<67.064000,-1.537000,18.916000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<65.644000,-1.537000,17.076000>}
box{<0,0,-0.127000><2.324220,0.037000,0.127000> rotate<0,-52.337771,0> translate<65.644000,-1.537000,17.076000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<64.794000,-1.537000,17.016000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<65.904000,-1.537000,18.996000>}
box{<0,0,-0.127000><2.269912,0.037000,0.127000> rotate<0,-60.720738,0> translate<64.794000,-1.537000,17.016000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<65.214000,-1.537000,19.826000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<64.374000,-1.537000,17.896000>}
box{<0,0,-0.127000><2.104875,0.037000,0.127000> rotate<0,-66.475340,0> translate<64.374000,-1.537000,17.896000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<63.664000,-1.537000,17.286000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<64.044000,-1.537000,19.666000>}
box{<0,0,-0.127000><2.410145,0.037000,0.127000> rotate<0,-80.923161,0> translate<63.664000,-1.537000,17.286000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<63.054000,-1.537000,20.176000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<63.054000,-1.537000,18.086000>}
box{<0,0,-0.127000><2.090000,0.037000,0.127000> rotate<0,-90.000000,0> translate<63.054000,-1.537000,18.086000> }
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<67.514000,-1.537000,13.716000>}
cylinder{<0,0,0><0,0.037000,0>0.127000 translate<69.844000,-1.537000,14.456000>}
box{<0,0,-0.127000><2.444688,0.037000,0.127000> rotate<0,-17.618507,0> translate<67.514000,-1.537000,13.716000> }
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
cylinder{<54.054000,0.038000,25.146000><54.054000,-1.538000,25.146000>0.400000}
cylinder{<48.054000,0.038000,25.146000><48.054000,-1.538000,25.146000>0.400000}
cylinder{<54.054000,0.038000,7.366000><54.054000,-1.538000,7.366000>0.400000}
cylinder{<48.054000,0.038000,7.366000><48.054000,-1.538000,7.366000>0.400000}
cylinder{<27.384000,0.038000,25.146000><27.384000,-1.538000,25.146000>0.400000}
cylinder{<21.384000,0.038000,25.146000><21.384000,-1.538000,25.146000>0.400000}
cylinder{<27.384000,0.038000,7.366000><27.384000,-1.538000,7.366000>0.400000}
cylinder{<21.384000,0.038000,7.366000><21.384000,-1.538000,7.366000>0.400000}
cylinder{<98.604000,0.038000,25.266000><98.604000,-1.538000,25.266000>0.400000}
cylinder{<92.604000,0.038000,25.266000><92.604000,-1.538000,25.266000>0.400000}
cylinder{<92.154000,0.038000,2.286000><92.154000,-1.538000,2.286000>0.400000}
cylinder{<86.154000,0.038000,2.286000><86.154000,-1.538000,2.286000>0.400000}
cylinder{<78.184000,0.038000,25.146000><78.184000,-1.538000,25.146000>0.400000}
cylinder{<72.184000,0.038000,25.146000><72.184000,-1.538000,25.146000>0.400000}
cylinder{<78.184000,0.038000,7.366000><78.184000,-1.538000,7.366000>0.400000}
cylinder{<72.184000,0.038000,7.366000><72.184000,-1.538000,7.366000>0.400000}
cylinder{<3.429000,0.038000,30.226000><3.429000,-1.538000,30.226000>0.508000}
cylinder{<3.429000,0.038000,32.766000><3.429000,-1.538000,32.766000>0.508000}
cylinder{<3.429000,0.038000,35.306000><3.429000,-1.538000,35.306000>0.508000}
cylinder{<3.429000,0.038000,37.846000><3.429000,-1.538000,37.846000>0.508000}
cylinder{<3.429000,0.038000,12.446000><3.429000,-1.538000,12.446000>0.508000}
cylinder{<3.429000,0.038000,14.986000><3.429000,-1.538000,14.986000>0.508000}
cylinder{<3.429000,0.038000,17.526000><3.429000,-1.538000,17.526000>0.508000}
cylinder{<3.429000,0.038000,20.066000><3.429000,-1.538000,20.066000>0.508000}
cylinder{<25.654000,0.038000,46.736000><25.654000,-1.538000,46.736000>0.508000}
cylinder{<28.194000,0.038000,46.736000><28.194000,-1.538000,46.736000>0.508000}
cylinder{<20.574000,0.038000,46.736000><20.574000,-1.538000,46.736000>0.508000}
cylinder{<23.114000,0.038000,46.736000><23.114000,-1.538000,46.736000>0.508000}
cylinder{<76.454000,0.038000,46.736000><76.454000,-1.538000,46.736000>0.508000}
cylinder{<78.994000,0.038000,46.736000><78.994000,-1.538000,46.736000>0.508000}
cylinder{<71.374000,0.038000,46.736000><71.374000,-1.538000,46.736000>0.508000}
cylinder{<73.914000,0.038000,46.736000><73.914000,-1.538000,46.736000>0.508000}
cylinder{<36.754000,0.038000,12.716000><36.754000,-1.538000,12.716000>0.500000}
cylinder{<11.754000,0.038000,12.716000><11.754000,-1.538000,12.716000>0.500000}
cylinder{<36.754000,0.038000,37.716000><36.754000,-1.538000,37.716000>0.500000}
cylinder{<11.754000,0.038000,37.716000><11.754000,-1.538000,37.716000>0.500000}
cylinder{<38.754000,0.038000,12.716000><38.754000,-1.538000,12.716000>0.500000}
cylinder{<13.754000,0.038000,12.716000><13.754000,-1.538000,12.716000>0.500000}
cylinder{<38.754000,0.038000,37.716000><38.754000,-1.538000,37.716000>0.500000}
cylinder{<13.754000,0.038000,37.716000><13.754000,-1.538000,37.716000>0.500000}
cylinder{<34.754000,0.038000,12.716000><34.754000,-1.538000,12.716000>0.500000}
cylinder{<9.754000,0.038000,12.716000><9.754000,-1.538000,12.716000>0.500000}
cylinder{<34.754000,0.038000,37.716000><34.754000,-1.538000,37.716000>0.500000}
cylinder{<9.754000,0.038000,37.716000><9.754000,-1.538000,37.716000>0.500000}
cylinder{<40.754000,0.038000,12.716000><40.754000,-1.538000,12.716000>0.500000}
cylinder{<15.754000,0.038000,12.716000><15.754000,-1.538000,12.716000>0.500000}
cylinder{<40.754000,0.038000,37.716000><40.754000,-1.538000,37.716000>0.500000}
cylinder{<15.754000,0.038000,37.716000><15.754000,-1.538000,37.716000>0.500000}
cylinder{<44.966000,0.038000,15.729000><44.966000,-1.538000,15.729000>0.300000}
cylinder{<42.426000,0.038000,13.697000><42.426000,-1.538000,13.697000>0.300000}
cylinder{<19.966000,0.038000,15.729000><19.966000,-1.538000,15.729000>0.300000}
cylinder{<17.426000,0.038000,13.697000><17.426000,-1.538000,13.697000>0.300000}
cylinder{<44.966000,0.038000,40.729000><44.966000,-1.538000,40.729000>0.300000}
cylinder{<42.426000,0.038000,38.697000><42.426000,-1.538000,38.697000>0.300000}
cylinder{<19.966000,0.038000,40.729000><19.966000,-1.538000,40.729000>0.300000}
cylinder{<17.426000,0.038000,38.697000><17.426000,-1.538000,38.697000>0.300000}
cylinder{<86.754000,0.038000,12.716000><86.754000,-1.538000,12.716000>0.500000}
cylinder{<61.754000,0.038000,12.716000><61.754000,-1.538000,12.716000>0.500000}
cylinder{<86.754000,0.038000,37.716000><86.754000,-1.538000,37.716000>0.500000}
cylinder{<61.754000,0.038000,37.716000><61.754000,-1.538000,37.716000>0.500000}
cylinder{<88.754000,0.038000,12.716000><88.754000,-1.538000,12.716000>0.500000}
cylinder{<63.754000,0.038000,12.716000><63.754000,-1.538000,12.716000>0.500000}
cylinder{<88.754000,0.038000,37.716000><88.754000,-1.538000,37.716000>0.500000}
cylinder{<63.754000,0.038000,37.716000><63.754000,-1.538000,37.716000>0.500000}
cylinder{<84.754000,0.038000,12.716000><84.754000,-1.538000,12.716000>0.500000}
cylinder{<59.754000,0.038000,12.716000><59.754000,-1.538000,12.716000>0.500000}
cylinder{<84.754000,0.038000,37.716000><84.754000,-1.538000,37.716000>0.500000}
cylinder{<59.754000,0.038000,37.716000><59.754000,-1.538000,37.716000>0.500000}
cylinder{<90.754000,0.038000,12.716000><90.754000,-1.538000,12.716000>0.500000}
cylinder{<65.754000,0.038000,12.716000><65.754000,-1.538000,12.716000>0.500000}
cylinder{<90.754000,0.038000,37.716000><90.754000,-1.538000,37.716000>0.500000}
cylinder{<65.754000,0.038000,37.716000><65.754000,-1.538000,37.716000>0.500000}
cylinder{<94.966000,0.038000,15.729000><94.966000,-1.538000,15.729000>0.300000}
cylinder{<92.426000,0.038000,13.697000><92.426000,-1.538000,13.697000>0.300000}
cylinder{<69.966000,0.038000,15.729000><69.966000,-1.538000,15.729000>0.300000}
cylinder{<67.426000,0.038000,13.697000><67.426000,-1.538000,13.697000>0.300000}
cylinder{<94.966000,0.038000,40.729000><94.966000,-1.538000,40.729000>0.300000}
cylinder{<92.426000,0.038000,38.697000><92.426000,-1.538000,38.697000>0.300000}
cylinder{<69.966000,0.038000,40.729000><69.966000,-1.538000,40.729000>0.300000}
cylinder{<67.426000,0.038000,38.697000><67.426000,-1.538000,38.697000>0.300000}
//Holes(fast)/Vias
cylinder{<34.544000,0.038000,46.736000><34.544000,-1.538000,46.736000>0.300000 }
cylinder{<61.214000,0.038000,46.736000><61.214000,-1.538000,46.736000>0.300000 }
cylinder{<85.344000,0.038000,46.736000><85.344000,-1.538000,46.736000>0.300000 }
cylinder{<11.684000,0.038000,46.736000><11.684000,-1.538000,46.736000>0.300000 }
cylinder{<35.814000,0.038000,21.336000><35.814000,-1.538000,21.336000>0.300000 }
cylinder{<61.214000,0.038000,21.336000><61.214000,-1.538000,21.336000>0.300000 }
cylinder{<85.344000,0.038000,21.336000><85.344000,-1.538000,21.336000>0.300000 }
cylinder{<32.004000,0.038000,46.736000><32.004000,-1.538000,46.736000>0.300000 }
cylinder{<58.674000,0.038000,46.736000><58.674000,-1.538000,46.736000>0.300000 }
cylinder{<9.144000,0.038000,46.736000><9.144000,-1.538000,46.736000>0.300000 }
cylinder{<82.804000,0.038000,46.736000><82.804000,-1.538000,46.736000>0.300000 }
cylinder{<81.534000,0.038000,22.606000><81.534000,-1.538000,22.606000>0.300000 }
cylinder{<57.404000,0.038000,22.606000><57.404000,-1.538000,22.606000>0.300000 }
cylinder{<32.004000,0.038000,22.606000><32.004000,-1.538000,22.606000>0.300000 }
cylinder{<43.434000,0.038000,27.686000><43.434000,-1.538000,27.686000>0.300000 }
cylinder{<42.418000,0.038000,4.953000><42.418000,-1.538000,4.953000>0.300000 }
cylinder{<17.399000,0.038000,27.559000><17.399000,-1.538000,27.559000>0.300000 }
cylinder{<17.399000,0.038000,5.207000><17.399000,-1.538000,5.207000>0.300000 }
cylinder{<67.564000,0.038000,27.686000><67.564000,-1.538000,27.686000>0.300000 }
cylinder{<67.437000,0.038000,4.826000><67.437000,-1.538000,4.826000>0.300000 }
cylinder{<16.764000,0.038000,25.146000><16.764000,-1.538000,25.146000>0.300000 }
cylinder{<42.164000,0.038000,25.146000><42.164000,-1.538000,25.146000>0.300000 }
cylinder{<66.294000,0.038000,25.146000><66.294000,-1.538000,25.146000>0.300000 }
cylinder{<90.805000,0.038000,27.686000><90.805000,-1.538000,27.686000>0.300000 }
cylinder{<66.040000,0.038000,0.254000><66.040000,-1.538000,0.254000>0.300000 }
cylinder{<41.402000,0.038000,0.254000><41.402000,-1.538000,0.254000>0.300000 }
cylinder{<16.002000,0.038000,0.254000><16.002000,-1.538000,0.254000>0.300000 }
cylinder{<90.043000,0.038000,0.254000><90.043000,-1.538000,0.254000>0.300000 }
cylinder{<44.704000,0.038000,28.956000><44.704000,-1.538000,28.956000>0.300000 }
cylinder{<19.939000,0.038000,28.956000><19.939000,-1.538000,28.956000>0.300000 }
cylinder{<70.104000,0.038000,28.956000><70.104000,-1.538000,28.956000>0.300000 }
cylinder{<94.996000,0.038000,28.956000><94.996000,-1.538000,28.956000>0.300000 }
cylinder{<20.066000,0.038000,3.556000><20.066000,-1.538000,3.556000>0.300000 }
cylinder{<43.434000,0.038000,3.556000><43.434000,-1.538000,3.556000>0.300000 }
cylinder{<69.977000,0.038000,3.556000><69.977000,-1.538000,3.556000>0.300000 }
cylinder{<94.234000,0.038000,3.556000><94.234000,-1.538000,3.556000>0.300000 }
cylinder{<90.424000,0.038000,48.006000><90.424000,-1.538000,48.006000>0.300000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,16.941800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,18.263700>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<6.654800,0.000000,18.263700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,18.263700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,18.263700>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<6.654800,0.000000,18.263700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,18.263700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,18.043400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<7.315700,0.000000,18.263700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,18.043400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,17.823000>}
box{<0,0,-0.050800><0.220400,0.036000,0.050800> rotate<0,-90.000000,0> translate<7.536000,0.000000,17.823000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,17.823000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,17.602700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<7.315700,0.000000,17.602700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,17.602700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,17.382400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<7.315700,0.000000,17.602700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,17.382400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,17.162100>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<7.536000,0.000000,17.162100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,17.162100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,16.941800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<7.315700,0.000000,16.941800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,16.941800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,16.941800>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<6.654800,0.000000,16.941800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,17.602700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,17.602700>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<6.654800,0.000000,17.602700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,18.263700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,16.941800>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<7.964500,0.000000,16.941800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,16.941800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.845700,0.000000,16.941800>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<7.964500,0.000000,16.941800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,18.263700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,17.162100>}
box{<0,0,-0.050800><1.101600,0.036000,0.050800> rotate<0,-90.000000,0> translate<9.274200,0.000000,17.162100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,17.162100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.494500,0.000000,16.941800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<9.274200,0.000000,17.162100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.494500,0.000000,16.941800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.935100,0.000000,16.941800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<9.494500,0.000000,16.941800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.935100,0.000000,16.941800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.155400,0.000000,17.162100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<9.935100,0.000000,16.941800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.155400,0.000000,17.162100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.155400,0.000000,18.263700>}
box{<0,0,-0.050800><1.101600,0.036000,0.050800> rotate<0,90.000000,0> translate<10.155400,0.000000,18.263700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.465100,0.000000,18.263700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.583900,0.000000,18.263700>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<10.583900,0.000000,18.263700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.583900,0.000000,18.263700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.583900,0.000000,16.941800>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<10.583900,0.000000,16.941800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.583900,0.000000,16.941800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.465100,0.000000,16.941800>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<10.583900,0.000000,16.941800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.583900,0.000000,17.602700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.024500,0.000000,17.602700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<10.583900,0.000000,17.602700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.893600,0.000000,18.043400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.113900,0.000000,18.263700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<11.893600,0.000000,18.043400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.113900,0.000000,18.263700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.554500,0.000000,18.263700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<12.113900,0.000000,18.263700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.554500,0.000000,18.263700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.774800,0.000000,18.043400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<12.554500,0.000000,18.263700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.774800,0.000000,18.043400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.774800,0.000000,17.823000>}
box{<0,0,-0.050800><0.220400,0.036000,0.050800> rotate<0,-90.000000,0> translate<12.774800,0.000000,17.823000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.774800,0.000000,17.823000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.554500,0.000000,17.602700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<12.554500,0.000000,17.602700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.554500,0.000000,17.602700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.334200,0.000000,17.602700>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<12.334200,0.000000,17.602700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.554500,0.000000,17.602700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.774800,0.000000,17.382400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<12.554500,0.000000,17.602700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.774800,0.000000,17.382400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.774800,0.000000,17.162100>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<12.774800,0.000000,17.162100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.774800,0.000000,17.162100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.554500,0.000000,16.941800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<12.554500,0.000000,16.941800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.554500,0.000000,16.941800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.113900,0.000000,16.941800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<12.113900,0.000000,16.941800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.113900,0.000000,16.941800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.893600,0.000000,17.162100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<11.893600,0.000000,17.162100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,14.401800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,15.723700>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<6.654800,0.000000,15.723700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,15.723700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,15.723700>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<6.654800,0.000000,15.723700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,15.723700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,15.503400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<7.315700,0.000000,15.723700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,15.503400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,15.062700>}
box{<0,0,-0.050800><0.440700,0.036000,0.050800> rotate<0,-90.000000,0> translate<7.536000,0.000000,15.062700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,15.062700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,14.842400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<7.315700,0.000000,14.842400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,14.842400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,14.842400>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<6.654800,0.000000,14.842400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.095400,0.000000,14.842400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,14.401800>}
box{<0,0,-0.050800><0.623102,0.036000,0.050800> rotate<0,44.997030,0> translate<7.095400,0.000000,14.842400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.845700,0.000000,15.723700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,15.723700>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<7.964500,0.000000,15.723700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,15.723700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,14.401800>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<7.964500,0.000000,14.401800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,14.401800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.845700,0.000000,14.401800>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<7.964500,0.000000,14.401800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,15.062700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.405100,0.000000,15.062700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<7.964500,0.000000,15.062700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,15.723700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,14.401800>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<9.274200,0.000000,14.401800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,14.401800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.935100,0.000000,14.401800>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<9.274200,0.000000,14.401800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.935100,0.000000,14.401800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.155400,0.000000,14.622100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<9.935100,0.000000,14.401800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.155400,0.000000,14.622100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.155400,0.000000,15.503400>}
box{<0,0,-0.050800><0.881300,0.036000,0.050800> rotate<0,90.000000,0> translate<10.155400,0.000000,15.503400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.155400,0.000000,15.503400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.935100,0.000000,15.723700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<9.935100,0.000000,15.723700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.935100,0.000000,15.723700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,15.723700>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<9.274200,0.000000,15.723700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.583900,0.000000,15.503400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.804200,0.000000,15.723700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<10.583900,0.000000,15.503400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.804200,0.000000,15.723700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.244800,0.000000,15.723700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<10.804200,0.000000,15.723700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.244800,0.000000,15.723700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.465100,0.000000,15.503400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<11.244800,0.000000,15.723700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.465100,0.000000,15.503400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.465100,0.000000,15.283000>}
box{<0,0,-0.050800><0.220400,0.036000,0.050800> rotate<0,-90.000000,0> translate<11.465100,0.000000,15.283000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.465100,0.000000,15.283000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.244800,0.000000,15.062700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<11.244800,0.000000,15.062700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.244800,0.000000,15.062700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.024500,0.000000,15.062700>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<11.024500,0.000000,15.062700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.244800,0.000000,15.062700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.465100,0.000000,14.842400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<11.244800,0.000000,15.062700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.465100,0.000000,14.842400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.465100,0.000000,14.622100>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<11.465100,0.000000,14.622100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.465100,0.000000,14.622100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.244800,0.000000,14.401800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<11.244800,0.000000,14.401800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.244800,0.000000,14.401800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.804200,0.000000,14.401800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<10.804200,0.000000,14.401800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.804200,0.000000,14.401800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.583900,0.000000,14.622100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<10.583900,0.000000,14.622100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,11.185400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,11.405700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<7.315700,0.000000,11.405700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,11.405700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.875100,0.000000,11.405700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<6.875100,0.000000,11.405700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.875100,0.000000,11.405700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,11.185400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<6.654800,0.000000,11.185400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,11.185400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,10.965000>}
box{<0,0,-0.050800><0.220400,0.036000,0.050800> rotate<0,-90.000000,0> translate<6.654800,0.000000,10.965000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,10.965000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.875100,0.000000,10.744700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<6.654800,0.000000,10.965000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.875100,0.000000,10.744700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,10.744700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<6.875100,0.000000,10.744700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,10.744700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,10.524400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<7.315700,0.000000,10.744700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,10.524400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,10.304100>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<7.536000,0.000000,10.304100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,10.304100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,10.083800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<7.315700,0.000000,10.083800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,10.083800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.875100,0.000000,10.083800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<6.875100,0.000000,10.083800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.875100,0.000000,10.083800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,10.304100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<6.654800,0.000000,10.304100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,11.405700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,10.083800>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<7.964500,0.000000,10.083800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,10.083800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.405100,0.000000,10.524400>}
box{<0,0,-0.050800><0.623102,0.036000,0.050800> rotate<0,-44.997030,0> translate<7.964500,0.000000,10.083800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.405100,0.000000,10.524400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.845700,0.000000,10.083800>}
box{<0,0,-0.050800><0.623102,0.036000,0.050800> rotate<0,44.997030,0> translate<8.405100,0.000000,10.524400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.845700,0.000000,10.083800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.845700,0.000000,11.405700>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<8.845700,0.000000,11.405700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,10.083800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.714800,0.000000,10.083800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<9.274200,0.000000,10.083800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.494500,0.000000,10.083800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.494500,0.000000,11.405700>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<9.494500,0.000000,11.405700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,11.405700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.714800,0.000000,11.405700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<9.274200,0.000000,11.405700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.587900,0.000000,10.083800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.587900,0.000000,11.405700>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<10.587900,0.000000,11.405700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.147300,0.000000,11.405700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.028500,0.000000,11.405700>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<10.147300,0.000000,11.405700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.338200,0.000000,11.185400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.117900,0.000000,11.405700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<12.117900,0.000000,11.405700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.117900,0.000000,11.405700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.677300,0.000000,11.405700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<11.677300,0.000000,11.405700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.677300,0.000000,11.405700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.457000,0.000000,11.185400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<11.457000,0.000000,11.185400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.457000,0.000000,11.185400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.457000,0.000000,10.304100>}
box{<0,0,-0.050800><0.881300,0.036000,0.050800> rotate<0,-90.000000,0> translate<11.457000,0.000000,10.304100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.457000,0.000000,10.304100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.677300,0.000000,10.083800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<11.457000,0.000000,10.304100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.677300,0.000000,10.083800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.117900,0.000000,10.083800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<11.677300,0.000000,10.083800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.117900,0.000000,10.083800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.338200,0.000000,10.304100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<12.117900,0.000000,10.083800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.766700,0.000000,10.083800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.766700,0.000000,11.405700>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<12.766700,0.000000,11.405700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.766700,0.000000,10.744700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.647900,0.000000,10.744700>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<12.766700,0.000000,10.744700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.647900,0.000000,11.405700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.647900,0.000000,10.083800>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<13.647900,0.000000,10.083800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.076400,0.000000,11.185400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.296700,0.000000,11.405700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<14.076400,0.000000,11.185400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.296700,0.000000,11.405700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.737300,0.000000,11.405700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<14.296700,0.000000,11.405700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.737300,0.000000,11.405700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.957600,0.000000,11.185400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<14.737300,0.000000,11.405700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.957600,0.000000,11.185400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.957600,0.000000,10.965000>}
box{<0,0,-0.050800><0.220400,0.036000,0.050800> rotate<0,-90.000000,0> translate<14.957600,0.000000,10.965000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.957600,0.000000,10.965000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.737300,0.000000,10.744700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<14.737300,0.000000,10.744700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.737300,0.000000,10.744700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.517000,0.000000,10.744700>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<14.517000,0.000000,10.744700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.737300,0.000000,10.744700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.957600,0.000000,10.524400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<14.737300,0.000000,10.744700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.957600,0.000000,10.524400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.957600,0.000000,10.304100>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<14.957600,0.000000,10.304100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.957600,0.000000,10.304100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.737300,0.000000,10.083800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<14.737300,0.000000,10.083800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.737300,0.000000,10.083800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.296700,0.000000,10.083800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<14.296700,0.000000,10.083800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.296700,0.000000,10.083800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.076400,0.000000,10.304100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<14.076400,0.000000,10.304100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,34.594800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,35.916700>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<6.654800,0.000000,35.916700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,35.916700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,35.916700>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<6.654800,0.000000,35.916700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,35.916700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,35.696400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<7.315700,0.000000,35.916700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,35.696400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,35.476000>}
box{<0,0,-0.050800><0.220400,0.036000,0.050800> rotate<0,-90.000000,0> translate<7.536000,0.000000,35.476000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,35.476000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,35.255700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<7.315700,0.000000,35.255700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,35.255700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,35.035400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<7.315700,0.000000,35.255700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,35.035400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,34.815100>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<7.536000,0.000000,34.815100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,34.815100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,34.594800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<7.315700,0.000000,34.594800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,34.594800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,34.594800>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<6.654800,0.000000,34.594800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,35.255700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,35.255700>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<6.654800,0.000000,35.255700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,35.916700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,34.594800>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<7.964500,0.000000,34.594800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,34.594800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.845700,0.000000,34.594800>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<7.964500,0.000000,34.594800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,35.916700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,34.815100>}
box{<0,0,-0.050800><1.101600,0.036000,0.050800> rotate<0,-90.000000,0> translate<9.274200,0.000000,34.815100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,34.815100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.494500,0.000000,34.594800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<9.274200,0.000000,34.815100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.494500,0.000000,34.594800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.935100,0.000000,34.594800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<9.494500,0.000000,34.594800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.935100,0.000000,34.594800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.155400,0.000000,34.815100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<9.935100,0.000000,34.594800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.155400,0.000000,34.815100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.155400,0.000000,35.916700>}
box{<0,0,-0.050800><1.101600,0.036000,0.050800> rotate<0,90.000000,0> translate<10.155400,0.000000,35.916700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.465100,0.000000,35.916700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.583900,0.000000,35.916700>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<10.583900,0.000000,35.916700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.583900,0.000000,35.916700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.583900,0.000000,34.594800>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<10.583900,0.000000,34.594800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.583900,0.000000,34.594800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.465100,0.000000,34.594800>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<10.583900,0.000000,34.594800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.583900,0.000000,35.255700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.024500,0.000000,35.255700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<10.583900,0.000000,35.255700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.554500,0.000000,34.594800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.554500,0.000000,35.916700>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<12.554500,0.000000,35.916700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.554500,0.000000,35.916700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.893600,0.000000,35.255700>}
box{<0,0,-0.050800><0.934724,0.036000,0.050800> rotate<0,-45.001364,0> translate<11.893600,0.000000,35.255700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.893600,0.000000,35.255700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.774800,0.000000,35.255700>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<11.893600,0.000000,35.255700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,32.054800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,33.376700>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<6.654800,0.000000,33.376700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,33.376700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,33.376700>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<6.654800,0.000000,33.376700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,33.376700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,33.156400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<7.315700,0.000000,33.376700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,33.156400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,32.715700>}
box{<0,0,-0.050800><0.440700,0.036000,0.050800> rotate<0,-90.000000,0> translate<7.536000,0.000000,32.715700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,32.715700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,32.495400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<7.315700,0.000000,32.495400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,32.495400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,32.495400>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<6.654800,0.000000,32.495400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.095400,0.000000,32.495400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,32.054800>}
box{<0,0,-0.050800><0.623102,0.036000,0.050800> rotate<0,44.997030,0> translate<7.095400,0.000000,32.495400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.845700,0.000000,33.376700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,33.376700>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<7.964500,0.000000,33.376700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,33.376700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,32.054800>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<7.964500,0.000000,32.054800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,32.054800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.845700,0.000000,32.054800>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<7.964500,0.000000,32.054800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,32.715700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.405100,0.000000,32.715700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<7.964500,0.000000,32.715700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,33.376700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,32.054800>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<9.274200,0.000000,32.054800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,32.054800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.935100,0.000000,32.054800>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<9.274200,0.000000,32.054800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.935100,0.000000,32.054800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.155400,0.000000,32.275100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<9.935100,0.000000,32.054800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.155400,0.000000,32.275100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.155400,0.000000,33.156400>}
box{<0,0,-0.050800><0.881300,0.036000,0.050800> rotate<0,90.000000,0> translate<10.155400,0.000000,33.156400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.155400,0.000000,33.156400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.935100,0.000000,33.376700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<9.935100,0.000000,33.376700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.935100,0.000000,33.376700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,33.376700>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<9.274200,0.000000,33.376700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.244800,0.000000,32.054800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.244800,0.000000,33.376700>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<11.244800,0.000000,33.376700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.244800,0.000000,33.376700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.583900,0.000000,32.715700>}
box{<0,0,-0.050800><0.934724,0.036000,0.050800> rotate<0,-45.001364,0> translate<10.583900,0.000000,32.715700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.583900,0.000000,32.715700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.465100,0.000000,32.715700>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<10.583900,0.000000,32.715700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,30.616400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,30.836700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<7.315700,0.000000,30.836700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,30.836700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.875100,0.000000,30.836700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<6.875100,0.000000,30.836700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.875100,0.000000,30.836700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,30.616400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<6.654800,0.000000,30.616400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,30.616400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,30.396000>}
box{<0,0,-0.050800><0.220400,0.036000,0.050800> rotate<0,-90.000000,0> translate<6.654800,0.000000,30.396000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,30.396000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.875100,0.000000,30.175700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<6.654800,0.000000,30.396000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.875100,0.000000,30.175700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,30.175700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<6.875100,0.000000,30.175700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,30.175700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,29.955400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<7.315700,0.000000,30.175700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,29.955400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,29.735100>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<7.536000,0.000000,29.735100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,29.735100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,29.514800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<7.315700,0.000000,29.514800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,29.514800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.875100,0.000000,29.514800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<6.875100,0.000000,29.514800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.875100,0.000000,29.514800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,29.735100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<6.654800,0.000000,29.735100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,30.836700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,29.514800>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<7.964500,0.000000,29.514800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,29.514800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.405100,0.000000,29.955400>}
box{<0,0,-0.050800><0.623102,0.036000,0.050800> rotate<0,-44.997030,0> translate<7.964500,0.000000,29.514800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.405100,0.000000,29.955400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.845700,0.000000,29.514800>}
box{<0,0,-0.050800><0.623102,0.036000,0.050800> rotate<0,44.997030,0> translate<8.405100,0.000000,29.955400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.845700,0.000000,29.514800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.845700,0.000000,30.836700>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<8.845700,0.000000,30.836700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,29.514800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.714800,0.000000,29.514800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<9.274200,0.000000,29.514800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.494500,0.000000,29.514800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.494500,0.000000,30.836700>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<9.494500,0.000000,30.836700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,30.836700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.714800,0.000000,30.836700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<9.274200,0.000000,30.836700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.587900,0.000000,29.514800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.587900,0.000000,30.836700>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<10.587900,0.000000,30.836700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.147300,0.000000,30.836700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.028500,0.000000,30.836700>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<10.147300,0.000000,30.836700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.338200,0.000000,30.616400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.117900,0.000000,30.836700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<12.117900,0.000000,30.836700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.117900,0.000000,30.836700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.677300,0.000000,30.836700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<11.677300,0.000000,30.836700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.677300,0.000000,30.836700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.457000,0.000000,30.616400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<11.457000,0.000000,30.616400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.457000,0.000000,30.616400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.457000,0.000000,29.735100>}
box{<0,0,-0.050800><0.881300,0.036000,0.050800> rotate<0,-90.000000,0> translate<11.457000,0.000000,29.735100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.457000,0.000000,29.735100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.677300,0.000000,29.514800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<11.457000,0.000000,29.735100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.677300,0.000000,29.514800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.117900,0.000000,29.514800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<11.677300,0.000000,29.514800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.117900,0.000000,29.514800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.338200,0.000000,29.735100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<12.117900,0.000000,29.514800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.766700,0.000000,29.514800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.766700,0.000000,30.836700>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<12.766700,0.000000,30.836700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.766700,0.000000,30.175700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.647900,0.000000,30.175700>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<12.766700,0.000000,30.175700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.647900,0.000000,30.836700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.647900,0.000000,29.514800>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<13.647900,0.000000,29.514800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.737300,0.000000,29.514800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.737300,0.000000,30.836700>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<14.737300,0.000000,30.836700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.737300,0.000000,30.836700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.076400,0.000000,30.175700>}
box{<0,0,-0.050800><0.934724,0.036000,0.050800> rotate<0,-45.001364,0> translate<14.076400,0.000000,30.175700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.076400,0.000000,30.175700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.957600,0.000000,30.175700>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<14.076400,0.000000,30.175700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,40.522400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,40.742700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<7.315700,0.000000,40.742700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,40.742700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.875100,0.000000,40.742700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<6.875100,0.000000,40.742700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.875100,0.000000,40.742700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,40.522400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<6.654800,0.000000,40.522400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,40.522400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,39.641100>}
box{<0,0,-0.050800><0.881300,0.036000,0.050800> rotate<0,-90.000000,0> translate<6.654800,0.000000,39.641100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,39.641100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.875100,0.000000,39.420800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<6.654800,0.000000,39.641100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.875100,0.000000,39.420800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,39.420800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<6.875100,0.000000,39.420800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,39.420800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,39.641100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<7.315700,0.000000,39.420800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,39.641100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,40.081700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<7.536000,0.000000,40.081700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,40.081700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.095400,0.000000,40.081700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<7.095400,0.000000,40.081700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,39.420800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,40.742700>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<7.964500,0.000000,40.742700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,40.742700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.625400,0.000000,40.742700>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<7.964500,0.000000,40.742700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.625400,0.000000,40.742700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.845700,0.000000,40.522400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<8.625400,0.000000,40.742700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.845700,0.000000,40.522400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.845700,0.000000,40.081700>}
box{<0,0,-0.050800><0.440700,0.036000,0.050800> rotate<0,-90.000000,0> translate<8.845700,0.000000,40.081700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.845700,0.000000,40.081700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.625400,0.000000,39.861400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<8.625400,0.000000,39.861400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.625400,0.000000,39.861400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,39.861400>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<7.964500,0.000000,39.861400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.405100,0.000000,39.861400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.845700,0.000000,39.420800>}
box{<0,0,-0.050800><0.623102,0.036000,0.050800> rotate<0,44.997030,0> translate<8.405100,0.000000,39.861400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.155400,0.000000,40.742700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,40.742700>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<9.274200,0.000000,40.742700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,40.742700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,39.420800>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<9.274200,0.000000,39.420800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,39.420800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.155400,0.000000,39.420800>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<9.274200,0.000000,39.420800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,40.081700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.714800,0.000000,40.081700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<9.274200,0.000000,40.081700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.465100,0.000000,40.742700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.583900,0.000000,40.742700>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<10.583900,0.000000,40.742700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.583900,0.000000,40.742700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.583900,0.000000,39.420800>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<10.583900,0.000000,39.420800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.583900,0.000000,39.420800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.465100,0.000000,39.420800>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<10.583900,0.000000,39.420800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.583900,0.000000,40.081700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.024500,0.000000,40.081700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<10.583900,0.000000,40.081700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.893600,0.000000,39.420800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.893600,0.000000,40.742700>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<11.893600,0.000000,40.742700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.893600,0.000000,40.742700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.774800,0.000000,39.420800>}
box{<0,0,-0.050800><1.588689,0.036000,0.050800> rotate<0,56.308217,0> translate<11.893600,0.000000,40.742700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.774800,0.000000,39.420800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.774800,0.000000,40.742700>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<12.774800,0.000000,40.742700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.864200,0.000000,39.420800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.864200,0.000000,40.742700>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<13.864200,0.000000,40.742700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.864200,0.000000,40.742700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.203300,0.000000,40.081700>}
box{<0,0,-0.050800><0.934724,0.036000,0.050800> rotate<0,-45.001364,0> translate<13.203300,0.000000,40.081700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.203300,0.000000,40.081700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.084500,0.000000,40.081700>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<13.203300,0.000000,40.081700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,20.456400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,20.676700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<7.315700,0.000000,20.676700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,20.676700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.875100,0.000000,20.676700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<6.875100,0.000000,20.676700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.875100,0.000000,20.676700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,20.456400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<6.654800,0.000000,20.456400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,20.456400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,19.575100>}
box{<0,0,-0.050800><0.881300,0.036000,0.050800> rotate<0,-90.000000,0> translate<6.654800,0.000000,19.575100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.654800,0.000000,19.575100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.875100,0.000000,19.354800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<6.654800,0.000000,19.575100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.875100,0.000000,19.354800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,19.354800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<6.875100,0.000000,19.354800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.315700,0.000000,19.354800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,19.575100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<7.315700,0.000000,19.354800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,19.575100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,20.015700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,90.000000,0> translate<7.536000,0.000000,20.015700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.536000,0.000000,20.015700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.095400,0.000000,20.015700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<7.095400,0.000000,20.015700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,19.354800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,20.676700>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<7.964500,0.000000,20.676700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,20.676700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.625400,0.000000,20.676700>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<7.964500,0.000000,20.676700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.625400,0.000000,20.676700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.845700,0.000000,20.456400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<8.625400,0.000000,20.676700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.845700,0.000000,20.456400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.845700,0.000000,20.015700>}
box{<0,0,-0.050800><0.440700,0.036000,0.050800> rotate<0,-90.000000,0> translate<8.845700,0.000000,20.015700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.845700,0.000000,20.015700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.625400,0.000000,19.795400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<8.625400,0.000000,19.795400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.625400,0.000000,19.795400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.964500,0.000000,19.795400>}
box{<0,0,-0.050800><0.660900,0.036000,0.050800> rotate<0,0.000000,0> translate<7.964500,0.000000,19.795400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.405100,0.000000,19.795400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.845700,0.000000,19.354800>}
box{<0,0,-0.050800><0.623102,0.036000,0.050800> rotate<0,44.997030,0> translate<8.405100,0.000000,19.795400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.155400,0.000000,20.676700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,20.676700>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<9.274200,0.000000,20.676700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,20.676700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,19.354800>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<9.274200,0.000000,19.354800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,19.354800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.155400,0.000000,19.354800>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<9.274200,0.000000,19.354800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.274200,0.000000,20.015700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.714800,0.000000,20.015700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<9.274200,0.000000,20.015700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.465100,0.000000,20.676700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.583900,0.000000,20.676700>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<10.583900,0.000000,20.676700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.583900,0.000000,20.676700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.583900,0.000000,19.354800>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,-90.000000,0> translate<10.583900,0.000000,19.354800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.583900,0.000000,19.354800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.465100,0.000000,19.354800>}
box{<0,0,-0.050800><0.881200,0.036000,0.050800> rotate<0,0.000000,0> translate<10.583900,0.000000,19.354800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.583900,0.000000,20.015700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.024500,0.000000,20.015700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<10.583900,0.000000,20.015700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.893600,0.000000,19.354800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.893600,0.000000,20.676700>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<11.893600,0.000000,20.676700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.893600,0.000000,20.676700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.774800,0.000000,19.354800>}
box{<0,0,-0.050800><1.588689,0.036000,0.050800> rotate<0,56.308217,0> translate<11.893600,0.000000,20.676700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.774800,0.000000,19.354800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.774800,0.000000,20.676700>}
box{<0,0,-0.050800><1.321900,0.036000,0.050800> rotate<0,90.000000,0> translate<12.774800,0.000000,20.676700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.203300,0.000000,20.456400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.423600,0.000000,20.676700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<13.203300,0.000000,20.456400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.423600,0.000000,20.676700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.864200,0.000000,20.676700>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<13.423600,0.000000,20.676700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.864200,0.000000,20.676700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.084500,0.000000,20.456400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<13.864200,0.000000,20.676700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.084500,0.000000,20.456400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.084500,0.000000,20.236000>}
box{<0,0,-0.050800><0.220400,0.036000,0.050800> rotate<0,-90.000000,0> translate<14.084500,0.000000,20.236000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.084500,0.000000,20.236000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.864200,0.000000,20.015700>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<13.864200,0.000000,20.015700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.864200,0.000000,20.015700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.643900,0.000000,20.015700>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,0.000000,0> translate<13.643900,0.000000,20.015700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.864200,0.000000,20.015700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.084500,0.000000,19.795400>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<13.864200,0.000000,20.015700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.084500,0.000000,19.795400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.084500,0.000000,19.575100>}
box{<0,0,-0.050800><0.220300,0.036000,0.050800> rotate<0,-90.000000,0> translate<14.084500,0.000000,19.575100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.084500,0.000000,19.575100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.864200,0.000000,19.354800>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,-44.997030,0> translate<13.864200,0.000000,19.354800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.864200,0.000000,19.354800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.423600,0.000000,19.354800>}
box{<0,0,-0.050800><0.440600,0.036000,0.050800> rotate<0,0.000000,0> translate<13.423600,0.000000,19.354800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.423600,0.000000,19.354800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.203300,0.000000,19.575100>}
box{<0,0,-0.050800><0.311551,0.036000,0.050800> rotate<0,44.997030,0> translate<13.203300,0.000000,19.575100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.847000,0.000000,32.275800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.575900,0.000000,32.004600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<71.575900,0.000000,32.004600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.575900,0.000000,32.004600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.575900,0.000000,31.462300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<71.575900,0.000000,31.462300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.575900,0.000000,31.462300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.847000,0.000000,31.191200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<71.575900,0.000000,31.462300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.847000,0.000000,31.191200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.118200,0.000000,31.191200>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<71.847000,0.000000,31.191200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.118200,0.000000,31.191200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.389400,0.000000,31.462300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<72.118200,0.000000,31.191200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.389400,0.000000,31.462300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.389400,0.000000,32.004600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<72.389400,0.000000,32.004600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.389400,0.000000,32.004600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.660500,0.000000,32.275800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<72.389400,0.000000,32.004600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.660500,0.000000,32.275800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.931700,0.000000,32.275800>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<72.660500,0.000000,32.275800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.931700,0.000000,32.275800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.202800,0.000000,32.004600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<72.931700,0.000000,32.275800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.202800,0.000000,32.004600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.202800,0.000000,31.462300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<73.202800,0.000000,31.462300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.202800,0.000000,31.462300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.931700,0.000000,31.191200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<72.931700,0.000000,31.191200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.575900,0.000000,32.828300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.202800,0.000000,32.828300>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<71.575900,0.000000,32.828300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.202800,0.000000,32.828300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.660500,0.000000,33.370600>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<72.660500,0.000000,33.370600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.660500,0.000000,33.370600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.202800,0.000000,33.912900>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<72.660500,0.000000,33.370600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.202800,0.000000,33.912900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.575900,0.000000,33.912900>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<71.575900,0.000000,33.912900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.202800,0.000000,35.007700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.575900,0.000000,35.007700>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<71.575900,0.000000,35.007700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.575900,0.000000,34.465400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.575900,0.000000,35.550000>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<71.575900,0.000000,35.550000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.389400,0.000000,36.102500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.389400,0.000000,37.187100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<72.389400,0.000000,37.187100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.847000,0.000000,38.824200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.575900,0.000000,38.553000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<71.575900,0.000000,38.553000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.575900,0.000000,38.553000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.575900,0.000000,38.010700>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<71.575900,0.000000,38.010700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.575900,0.000000,38.010700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.847000,0.000000,37.739600>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<71.575900,0.000000,38.010700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.847000,0.000000,37.739600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.931700,0.000000,37.739600>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<71.847000,0.000000,37.739600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.931700,0.000000,37.739600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.202800,0.000000,38.010700>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<72.931700,0.000000,37.739600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.202800,0.000000,38.010700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.202800,0.000000,38.553000>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<73.202800,0.000000,38.553000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.202800,0.000000,38.553000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.931700,0.000000,38.824200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<72.931700,0.000000,38.824200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.931700,0.000000,38.824200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.389400,0.000000,38.824200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<72.389400,0.000000,38.824200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.389400,0.000000,38.824200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.389400,0.000000,38.281900>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<72.389400,0.000000,38.281900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.202800,0.000000,39.376700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.575900,0.000000,39.376700>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<71.575900,0.000000,39.376700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.575900,0.000000,39.376700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.202800,0.000000,40.461300>}
box{<0,0,-0.076200><1.955290,0.036000,0.076200> rotate<0,-33.687844,0> translate<71.575900,0.000000,39.376700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.202800,0.000000,40.461300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.575900,0.000000,40.461300>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<71.575900,0.000000,40.461300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.575900,0.000000,41.013800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.202800,0.000000,41.013800>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<71.575900,0.000000,41.013800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.202800,0.000000,41.013800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.202800,0.000000,41.827200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<73.202800,0.000000,41.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.202800,0.000000,41.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.931700,0.000000,42.098400>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<72.931700,0.000000,42.098400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.931700,0.000000,42.098400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.847000,0.000000,42.098400>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<71.847000,0.000000,42.098400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.847000,0.000000,42.098400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.575900,0.000000,41.827200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<71.575900,0.000000,41.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.575900,0.000000,41.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.575900,0.000000,41.013800>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<71.575900,0.000000,41.013800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.202800,0.000000,43.735500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.202800,0.000000,42.650900>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<73.202800,0.000000,42.650900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.202800,0.000000,42.650900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.118200,0.000000,43.735500>}
box{<0,0,-0.076200><1.533856,0.036000,0.076200> rotate<0,44.997030,0> translate<72.118200,0.000000,43.735500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.118200,0.000000,43.735500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.847000,0.000000,43.735500>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<71.847000,0.000000,43.735500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.847000,0.000000,43.735500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.575900,0.000000,43.464300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<71.575900,0.000000,43.464300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.575900,0.000000,43.464300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.575900,0.000000,42.922000>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<71.575900,0.000000,42.922000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.575900,0.000000,42.922000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.847000,0.000000,42.650900>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<71.575900,0.000000,42.922000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.671900,0.000000,31.191200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.298800,0.000000,31.191200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<77.671900,0.000000,31.191200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.298800,0.000000,31.191200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.298800,0.000000,32.275800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<79.298800,0.000000,32.275800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.671900,0.000000,33.912900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.671900,0.000000,32.828300>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<77.671900,0.000000,32.828300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.671900,0.000000,32.828300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.298800,0.000000,32.828300>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<77.671900,0.000000,32.828300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.298800,0.000000,32.828300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.298800,0.000000,33.912900>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<79.298800,0.000000,33.912900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.485400,0.000000,32.828300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.485400,0.000000,33.370600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<78.485400,0.000000,33.370600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.671900,0.000000,34.465400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.298800,0.000000,34.465400>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<77.671900,0.000000,34.465400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.298800,0.000000,34.465400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.298800,0.000000,35.278800>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<79.298800,0.000000,35.278800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.298800,0.000000,35.278800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.027700,0.000000,35.550000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<79.027700,0.000000,35.550000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.027700,0.000000,35.550000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.943000,0.000000,35.550000>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<77.943000,0.000000,35.550000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.943000,0.000000,35.550000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.671900,0.000000,35.278800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<77.671900,0.000000,35.278800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.671900,0.000000,35.278800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.671900,0.000000,34.465400>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<77.671900,0.000000,34.465400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.485400,0.000000,36.102500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.485400,0.000000,37.187100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<78.485400,0.000000,37.187100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.943000,0.000000,38.824200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.671900,0.000000,38.553000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<77.671900,0.000000,38.553000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.671900,0.000000,38.553000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.671900,0.000000,38.010700>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<77.671900,0.000000,38.010700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.671900,0.000000,38.010700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.943000,0.000000,37.739600>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<77.671900,0.000000,38.010700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.943000,0.000000,37.739600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.027700,0.000000,37.739600>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<77.943000,0.000000,37.739600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.027700,0.000000,37.739600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.298800,0.000000,38.010700>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<79.027700,0.000000,37.739600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.298800,0.000000,38.010700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.298800,0.000000,38.553000>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<79.298800,0.000000,38.553000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.298800,0.000000,38.553000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.027700,0.000000,38.824200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<79.027700,0.000000,38.824200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.027700,0.000000,38.824200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.485400,0.000000,38.824200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<78.485400,0.000000,38.824200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.485400,0.000000,38.824200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.485400,0.000000,38.281900>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<78.485400,0.000000,38.281900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.298800,0.000000,39.376700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.671900,0.000000,39.376700>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<77.671900,0.000000,39.376700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.671900,0.000000,39.376700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.298800,0.000000,40.461300>}
box{<0,0,-0.076200><1.955290,0.036000,0.076200> rotate<0,-33.687844,0> translate<77.671900,0.000000,39.376700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.298800,0.000000,40.461300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.671900,0.000000,40.461300>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<77.671900,0.000000,40.461300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.671900,0.000000,41.013800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.298800,0.000000,41.013800>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<77.671900,0.000000,41.013800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.298800,0.000000,41.013800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.298800,0.000000,41.827200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<79.298800,0.000000,41.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.298800,0.000000,41.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.027700,0.000000,42.098400>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<79.027700,0.000000,42.098400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.027700,0.000000,42.098400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.943000,0.000000,42.098400>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<77.943000,0.000000,42.098400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.943000,0.000000,42.098400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.671900,0.000000,41.827200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<77.671900,0.000000,41.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.671900,0.000000,41.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.671900,0.000000,41.013800>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<77.671900,0.000000,41.013800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.214200,0.000000,42.650900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.671900,0.000000,43.193200>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<77.671900,0.000000,43.193200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.671900,0.000000,43.193200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.298800,0.000000,43.193200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<77.671900,0.000000,43.193200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.298800,0.000000,42.650900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.298800,0.000000,43.735500>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<79.298800,0.000000,43.735500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.483000,0.000000,32.275800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.211900,0.000000,32.004600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<80.211900,0.000000,32.004600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.211900,0.000000,32.004600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.211900,0.000000,31.462300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<80.211900,0.000000,31.462300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.211900,0.000000,31.462300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.483000,0.000000,31.191200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<80.211900,0.000000,31.462300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.483000,0.000000,31.191200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.754200,0.000000,31.191200>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<80.483000,0.000000,31.191200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.754200,0.000000,31.191200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.025400,0.000000,31.462300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<80.754200,0.000000,31.191200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.025400,0.000000,31.462300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.025400,0.000000,32.004600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<81.025400,0.000000,32.004600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.025400,0.000000,32.004600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.296500,0.000000,32.275800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<81.025400,0.000000,32.004600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.296500,0.000000,32.275800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.567700,0.000000,32.275800>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<81.296500,0.000000,32.275800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.567700,0.000000,32.275800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.838800,0.000000,32.004600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<81.567700,0.000000,32.275800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.838800,0.000000,32.004600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.838800,0.000000,31.462300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<81.838800,0.000000,31.462300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.838800,0.000000,31.462300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.567700,0.000000,31.191200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<81.567700,0.000000,31.191200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.211900,0.000000,32.828300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.838800,0.000000,32.828300>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<80.211900,0.000000,32.828300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.838800,0.000000,32.828300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.296500,0.000000,33.370600>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<81.296500,0.000000,33.370600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.296500,0.000000,33.370600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.838800,0.000000,33.912900>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<81.296500,0.000000,33.370600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.838800,0.000000,33.912900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.211900,0.000000,33.912900>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<80.211900,0.000000,33.912900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.838800,0.000000,35.007700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.211900,0.000000,35.007700>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<80.211900,0.000000,35.007700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.211900,0.000000,34.465400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.211900,0.000000,35.550000>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<80.211900,0.000000,35.550000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.025400,0.000000,36.102500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.025400,0.000000,37.187100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<81.025400,0.000000,37.187100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.483000,0.000000,38.824200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.211900,0.000000,38.553000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<80.211900,0.000000,38.553000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.211900,0.000000,38.553000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.211900,0.000000,38.010700>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<80.211900,0.000000,38.010700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.211900,0.000000,38.010700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.483000,0.000000,37.739600>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<80.211900,0.000000,38.010700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.483000,0.000000,37.739600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.567700,0.000000,37.739600>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<80.483000,0.000000,37.739600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.567700,0.000000,37.739600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.838800,0.000000,38.010700>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<81.567700,0.000000,37.739600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.838800,0.000000,38.010700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.838800,0.000000,38.553000>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<81.838800,0.000000,38.553000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.838800,0.000000,38.553000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.567700,0.000000,38.824200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<81.567700,0.000000,38.824200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.567700,0.000000,38.824200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.025400,0.000000,38.824200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<81.025400,0.000000,38.824200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.025400,0.000000,38.824200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.025400,0.000000,38.281900>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<81.025400,0.000000,38.281900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.838800,0.000000,39.376700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.211900,0.000000,39.376700>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<80.211900,0.000000,39.376700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.211900,0.000000,39.376700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.838800,0.000000,40.461300>}
box{<0,0,-0.076200><1.955290,0.036000,0.076200> rotate<0,-33.687844,0> translate<80.211900,0.000000,39.376700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.838800,0.000000,40.461300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.211900,0.000000,40.461300>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<80.211900,0.000000,40.461300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.211900,0.000000,41.013800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.838800,0.000000,41.013800>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<80.211900,0.000000,41.013800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.838800,0.000000,41.013800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.838800,0.000000,41.827200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<81.838800,0.000000,41.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.838800,0.000000,41.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.567700,0.000000,42.098400>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<81.567700,0.000000,42.098400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.567700,0.000000,42.098400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.483000,0.000000,42.098400>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<80.483000,0.000000,42.098400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.483000,0.000000,42.098400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.211900,0.000000,41.827200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<80.211900,0.000000,41.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.211900,0.000000,41.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.211900,0.000000,41.013800>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<80.211900,0.000000,41.013800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.754200,0.000000,42.650900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.211900,0.000000,43.193200>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<80.211900,0.000000,43.193200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.211900,0.000000,43.193200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.838800,0.000000,43.193200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<80.211900,0.000000,43.193200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.838800,0.000000,42.650900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.838800,0.000000,43.735500>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<81.838800,0.000000,43.735500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.035900,0.000000,31.191200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.662800,0.000000,31.191200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<69.035900,0.000000,31.191200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.662800,0.000000,31.191200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.662800,0.000000,32.275800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<70.662800,0.000000,32.275800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.035900,0.000000,33.912900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.035900,0.000000,32.828300>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<69.035900,0.000000,32.828300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.035900,0.000000,32.828300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.662800,0.000000,32.828300>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<69.035900,0.000000,32.828300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.662800,0.000000,32.828300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.662800,0.000000,33.912900>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<70.662800,0.000000,33.912900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.849400,0.000000,32.828300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.849400,0.000000,33.370600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<69.849400,0.000000,33.370600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.035900,0.000000,34.465400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.662800,0.000000,34.465400>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<69.035900,0.000000,34.465400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.662800,0.000000,34.465400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.662800,0.000000,35.278800>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<70.662800,0.000000,35.278800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.662800,0.000000,35.278800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.391700,0.000000,35.550000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<70.391700,0.000000,35.550000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.391700,0.000000,35.550000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.307000,0.000000,35.550000>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<69.307000,0.000000,35.550000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.307000,0.000000,35.550000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.035900,0.000000,35.278800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<69.035900,0.000000,35.278800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.035900,0.000000,35.278800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.035900,0.000000,34.465400>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<69.035900,0.000000,34.465400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.849400,0.000000,36.102500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.849400,0.000000,37.187100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<69.849400,0.000000,37.187100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.307000,0.000000,38.824200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.035900,0.000000,38.553000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<69.035900,0.000000,38.553000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.035900,0.000000,38.553000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.035900,0.000000,38.010700>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<69.035900,0.000000,38.010700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.035900,0.000000,38.010700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.307000,0.000000,37.739600>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<69.035900,0.000000,38.010700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.307000,0.000000,37.739600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.391700,0.000000,37.739600>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<69.307000,0.000000,37.739600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.391700,0.000000,37.739600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.662800,0.000000,38.010700>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<70.391700,0.000000,37.739600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.662800,0.000000,38.010700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.662800,0.000000,38.553000>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<70.662800,0.000000,38.553000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.662800,0.000000,38.553000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.391700,0.000000,38.824200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<70.391700,0.000000,38.824200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.391700,0.000000,38.824200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.849400,0.000000,38.824200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<69.849400,0.000000,38.824200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.849400,0.000000,38.824200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.849400,0.000000,38.281900>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<69.849400,0.000000,38.281900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.662800,0.000000,39.376700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.035900,0.000000,39.376700>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<69.035900,0.000000,39.376700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.035900,0.000000,39.376700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.662800,0.000000,40.461300>}
box{<0,0,-0.076200><1.955290,0.036000,0.076200> rotate<0,-33.687844,0> translate<69.035900,0.000000,39.376700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.662800,0.000000,40.461300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.035900,0.000000,40.461300>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<69.035900,0.000000,40.461300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.035900,0.000000,41.013800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.662800,0.000000,41.013800>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<69.035900,0.000000,41.013800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.662800,0.000000,41.013800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.662800,0.000000,41.827200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<70.662800,0.000000,41.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.662800,0.000000,41.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.391700,0.000000,42.098400>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<70.391700,0.000000,42.098400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.391700,0.000000,42.098400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.307000,0.000000,42.098400>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<69.307000,0.000000,42.098400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.307000,0.000000,42.098400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.035900,0.000000,41.827200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<69.035900,0.000000,41.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.035900,0.000000,41.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.035900,0.000000,41.013800>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<69.035900,0.000000,41.013800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.662800,0.000000,43.735500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.662800,0.000000,42.650900>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<70.662800,0.000000,42.650900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.662800,0.000000,42.650900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.578200,0.000000,43.735500>}
box{<0,0,-0.076200><1.533856,0.036000,0.076200> rotate<0,44.997030,0> translate<69.578200,0.000000,43.735500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.578200,0.000000,43.735500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.307000,0.000000,43.735500>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<69.307000,0.000000,43.735500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.307000,0.000000,43.735500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.035900,0.000000,43.464300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<69.035900,0.000000,43.464300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.035900,0.000000,43.464300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.035900,0.000000,42.922000>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<69.035900,0.000000,42.922000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.035900,0.000000,42.922000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.307000,0.000000,42.650900>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<69.035900,0.000000,42.922000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.870900,0.000000,31.191200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.497800,0.000000,31.191200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<18.870900,0.000000,31.191200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.497800,0.000000,31.191200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.497800,0.000000,32.275800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<20.497800,0.000000,32.275800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.870900,0.000000,33.912900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.870900,0.000000,32.828300>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.870900,0.000000,32.828300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.870900,0.000000,32.828300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.497800,0.000000,32.828300>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<18.870900,0.000000,32.828300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.497800,0.000000,32.828300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.497800,0.000000,33.912900>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<20.497800,0.000000,33.912900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.684400,0.000000,32.828300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.684400,0.000000,33.370600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<19.684400,0.000000,33.370600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.870900,0.000000,34.465400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.497800,0.000000,34.465400>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<18.870900,0.000000,34.465400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.497800,0.000000,34.465400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.497800,0.000000,35.278800>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<20.497800,0.000000,35.278800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.497800,0.000000,35.278800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.226700,0.000000,35.550000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<20.226700,0.000000,35.550000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.226700,0.000000,35.550000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.142000,0.000000,35.550000>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<19.142000,0.000000,35.550000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.142000,0.000000,35.550000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.870900,0.000000,35.278800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<18.870900,0.000000,35.278800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.870900,0.000000,35.278800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.870900,0.000000,34.465400>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.870900,0.000000,34.465400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.684400,0.000000,36.102500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.684400,0.000000,37.187100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<19.684400,0.000000,37.187100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.142000,0.000000,38.824200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.870900,0.000000,38.553000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<18.870900,0.000000,38.553000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.870900,0.000000,38.553000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.870900,0.000000,38.010700>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.870900,0.000000,38.010700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.870900,0.000000,38.010700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.142000,0.000000,37.739600>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<18.870900,0.000000,38.010700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.142000,0.000000,37.739600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.226700,0.000000,37.739600>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<19.142000,0.000000,37.739600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.226700,0.000000,37.739600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.497800,0.000000,38.010700>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.226700,0.000000,37.739600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.497800,0.000000,38.010700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.497800,0.000000,38.553000>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<20.497800,0.000000,38.553000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.497800,0.000000,38.553000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.226700,0.000000,38.824200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<20.226700,0.000000,38.824200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.226700,0.000000,38.824200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.684400,0.000000,38.824200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<19.684400,0.000000,38.824200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.684400,0.000000,38.824200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.684400,0.000000,38.281900>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.684400,0.000000,38.281900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.497800,0.000000,39.376700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.870900,0.000000,39.376700>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<18.870900,0.000000,39.376700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.870900,0.000000,39.376700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.497800,0.000000,40.461300>}
box{<0,0,-0.076200><1.955290,0.036000,0.076200> rotate<0,-33.687844,0> translate<18.870900,0.000000,39.376700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.497800,0.000000,40.461300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.870900,0.000000,40.461300>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<18.870900,0.000000,40.461300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.870900,0.000000,41.013800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.497800,0.000000,41.013800>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<18.870900,0.000000,41.013800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.497800,0.000000,41.013800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.497800,0.000000,41.827200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<20.497800,0.000000,41.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.497800,0.000000,41.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.226700,0.000000,42.098400>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<20.226700,0.000000,42.098400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.226700,0.000000,42.098400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.142000,0.000000,42.098400>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<19.142000,0.000000,42.098400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.142000,0.000000,42.098400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.870900,0.000000,41.827200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<18.870900,0.000000,41.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.870900,0.000000,41.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.870900,0.000000,41.013800>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.870900,0.000000,41.013800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.497800,0.000000,43.464300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.870900,0.000000,43.464300>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<18.870900,0.000000,43.464300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.870900,0.000000,43.464300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.684400,0.000000,42.650900>}
box{<0,0,-0.076200><1.150392,0.036000,0.076200> rotate<0,44.993509,0> translate<18.870900,0.000000,43.464300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.684400,0.000000,42.650900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.684400,0.000000,43.735500>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<19.684400,0.000000,43.735500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.809000,0.000000,32.275800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.537900,0.000000,32.004600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<21.537900,0.000000,32.004600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.537900,0.000000,32.004600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.537900,0.000000,31.462300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.537900,0.000000,31.462300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.537900,0.000000,31.462300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.809000,0.000000,31.191200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<21.537900,0.000000,31.462300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.809000,0.000000,31.191200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.080200,0.000000,31.191200>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<21.809000,0.000000,31.191200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.080200,0.000000,31.191200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.351400,0.000000,31.462300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<22.080200,0.000000,31.191200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.351400,0.000000,31.462300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.351400,0.000000,32.004600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<22.351400,0.000000,32.004600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.351400,0.000000,32.004600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.622500,0.000000,32.275800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<22.351400,0.000000,32.004600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.622500,0.000000,32.275800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.893700,0.000000,32.275800>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<22.622500,0.000000,32.275800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.893700,0.000000,32.275800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.164800,0.000000,32.004600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<22.893700,0.000000,32.275800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.164800,0.000000,32.004600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.164800,0.000000,31.462300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.164800,0.000000,31.462300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.164800,0.000000,31.462300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.893700,0.000000,31.191200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.893700,0.000000,31.191200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.537900,0.000000,32.828300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.164800,0.000000,32.828300>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<21.537900,0.000000,32.828300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.164800,0.000000,32.828300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.622500,0.000000,33.370600>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<22.622500,0.000000,33.370600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.622500,0.000000,33.370600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.164800,0.000000,33.912900>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.622500,0.000000,33.370600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.164800,0.000000,33.912900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.537900,0.000000,33.912900>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<21.537900,0.000000,33.912900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.164800,0.000000,35.007700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.537900,0.000000,35.007700>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<21.537900,0.000000,35.007700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.537900,0.000000,34.465400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.537900,0.000000,35.550000>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<21.537900,0.000000,35.550000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.351400,0.000000,36.102500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.351400,0.000000,37.187100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<22.351400,0.000000,37.187100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.809000,0.000000,38.824200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.537900,0.000000,38.553000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<21.537900,0.000000,38.553000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.537900,0.000000,38.553000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.537900,0.000000,38.010700>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.537900,0.000000,38.010700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.537900,0.000000,38.010700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.809000,0.000000,37.739600>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<21.537900,0.000000,38.010700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.809000,0.000000,37.739600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.893700,0.000000,37.739600>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<21.809000,0.000000,37.739600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.893700,0.000000,37.739600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.164800,0.000000,38.010700>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.893700,0.000000,37.739600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.164800,0.000000,38.010700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.164800,0.000000,38.553000>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<23.164800,0.000000,38.553000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.164800,0.000000,38.553000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.893700,0.000000,38.824200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<22.893700,0.000000,38.824200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.893700,0.000000,38.824200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.351400,0.000000,38.824200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<22.351400,0.000000,38.824200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.351400,0.000000,38.824200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.351400,0.000000,38.281900>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.351400,0.000000,38.281900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.164800,0.000000,39.376700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.537900,0.000000,39.376700>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<21.537900,0.000000,39.376700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.537900,0.000000,39.376700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.164800,0.000000,40.461300>}
box{<0,0,-0.076200><1.955290,0.036000,0.076200> rotate<0,-33.687844,0> translate<21.537900,0.000000,39.376700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.164800,0.000000,40.461300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.537900,0.000000,40.461300>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<21.537900,0.000000,40.461300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.537900,0.000000,41.013800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.164800,0.000000,41.013800>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<21.537900,0.000000,41.013800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.164800,0.000000,41.013800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.164800,0.000000,41.827200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<23.164800,0.000000,41.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.164800,0.000000,41.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.893700,0.000000,42.098400>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<22.893700,0.000000,42.098400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.893700,0.000000,42.098400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.809000,0.000000,42.098400>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<21.809000,0.000000,42.098400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.809000,0.000000,42.098400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.537900,0.000000,41.827200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<21.537900,0.000000,41.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.537900,0.000000,41.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.537900,0.000000,41.013800>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.537900,0.000000,41.013800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.164800,0.000000,43.464300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.537900,0.000000,43.464300>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<21.537900,0.000000,43.464300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.537900,0.000000,43.464300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.351400,0.000000,42.650900>}
box{<0,0,-0.076200><1.150392,0.036000,0.076200> rotate<0,44.993509,0> translate<21.537900,0.000000,43.464300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.351400,0.000000,42.650900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.351400,0.000000,43.735500>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<22.351400,0.000000,43.735500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.379900,0.000000,31.191200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.006800,0.000000,31.191200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<27.379900,0.000000,31.191200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.006800,0.000000,31.191200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.006800,0.000000,32.275800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<29.006800,0.000000,32.275800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.379900,0.000000,33.912900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.379900,0.000000,32.828300>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.379900,0.000000,32.828300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.379900,0.000000,32.828300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.006800,0.000000,32.828300>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<27.379900,0.000000,32.828300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.006800,0.000000,32.828300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.006800,0.000000,33.912900>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<29.006800,0.000000,33.912900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.193400,0.000000,32.828300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.193400,0.000000,33.370600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<28.193400,0.000000,33.370600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.379900,0.000000,34.465400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.006800,0.000000,34.465400>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<27.379900,0.000000,34.465400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.006800,0.000000,34.465400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.006800,0.000000,35.278800>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<29.006800,0.000000,35.278800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.006800,0.000000,35.278800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.735700,0.000000,35.550000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<28.735700,0.000000,35.550000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.735700,0.000000,35.550000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.651000,0.000000,35.550000>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<27.651000,0.000000,35.550000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.651000,0.000000,35.550000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.379900,0.000000,35.278800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<27.379900,0.000000,35.278800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.379900,0.000000,35.278800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.379900,0.000000,34.465400>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.379900,0.000000,34.465400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.193400,0.000000,36.102500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.193400,0.000000,37.187100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<28.193400,0.000000,37.187100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.651000,0.000000,38.824200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.379900,0.000000,38.553000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<27.379900,0.000000,38.553000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.379900,0.000000,38.553000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.379900,0.000000,38.010700>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.379900,0.000000,38.010700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.379900,0.000000,38.010700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.651000,0.000000,37.739600>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<27.379900,0.000000,38.010700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.651000,0.000000,37.739600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.735700,0.000000,37.739600>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<27.651000,0.000000,37.739600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.735700,0.000000,37.739600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.006800,0.000000,38.010700>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<28.735700,0.000000,37.739600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.006800,0.000000,38.010700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.006800,0.000000,38.553000>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<29.006800,0.000000,38.553000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.006800,0.000000,38.553000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.735700,0.000000,38.824200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<28.735700,0.000000,38.824200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.735700,0.000000,38.824200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.193400,0.000000,38.824200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<28.193400,0.000000,38.824200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.193400,0.000000,38.824200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.193400,0.000000,38.281900>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.193400,0.000000,38.281900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.006800,0.000000,39.376700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.379900,0.000000,39.376700>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<27.379900,0.000000,39.376700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.379900,0.000000,39.376700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.006800,0.000000,40.461300>}
box{<0,0,-0.076200><1.955290,0.036000,0.076200> rotate<0,-33.687844,0> translate<27.379900,0.000000,39.376700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.006800,0.000000,40.461300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.379900,0.000000,40.461300>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<27.379900,0.000000,40.461300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.379900,0.000000,41.013800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.006800,0.000000,41.013800>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<27.379900,0.000000,41.013800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.006800,0.000000,41.013800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.006800,0.000000,41.827200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<29.006800,0.000000,41.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.006800,0.000000,41.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.735700,0.000000,42.098400>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<28.735700,0.000000,42.098400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.735700,0.000000,42.098400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.651000,0.000000,42.098400>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<27.651000,0.000000,42.098400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.651000,0.000000,42.098400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.379900,0.000000,41.827200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<27.379900,0.000000,41.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.379900,0.000000,41.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.379900,0.000000,41.013800>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.379900,0.000000,41.013800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.651000,0.000000,42.650900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.379900,0.000000,42.922000>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<27.379900,0.000000,42.922000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.379900,0.000000,42.922000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.379900,0.000000,43.464300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<27.379900,0.000000,43.464300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.379900,0.000000,43.464300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.651000,0.000000,43.735500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<27.379900,0.000000,43.464300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.651000,0.000000,43.735500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.922200,0.000000,43.735500>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<27.651000,0.000000,43.735500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.922200,0.000000,43.735500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.193400,0.000000,43.464300>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<27.922200,0.000000,43.735500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.193400,0.000000,43.464300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.193400,0.000000,43.193200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.193400,0.000000,43.193200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.193400,0.000000,43.464300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.464500,0.000000,43.735500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<28.193400,0.000000,43.464300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.464500,0.000000,43.735500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.735700,0.000000,43.735500>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<28.464500,0.000000,43.735500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.735700,0.000000,43.735500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.006800,0.000000,43.464300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<28.735700,0.000000,43.735500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.006800,0.000000,43.464300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.006800,0.000000,42.922000>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.006800,0.000000,42.922000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.006800,0.000000,42.922000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.735700,0.000000,42.650900>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<28.735700,0.000000,42.650900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.064000,0.000000,32.275800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.792900,0.000000,32.004600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<29.792900,0.000000,32.004600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.792900,0.000000,32.004600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.792900,0.000000,31.462300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.792900,0.000000,31.462300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.792900,0.000000,31.462300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.064000,0.000000,31.191200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<29.792900,0.000000,31.462300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.064000,0.000000,31.191200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.335200,0.000000,31.191200>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<30.064000,0.000000,31.191200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.335200,0.000000,31.191200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.606400,0.000000,31.462300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<30.335200,0.000000,31.191200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.606400,0.000000,31.462300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.606400,0.000000,32.004600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<30.606400,0.000000,32.004600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.606400,0.000000,32.004600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.877500,0.000000,32.275800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<30.606400,0.000000,32.004600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.877500,0.000000,32.275800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.148700,0.000000,32.275800>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<30.877500,0.000000,32.275800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.148700,0.000000,32.275800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.419800,0.000000,32.004600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<31.148700,0.000000,32.275800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.419800,0.000000,32.004600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.419800,0.000000,31.462300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.419800,0.000000,31.462300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.419800,0.000000,31.462300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.148700,0.000000,31.191200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.148700,0.000000,31.191200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.792900,0.000000,32.828300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.419800,0.000000,32.828300>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<29.792900,0.000000,32.828300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.419800,0.000000,32.828300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.877500,0.000000,33.370600>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<30.877500,0.000000,33.370600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.877500,0.000000,33.370600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.419800,0.000000,33.912900>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<30.877500,0.000000,33.370600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.419800,0.000000,33.912900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.792900,0.000000,33.912900>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<29.792900,0.000000,33.912900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.419800,0.000000,35.007700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.792900,0.000000,35.007700>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<29.792900,0.000000,35.007700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.792900,0.000000,34.465400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.792900,0.000000,35.550000>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<29.792900,0.000000,35.550000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.606400,0.000000,36.102500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.606400,0.000000,37.187100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<30.606400,0.000000,37.187100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.064000,0.000000,38.824200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.792900,0.000000,38.553000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<29.792900,0.000000,38.553000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.792900,0.000000,38.553000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.792900,0.000000,38.010700>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.792900,0.000000,38.010700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.792900,0.000000,38.010700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.064000,0.000000,37.739600>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<29.792900,0.000000,38.010700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.064000,0.000000,37.739600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.148700,0.000000,37.739600>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<30.064000,0.000000,37.739600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.148700,0.000000,37.739600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.419800,0.000000,38.010700>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.148700,0.000000,37.739600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.419800,0.000000,38.010700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.419800,0.000000,38.553000>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<31.419800,0.000000,38.553000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.419800,0.000000,38.553000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.148700,0.000000,38.824200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<31.148700,0.000000,38.824200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.148700,0.000000,38.824200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.606400,0.000000,38.824200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<30.606400,0.000000,38.824200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.606400,0.000000,38.824200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.606400,0.000000,38.281900>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.606400,0.000000,38.281900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.419800,0.000000,39.376700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.792900,0.000000,39.376700>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<29.792900,0.000000,39.376700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.792900,0.000000,39.376700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.419800,0.000000,40.461300>}
box{<0,0,-0.076200><1.955290,0.036000,0.076200> rotate<0,-33.687844,0> translate<29.792900,0.000000,39.376700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.419800,0.000000,40.461300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.792900,0.000000,40.461300>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<29.792900,0.000000,40.461300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.792900,0.000000,41.013800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.419800,0.000000,41.013800>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<29.792900,0.000000,41.013800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.419800,0.000000,41.013800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.419800,0.000000,41.827200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<31.419800,0.000000,41.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.419800,0.000000,41.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.148700,0.000000,42.098400>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<31.148700,0.000000,42.098400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.148700,0.000000,42.098400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.064000,0.000000,42.098400>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<30.064000,0.000000,42.098400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.064000,0.000000,42.098400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.792900,0.000000,41.827200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<29.792900,0.000000,41.827200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.792900,0.000000,41.827200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.792900,0.000000,41.013800>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.792900,0.000000,41.013800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.064000,0.000000,42.650900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.792900,0.000000,42.922000>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<29.792900,0.000000,42.922000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.792900,0.000000,42.922000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.792900,0.000000,43.464300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<29.792900,0.000000,43.464300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.792900,0.000000,43.464300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.064000,0.000000,43.735500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<29.792900,0.000000,43.464300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.064000,0.000000,43.735500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.335200,0.000000,43.735500>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<30.064000,0.000000,43.735500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.335200,0.000000,43.735500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.606400,0.000000,43.464300>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<30.335200,0.000000,43.735500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.606400,0.000000,43.464300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.606400,0.000000,43.193200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.606400,0.000000,43.193200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.606400,0.000000,43.464300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.877500,0.000000,43.735500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<30.606400,0.000000,43.464300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.877500,0.000000,43.735500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.148700,0.000000,43.735500>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<30.877500,0.000000,43.735500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.148700,0.000000,43.735500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.419800,0.000000,43.464300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<31.148700,0.000000,43.735500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.419800,0.000000,43.464300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.419800,0.000000,42.922000>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.419800,0.000000,42.922000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.419800,0.000000,42.922000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.148700,0.000000,42.650900>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.148700,0.000000,42.650900> }
//D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.954000,0.000000,26.146000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.954000,0.000000,24.146000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<52.954000,0.000000,24.146000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.954000,0.000000,24.146000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.754000,0.000000,24.146000>}
box{<0,0,-0.063500><3.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<49.754000,0.000000,24.146000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.754000,0.000000,24.146000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.154000,0.000000,24.146000>}
box{<0,0,-0.063500><0.600000,0.036000,0.063500> rotate<0,0.000000,0> translate<49.154000,0.000000,24.146000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.154000,0.000000,24.146000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.154000,0.000000,26.146000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<49.154000,0.000000,26.146000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.154000,0.000000,26.146000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.754000,0.000000,26.146000>}
box{<0,0,-0.063500><0.600000,0.036000,0.063500> rotate<0,0.000000,0> translate<49.154000,0.000000,26.146000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.754000,0.000000,26.146000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.954000,0.000000,26.146000>}
box{<0,0,-0.063500><3.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<49.754000,0.000000,26.146000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.754000,0.000000,26.146000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.754000,0.000000,24.146000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<49.754000,0.000000,24.146000> }
//D2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.954000,0.000000,8.366000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.954000,0.000000,6.366000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<52.954000,0.000000,6.366000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.954000,0.000000,6.366000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.754000,0.000000,6.366000>}
box{<0,0,-0.063500><3.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<49.754000,0.000000,6.366000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.754000,0.000000,6.366000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.154000,0.000000,6.366000>}
box{<0,0,-0.063500><0.600000,0.036000,0.063500> rotate<0,0.000000,0> translate<49.154000,0.000000,6.366000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.154000,0.000000,6.366000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.154000,0.000000,8.366000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<49.154000,0.000000,8.366000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.154000,0.000000,8.366000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.754000,0.000000,8.366000>}
box{<0,0,-0.063500><0.600000,0.036000,0.063500> rotate<0,0.000000,0> translate<49.154000,0.000000,8.366000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.754000,0.000000,8.366000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.954000,0.000000,8.366000>}
box{<0,0,-0.063500><3.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<49.754000,0.000000,8.366000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.754000,0.000000,8.366000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.754000,0.000000,6.366000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<49.754000,0.000000,6.366000> }
//D5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.284000,0.000000,26.146000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.284000,0.000000,24.146000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<26.284000,0.000000,24.146000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.284000,0.000000,24.146000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.084000,0.000000,24.146000>}
box{<0,0,-0.063500><3.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<23.084000,0.000000,24.146000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.084000,0.000000,24.146000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.484000,0.000000,24.146000>}
box{<0,0,-0.063500><0.600000,0.036000,0.063500> rotate<0,0.000000,0> translate<22.484000,0.000000,24.146000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.484000,0.000000,24.146000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.484000,0.000000,26.146000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<22.484000,0.000000,26.146000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.484000,0.000000,26.146000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.084000,0.000000,26.146000>}
box{<0,0,-0.063500><0.600000,0.036000,0.063500> rotate<0,0.000000,0> translate<22.484000,0.000000,26.146000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.084000,0.000000,26.146000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.284000,0.000000,26.146000>}
box{<0,0,-0.063500><3.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<23.084000,0.000000,26.146000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.084000,0.000000,26.146000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.084000,0.000000,24.146000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<23.084000,0.000000,24.146000> }
//D6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.284000,0.000000,8.366000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.284000,0.000000,6.366000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<26.284000,0.000000,6.366000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.284000,0.000000,6.366000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.084000,0.000000,6.366000>}
box{<0,0,-0.063500><3.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<23.084000,0.000000,6.366000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.084000,0.000000,6.366000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.484000,0.000000,6.366000>}
box{<0,0,-0.063500><0.600000,0.036000,0.063500> rotate<0,0.000000,0> translate<22.484000,0.000000,6.366000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.484000,0.000000,6.366000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.484000,0.000000,8.366000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<22.484000,0.000000,8.366000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.484000,0.000000,8.366000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.084000,0.000000,8.366000>}
box{<0,0,-0.063500><0.600000,0.036000,0.063500> rotate<0,0.000000,0> translate<22.484000,0.000000,8.366000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.084000,0.000000,8.366000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.284000,0.000000,8.366000>}
box{<0,0,-0.063500><3.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<23.084000,0.000000,8.366000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.084000,0.000000,8.366000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.084000,0.000000,6.366000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<23.084000,0.000000,6.366000> }
//D9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<97.504000,0.000000,26.266000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<97.504000,0.000000,24.266000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<97.504000,0.000000,24.266000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<97.504000,0.000000,24.266000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<94.304000,0.000000,24.266000>}
box{<0,0,-0.063500><3.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<94.304000,0.000000,24.266000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<94.304000,0.000000,24.266000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<93.704000,0.000000,24.266000>}
box{<0,0,-0.063500><0.600000,0.036000,0.063500> rotate<0,0.000000,0> translate<93.704000,0.000000,24.266000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<93.704000,0.000000,24.266000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<93.704000,0.000000,26.266000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<93.704000,0.000000,26.266000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<93.704000,0.000000,26.266000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<94.304000,0.000000,26.266000>}
box{<0,0,-0.063500><0.600000,0.036000,0.063500> rotate<0,0.000000,0> translate<93.704000,0.000000,26.266000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<94.304000,0.000000,26.266000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<97.504000,0.000000,26.266000>}
box{<0,0,-0.063500><3.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<94.304000,0.000000,26.266000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<94.304000,0.000000,26.266000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<94.304000,0.000000,24.266000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<94.304000,0.000000,24.266000> }
//D10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<91.054000,0.000000,3.286000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<91.054000,0.000000,1.286000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<91.054000,0.000000,1.286000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<91.054000,0.000000,1.286000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<87.854000,0.000000,1.286000>}
box{<0,0,-0.063500><3.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<87.854000,0.000000,1.286000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<87.854000,0.000000,1.286000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<87.254000,0.000000,1.286000>}
box{<0,0,-0.063500><0.600000,0.036000,0.063500> rotate<0,0.000000,0> translate<87.254000,0.000000,1.286000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<87.254000,0.000000,1.286000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<87.254000,0.000000,3.286000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<87.254000,0.000000,3.286000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<87.254000,0.000000,3.286000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<87.854000,0.000000,3.286000>}
box{<0,0,-0.063500><0.600000,0.036000,0.063500> rotate<0,0.000000,0> translate<87.254000,0.000000,3.286000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<87.854000,0.000000,3.286000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<91.054000,0.000000,3.286000>}
box{<0,0,-0.063500><3.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<87.854000,0.000000,3.286000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<87.854000,0.000000,3.286000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<87.854000,0.000000,1.286000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<87.854000,0.000000,1.286000> }
//D13 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.084000,0.000000,26.146000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.084000,0.000000,24.146000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<77.084000,0.000000,24.146000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.084000,0.000000,24.146000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.884000,0.000000,24.146000>}
box{<0,0,-0.063500><3.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<73.884000,0.000000,24.146000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.884000,0.000000,24.146000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.284000,0.000000,24.146000>}
box{<0,0,-0.063500><0.600000,0.036000,0.063500> rotate<0,0.000000,0> translate<73.284000,0.000000,24.146000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.284000,0.000000,24.146000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.284000,0.000000,26.146000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<73.284000,0.000000,26.146000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.284000,0.000000,26.146000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.884000,0.000000,26.146000>}
box{<0,0,-0.063500><0.600000,0.036000,0.063500> rotate<0,0.000000,0> translate<73.284000,0.000000,26.146000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.884000,0.000000,26.146000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.084000,0.000000,26.146000>}
box{<0,0,-0.063500><3.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<73.884000,0.000000,26.146000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.884000,0.000000,26.146000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.884000,0.000000,24.146000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<73.884000,0.000000,24.146000> }
//D14 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.084000,0.000000,8.366000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.084000,0.000000,6.366000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<77.084000,0.000000,6.366000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.084000,0.000000,6.366000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.884000,0.000000,6.366000>}
box{<0,0,-0.063500><3.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<73.884000,0.000000,6.366000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.884000,0.000000,6.366000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.284000,0.000000,6.366000>}
box{<0,0,-0.063500><0.600000,0.036000,0.063500> rotate<0,0.000000,0> translate<73.284000,0.000000,6.366000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.284000,0.000000,6.366000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.284000,0.000000,8.366000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<73.284000,0.000000,8.366000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.284000,0.000000,8.366000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.884000,0.000000,8.366000>}
box{<0,0,-0.063500><0.600000,0.036000,0.063500> rotate<0,0.000000,0> translate<73.284000,0.000000,8.366000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.884000,0.000000,8.366000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<77.084000,0.000000,8.366000>}
box{<0,0,-0.063500><3.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<73.884000,0.000000,8.366000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.884000,0.000000,8.366000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.884000,0.000000,6.366000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<73.884000,0.000000,6.366000> }
//JP1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.381000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.969000,0.000000,28.956000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,0.000000,0> translate<0.381000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.381000,0.000000,39.116000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.969000,0.000000,39.116000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,0.000000,0> translate<0.381000,0.000000,39.116000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.381000,0.000000,39.116000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.381000,0.000000,28.956000>}
box{<0,0,-0.063500><10.160000,0.036000,0.063500> rotate<0,-90.000000,0> translate<0.381000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.969000,0.000000,39.116000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.969000,0.000000,37.846000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<5.969000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.969000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.969000,0.000000,30.226000>}
box{<0,0,-0.063500><7.620000,0.036000,0.063500> rotate<0,-90.000000,0> translate<5.969000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.969000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.969000,0.000000,28.956000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<5.969000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.969000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.699000,0.000000,30.226000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<4.699000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.699000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.699000,0.000000,37.846000>}
box{<0,0,-0.063500><7.620000,0.036000,0.063500> rotate<0,90.000000,0> translate<4.699000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.699000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.969000,0.000000,37.846000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<4.699000,0.000000,37.846000> }
//JP2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.381000,0.000000,11.176000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.969000,0.000000,11.176000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,0.000000,0> translate<0.381000,0.000000,11.176000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.381000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.969000,0.000000,21.336000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,0.000000,0> translate<0.381000,0.000000,21.336000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.381000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.381000,0.000000,11.176000>}
box{<0,0,-0.063500><10.160000,0.036000,0.063500> rotate<0,-90.000000,0> translate<0.381000,0.000000,11.176000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.969000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.969000,0.000000,20.066000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<5.969000,0.000000,20.066000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.969000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.969000,0.000000,12.446000>}
box{<0,0,-0.063500><7.620000,0.036000,0.063500> rotate<0,-90.000000,0> translate<5.969000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.969000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.969000,0.000000,11.176000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<5.969000,0.000000,11.176000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.969000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.699000,0.000000,12.446000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<4.699000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.699000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.699000,0.000000,20.066000>}
box{<0,0,-0.063500><7.620000,0.036000,0.063500> rotate<0,90.000000,0> translate<4.699000,0.000000,20.066000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.699000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.969000,0.000000,20.066000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<4.699000,0.000000,20.066000> }
//JP5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.384000,0.000000,49.784000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.384000,0.000000,44.196000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,-90.000000,0> translate<24.384000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.464000,0.000000,49.784000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.464000,0.000000,44.196000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,-90.000000,0> translate<29.464000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.464000,0.000000,49.784000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.384000,0.000000,49.784000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,0.000000,0> translate<24.384000,0.000000,49.784000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.464000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.194000,0.000000,44.196000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<28.194000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.194000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.654000,0.000000,44.196000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<25.654000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.654000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.384000,0.000000,44.196000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<24.384000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.654000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.654000,0.000000,45.466000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<25.654000,0.000000,45.466000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.654000,0.000000,45.466000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.194000,0.000000,45.466000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<25.654000,0.000000,45.466000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.194000,0.000000,45.466000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.194000,0.000000,44.196000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<28.194000,0.000000,44.196000> }
//JP6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.304000,0.000000,49.784000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.304000,0.000000,44.196000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,-90.000000,0> translate<19.304000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.384000,0.000000,49.784000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.384000,0.000000,44.196000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,-90.000000,0> translate<24.384000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.384000,0.000000,49.784000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.304000,0.000000,49.784000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,0.000000,0> translate<19.304000,0.000000,49.784000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.384000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.114000,0.000000,44.196000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<23.114000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.114000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.574000,0.000000,44.196000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<20.574000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.574000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.304000,0.000000,44.196000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<19.304000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.574000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.574000,0.000000,45.466000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<20.574000,0.000000,45.466000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.574000,0.000000,45.466000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.114000,0.000000,45.466000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<20.574000,0.000000,45.466000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.114000,0.000000,45.466000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.114000,0.000000,44.196000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<23.114000,0.000000,44.196000> }
//JP7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<75.184000,0.000000,49.784000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<75.184000,0.000000,44.196000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,-90.000000,0> translate<75.184000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<80.264000,0.000000,49.784000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<80.264000,0.000000,44.196000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,-90.000000,0> translate<80.264000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<80.264000,0.000000,49.784000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<75.184000,0.000000,49.784000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,0.000000,0> translate<75.184000,0.000000,49.784000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<80.264000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.994000,0.000000,44.196000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<78.994000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.994000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.454000,0.000000,44.196000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<76.454000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.454000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<75.184000,0.000000,44.196000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<75.184000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.454000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.454000,0.000000,45.466000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<76.454000,0.000000,45.466000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.454000,0.000000,45.466000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.994000,0.000000,45.466000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<76.454000,0.000000,45.466000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.994000,0.000000,45.466000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<78.994000,0.000000,44.196000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<78.994000,0.000000,44.196000> }
//JP8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.104000,0.000000,49.784000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.104000,0.000000,44.196000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,-90.000000,0> translate<70.104000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<75.184000,0.000000,49.784000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<75.184000,0.000000,44.196000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,-90.000000,0> translate<75.184000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<75.184000,0.000000,49.784000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.104000,0.000000,49.784000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,0.000000,0> translate<70.104000,0.000000,49.784000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<75.184000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.914000,0.000000,44.196000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<73.914000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.914000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.374000,0.000000,44.196000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<71.374000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.374000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<70.104000,0.000000,44.196000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<70.104000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.374000,0.000000,44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.374000,0.000000,45.466000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<71.374000,0.000000,45.466000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<71.374000,0.000000,45.466000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.914000,0.000000,45.466000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<71.374000,0.000000,45.466000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.914000,0.000000,45.466000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.914000,0.000000,44.196000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<73.914000,0.000000,44.196000> }
//P3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<50.254000,-1.536000,0.216000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<50.254000,-1.536000,50.216000>}
box{<0,0,-0.127000><50.000000,0.036000,0.127000> rotate<0,90.000000,0> translate<50.254000,-1.536000,50.216000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<50.254000,-1.536000,50.216000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.254000,-1.536000,50.216000>}
box{<0,0,-0.127000><50.000000,0.036000,0.127000> rotate<0,0.000000,0> translate<0.254000,-1.536000,50.216000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.254000,-1.536000,50.216000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.254000,-1.536000,0.216000>}
box{<0,0,-0.127000><50.000000,0.036000,0.127000> rotate<0,-90.000000,0> translate<0.254000,-1.536000,0.216000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.254000,-1.536000,0.216000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<50.254000,-1.536000,0.216000>}
box{<0,0,-0.127000><50.000000,0.036000,0.127000> rotate<0,0.000000,0> translate<0.254000,-1.536000,0.216000> }
object{ARC(3.241600,0.203200,199.133643,326.003541,0.036000) translate<38.066500,-1.536000,37.528500>}
object{ARC(3.241600,0.203200,33.996459,160.866357,0.036000) translate<38.066500,-1.536000,37.903500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.754000,-1.536000,39.716000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.754000,-1.536000,38.966000>}
box{<0,0,-0.101600><0.750000,0.036000,0.101600> rotate<0,-90.000000,0> translate<40.754000,-1.536000,38.966000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.754000,-1.536000,35.716000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.754000,-1.536000,36.466000>}
box{<0,0,-0.101600><0.750000,0.036000,0.101600> rotate<0,90.000000,0> translate<40.754000,-1.536000,36.466000> }
object{ARC(3.241600,0.203200,199.133643,326.003541,0.036000) translate<13.066500,-1.536000,37.528500>}
object{ARC(3.241600,0.203200,33.996459,160.866357,0.036000) translate<13.066500,-1.536000,37.903500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.754000,-1.536000,39.716000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.754000,-1.536000,38.966000>}
box{<0,0,-0.101600><0.750000,0.036000,0.101600> rotate<0,-90.000000,0> translate<15.754000,-1.536000,38.966000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.754000,-1.536000,35.716000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.754000,-1.536000,36.466000>}
box{<0,0,-0.101600><0.750000,0.036000,0.101600> rotate<0,90.000000,0> translate<15.754000,-1.536000,36.466000> }
object{ARC(3.241600,0.203200,199.133643,326.003541,0.036000) translate<38.066500,-1.536000,12.528500>}
object{ARC(3.241600,0.203200,33.996459,160.866357,0.036000) translate<38.066500,-1.536000,12.903500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.754000,-1.536000,14.716000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.754000,-1.536000,13.966000>}
box{<0,0,-0.101600><0.750000,0.036000,0.101600> rotate<0,-90.000000,0> translate<40.754000,-1.536000,13.966000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.754000,-1.536000,10.716000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.754000,-1.536000,11.466000>}
box{<0,0,-0.101600><0.750000,0.036000,0.101600> rotate<0,90.000000,0> translate<40.754000,-1.536000,11.466000> }
object{ARC(3.241600,0.203200,199.133643,326.003541,0.036000) translate<13.066500,-1.536000,12.528500>}
object{ARC(3.241600,0.203200,33.996459,160.866357,0.036000) translate<13.066500,-1.536000,12.903500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.754000,-1.536000,14.716000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.754000,-1.536000,13.966000>}
box{<0,0,-0.101600><0.750000,0.036000,0.101600> rotate<0,-90.000000,0> translate<15.754000,-1.536000,13.966000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.754000,-1.536000,10.716000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.754000,-1.536000,11.466000>}
box{<0,0,-0.101600><0.750000,0.036000,0.101600> rotate<0,90.000000,0> translate<15.754000,-1.536000,11.466000> }
//P4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<100.254000,-1.536000,0.216000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<100.254000,-1.536000,50.216000>}
box{<0,0,-0.127000><50.000000,0.036000,0.127000> rotate<0,90.000000,0> translate<100.254000,-1.536000,50.216000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<100.254000,-1.536000,50.216000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<50.254000,-1.536000,50.216000>}
box{<0,0,-0.127000><50.000000,0.036000,0.127000> rotate<0,0.000000,0> translate<50.254000,-1.536000,50.216000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<50.254000,-1.536000,50.216000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<50.254000,-1.536000,0.216000>}
box{<0,0,-0.127000><50.000000,0.036000,0.127000> rotate<0,-90.000000,0> translate<50.254000,-1.536000,0.216000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<50.254000,-1.536000,0.216000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<100.254000,-1.536000,0.216000>}
box{<0,0,-0.127000><50.000000,0.036000,0.127000> rotate<0,0.000000,0> translate<50.254000,-1.536000,0.216000> }
object{ARC(3.241600,0.203200,199.133643,326.003541,0.036000) translate<88.066500,-1.536000,37.528500>}
object{ARC(3.241600,0.203200,33.996459,160.866357,0.036000) translate<88.066500,-1.536000,37.903500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<90.754000,-1.536000,39.716000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<90.754000,-1.536000,38.966000>}
box{<0,0,-0.101600><0.750000,0.036000,0.101600> rotate<0,-90.000000,0> translate<90.754000,-1.536000,38.966000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<90.754000,-1.536000,35.716000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<90.754000,-1.536000,36.466000>}
box{<0,0,-0.101600><0.750000,0.036000,0.101600> rotate<0,90.000000,0> translate<90.754000,-1.536000,36.466000> }
object{ARC(3.241600,0.203200,199.133643,326.003541,0.036000) translate<63.066500,-1.536000,37.528500>}
object{ARC(3.241600,0.203200,33.996459,160.866357,0.036000) translate<63.066500,-1.536000,37.903500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.754000,-1.536000,39.716000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.754000,-1.536000,38.966000>}
box{<0,0,-0.101600><0.750000,0.036000,0.101600> rotate<0,-90.000000,0> translate<65.754000,-1.536000,38.966000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.754000,-1.536000,35.716000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.754000,-1.536000,36.466000>}
box{<0,0,-0.101600><0.750000,0.036000,0.101600> rotate<0,90.000000,0> translate<65.754000,-1.536000,36.466000> }
object{ARC(3.241600,0.203200,199.133643,326.003541,0.036000) translate<88.066500,-1.536000,12.528500>}
object{ARC(3.241600,0.203200,33.996459,160.866357,0.036000) translate<88.066500,-1.536000,12.903500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<90.754000,-1.536000,14.716000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<90.754000,-1.536000,13.966000>}
box{<0,0,-0.101600><0.750000,0.036000,0.101600> rotate<0,-90.000000,0> translate<90.754000,-1.536000,13.966000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<90.754000,-1.536000,10.716000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<90.754000,-1.536000,11.466000>}
box{<0,0,-0.101600><0.750000,0.036000,0.101600> rotate<0,90.000000,0> translate<90.754000,-1.536000,11.466000> }
object{ARC(3.241600,0.203200,199.133643,326.003541,0.036000) translate<63.066500,-1.536000,12.528500>}
object{ARC(3.241600,0.203200,33.996459,160.866357,0.036000) translate<63.066500,-1.536000,12.903500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.754000,-1.536000,14.716000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.754000,-1.536000,13.966000>}
box{<0,0,-0.101600><0.750000,0.036000,0.101600> rotate<0,-90.000000,0> translate<65.754000,-1.536000,13.966000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.754000,-1.536000,10.716000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<65.754000,-1.536000,11.466000>}
box{<0,0,-0.101600><0.750000,0.036000,0.101600> rotate<0,90.000000,0> translate<65.754000,-1.536000,11.466000> }
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  BUTTON_PAD(-50.343000,0,-25.197000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//D1		DOIDE-1N4148
//D2		DOIDE-1N4148
//D5		DOIDE-1N4148
//D6		DOIDE-1N4148
//D9		DOIDE-1N4148
//D10		DOIDE-1N4148
//D13		DOIDE-1N4148
//D14		DOIDE-1N4148
//JP1		MOLEX-1X4
//JP2		MOLEX-1X4
//JP5		MOLEX-1X2
//JP6		MOLEX-1X2
//JP7		MOLEX-1X2
//JP8		MOLEX-1X2
//P3	BUTTONPAD-4x4	BUTTONPAD-2X2
//P4	BUTTONPAD-4x4	BUTTONPAD-2X2
