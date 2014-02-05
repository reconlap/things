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


use </home/mec/.local/share/OpenSCAD/libraries/celtic-knots.scad>



lenght = 90;
width = 110;
height = 35;

walls = 5;

lip_width = 23;
inner_lip_height = 16.3;
outer_lip_height = 18;

screw_walls = 10;
screw_hole_size = 2;

board_top_height = 15;
base_h = height/2;

inset = 5;


rotate ([0,0,0])
	difference(){
		base();
		screws();
		rotate([0,-270,0]) holes_s();
		rotate([0,0,0]) decoration(lenght=lenght,width=width);
	}



module screws(){

	translate([base_h,width*0.25,0]) rotate ([180,0,0])
		screw_hole(walls+10,3,screw_hole_size);
	translate([base_h,width*0.5,0]) rotate ([180,0,0])
		screw_hole(walls+10,3,screw_hole_size);
	translate([base_h,width*0.75,0]) rotate ([180,0,0])
		screw_hole(walls+10,3,screw_hole_size);


	translate([screw_walls,width*0.20,lenght*0.70]) rotate ([0,90,0]){
			screw_hole(outer_lip_height+1,3,screw_hole_size);
			cylinder(h=outer_lip_height-screw_walls, r=5 );
		}
	translate([screw_walls,width*0.75,lenght*0.70]) rotate ([0,90,0]){
			screw_hole(outer_lip_height+1,3,screw_hole_size);
			cylinder(h=outer_lip_height-screw_walls, r=5 );
		}
	translate([screw_walls,width*0.5,lenght*0.5]) rotate ([0,90,0]){
			screw_hole(outer_lip_height+1,3,screw_hole_size);
			cylinder(h=outer_lip_height-screw_walls, r=5 );
		}

}

module base(){
	// under plate
	cube([height,width,walls]);
  // frount plate
	translate([0,0,0])
		cube([walls,width,lenght]);
	// lip
	hull(){
		translate([0,0,lip_width+walls*2]) rotate([0,90,0])
			cube([walls,width,inner_lip_height]);
		translate([walls,0,lip_width+walls]) rotate([0,180,0])
			cube([walls,width,inner_lip_height]);
	}
	// outer lip
	hull(){
		translate([0,0,lenght]) rotate([0,90,0])
			cube([walls,width,outer_lip_height]);
		translate([walls,0,lenght-walls]) rotate([0,180,0])
			cube([walls,width,outer_lip_height]);
	}
}

module screw_hole(sl,scs,sr){

	screw_lenght = sl;
	screw_r = sr;
	counter_sink_h = scs;

	translate([0,0,-screw_lenght-counter_sink_h])
		cylinder(h=screw_lenght,r=screw_r, center=false);
	translate([0,0,-counter_sink_h])
		cylinder(h=counter_sink_h+1,r1=screw_r,r2=screw_r*2, center=false);

}


module holes_s(){
	translate([(-lip_width/2)-walls,width*0.33,-5]){
		cylinder(h=20,r=5, center=false);
	}
	translate([(-lip_width/2)-walls,width*0.66,-5]){
		cylinder(h=20,r=5, center=false);
	}
	translate([-(lenght*0.70)-walls,width*0.5,-5]){
		cylinder(h=20,r=8, center=false);
	}
	translate([-(lip_width+(walls*2)+10),width*0.75,-5]){
		cylinder(h=20,r=5, center=false);
	}
	translate([-(lip_width+(walls*2)+10),width*0.25,-5]){
		cylinder(h=20,r=5, center=false);
	}
}


module decoration(lenght,width){
$fn = 100;
	
	translate([base_h,width*0.25,walls+1-inset]) rotate ([180,0,90])
		knot([ "<=>", "|j;", "[_]" ],tile_width = width/16, gap = 3, tile_height = inset, $fn=$fn );

	translate([base_h,width*0.5,walls+1-inset]) rotate ([180,0,0])
		knot([ "<~>", "!&;", "[-]" ], tile_width = width/17, gap = 3, tile_height = inset, $fn=$fn );
	
	translate([base_h,width*0.75,walls+1-inset]) rotate ([180,0,90])
		knot([ "<=>", "!l:", "[_]" ], tile_width = width/17, gap = 3, tile_height = inset, $fn=$fn );

		translate([height+walls,width,0]) scale([1,0.25]) 
			cylinder(h=walls, r1=height+walls , r2=height , $fn=360);
		translate([height+walls,0,0])  
			scale([1,0.25]) cylinder(h=walls, r1=height+walls , r2=height , $fn=360);
		translate([height+walls,width/2,0]) scale([0.05,1])
			cylinder(h=walls, r1=width+walls , r2=width , $fn=360);	


}



