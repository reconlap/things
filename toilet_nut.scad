/*
 *   Creates a nut for holding a toilet lid to a toilet bowl.
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

outer_r = 14;
outer_h = 2.5;

inner_r = 9;
inner_h = 15 ;

bolt_hole_r = 4;

grip_w = 3;

difference(){
	bolt_body();
	translate([0,0,inner_h/2])
		cylinder( h=inner_h+3, r=bolt_hole_r , center=true);
}
module bolt_body(){
	cylinder( h=outer_h, r=outer_r , center=true);
	translate([0,0,inner_h/2])
		cylinder( h=inner_h, r=inner_r , center=true);
	translate([0,0,inner_h/2])
		cube([(outer_r*2)-3,grip_w,inner_h],center=true); 
}
