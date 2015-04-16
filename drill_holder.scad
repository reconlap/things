// drill holder

drill_d = 25;
clerance = 1;
drill_h = 33;
walls = 3;


vice_gap = 2;
vice_walls = 3;
vice_w = 10;
bolt_r = 2.25;
bolt_channel_r = 5;
nut_trap_depth = vice_walls+8+vice_gap/2;
nut_h = 3.2;

base_h = drill_h * 1.5;
base_w = 35;
base_d = 23;
thread = 3;



drill_r = (drill_d/2)+clerance;

drill_holder();

/*
//test
difference(){
    drill_holder();
    translate([0,0,-25]) cube([60,60,20],center=true);
    translate([0,0,30]) cube([60,60,60],center=true);
    }
*/
//void();
//base();


module base() {
    hull(){
    //base
        translate([0,(drill_d + walls)/2,0])
            cube([base_w,base_d,base_h],center=true);
            
    //drill
        cylinder(r=drill_r + walls, h = drill_h,center=true);
    
    //vice
    translate([drill_r+vice_w/2+vice_walls,0,0])
        cube([vice_w,vice_walls*2+vice_gap,drill_h+clerance],center=true);
    }
}


module void() {
    cylinder(r=drill_r, h = base_h+clerance,center=true);
    
    // vice jaws
    translate([drill_r+drill_r/2-1,0,0])
        cube([drill_r,vice_gap, base_h],center=true);
    
    // vice nut traps
    translate([drill_r+walls+bolt_channel_r,-(vice_walls+vice_gap/2),drill_h/4])
        rotate([90,180,0]) 
            nut_trap() ;

    translate([drill_r+walls+bolt_channel_r,-(vice_walls+vice_gap/2),-drill_h/4])
            rotate([90,180,0]) 
                nut_trap() ;
    // rail nut traps
    translate([0,nut_trap_depth-nut_h+(drill_d + walls)/2+nut_h+1,base_h/2.5])
            rotate([270,90,0]) 
                nut_trap() ;
    translate([0,nut_trap_depth-nut_h+(drill_d + walls)/2+nut_h+1,-base_h/2.5])
            rotate([270,270,0]) 
                nut_trap() ;  
    // Motor Cooling Shaft
    translate([0,0,drill_h/2-8])
        rotate([0,90,45])
            motor_vent ();
}


module drill_holder() {
    difference() {
        base();
        void();
    }
}

 module screw_hole(shaft_r=1.5,channel_r=5,channel_h=50) {
    
    translate([0,0,-channel_h/2+1])
        cylinder(r=shaft_r,h=channel_h,center=true);
    translate([0,0,channel_h/2])
        cylinder(r=channel_r,h=channel_h,center=true);
     
}

module nut_trap() {
    screw_hole(shaft_r=bolt_r,channel_r=bolt_channel_r,channel_h=50);
    hull(){
        translate([0,0,-nut_trap_depth]) m4_nut ();
        translate([-10,0,-nut_trap_depth]) m4_nut ();
    }
}

module m3_nut (){
   cylinder(r = 5.5 / 2 / cos(180 / 6) + 0.05, $fn=6);
}

module m4_nut (){
   cylinder(r = 7.5 / 2 / cos(180 / 6) + 0.05, h=nut_h, $fn=6);
}

module motor_vent (){
    hull (){
        translate([0,4,0])
            cylinder(r=2,h=100,center=true);
        translate([0,-4,0])
            cylinder(r=2,h=100,center=true);
    }
}