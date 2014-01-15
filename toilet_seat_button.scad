/*
 *  OpenSCAD Seat Spacer 
 *  Copyright (C) 2013 Mogue Carpenter
 *
 *  License: LGPL 2.1 or later
 *
 *  A simple spacer for the base of
 *  a toilet seat onto a bow.
 *
*/


lenght =43;
width = 17;
height = 10;

cap_or = width/2;

plug_lenght = 39;
plug_width = 13.7;
plug_height = 5;
wall_thinkness = 1.35;

plug_or = plug_width/2;
plug_ir = plug_or-wall_thinkness;

difference(){
	body();

	translate([0,0,wall_thinkness])
	linear_extrude(height = height, center = true, convexity = 0)
		hull() {
			translate([plug_lenght - plug_width,0,0]) circle(plug_ir);
			circle(plug_ir);
		}
}

translate([plug_ir,0,wall_thinkness-1])
	cube(size=[wall_thinkness,plug_width,height-wall_thinkness],center=true);

translate([plug_lenght-(plug_or*3) ,0, wall_thinkness -1])
	cube(size=[wall_thinkness,plug_width,height-wall_thinkness],center=true);

module body(){
	difference(){
		intersection(){
			rotate([0,90,0])
				translate([(-cap_or*3)+height/2,0,-plug_lenght])
					cylinder(r=cap_or*3,h=plug_lenght*2, $fn=128);

			hull(){
				sphere(r=cap_or);
				translate([plug_lenght - plug_width,0,0]) sphere(r=cap_or);
			}
		}

		translate([-width/2,-width/2,0])
			cube(size=[lenght,width,height]);
	}

	// base
	translate([0,0, wall_thinkness])
		linear_extrude(height = height - wall_thinkness, center = true, convexity = 0){
					hull() {
	  				translate([plug_lenght - plug_width,0,0]) circle(plug_or);
					circle(plug_or);
	 			}
		}
}


module 2d_base(){
	difference(){
		hull() {
  			translate([plug_lenght - plug_width,0,0]) circle(plug_or);
			circle(plug_or);
 		}

		hull() {
			translate([plug_lenght - plug_width,0,0]) circle(plug_ir);
			circle(plug_ir);
		}
	}
}