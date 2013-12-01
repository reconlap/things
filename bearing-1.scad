/*
 *  OpenSCAD Bearing 
 *  Copyright (C) 2013 Mogue Carpenter
 *
 *  License: LGPL 2.1 or later
*/
num_bearings = 7;
bearing_r = 4;      
gap = .1;


box_size = bearing_r*8;
box_height_muliplyer = 1.5 ;
box_height = (bearing_r*2 ) * box_height_muliplyer;

//high resolution
//bearing_fa=5;
//bearing_fs=0.1;

//low resoultion
bearing_fa=12;
bearing_fs=1;


difference() {
	// Outer Box
	cube(size = [box_size,box_size,box_height], center = true); 

	// - Vertical Cylinder
	difference() { 
		cylinder(h = box_height+1, r= bearing_r*3,center = true);
		cylinder(h = box_height+2, r= bearing_r*2,center = true);
	}
  // - center rod hole 
	cylinder(h = box_height+1, r= 4,center = true);

  // - Inner bearing channel 
	rotate_extrude(convexity = 10)
    translate([bearing_r*2.5 , 0, 0])
    circle(r = ((1 + gap) * bearing_r), $fn=100);
}

// Bearings
for ( i = [1:num_bearings] ) {
	rotate( i*360/num_bearings, [0, 0, 1])
	translate ([bearing_r*2.5,0,0])
	sphere(bearing_r, $fa=bearing_fa, $fs=bearing_fs);

}

// Supports
for ( i = [1:num_bearings] ) {
	rotate( i*360/num_bearings, [0, 0, 1])
	translate ([bearing_r*2.5,0,-(box_height/2)])
	cylinder(h = ((box_height-(bearing_r*2))/2)-.5, r1 = bearing_r/4, r2 = .5, center = false);
}