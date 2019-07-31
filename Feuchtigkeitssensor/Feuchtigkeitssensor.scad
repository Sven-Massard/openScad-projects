difference(){
  cube([25, 43, 5.5], center = true);
  translate([0, 0, 0.5])cube([23, 41, 4.5], center = true);
  translate([0, 4.75, -2.25])cube([16, 20.5, 1], center = true); // Fenster Sensor
  translate([0, -19, 0])cube([10, 5, 5.5], center = true);// Pins
}