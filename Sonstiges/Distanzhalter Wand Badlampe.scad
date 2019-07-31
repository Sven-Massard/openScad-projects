difference(){
    cube([130, 20, 8], center = true);
    translate([ 55,-2.5, 0]) cylinder(h=20,d = 5, center = true);
    translate([ -55,-2.5, 0]) cylinder(h=20,d = 5, center = true);
    translate([0,0,5])cube([30, 20, 10], center = true);
    }