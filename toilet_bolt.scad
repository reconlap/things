/*
 *   Creates a bolt for holding a toilet lid to a toilet bowl.
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

height = 40;
screw_r = 4.5;
base_w = 25;
base_l = 25;
base_h = 3;
step_w = 15;
step_l = 15;
step_h = 2;

cube ([base_w,base_l,base_h], center=true);
translate([0,0,base_h/2])
	cube ([step_w,step_l,step_h+base_h], center=true);
translate([(step_w/2)-screw_r,0,height/2])
	cylinder(h=height,r=screw_r,center=true);
