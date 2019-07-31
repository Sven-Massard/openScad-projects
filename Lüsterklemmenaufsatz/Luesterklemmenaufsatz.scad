
// Wanne
translate([0, -1.5, 0])difference(){
    cube([42, 43, 16], center = true);
    translate([0, 0, 0.5])cube([40, 43, 15], center = true);
}
// Obere Teilwand
translate([0, 19.5, -(15-7)/2 + 0.5])cube([40,1,7], center=true);

// UntereTeilwand
translate([0, -22.5, -(15-7)/2  + 0.5])cube([40,1,7], center=true);


// Stifte, orientierung am Design, nicht an Lüsterklemme
translate([14,   3.55,  -(15-4)/2 + 0.5])cylinder(d=3.8, h=4, center = true); //Oben Rechts
translate([14,  -3.55,  -(15-4)/2 + 0.5])cylinder(d=3.8, h=4, center = true); //Unten Rechts
translate([4.2,  3.55,  -(15-4)/2 + 0.5])cylinder(d=3.8, h=4, center = true); //Oben Mitte
translate([4.2, -3.55,  -(15-4)/2 + 0.5])cylinder(d=3.8, h=4, center = true); //Unten Mitte
translate([-5.6, 3.55,  -(15-4)/2 + 0.5])cylinder(d=3.8, h=4, center = true); //Oben Links
translate([-5.6, -3.55, -(15-4)/2 + 0.5])cylinder(d=3.8, h=4, center = true); //Unten Links