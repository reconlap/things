
screw_hole_r = 3;
handle_width = 15;
bevel_r = 2;

//scale(10/9.5,0.0,0.0){
//rotate([0,0,50]){
	difference () {
		difference () {
			union(){
				difference() {
    				translate([0,-75,0]) rotate_extrude($fn = 320) translate([110, 0]) handle();
					translate([-150,-200,-((50-20)/2)]) cube ([300,200,50]);
				}
				translate([-55,0,-2]) cube([15,27,handle_width+(bevel_r*2)]);
				translate([55-15,0,-2]) cube([15,27,handle_width+(bevel_r*2)]);
			}
		}
		translate([47.5-1.5,0,(handle_width/2)-1.5]) cube ([3,9.5,3]);
	
 
		translate([-47.5-1.5,0,(handle_width/2)-1.5])
		cube ([3,9.5,3]);
 
		//
		translate([ -47.5, 34.5, (handle_width)/2])
		rotate([90,90,0])
	 	cylinder (h=25, r=screw_hole_r, $fn=60);
 
		translate([47.5,34.5,(handle_width)/2])
		rotate([90,90,0])
		cylinder (h=25, r=screw_hole_r, $fn=60);
	}

module handle() {
	hull() {
	circle(r = bevel_r);
	translate([0, handle_width]) circle(r = bevel_r);
	translate([5, 0]) circle(r = r);
	translate([5, handle_width]) circle(r = bevel_r);
	}
}
//}