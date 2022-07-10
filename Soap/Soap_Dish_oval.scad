$fn = 120;

rotate([180, 0, 0]) {
    intersection() {
        bars();
        hull() frame();
    }
    frame();

    translate([40, 26.5, 0])
        stand();
    translate([40, -26.5, 0])
        stand();
    translate([-40, -26.5, 0])
        stand();
    translate([-40, 26.5, 0])
        stand();
}

module stand() {
    translate([0, 0, -4.5])
        cylinder(h = 5, d = 3, center = true);
    translate([0, 0, -7])
        sphere(d = 3);
}

module bars() {
    for (i = [-50:10:50]) {
        translate([i, 0, 0])
            bar();
    }
}

module bar() {
    translate([0, 0, 5])
        rotate([90, 0, 0])
        cylinder(h = 100, d = 3, center = true);
    translate([0, 0, -0.75])
        cube([3, 100, 11.5], center = true);
}

module frame() {
    translate([0, -40, 0])
        rotate([0, 90, 0])
        linear_extrude(height = 40, center = true)
        profile();

    translate([0, 40, 0])
        rotate([0, 90, 180])
        linear_extrude(height = 40, center = true)
        profile();

    translate([-20, 0, 0])
        rotate([0, 0, 90])
        rotate_extrude(angle = 180, convexity = 10)
        translate([40, 0, 0])
        rotate([0, 180, 90])
        profile();

    translate([20, 0, 0])
        rotate([0, 0, -90])
        rotate_extrude(angle = 180, convexity = 10)
        translate([40, 0, 0])
        rotate([0, 180, 90])
        profile();
}

module profile() {
    projection() {
        translate([-5, 0, 0]) sphere(d = 3);

        rotate([0, -90, 0])
        linear_extrude(height = 5, convexity = 10)
            projection()
            sphere(d = 3);

        translate([0, 5, 0])
            rotate_extrude(angle = -90, convexity = 10)
            projection()
            translate([5, 0, 0]) sphere(d = 3);

        translate([5, 5, 0]) sphere(d = 3);
    }
}

