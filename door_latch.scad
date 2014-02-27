/*
 *   door_latch.scad
 *   Creates a simple door lock for closing a door.
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
catch_lenght = 15;
holder_lenght = 50;
lenght = catch_lenght + holder_lenght ;
width = 30;

wall_s = 3;
bolt_r = 4;
bolt_slider_w = 3;
bolt_slider_gl = catch_lenght;
gap = 0.5;
handle_l = 5;

screw_lenght = wall_s*2+1;
screw_size = 1.5;
counter_sink = 2;

//rounding
p=0.1;
r=wall_s/4;
s=45;

//translate ([0,0,holder_lenght+catch_lenght]) rotate([270,0,0]) base();
translate ([0,-20,catch_lenght]) rotate([270,0,0]) latch();
//translate ([0,20,-catch_lenght]) rotate([90,0,0]) top();
translate ([-15,-20,wall_s/2]) rotate([270,270,0]) latch_bolt();




module top(){
	intersection(){
		latch_block();
		// top_plate_void
		translate([0,catch_lenght,-wall_s*6.1]) 
			cube([width,(holder_lenght*0.80),wall_s*6],center=false);
	}
}

module latch (){
	intersection(){
		latch_block();
		translate([0,-5,-wall_s*3]) cube([width,catch_lenght+5,wall_s*6],center=false);
	}
}

module base (){
	difference(){
		latch_block();
		// latch void
		translate([0,-handle_l,-wall_s*3]) cube([width,catch_lenght+handle_l,wall_s*6-1],center=false);
		// top_plate_void
		translate([0,catch_lenght,-wall_s*6]) cube([width,holder_lenght*0.80,wall_s*6],center=false);
	}
}

module latch_bolt(){

		translate([0,0,catch_lenght])
			cube ([wall_s*.75,bolt_r*2,holder_lenght],center=true);
		translate([wall_s*.75,0,handle_l])
			cube ([6,bolt_slider_w,handle_l],center=true);
}

module handle(){
	w = (bolt_r+2)*2+gap;
	l = (bolt_r*2)+2;
	h = bolt_slider_gl-catch_lenght;

	difference(){
		//block
		translate([w*0.25,0,0])
		cube([w,l,h],center=true);
		translate([bolt_r+2+gap,0,h*2])
			cylinder(h=lenght,r=bolt_r+2,center=true);
		translate([-h/2,-h*1.5,0])
			cylinder(h=h,r=h,center=true);
		translate([-h/2,+h*1.5,0])
			cylinder(h=h,r=h,center=true);
	}		
	translate([-h/2,0,0])
			cylinder(h=h,r=h/2,center=true);
}

module latch_block(){
	difference(){
		union(){
			back_plate();
			translate([0,0,-wall_s]) top_plate();
		}
		rotate([180,0,0]) translate([0,-lenght,-wall_s])	 screw_holes();
	}
}

module top_plate(){
	difference(){
		cube([width,lenght,wall_s],center=false);

		//Bolt hole
		translate([width/2,lenght/2,0]) rotate([270,0,0]) 
			cube ([bolt_r*2,wall_s*2+1,lenght+1],center=true);

		//bevel
		translate ([0,lenght/2,0])rotate ([90,0,0]) bevel(p,lenght,width,wall_s,r,s);
		translate ([width,lenght/2,0])rotate ([90,0,0]) bevel(p,lenght,width,wall_s,r,s);
		translate ([width/2,0,0])rotate ([0,90,0]) bevel(p,width,lenght,wall_s,r,s);
		translate ([width/2,lenght,0])rotate ([0,90,0]) bevel(p,width,lenght,wall_s,r,s);
	}
	bolt_hole();
}

module back_plate(){
	difference(){
		cube([width,lenght,wall_s],center=false);
	}
}

module bolt_hole(){
	// bolt hole
	translate([width/2,lenght/2,0]) rotate([270,0,0]) 
	difference(){

		cube ([bolt_r*3,wall_s,lenght],center=true);
		translate([0,-wall_s/2,0])
			cube ([bolt_r*2,wall_s*1.5,lenght],center=true);

		// bolt handle grove
		translate([0,0,(holder_lenght/2)-(bolt_slider_gl/2)-handle_l+0.1])
			cube([bolt_slider_w+gap, bolt_r ,bolt_slider_gl+handle_l],center=true);

	}

}

module screw_holes(){
		translate([width*0.20,holder_lenght*0.25,wall_s*2]) 	screw_hole();
		translate([width*0.80,holder_lenght*0.25,wall_s*2]) 	screw_hole();
		translate([width*0.20,holder_lenght*0.75,wall_s*2]) 	screw_hole();
		translate([width*0.80,holder_lenght*0.75,wall_s*2]) 	screw_hole();
		translate([width*0.20,lenght-(catch_lenght*0.50),wall_s*2]) 	screw_hole();
		translate([width*0.80,lenght-(catch_lenght*0.50),wall_s*2]) 	screw_hole();
}

module screw_hole(){
	counter_sink_h = counter_sink;
	screw_l = screw_lenght;
	screw_r = screw_size;

	translate([0,0,-screw_l-counter_sink_h-1])
		cylinder(h=screw_l+1,r=screw_r, center=false);
	translate([0,0,-counter_sink_h])
		cylinder(h=2,r1=screw_r,r2=screw_r*2, center=false);
}


module bevel(p,l,w,h,r,s) {

pad = p;			// Padding to maintain manifold
box_l = l; 		// Length
box_w = w;		// Width
box_h = h;		// Height
round_r = r;	// Radius of round
smooth = s;		// Number of facets of rounding cylinder

		cylinder(h=box_l,r=round_r, center=true, $fn=smooth);

}

