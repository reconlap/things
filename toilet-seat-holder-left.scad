/*
 *  OpenSCAD toilet-seat-holder-left.scad
 *  Copyright (C) 2013 Mogue Carpenter
 *
 *  License: LGPL 2.1 or later
 *
 *  A simple holder to hold a toilet seat
 *  onto a bow.
*/

rotate([90,0,90])
seat_hook();

module seat_hook(){
	base();
	rotate([180,0,90])
		translate([-(32.5/2)+(13-9),0,(9.4/2)+((36.7-9.4)/2)])
			hook();
}

module hook(){
	cube([9,9,36.7-9.4],center = true);
	translate([0,(32.5-9.4)/2,(36.7/2)-(9) ] )
		rotate ([90,0,0])
			cylinder(h = 32.5, r = 9/2,center = true);

}

module base(){
	difference () {
		cube (size=[32.5,38.5,9.4], center=true);
		translate([0,3,0])
			cube (size=[1+32.5-7,38.5,3.5],center=true);
		translate([0,8.2,5])
			cube (size=[32.5-(8*2),38.5-(8),10],center=true);
	};
};