

module bar() {
	$wuerfelhoehe=78;

	translate([0, 0, 22]) {

		cube([100, 145, $wuerfelhoehe]);
		
		translate([(800/2 - 145/2), 0, 0])
		cube([145, 145, $wuerfelhoehe]);
		
		translate([700, 0, 0])
		cube([100, 145, $wuerfelhoehe]);
		
		translate([0, 0, $wuerfelhoehe])
		cube([800, 145 , 22]);
	}
}


module palette(){

	bar();
	
	translate([0, (145+392.5), 0])
	bar();
	
	translate([0, 1200-145, 0])
	bar();


	// bretter unten
	cube([100, 1200, 22]);

	translate([(800/2 - 145/2), 0, 0])
	cube([145, 1200, 22]);

	translate([800-100, 0, 0])
	cube([100, 1200, 22]);

	// bretter oben
	translate([0, 0, 22+78+22])
	cube([145, 1200, 22]);

	translate([(800/2 - 145/2)-40-100, 0, 22+78+22])
	cube([100, 1200, 22]);

	translate([(800/2 - 145/2), 0, 22+78+22])
	cube([145, 1200, 22]);

	translate([800-40-100-145, 0, 22+78+22])
	cube([100, 1200, 22]);

	translate([800-145, 0, 22+78+22])
	cube([145, 1200, 22]);
}

module palette_halb() {
	difference() {
		palette();
		translate([-10, 1200/2+82.5, -11])
		cube([820, (382.5+145+22), 22+22+78+22+22]);
	}
}

module mod1() {
	palette();
	
	translate([0,0,22+22+78+22])
	palette();
	
	translate([0,0,2*(22+22+78+22)])
	palette();
}

module mod2() {
	palette_halb();
	
	translate([0,0,22+22+78+22])
	palette_halb();
	
	translate([0,0,2*(22+22+78+22)])
	palette_halb();
}

module kopf() {
	translate([0, 0, 3*(22+22+78+11)])
	bar();

	translate([0, 0, 4*(22+22+78)])
	bar();
	
	translate([800, 0, 3*(22+22+78+11)])
	bar();

	translate([800, 0, 4*(22+22+78)])
	bar();
}

module z1() {
	mod1();
	translate([800, 0, 0])
	mod1();
	
	translate([0, 1200, 0])
	mod2();
	translate([800, 1200, 0])
	mod2();
	
	translate([0, 2*1200-145-145-385.2, 0])
	kopf();
}

module z2() {
	translate([-700, -300, 0])
	rotate([0, 0, 10], center=true)
	mod1();
	translate([800, 0, 0])
	mod1();
	
	translate([0, 1200, 0])
	mod2();
	translate([800, 1200, 0])
	mod2();

	translate([0, 2*1200-145-145-385.2, 0])
	kopf();
}

z2();

translate([-3000,0,0])
z1();