// E-Cig Holder


depth = 5;
lenght = 150; 
offset = 25;
detail = 60;
e_cig_r = 25/2;

difference(){
rotate([15,0,0]){
	rotate([0,90,0]) holder_wt_hole();
	}
translate([0,0,-1])cube([200,200,1]);
}


module holder_wt_hole(){
	difference(){
		holder();
		translate ([0,lenght/4,-depth])
 			rotate([-50,0,0]) 
				translate([0,0,depth+offset]) 
					cylinder(r=e_cig_r,h=lenght,center=false);
	}
}
module holder(){
	intersection() {
		rotate([90,0,90]) slice();
		difference(){
			rotate_extrude(convexity = 10, $fn=detail)
				mirror([0,0,90])translate([depth+offset,depth,0])frame_outter();
			rotate_extrude(convexity = 10, $fn=detail)
				mirror([0,0,90])translate([depth+offset,depth,0])frame_inner();
		}
	}
}

module slice(){
	hull(){
		rotate([0,15,0])linear_extrude(height = 1) square([lenght*2,lenght*2]);
		rotate([0,-15,0]) linear_extrude(height = 1)  square([lenght*2,lenght*2]);
}
}


module frame_outter(){
	translate([0,-depth,0])square([lenght,depth]);
	translate([lenght,-depth/2,0]) circle(r=depth/2);
	circle(r=depth);
	rotate([0,0,30]) {
		union(){
			square([lenght,depth]);
			translate([lenght,depth/2,0]) circle(r=depth/2);
		}
	}
	translate ([lenght*cos(30)-depth,0]) square([depth,lenght*sin(30)]);
}

module frame_inner() {
	difference(){
		square([lenght,lenght*tan(30)-depth]);
	rotate([0,0,30]) 
			square([lenght/cos(30),lenght*tan(30)-depth]);
		frame_outter();
	}
}

