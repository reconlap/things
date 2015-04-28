$fn=360;

clip_or = 18/2;
clip_ir = 9/2;
clip_out_h = 1.8;
clip_in_h = 4;
clip_top_h = 2.8;

cylinder(r=clip_or,h=clip_out_h,center=true);
translate ([0,0,clip_out_h/2+clip_in_h/2]) cylinder(r=clip_ir,h=clip_in_h,center=true);
translate ([0,0,(clip_out_h/2+clip_in_h/2)+clip_top_h]) cylinder(r=clip_or,h=clip_top_h,center=true);