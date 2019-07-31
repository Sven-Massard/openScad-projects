union(){    
    difference(){
        cube([61, 61, 20], center = true); // Base Cube
        cube([55, 55, 16], center = true); // Hohlraum
        translate([0,0,-9])cube([58, 58, 2], center = true); //Untere Falz
        translate([29,14,-3.5])cube([3, 15, 7], center = true); // Kabelkanal
        translate([17.0, -17.15, 9])cylinder(h = 2, d = 11.9, center = true); // Button Minus
        translate([17.0, -2.65, 9])cylinder(h = 2, d = 11.9, center = true); // Button Plus
        translate([-17.25, 17.1, 9])cylinder(h = 2, d = 11.9, center = true); // Button Off
        translate([-2.75, 17.1, 9])cylinder(h = 2, d = 11.9, center = true); // Button Reset
        translate([-10, -8, 9])cube([26, 14, 2], center = true); //Display
    }
    
    //Rahmen Display
    difference(){
    translate([-10, -9.9, 6.5])cube([30.5, 30, 6], center=true);
    translate([-10, -9.9, 6.5])cube([28, 28.5, 6], center=true);
    }
    
    //Verschraubung
    difference(){
        translate([25.8, 25.8, 0])cylinder( h = 16, d = 4.5, center = true); // rechts oben
        translate([25.8, 25.8, 0])cylinder( h = 16, d = 3.4, center = true); // rechts oben
        
    }
    difference(){
        translate([-25.8, 25.8, 0])cylinder( h = 16, d = 4.5, center = true); // links oben
        translate([-25.8, 25.8, 0])cylinder( h = 16, d = 3.4, center = true); // links oben
    }
    difference(){
        translate([25.8, -25.8, 0])cylinder( h = 16, d = 4.5, center = true); // rechts unten
        translate([25.8, -25.8, 0])cylinder( h = 16, d = 3.4, center = true); // rechts unten
    }
    difference(){
        translate([-25.8, -25.8, 0])cylinder( h = 16, d = 4.5, center = true); // links unten
        translate([-25.8, -25.8, 0])cylinder( h = 16, d = 3.4, center = true); // links unten
    }
    
}