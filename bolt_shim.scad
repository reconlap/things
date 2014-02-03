/*
 *   bolt_shim.scad
 *   Creates a simple shim for a bolt latch.
 *	
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

height = 9;
lenght = 40;
width = 25;

screw_l = 25;
screw_r = 2.5;

difference(){
	cube([lenght,width,height]);
	translate([(lenght-screw_l)/2,width/2,-0.5])
		cylinder(h=height+1, r= screw_r);	
	translate([lenght-(lenght-screw_l)/2,width/2,-0.5])
		cylinder(h=height+1, r= screw_r);	
}
