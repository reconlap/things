/*
 *  OpenSCAD threaded rod holder 
 *  Copyright (C) 2013 Mogue Carpenter
 *
 *  License: LGPL 2.1 or later
 *
 *  A simple rod holder to fit on a rectangular
 *  pipe with a m4 retaining screw.
*/

include <nut_trap.scad>;

// Rod size
rod_dia = 8;
rod_r = rod_dia/2 ;

// Part size
box_height = 30;
outer_size_x = 25;
outer_size_y = 25;

// Tube size
inner_size_x = 21;
inner_size_y = 21;

// Bolt
bolt_lenght = 15;
bolt_nut_dia = 7;

difference() {
	union() {
		// Outer Box
		translate([-rod_dia/2,0,0])
		cube( size = [outer_size_x+rod_dia,outer_size_y,box_height], center = true); 
		wedge ();
		translate([inner_size_x/2+bolt_nut_dia,0,0]) nut_vise(bolt_nut_dia,bolt_lenght,box_height);
	}

		// - inner box
		cube( size = [inner_size_x,inner_size_y,box_height+2], center = true); 
		// rod clip
		translate ([-((outer_size_x/1.3+rod_dia)),0,-box_height/4])
			rod_clip_hole(outer_size_y+2,(rod_dia/2),box_height/2);
	  // vice grip gap
		translate([(bolt_nut_dia*2)+(outer_size_x - inner_size_x),0,0])
			cube (size = [(bolt_nut_dia*2)+(outer_size_x - inner_size_x)+1,outer_size_y/6,box_height], center = true) ;
}

module rod_clip_hole (w, r, h) {
	rotate([90,0,0])
		cylinder(w,r+0.2,r+0.2,center = true);
	translate ( v = [0,0,-h/4] )
		cube( size = [(r*2)-.2,w,h/2], center = true); 
 }

module wedge (){
translate ( v = [-(outer_size_x+rod_dia),0,0] )
	polyhedron(
	  points=[ 
			// the four points at base
			[outer_size_x/2,outer_size_y/2,-box_height/2],
			[outer_size_x/2,-outer_size_y/2,-box_height/2],
			[-outer_size_x/2,-outer_size_y/2,-box_height/2],
			[-outer_size_x/2,outer_size_y/2,-box_height/2],	
	 		// the apex edge 
			[outer_size_x/2,-outer_size_y/2,box_height/2],
			[outer_size_x/2,outer_size_y/2,box_height/2]  
		],
		triangles=[
					// each triangle side
					[0,1,4],
					[1,2,4],
					[2,3,5],
					[3,0,5],
					[0,4,5],
					[4,2,5],
					// two triangles for square base
					[1,0,3],
					[2,1,3] 
		] 
 );
}

module nut_vise(x,y,h,n){

	// nut trap
	nut_trap_size = x; // nut trap x lenght is nut_trap_size*2
	nut_trap_depth = 3;
	nut_trap_sides = 6;
	bolt_dia = 3.8;
	shaft_lenght = y+1;


	difference() {
		cube( size = [nut_trap_size*2,y,h], center = true);
		rotate([90,0,0])
			nut_trap(lenght=shaft_lenght, hole_dia=bolt_dia, nut_dia=nut_trap_size, nut_depth=nut_trap_depth, nut_sides = nut_trap_sides );
	};
};
