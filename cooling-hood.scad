PEEK_chamber_height = 40;
PEEK_diameter = 15;
PEEK_chamber = (PEEK_diameter/2) + 3;
PEEK_chamber_outer = (PEEK_chamber)+6;
Fan_cube = 40;    // min PEEK_chamber_outer *2;
Fan_cube_hole = Fan_cube/2;




difference () {
	cube ([Fan_cube,Fan_cube,PEEK_chamber_height],center=true);
	cylinder(h = PEEK_chamber_height, r = PEEK_chamber_outer,center = true);
	rotate([0,90,0]) cylinder(h = PEEK_chamber_height+2, r = PEEK_chamber_outer,center = true);
	
};


translate ([0,0,0]) cut_out_tube();

module cut_out_tube(){
	difference () {
		cylinder(h = PEEK_chamber_height, r = PEEK_chamber_outer,center = true);
		cylinder(h = PEEK_chamber_height, r = PEEK_chamber,center = true);
		cut_out();
	};
};


module cut_out(){
	difference () {
		cylinder(h = PEEK_chamber_height, r = PEEK_chamber_outer-2,center = true);
		cylinder(h = PEEK_chamber_height, r = PEEK_chamber +2 ,center = true);

		cube ([(PEEK_chamber_outer*2)-2,2,PEEK_chamber_height],center = true);
		cube ([2,(PEEK_chamber_outer*2)-2,PEEK_chamber_height],center = true);
	};
};