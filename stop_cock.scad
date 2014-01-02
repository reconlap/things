/*
 *  OpenSCAD stop_cock.scad 
 *  Copyright (C) 2014 Mogue Carpenter
 *
 *  License: LGPL 2.1 or later
 *
 *  Creates a stop cock key for
 *  opening and closing the mains 
 *  water supply valve.
 *
*/
	inner_cyc_r = 5/2;
	outer_cyc_r = 27/2;

	shaft_h = 100;
	shaft_r = 27/2;
	shaft_taper_h = 20;

	cyc_h = 20;

	inner_hex_side = 5;
	inner_hex_r = 10.5/2;

	outer_hex_side = 10;
	outer_hex_r = 19/2;

	handel_w = 60;



	translate([0,0,cyc_h+shaft_h])
		rotate ([0,180,0])
			stopcock ();

module stopcock (){

	// Socket
	union (){
		difference(){
			cylinder(r = outer_cyc_r, h=cyc_h, $fn=40);
			cylinder(r = outer_hex_r, h=cyc_h, $fn=6);
		}

		difference(){
			cylinder(r = inner_hex_r, h=cyc_h, $fn=6);
			cylinder(r = inner_cyc_r, h=cyc_h, $fn=18);
		}
	}

	// Taper
	translate([0,0,cyc_h])
		cylinder(r1 = outer_cyc_r,r = shaft_r, h=shaft_taper_h, $fn=40);

	// Shaft
	translate([0,0,cyc_h+shaft_taper_h])
		cylinder(r = shaft_r, h=shaft_h-shaft_taper_h, $fn=40);

	// Handle
	translate([0,0,cyc_h+shaft_h])
		cube([shaft_r,handel_w,shaft_r],center=true);

	translate([0,0,cyc_h+shaft_h])
		rotate ([0,0,90])
			cube([shaft_r,handel_w,shaft_r],center=true);
}
