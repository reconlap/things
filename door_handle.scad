/*
 *  OpenSCAD door_handle.scad 
 *  Copyright (C) 2014 Mogue Carpenter
 *
 *  License: LGPL 2.1 or later
 *
 *  Design for a simple door handle
 *  with two screw holes.
 *
*/

detail = 500 ; // 320

handel_r = 75;
screw_hole_r = 4;
screw_thread_r = 1.5;
handle_width = 15;
bevel_r = 3;

post_width = handle_width - bevel_r;


//scale(10/9.5,0.0,0.0){
//rotate([0,0,50]){
	difference () {
		difference () {
			union(){
				// HANDLE
				difference() {
    				translate([0,-75,0]) 
						rotate_extrude($fn = detail) 
							translate([110, 0]) handle();
					translate([-150,-200,-((50-20)/2)]) cube ([300,200,50]);
				}

				// POSTS
				intersection(){
					translate([-55,0,-bevel_r]) 
						cube([15,27,handle_width+(bevel_r*2)]);
					translate([0,-150+30,0])
						cylinder (r=150,h=handle_width);
				}
				intersection(){
					translate([55-15,0,-bevel_r]) 
						cube([15,24,handle_width+(bevel_r*2)]);		
					translate([0,-150+30,0])
						cylinder (r=150,h=handle_width);
				}

			

			}
		}

		// SCREW THREAD HOLES
//		translate([47.5-1.5,0,(handle_width/2)-1.5])
			cube ([3,9.5,3]);

		translate([47.5,10,(handle_width/2)])
			rotate([90,0,0])
				cylinder ( h=11, r = screw_thread_r, $fn=60);
			
		translate([-47.5,10,(handle_width/2)])
			rotate([90,0,0])
				cylinder ( h=11, r = screw_thread_r, $fn=60);

		// SCREW HEAD HOLES
		translate([ -47.5, 34.5, (handle_width)/2])
		rotate([90,90,0])
	 	cylinder (h=25, r=screw_hole_r, $fn=60);
 
		translate([47.5,34.5,(handle_width)/2])
		rotate([90,90,0])
		cylinder (h=25, r=screw_hole_r, $fn=60);
	}

module handle() {
	hull() {
	circle(r = bevel_r);
	translate([0, handle_width]) circle(r = bevel_r);
	translate([5, 0]) circle(r = r);
	translate([5, handle_width]) circle(r = bevel_r);
	}
}
//}