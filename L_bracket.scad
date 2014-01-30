/*
 *   Creates a L Bracket model for holding two pieces of wood together.
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
 *    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

bracket_l = 40;
bracket_w = 20;
bracket_h = 20;
bracket_wall = 4;
screw_r = 1.5;

screw_off_y = ((bracket_w-bracket_wall)/2);
screw_off_x = (bracket_l)/4;
screw_off_h = ((bracket_h-bracket_wall)/2)+bracket_wall;


	L_bracket();
	


module L_bracket(){
	difference(){

		bracket();

		//screwholes
		translate ([screw_off_x,screw_off_y,bracket_wall])
			screw_hole();
		translate ([3*screw_off_x,screw_off_y,bracket_wall])
			screw_hole();

		translate ([screw_off_x,bracket_w-bracket_wall,screw_off_h])rotate([90,0,0])
			screw_hole();
		translate ([3*screw_off_x,bracket_w-bracket_wall,screw_off_h])rotate([90,0,0])
			screw_hole();

	}
}

module screw_hole(){
	counter_sink_h = 2;

	translate([0,0,-bracket_wall-counter_sink_h-1])
		cylinder(h=bracket_wall+1,r=screw_r, center=false);
	translate([0,0,-counter_sink_h])
		cylinder(h=2,r1=screw_r,r2=screw_r*2, center=false);

}

module bracket(){
	cube([bracket_l,bracket_w,bracket_wall],center=false);
	translate([0,bracket_w-bracket_wall,0])
		cube([bracket_l,bracket_wall,bracket_h],center=false);

	difference(){
		translate([(bracket_l-bracket_wall)/2,0,0])
			cube([bracket_wall,bracket_w,bracket_h]);
		translate ([((bracket_l-bracket_wall)/2)-1,0,bracket_h]) rotate ([0,90,0]) 
			cylinder( h=bracket_wall+2, r = bracket_w-bracket_wall, center=fase);
	}
}