/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\
 * Copyright (C) Claus Schrammel <claus@f05fk.net>                       *
 *                                                                       *
 * This program is free software: you can redistribute it and/or modify  *
 * it under the terms of the GNU General Public License as published by  *
 * the Free Software Foundation, either version 3 of the License, or     *
 * (at your option) any later version.                                   *
 *                                                                       *
 * This program is distributed in the hope that it will be useful,       *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 * GNU General Public License for more details.                          *
 *                                                                       *
 * You should have received a copy of the GNU General Public License     *
 * along with this program.  If not, see <http://www.gnu.org/licenses/>. *
 *                                                                       *
 * SPDX-License-Identifier: GPL-3.0-or-later                             *
\* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
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

