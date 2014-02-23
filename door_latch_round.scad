/*
 * door_latch_round.scad
 * Creates a simple door lock for closing a door.
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
catch_lenght = 15;
holder_lenght = 60;
lenght = catch_lenght + holder_lenght ;
width = 40;

wall_s = 6;
bolt_r = 3.5;
bolt_slider_w = 4;
bolt_slider_gl = 21;
gap = 0.5;

screw_lenght = wall_s*2+1;
screw_size = 1.5;
counter_sink = 2;

//rounding
p=0.1;
r=wall_s/4;
s=45;

//translate ([0,0,lenght]) rotate([270,0,0])  base();
//translate ([0,70,catch_lenght]) rotate([270,0,0]) latch();
//translate ([0,30,-(holder_lenght/2)+catch_lenght]) rotate([90,0,0]) top();
rotate ([0,0,0]) translate ([width/2,-wall_s-30,bolt_r]) rotate([90,0,90]) latch_bolt();

// base();
// latch();
// top();
// latch_bolt();


module top(){
	intersection(){
		latch_block();
		// top_plate_void
		translate([0,catch_lenght,-wall_s*6]) cube([width,(holder_lenght/2)+catch_lenght/2,wall_s*6],center=false);
	}
}

module latch (){
	intersection(){
		latch_block();
		// latch void
		translate([0,-5,-wall_s*3]) cube([width,catch_lenght+5,wall_s*6],center=false);
	}
}

module base (){
	difference(){
		latch_block();
		// latch void
		translate([0,-5,-wall_s*3]) cube([width,catch_lenght+5,wall_s*6],center=false);
		// top_plate_void
		translate([0,catch_lenght,-wall_s*6]) cube([width,(holder_lenght/2)+catch_lenght/2,wall_s*6],center=false);
	}
}

module latch_bolt(){
	handle_location = catch_lenght-(bolt_slider_gl/2);

	scale([0.95,0.95,0.95]){
		intersection() {
			cylinder(h=holder_lenght,r=bolt_r,center=true);
			scale([0.4,0.4,1]) sphere(r=holder_lenght/2, center=true, $fn=100);
			}
		translate([bolt_r,0,handle_location])
			cube([bolt_r+4+gap,bolt_slider_w-gap*2,bolt_slider_gl/2],center=true);
		translate([2+gap,0,handle_location]) rotate([0,180,0]) 
			handle();
	}
}

module handle(){
	w = (bolt_r+2)*2+gap;
	l = (bolt_r*2)+2;
	h = bolt_slider_gl-catch_lenght;

	difference(){	
	translate([-h,0,0]) rotate([90,0,0])
		cylinder(h=bolt_r*2,r=h,center=true);
		//block
		translate([w*0.25,0,0])
		cube([w,l,h*2],center=true);		
			translate([bolt_r+2+gap,0,h*2])
				cylinder(h=lenght,r=bolt_r+2,center=true);
			rotate([90,0,0]){
				translate([-h/2,-h*1.5,0])
					rotate([0,0,90]) cylinder(h=bolt_r*2,r=h,center=true);
				translate([-h/2,+h*1.5,0])
					rotate([0,0,0]) cylinder(h=bolt_r*2,r=h,center=true);
			}		
		translate([0,0,0])
		rotate([0,0,0])cylinder(h=h*2,r=bolt_r+1.5,center=true);
	}


}

module latch_block(){
	difference(){
		union(){
			back_plate();
			translate([0,0,-wall_s]) top_plate();	
		}
		rotate([180,0,0]) translate([0,-lenght,-wall_s]) screw_holes();
	}
}

module top_plate(){

	difference(){
		cube([width,lenght,wall_s],center=false);

		translate([width/2,lenght/2,0]) rotate([270,0,0])
			cylinder(h=lenght+1,r=bolt_r,center=true);

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
			cylinder(h=lenght,r=bolt_r+2,center=true);
			cylinder(h=lenght,r=bolt_r,center=true);
			// handle hole
			cube([bolt_r,bolt_slider_w ,bolt_slider_gl],center=true);
			// bolt grove
			translate([0,bolt_r,1+catch_lenght-(bolt_slider_gl/2)])
			cube([bolt_slider_w, bolt_r*2 ,bolt_slider_gl],center=true);
			// clean bottom
			translate([0,-wall_s,0])
			cube([width, wall_s,lenght],center=true);
		}
}

module screw_holes(){
	translate([width*0.20,holder_lenght*0.25,wall_s*2]) screw_hole();
	translate([width*0.80,holder_lenght*0.25,wall_s*2]) screw_hole();
	translate([width*0.20,holder_lenght*0.75,wall_s*2]) screw_hole();
	translate([width*0.80,holder_lenght*0.75,wall_s*2]) screw_hole();
	translate([width*0.20,lenght-(catch_lenght*0.75),wall_s*2]) screw_hole();
	translate([width*0.80,lenght-(catch_lenght*0.75),wall_s*2]) screw_hole();
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

	pad = p; // Padding to maintain manifold
	box_l = l; // Length
	box_w = w; // Width
	box_h = h; // Height
	round_r = r; // Radius of round
	smooth = s; // Number of facets of rounding cylinder

	cylinder(h=box_l,r=round_r, center=true, $fn=smooth);

}



