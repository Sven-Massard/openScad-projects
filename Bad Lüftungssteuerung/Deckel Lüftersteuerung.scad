difference(){
    union(){
        translate([0, 0, 2])cube([57.8, 57.8, 2], center = true); // Base top
        translate([0, 0, -0.35])cube([61, 61, 2.7], center = true); // Base bottom
        translate([17.0, -17.15, 7])cube([10,10,8], center = true); // Support Button Minus
        translate([17.0, -2.65, 7])cube([10,10,8], center = true); // Support Button Plus
        translate([-17.25, 17.1, 7])cube([10,10,8], center = true); // Support Button Off
        translate([-2.75, 17.1, 7])cube([10,10,8], center = true); // Support Button Reset
        translate([-10, -9.9, 8.8])cube([20,20,11.6], center = true); // Support Display
        
    }
    //Verschraubung
    translate([25.8, 25.8, -0.45])cylinder( h = 2.5, d = 6.5, center = true); // rechts oben
    translate([25.8, 25.8, 1.9])cylinder( h = 2.2, d = 4, center = true); // rechts oben
    translate([-25.8, 25.8, -0.45])cylinder( h = 2.5, d = 6.5, center = true); // links oben
    translate([-25.8, 25.8, 1.9])cylinder( h = 2.2, d = 4, center = true); // links oben
    translate([25.8, -25.8, -0.45])cylinder( h = 2.5, d = 6.5, center = true); // rechts unten
    translate([25.8, -25.8, 1.9])cylinder( h = 2.2, d = 4, center = true); // rechts unten
    translate([-25.8, -25.8, -0.45])cylinder( h = 2.5, d = 6.5, center = true); // links unten
    translate([-25.8, -25.8, 1.9])cylinder( h = 2.2, d = 4, center = true); // links unten
}