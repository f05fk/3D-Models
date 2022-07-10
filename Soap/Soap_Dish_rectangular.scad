

module bevelCube(size, bevel) {
    hull() {
        cube([size[0] - 2 * bevel, size[1] - 2 * bevel, size[2]], center = true);
        cube([size[0] - 2 * bevel, size[1], size[2] - 2 * bevel], center = true);
        cube([size[0], size[1] - 2 * bevel, size[2] - 2 * bevel], center = true);
    }
}

translate([0,  38, 0]) bevelCube([120, 4, 15], 1);
translate([0, -38, 0]) bevelCube([120, 4, 15], 1);

for (i = [0:10]) {
    translate([-58 + i * 116 / 10, 0, 0]) bevelCube([4, 80, 15], 1);
}

translate([-58, -38, 5]) bevelCube([4, 4, 15], 1);
translate([-58, +38, 5]) bevelCube([4, 4, 15], 1);
translate([+58, +38, 5]) bevelCube([4, 4, 15], 1);
translate([+58, -38, 5]) bevelCube([4, 4, 15], 1);

