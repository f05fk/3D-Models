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

difference() {

    rotate_extrude(convexity = 10) {
        hull() {
            translate([32, 0, 0])
            circle(d = 2);
            translate([22, 4, 0])
            circle(d = 2);
        }
        hull() {
            translate([22, 4, 0])
            circle(d = 2);
            translate([18, -4, 0])
            circle(d = 2);
        }
        hull() {
            translate([18, -4, 0])
            circle(d = 2);
            translate([1.5, -4, 0])
            circle(d = 2);
        }
    }

    translate([0, 0, -4])
    cylinder(h = 4, r = 2, center = true);

    for (i = [0:60:359]) {
        rotate(i)
        translate([6.5, 0, -4])
        cylinder(h = 4, r = 2, center = true);
    }

    for (i = [0:30:359]) {
        rotate(i)
        translate([13, 0, -4])
        cylinder(h = 4, r = 2, center = true);
    }

    for (i = [0:20:359]) {
        rotate(i)
        translate([20, 0, 0])
        rotate([0, atan(-2), 0])
        cylinder(h = 4, r = 2, center = true);
    }

    for (i = [0:20:359]) {
        rotate(i)
        translate([26, 0, 3])
        rotate([0, atan(0.4), 0])
        cylinder(h = 4, r = 2, center = true);
    }

    for (i = [10:20:369]) {
        rotate(i)
        translate([29, 0, 1])
        rotate([0, atan(0.4), 0])
        cylinder(h = 4, r = 2, center = true);
    }

}
