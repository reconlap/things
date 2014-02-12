/*
 *   celtic_test_cube.scad
 *   Creates a cube with some celtic patterns on it as a test object to check quality of prints.
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

use </home/mec/.local/share/OpenSCAD/libraries/celtic-knots.scad>

cube_l = 20;
cube_w = 20;
cube_h = 20;

knot_l = cube_l*0.80;
knot_w = cube_w*0.80;
knot_h = 5;
knot_g= 1;

fn = 40;

difference(){
	cube ([cube_l,cube_w,cube_h],center=true);

	translate([0,0,-(cube_h/2)-(knot_h)+1]) rotate ([0,0,0]) knot_1(knot_w/4,knot_h,knot_g);

	translate([0, (cube_w/2)+knot_h-1,0]) rotate ([90,0,0]) knot_2(knot_w/4,knot_h,knot_g);

	translate([cube_l/2-1,0,0]) rotate ([0,90,0]) knot_3(knot_w/4,knot_h,knot_g);

}

translate([0,0,(cube_h/2)-(knot_h)+1]) rotate ([0,0,0]) knot_1(knot_w/4,knot_h,knot_g);

translate([0,-cube_w/2+(knot_h)-1,0]) rotate ([90,0,0]) knot_2(knot_l/4,knot_h,knot_g);

translate([-cube_l/2-1,0,0]) rotate ([0,90,0]) knot_3(knot_w/4,knot_h,knot_g);

module knot_1 (knot_w,knot_h,knot_g){
	knot([ "<=>", "|j;", "[_]" ],tile_width = knot_w, tile_height = knot_h, gap = knot_g, $fn=fn );
	}

module knot_2 (knot_w,knot_h,knot_g){
	knot([  "<~>", "!&;", "[-]" ],tile_width = knot_w, tile_height = knot_h, gap = knot_g, $fn=fn );
	}

module knot_3 (knot_w,knot_h,knot_g){
	knot([ "<=>", "|Q;", "[-]" ],tile_width = knot_w, tile_height = knot_h, gap = knot_g, $fn=fn );

}




