/*
 *   bench_spacer.scad
 *   Creates a plastic part for fixing a table top to a table.
 *   Copyright (C) 2014  Mogue Carpenter
 *
 *    This program is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    This program is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.

 *    You should have received a copy of the GNU General Public License
 *    along with this programbvngn  If not, see <http://www.gnu.org/licenses/>.
*/

lenght = 90;
width = 60;
height = 25;

lip_width = 23;
inner_lip_height = 16.3;
outer_lip_height = 18;


walls = 5;
board_top_height = 10;
base_h = height-board_top_height;

rotate ([0,-90,0])
difference(){
	base();
	screws();
}

module screws(){
	translate([base_h,width*0.25,0]) rotate ([180,0,0])
		screw_hole();
	translate([base_h,width*0.5,0]) rotate ([180,0,0])
		screw_hole();
	translate([base_h,width*0.75,0]) rotate ([180,0,0])
		screw_hole();

	translate([walls,width*0.25,lenght*0.70]) rotate ([0,90,0])
		screw_hole();
	translate([walls,width*0.75,lenght*0.70]) rotate ([0,90,0])
		screw_hole();
	translate([walls,width*0.5,lenght*0.4]) rotate ([0,90,0])
		screw_hole();
}

module base(){
	// under plate
	cube([height,width,walls]);
  // frount plate
	translate([0,0,0])
		cube([walls,width,lenght]);
	// lip
	translate([0,0,lip_width+walls]) rotate([0,90,0])
		cube([walls,width,inner_lip_height]);
	// outer lip
	translate([0,0,lenght]) rotate([0,90,0])
		cube([walls,width,outer_lip_height]);	

}

module screw_hole(){
	counter_sink_h = 2;
	bracket_wall = walls+10;
	screw_r = 1.5;

	translate([0,0,-bracket_wall-counter_sink_h-1])
		cylinder(h=bracket_wall+1,r=screw_r, center=false);
	translate([0,0,-counter_sink_h])
		cylinder(h=2,r1=screw_r,r2=screw_r*2, center=false);

}








