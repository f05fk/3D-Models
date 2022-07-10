$fn = 120;

difference() {
    cube([250, 80, 3]);

    num = 10;
    for (i = [0:num - 1]) {
        translate([10 + i * 230 / num, 20, -2]) scale([10, 30, 1]) cylinder(h = 7, d = 1);
        translate([10 + i * 230 / num, 60, -2]) scale([10, 30, 1]) cylinder(h = 7, d = 1);
        translate([10 + (i + 0.5) * 230 / num, 00, -2]) scale([10, 30, 1]) cylinder(h = 7, d = 1);
        translate([10 + (i + 0.5) * 230 / num, 40, -2]) scale([10, 30, 1]) cylinder(h = 7, d = 1);
        translate([10 + (i + 0.5) * 230 / num, 80, -2]) scale([10, 30, 1]) cylinder(h = 7, d = 1);
    }
    translate([240, 20, -2]) scale([10, 30, 1]) cylinder(h = 7, d = 1);
    translate([240, 60, -2]) scale([10, 30, 1]) cylinder(h = 7, d = 1);

//    translate([ 10, 20, -2]) scale([10, 30, 1]) cylinder(h = 7, d = 1);
//    translate([ 10, 60, -2]) scale([10, 30, 1]) cylinder(h = 7, d = 1);
//    translate([ 25, 40, -2]) scale([10, 30, 1]) cylinder(h = 7, d = 1);

}
