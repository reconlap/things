use <nuts_and_bolts.scad>

ring_od = 60;
ring_h = 7.5;
ring_w = 7.5;

ring_inner_id = 6;
ring_inner_h = 15;
ring_inner_w = 4;

wheel();
arms();
rotate([0,180,0]) 
    translate([0,ring_od-ring_w/2,-ring_h*3]) 
        knob();


module m3_nut_trap (){
    translate([0,-(ring_inner_id+ring_inner_w/2)+1,ring_inner_h/3])
    rotate([90,0,0]){
        cylinder(r = 5.5 / 2 / cos(180 / 6) + 0.05, $fn=6);
        cylinder(r = 2.5/2 , h=ring_inner_id+ring_inner_w,center=true);
    }
}
module knob(){
    difference(){
        union(){
            sphere(r=ring_h);
            cylinder(r=ring_h,h=ring_h*2);
        }
        translate([0,0,ring_h+ring_h/2])
            rotate_extrude(convexity = 10)
                translate([ring_h+ring_h/2,0,0])
                    circle(r=ring_h);
    }
}

module wheel(){
    // outter wheel
    minkowski(){
        difference(){
                cylinder(r=ring_od,h=ring_h,center=true);
                cylinder(r=ring_od-ring_w,h=ring_h+1,center=true);
        }
        sphere(r=ring_h/2,center=true);
    }

    // inner wheel
    translate([0,0,ring_h/2])
        difference(){
            cylinder(r=ring_inner_id+ring_inner_w,h=ring_inner_h,center=true);
            cylinder(r=ring_inner_id,h=ring_inner_h+1,center=true);
            m3_nut_trap();
        };
    }

module arms(){
    // arms
    
    large_cutout_r = (ring_od-(ring_w*2)-(ring_inner_id))/2;
        
    difference(){
        translate([0,0,-ring_h])
            cylinder(r=ring_od-ring_w,h=ring_h/2);
        // center hole
        cylinder(r=ring_inner_id,h=ring_inner_h+1,center=true);
        // arm holes
        for (i = [1:1:5]){
            rotate([0,0,i*90])
                translate([0,ring_inner_id+ring_inner_w+large_cutout_r,0])
                    cylinder(r=large_cutout_r,h=(ring_h+1)*2,center=true);
            
            rotate([0,0,(i*90)+45])
                translate([0,ring_inner_id+ring_inner_w+large_cutout_r+large_cutout_r,0])
                    cylinder(r=large_cutout_r/2,h=(ring_h+1)*2,center=true);
            }
            
    }
}
    
    
