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


plug_lenght = 39;
plug_width = 14;
plug_height = 5;


round_cube (p=0.1,l=lenght,w=width,h=height,r=height/4,s=45);

module round_cube (p,l,w,h,r,s){
	difference() {
		cube([l,w,h],center=true);
		round_edge_shadow (p,l,w,h,r,s);
	}
}

module round_edge_shadow (p,l,w,h,r,s){
	union() {
		round_edge_shadow_l (p,l,w,h,r,s);
		rotate([0,0,90])
			round_edge_shadow_l (p,w,l,h,r,s);
		rotate([0,90,0])
			round_edge_shadow_l (p,h,w,l,r,s);
	}
}


module round_edge_shadow_l (p,l,w,h,r,s){

pad = p;			// Padding to maintain manifold
box_l = l; 		// Length
box_w = w;		// Width
box_h = h;		// Height
round_r = r;	// Radius of round
smooth = s;		// Number of facets of rounding cylinder

	difference() {
		cube([box_l+pad, box_w+pad, box_h+pad], center = true);

		translate([0, -box_w/2+round_r, box_h/2-round_r]) 
		{
			rotate(a=[0,90,0])
				cylinder(box_l+4*pad,round_r,round_r,center=true,$fn=smooth);
		}

		translate([0, -box_w/2+round_r, -(box_h/2-round_r)]) 
		{
			rotate(a=[0,90,0])
				cylinder(box_l+4*pad,round_r,round_r,center=true,$fn=smooth);
		}

		translate([0, box_w/2-round_r, -(box_h/2-round_r)]) 
		{
			rotate(a=[0,90,0])
				cylinder(box_l+4*pad,round_r,round_r,center=true,$fn=smooth);
		}

		translate([0, box_w/2-round_r, box_h/2-round_r]) 
		{
			rotate(a=[0,90,0])
				cylinder(box_l+4*pad,round_r,round_r,center=true,$fn=smooth);
		}

		cube([box_l+pad, box_w-(round_r*2)+pad, box_h+pad+pad], center = true);
		cube([box_l+pad, box_w+pad, box_h-(round_r*2)+pad], center = true);

	} //diff
} // round_edge_shadow