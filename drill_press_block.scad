fn=36;

block_w = 70;
block_l = 150;
block_top_l = 60;
block_h = 40;
holder_offset = 30;

base_w = 63.5;
base_h = 19;
base_l = 50; 
base_top_w = 58;
bevel = 2;

cutout_h=10;
cutout_w=50;
cutout_l=base_l+2;
cutout_w_t = 43;


dremel_holder();

module dremel_holder(){
    screw_x = 15;
    screw_y = 15;
    
    difference(){
        block();
        translate([(block_w+bevel-base_w)/2,holder_offset+5,block_h])
            carrage(base_l);
        translate([screw_x,screw_y,15])
            screw_hole();
        translate([block_w-screw_x,screw_y,15])
            screw_hole();
        translate([screw_x,block_l-screw_y,15])
            screw_hole();
        translate([block_w-screw_x,block_l-screw_y,15])
            screw_hole();
    }

}

module block() {


    hull() {
        cube([block_w,block_l,5]);
        translate([0,holder_offset,block_h])
            cube([block_w,block_top_l,cutout_h/2]);
    }
}

module carrage(base_l) {
    cutout_h = 10;
    cutout_x = 7;

    difference() {
        base();
        translate([cutout_x,-2,cutout_h])
            base_cutout(base_l);
    }
}

module base() {

    translate([0,0,0])
        minkowski(){
            cube([base_w-bevel,base_l-bevel,base_h-1]);
            rotate([90,0,0]) 
                cylinder(r=bevel,h=1,$fn=fn);
        }
}

module base_cutout(base_l=50) {
    hull() {
        cube([cutout_w,cutout_l,0.1]);
        cube([cutout_w_t,cutout_l,cutout_h+0.1]);
    }
 }
 
 module screw_hole(shaft_r=1.5,channel_r=5,channel_h=50) {
    
    translate([0,0,-channel_h/2])
        cylinder(r=shaft_r,h=channel_h,center=true);
    translate([0,0,channel_h/2])
    cylinder(r=channel_r,h=channel_h,center=true);
     
     }