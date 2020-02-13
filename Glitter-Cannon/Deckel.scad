fanDiameter = 80;


fn=128;
circle($fn=fn, d=fanDiameter-0.5);

translate([fanDiameter/2+(fanDiameter+2)/2+5, 0])circle($fn=fn, d=fanDiameter+2);