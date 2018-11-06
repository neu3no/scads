
mat_w = 1400;
mat_t = 2000;
mat_h = 190;

balk_s=70;
lang=2100;
breit=mat_w+10;

brett_s1=121;
brett_s2=22;

rahmen_s=34;

box_h=3*brett_s1;

sitz_b = breit/2-balk_s;

gesamt_hoch=600;
hoch=gesamt_hoch-rahmen_s;

// L
module rahmen_L() {
 translate([balk_s,lang - balk_s,0])
    rotate([0,0,90])
    cube([balk_s,breit,balk_s]);

    cube([balk_s,lang,balk_s]);

    translate([-sitz_b,0,0])
    cube([balk_s,lang,balk_s]);

    translate([balk_s, lang - sitz_b - balk_s, 0])
    rotate([0,0,90])
    cube([balk_s,breit,balk_s]);

    translate([balk_s, 0, 0])
    rotate([0, 0, 90])
    cube([balk_s, sitz_b + balk_s, balk_s]);

    translate([-2*sitz_b-balk_s, lang - sitz_b - balk_s, 0])
    rotate([0, 0, 0])
    cube([balk_s, sitz_b + balk_s, balk_s]);
}

module beine_L() {
    translate([0, 0, 0])
    rotate([-90, 0, 0])
    cube([balk_s, hoch - balk_s, balk_s]); 
    
    translate([0, lang - balk_s, 0])
    rotate([-90, 0, 0])
    cube([balk_s, hoch - balk_s, balk_s]); 
    
    translate([-sitz_b, 0, 0])
    rotate([-90, 0, 0])
    cube([balk_s, hoch - balk_s, balk_s]); 
    
    translate([-breit + balk_s, lang - balk_s, 0])
    rotate([-90, 0, 0])
    cube([balk_s, hoch - balk_s, balk_s]); 
    
    translate([-sitz_b, lang - balk_s - sitz_b, 0])
    rotate([-90, 0, 0])
    cube([balk_s, hoch - balk_s, balk_s]); 
    
    translate([-breit + balk_s, lang - balk_s - sitz_b, 0])
    rotate([-90, 0, 0])
    cube([balk_s, hoch - balk_s, balk_s]); 
}

module seite_L(){
    gap=3;
    
    // vorn
    rotate([0,90,90])
    cube([brett_s1-gap, sitz_b - balk_s, brett_s2]);
    
    // rechts
    translate([balk_s-brett_s2, balk_s, -gap])
    rotate([0,90,0])
    cube([brett_s1-gap, lang- 2*balk_s, brett_s2-gap]);
    
    //hinten
    translate([0, lang-brett_s2, -gap])
    rotate([0,90,90])
    cube([brett_s1-gap, breit - 2 * balk_s, brett_s2]);
    
    // links1
    translate([-breit+balk_s, lang-sitz_b, -gap])
    rotate([0,90,0])
    cube([brett_s1-gap, sitz_b - balk_s, brett_s2]);
    
    // mitte
    translate([-sitz_b, lang-sitz_b-balk_s, -gap])
    rotate([0,90,90])
    cube([
        brett_s1-gap, 
        breit - 2 * balk_s - sitz_b, 
        brett_s2
    ]);
    
    // links2
    translate([-sitz_b, balk_s, -gap])
    rotate([0,90,0])
    cube([brett_s1-gap, lang - balk_s - sitz_b, brett_s2]);
    
}
module seiten_L(){    

    for (off = [0:brett_s1:box_h-1]) {
        translate([0, 0, -off])
        seite_L();
    }
}
module teil_L() {
    rahmen_L();
    beine_L();
    seiten_L();
}

// Q
module rahmen_Q(){
    rotate([0,0,90])
    cube([balk_s, sitz_b , balk_s]);

    cube([balk_s, lang - (balk_s) - sitz_b, balk_s]);    
    
    translate([0,  lang - (2*balk_s) - sitz_b, 0])
    rotate([0,0,90])
    cube([balk_s, sitz_b , balk_s]);
    
    translate([-sitz_b,  0, 0])
    rotate([0, 0, 0])
    cube([balk_s, lang - (balk_s) - sitz_b, balk_s]); 
 
}
module beine_Q(){
    translate([0, 0, 0])
    rotate([-90, 0, 0])
    cube([balk_s, hoch - balk_s, balk_s]); 
    
    translate([-sitz_b, 0, 0])
    rotate([-90, 0, 0])
    cube([balk_s, hoch - balk_s, balk_s]); 
    
    translate([0, lang - (2*balk_s) - sitz_b , 0])
    rotate([-90, 0, 0])
    cube([balk_s, hoch - balk_s, balk_s]); 
    
    translate([-sitz_b, lang - (2*balk_s) - sitz_b, 0])
    rotate([-90, 0, 0])
    cube([balk_s, hoch - balk_s, balk_s]); 
}
module seite_Q(){
    gap=3;
    
    // vorn
    translate([0,0,0])
    rotate([0,90,90])
    cube([brett_s1-gap, sitz_b - balk_s, brett_s2]);
    
     // rechts
    translate([balk_s-brett_s2, balk_s, -gap])
    rotate([0,90,0])
    cube([brett_s1-gap, lang- 3*balk_s -sitz_b, brett_s2-gap]);
    
    // hinten
    translate([0,lang-sitz_b-balk_s-brett_s2,0])
    rotate([0,90,90])
    cube([
        brett_s1 - gap, 
        sitz_b - balk_s, 
        brett_s2
    ]);
    
     // links
    translate([-sitz_b, balk_s, -gap])
    rotate([0,90,0])
    cube([brett_s1-gap, lang- 3*balk_s -sitz_b, brett_s2-gap]);
}
module seiten_Q() {
    for (off = [0:brett_s1:box_h-1]) {
        translate([0, 0, -off])
        seite_Q();
    }
}
module deckel_Q(){
    translate([balk_s-rahmen_s, 0, 2*rahmen_s]) {
        /// vorn
        rotate([0,0,90])
        cube([
            rahmen_s, 
            sitz_b +balk_s-rahmen_s, 
            rahmen_s
        ]);

        cube([rahmen_s, lang - (rahmen_s) - sitz_b, rahmen_s]);    
        
        translate([0,  lang - (2*rahmen_s) - sitz_b, 0])
        rotate([0,0,90])
        cube([rahmen_s, sitz_b , rahmen_s]);
        
        translate([-sitz_b,  0, 0])
        rotate([0, 0, 0])
        cube([rahmen_s, lang - (rahmen_s) - sitz_b, rahmen_s]); 
    }
}
module teil_Q() {
    rahmen_Q();
    beine_Q();
    seiten_Q();
    //#deckel_Q();
}


// Zusammengestellt
module bett() {
    translate([-balk_s,0,hoch-balk_s]) {
        teil_L();
        translate([-sitz_b-balk_s, 0, 0])
        teil_Q();
    }    
}
module bett2() {
    translate([-balk_s,0,hoch-balk_s]) {
        teil_L();
        translate([-2*sitz_b-balk_s, 0, 0])
        rotate([0,0,5])
        teil_Q();
    }    
}

// anzeige
bett2();


translate([-3000,0,0])
bett();