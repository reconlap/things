/*
 * microswitch_holder.scad
 * An updated mircoswitch holder for the adjustable z endstop holder.
 * Copyright (C) 2014 Mogue Carpenter
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with this programbvngn If not, see <http://www.gnu.org/licenses/>.
*/

//switch dimensions
sw_h = 9.75;
sw_l = 20;
sw_w = 6;
sw_bore = 1.5;
sw_h_os = 3.5;
sw_gap = 10;

// holder
h_h = 35;
h_w = 12;
h_l = sw_l;
sc_os = 8;
wall = 2.75;
h_top_h = 13;

//wires tubing
pin_h = 4;
pin_w = 4;

//bolt hole
b_ir = 1.75;
b_or = 3;
b_h = 3;


rotate ([0,90,0])
difference(){
	translate([0,0,pin_h+sw_h/2-(h_h/2)]) cube([h_l,h_w,h_h], center=true);
	translate([0,0,sw_h/4]) sw_holder ();
	translate([0,2.75,((sw_h-h_h)/2)-h_top_h]) cube([h_l,h_w,h_h], center=true);
}	

//sw_holder ();

module sw_holder () {
	translate([0,0,pin_h]){
		cube([sw_l,sw_w,sw_h], center=true);
		// mircoswitch boltholes
		translate([sw_gap/2,0,-(sw_h/2)+sw_h_os]) rotate([90,0,0]) cylinder(h=h_w+1, r=sw_bore, center=true);
		translate([-sw_gap/2,0,-(sw_h/2)+sw_h_os]) rotate([90,0,0]) cylinder(h=h_w+1, r=sw_bore, center=true);
}
		// adjustment bolthole 
	translate([0,0,-((b_h+sw_h)/2)]) cylinder(h=b_h, r=b_h, center=true);
	translate([0,0,-((b_h+sw_h)/2)]) cylinder(h=h_h, r=b_ir, center=true);
	translate([0,0, -0.5-pin_h/2 ]) cube([b_or*2,sw_w, pin_h+1 ], center=true);
	difference(){
		translate([0,0,-h_h/2]) cube([sw_l,sw_w,h_h], center=true);
		translate([0,0,-h_h/2]) cube([sw_l-pin_w*2,sw_w,h_h], center=true);
	}
}