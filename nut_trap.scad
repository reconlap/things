/*
 *  OpenSCAD nut_trap.scad
 *  Copyright (C) 2013 Mogue Carpenter
 *
 *  License: LGPL 2.1 or later
 *
 *  A simple nut trap. 
 *  
*/

// example 
// nut_trap(21,3,6,3,6);


module nut_trap ( lenght, hole_dia, nut_dia, nut_depth, nut_sides ) {
	// lenght : Total lenght of the trap. 
	// hole_dia : Diameter of the bolt shaft.
	// nut_dia : Diameter of the nut.
	// nut_depth : Depth of the nut trap.
	// nut_sides : Number of side in the nut trap. 
	difference() {
		union() {
			cylinder(lenght,hole_dia,hole_dia,center = true);

			translate ([0,0,(lenght/2)-nut_depth])
			cylinder(nut_depth,nut_dia,nut_dia,nut_depth,$fn=nut_sides);
		}	

	} // differance 
}
