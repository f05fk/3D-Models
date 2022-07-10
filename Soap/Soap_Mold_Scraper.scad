$fn = 120;

difference() {
    cube([130, 80, 4]);

    translate([-4, 9, -2]) cylinder(h = 8, r = 10);
    translate([-2, 31, -2]) cylinder(h = 8, r = 18);
    translate([-2, 55, -2]) cylinder(h = 8, r = 12);
    translate([-7, 70, -2]) cylinder(h = 8, r = 12);

    translate([120, 10, -2]) rotate(-45) cube([100, 100, 8]);
    translate([110, 30, -2]) rotate(-45) cube([100, 100, 8]);
    translate([115, 40, -2]) rotate(-45) cube([100, 100, 8]);
    translate([120, 65, -2]) rotate(-45) cube([100, 100, 8]);
    translate([125, 75, -2]) rotate(-45) cube([100, 100, 8]);




}
