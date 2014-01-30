/*
 *  OpenSCAD gregs_wade_cooling_hood.scad 
 *  Copyright (C) 2014 Mogue Carpenter
 *
 *  License: LGPL 2.1 or later
 *
 *  Design for a two 40mm fan cooling hood 
 *  for a gred wades extruder.
 *
*/

// overall block
height = 40;
width = 28;
lenght = 77;

attachment_plate_height = 3;
wall_thinkness = 1.8;

peek_chamber_h = 28;
peek_chamber_r = 10;
peek_skirt_r = 7;

hole_r = 10;



attachment_plate();
peek_cooling_block();

module attachment_plate(){
	difference(){
		translate([0,0,(height/2)-attachment_plate_height])
			cube([lenght,width,attachment_plate_height], center=true);
		translate([0,0,(height/2)-attachment_plate_height])
			cylinder (h=peek_chamber_h,r=peek_chamber_r, center=true);
	}
}

module peek_cooling_block(){
	difference(){
		peek_chamber_block();

		// peek chamber
		translate([0,0,wall_thinkness])
			cylinder (h=peek_chamber_h,r=peek_chamber_r, center=true);

		// peek skirt
		cylinder (h=peek_chamber_h+wall_thinkness*2,r=peek_skirt_r, center=true);

		// exahust 
		translate([0,0,-(peek_chamber_h/2)+wall_thinkness*2])
			cube([(peek_chamber_r+wall_thinkness)*2,wall_thinkness*2,wall_thinkness*2] , center=true);
		translate([0,0,-(peek_chamber_h/2)+wall_thinkness*2])
			cube([wall_thinkness*2,(peek_chamber_r+wall_thinkness)*2,wall_thinkness*2] , center=true);

		// fan hole
		translate([width/2,0,0])
			rotate([0,90,0])
				cylinder(h=wall_thinkness+1, r=(width/2)-(wall_thinkness*2), center=true);
	}
}


module peek_chamber_block(){
	difference(){
		translate([0,0,-(wall_thinkness)]	)
			cylinder (h=peek_chamber_h-(wall_thinkness*2),r=peek_chamber_r+wall_thinkness, center=true);
		intake_holes();
}

	// Peek Air Passage
	difference(){
		// outer wall
		cube ([width,width,peek_chamber_h+wall_thinkness],center=true);

		// inner chamber
		translate([0,0,-wall_thinkness*2])
		cube ([width-wall_thinkness,width-wall_thinkness,peek_chamber_h-(wall_thinkness*4)],center=true);

		intake_holes();
	}
}


module intake_holes(){
		// intake holes
		translate([width/4,0,(peek_chamber_h/2)-(attachment_plate_height)])
			cube([wall_thinkness*2,width,wall_thinkness*2] , center=true);
		translate([-width/4,0,(peek_chamber_h/2)-(attachment_plate_height)])
			cube([wall_thinkness*2,width,wall_thinkness*2] , center=true);
}





// fan 50mm
fan_width = 50;
fan_height = 11;
fan_r = 22.25;
screw_hole_r =  2.25 ;
screw_hole_off_set = 5.5;

// fan 40mm


// fan 30mm
fan_width = 30;
fan_height = 7;
fan_r = 14;
screw_hole_r =  1.75 ;
screw_hole_off_set = 2.5;

translate([width,width-fan_width,0])	rotate([0,60,0])
		fan_model();

/* the dimension of the rectangle that would define its height when rotated would be the lenght from corner to corner, so you would find that length c = sqrt(a^2 +b^2) and then the height you would have would an original angle a=tan^-1(b/a) and the new height would be defined by h = c*sin^-1(a+new angle)
*/

module fan_model(){
	fan_screw_tran = (fan_width/2)-screw_hole_off_set;

	difference(){
		cube ([fan_width,fan_width,fan_height],center=true);
		cylinder( h=fan_height, r=fan_r, center = true );
		// main fan hole
		translate([fan_width-screw_hole_off_set-screw_hole_r,0,0])
			cylinder( h=fan_height, r=screw_hole_r, center = true );

		// screw holes
 		translate([fan_screw_tran,fan_screw_tran,0])
			cylinder( h=fan_height, r=screw_hole_r, center = true );
 		translate([fan_screw_tran,-fan_screw_tran,0])
			cylinder( h=fan_height, r=screw_hole_r, center = true );
 		translate([-fan_screw_tran,-fan_screw_tran,0])
			cylinder( h=fan_height, r=screw_hole_r, center = true );
 		translate([-fan_screw_tran,fan_screw_tran,0])
			cylinder( h=fan_height, r=screw_hole_r, center = true );
	}
}

//duct_stencil();

//rotate_extrude() translate([20, 0]) square([10, 20]);
// rotate_extrude($fn = 8) translate([hole_r,0])
//	rotate([0,90,0])
//	linear_extrude(height=1) duct_stencil();

module duct_stencil(){
	duct_height = 5;
	duct_lenght = 30;
	duct_angle = 30;

	duct_apature=duct_height/cos(90-duct_angle);
	lost_lenght = duct_height * tan(90-duct_angle);

	duct_short_internal_lenght = (duct_lenght-lost_lenght);
	duct_bend_x = (duct_short_internal_lenght*cos(duct_angle));

	duct_bend_y = (duct_short_internal_lenght*sin(duct_angle));

	//translate([0,hole_r]) square([duct_apature,duct_apature]);
	//translate([duct_bend_y,hole_r+duct_apature]) square([duct_bend_x,duct_bend_x]);

	translate([-fan_width-duct_bend_y,duct_bend_x])
		square([fan_width,duct_apature]);

		rotate(duct_angle)
			square([duct_height,duct_lenght]);
}

module duct_bend(){
// part fan duct
p_duct_r = 5;
ell_factor = 2.5;

	translate([-15,0,0]){
		difference(){
			scale([2.5, 1]) circle(r=p_duct_r, center=false);
			translate([0,p_duct_r]) scale([2, 1]) circle(r=p_duct_r, center=false);
			translate([0,-p_duct_r]) square(p_duct_r*ell_factor,p_duct_r*ell_factor);
	}
		translate([-(p_duct_r*ell_factor),0]) square(p_duct_r,p_duct_r);
	}
}
