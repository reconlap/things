/*
 *  OpenSCAD threaded rod holder 
 *  Copyright (C) 2013 Mogue Carpenter
 *
 *  License: LGPL 2.1 or later
 *
 *  A simple holder to hold a toilet seat
 *  onto a bow.
*/

rotate([90,90,90])
seat_hook();

module seat_hook(){
	base();
	rotate([180,0,270])
		translate([(32.5/2)-13,-((32.5/2)-(9/2)),(9.4/2)+((26.7-9.4)/2)])
			hook();
}

module hook(){
	cube([9,9,26.7-9.4],center = true);
	translate([0,(32.5-9.4)/2,(26.7/2)-(9) ] )
		rotate ([90,0,0])
			cylinder(h = 32.5, r = 9/2,center = true);

}

module base(){
	difference () {
		cube (size=[32.5,38.5,9.4], center=true);
		translate([0,9,0])
			cube (size=[1+32.5-8.2,38.5-(3.5*2),3.5],center=true);
		translate([0,8.2,5])
			cube (size=[32.5-(8.2*2),38.5-(8.2),10],center=true);
	};
};