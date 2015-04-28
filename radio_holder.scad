$fn = 80;

base_l = 90;
base_w = 60;
base_t = 10;


cup_l = 60;
cup_w = 35;
cup_wall = 3;

base_height = 3;
cup_height = 50;



difference(){
    holder();
    voids();
}


module voids(){
    //big middle hole
    translate([0,cup_w/2+cup_wall+0.5,cup_height/2+cup_wall])
        rotate([90,0,0]) 
            linear_extrude (height=cup_wall+1) speed_holes_1(cup_height,base_l);
    //small middle hole
    translate([0,-(cup_w/2-0.5),cup_height/2+cup_wall/2])
        rotate([90,0,0])
            linear_extrude (height=cup_wall+1)
                speed_holes_2(cup_height,base_l);
    
    // side holes
    translate([-cup_l/2-cup_wall-0.5,0,cup_height/2])
    rotate([0,90,0])
        linear_extrude (height=cup_l+cup_wall*2+1)      
            speed_holes_3(cup_height,base_w);
}

module holder(){
    linear_extrude (height=base_height) base();
    cup();
}

module base() {

    scale([1,base_w/base_l,1]){
        difference(){
            circle(r=base_l/2+cup_wall);
            circle(r=base_l/2-cup_wall*2);
        }
    }

    square([base_t,base_w],center=true);
    square([base_l,base_t],center=true);

//    cup_base();

}

module cup(){
    linear_extrude (height=cup_height){
        difference(){
            cup_base();
            square([cup_l,cup_w],center=true);
        }
    }
}

module cup_base(){
    minkowski(){
        square([cup_l,cup_w],center=true);
        circle(r=cup_wall,center=true);
    }
}

module speed_holes_1(w,l){
    
    hyp = sqrt(pow(w,2)+pow(l,2));
    side_short = min (w,l);
    hole_r = side_short/4;

    circle(r=hole_r,center=true);

    corner_hole();
    mirror([0,1,0]) corner_hole();
    mirror([1,0,0]) corner_hole();
    mirror([1,0,0]) mirror([0,1,0]) corner_hole();

    
    module corner_hole(){
        translate([side_short/2-hole_r/2,side_short/2-hole_r])
            circle( r=hole_r/2,center=true);      
    } 
}


module speed_holes_2(w,l){
    
    hyp = sqrt(pow(w,2)+pow(l,2));
    side_short = min (w,l);
    hole_r = side_short/4;

    circle(r=hole_r/2,center=true);

    corner_hole();
    mirror([0,1,0]) corner_hole();
    mirror([1,0,0]) corner_hole();
    mirror([1,0,0]) mirror([0,1,0]) corner_hole();

    
    module corner_hole(){
        translate([side_short/2-hole_r/2,side_short/2-hole_r])
            circle(r=hole_r-cup_wall,center=true);      
    } 
}

module speed_holes_3(w,l){
    
    hole_r = w / 8;

    translate([-(hole_r*2+hole_r/2),-w/6])
        for (i = [0:2]) {
            for (n = [0:1]) {
                translate([i*(hole_r*2+hole_r/2),n*(w/3)])
                    circle(r=hole_r,center=true);
            }
        }
    
    
}