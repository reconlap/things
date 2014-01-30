/*
 *  OpenSCAD sink_stopper.scad 
 *  Copyright (C) 2014 Mogue Carpenter
 *
 *  License: LGPL 2.1 or later
 *
 *  Creates a simple stopper for 
 *  use in a sink. 
 *
*/

stopper_d = 38;
slope = 1;
height = 8;
detail = 256; //128;

//Base
botton_r = (stopper_d/2)-slope;
top_r = (stopper_d/2);
botton_ir = botton_r -2;
top_ir = botton_r - (height/2);

//Chain attachment
att_height = height/1.5;
att_width = 4;
att_lenght = stopper_d/4; 

	translate([0,0,height+(att_height/2)]) attachment();
	base();

module attachment(){
	difference(){
		cube ([att_lenght,att_width,att_height],center=true);

		// hole
		translate([0,0,-1])
			rotate([90,0,0])
				cylinder (h=att_width+1, r=att_lenght/6, center=true, $fn=detail );

		//bevel
		translate([-att_lenght/2,0,att_height/2])
			rotate([90,0,0])
				cylinder (h=att_width+1, r=att_lenght/4, center=true, $fn=detail );

		mirror([ 1, 0, 0 ]) { 
			translate([-att_lenght/2,0,att_height/2])
				rotate([90,0,0])
					cylinder (h=att_width+1, r=att_lenght/4, center=true, $fn=detail );
		}
	}
}

module base(){
	difference (){
		cylinder (h=height, r1=botton_r, r2=top_r, $fn=detail );
		cylinder (h=height-3, r1=botton_ir, r2=top_ir, $fn=detail );
	}
	translate([0,0,height/2]){
		cube([botton_ir*2,1,height],center=true);
		cube([1,botton_ir*2,height],center=true);
	}
}

