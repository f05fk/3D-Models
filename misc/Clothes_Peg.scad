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

// does not work properly

difference() {
    union() {
        linear_extrude(10, center = true, convexity = 10)
        polygon([ [0, 6], [80, 15], [80, 12], [40, 0], [80, -12], [80, -15], [0, -6]]);

        translate([40, 0, 0]) cylinder(h = 10, d = 10, center = true);
    }

    translate([40, 0, 0]) cylinder(h = 12, d = 1, center = true);

    translate([32, 0, 0]) cube([16, 0.2, 12], center = true);

    translate([24, 0, 0])
    intersection() {
        translate([0, 1, 0]) cylinder(h = 12, d = 6, center = true);
        translate([0, -1, 0]) cylinder(h = 12, d = 6, center = true);
    }

    translate([13, 0, 0])
    intersection() {
        translate([0, 10, 0]) cylinder(h = 12, d = 26, center = true);
        translate([0, -10, 0]) cylinder(h = 12, d = 26, center = true);
    }

    difference() {
        cube([20, 20, 12], center = true);
        translate([9.3, 9, 0]) cylinder(h = 14, d = 20, center = true);
        translate([9.3, -9, 0]) cylinder(h = 14, d = 20, center = true);
    }

}
