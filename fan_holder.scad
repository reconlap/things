/*
 *   fan_holder.scad
 *   Creates a simple holder arm for a part fan on a greg's wade 
 *   extruder.
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

height = 5;
lenght = 45+28;
width = 69.5;

arm_width = 15;
arm_lenght = 45;

teeth_gaps = 3.2;
teeth_or = 5;
teeth_ir = 2;

notch_width = 35.5;
notch_lenght = 28;
notch_depth = 28;
notch_offset = 9;

screw_x = 59;
screw_y = lenght - 16;
screw_r = 1;

rotate ([90,180,0]) fan_arm();

module fan_arm(){
	difference(){
		arm_body();
		translate ([-teeth_or,-(teeth_or*3)/2,0])
		cube([(width-arm_width)/3,teeth_or*3,(width-arm_width)/2]);
		translate ([-teeth_or,-(teeth_or*3)/2,((width-arm_width)/2)+arm_width])
		cube([(width-arm_width)/3,teeth_or*3,(width-arm_width)/2]);

		translate([(width-arm_width)/3,0,0]) rotate([90,0,0]) 
			cylinder(h=teeth_or*3,r=(width-arm_width)/2,center=true);

		translate([(width-arm_width)/3,0,width]) rotate([90,0,0]) 
			cylinder(h=teeth_or*3,r=(width-arm_width)/2,center=true);	
		//teeth
		translate([0,0,((width/2)-(arm_width/2))+(teeth_gaps/2)+(arm_width*0.2)])
			cube([teeth_or*2.2,teeth_or*3,teeth_gaps], center = true);

		translate([0,0,((width/2)-(arm_width/2))+(teeth_gaps/2)+(arm_width*0.6)])
			cube([teeth_or*2.2,teeth_or*3,teeth_gaps], center = true);
		//notch
		translate([lenght+teeth_or-notch_depth,0,notch_offset])
		cube ([notch_depth,height+1,notch_width]);

		//screw hole
		translate([screw_x,0,screw_y]) rotate([90,0,0]) 
			cylinder(h=teeth_or*3,r=screw_r,center=true);	
	}


}
module arm_body(){
	linear_extrude(height =width )
	{
		difference(){
			hull(){
				circle (r= teeth_or );
				translate([arm_lenght/2,height/2])
					square([arm_lenght,height], center=true);
			}
			circle (r = teeth_ir );
		}
		translate([(lenght/2)+teeth_ir,height/2])
			square([lenght-teeth_ir,height], center=true);
	}
}
