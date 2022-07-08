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

intersection() {
    union() {
        difference() {
            intersection() {
                union() {
                    intersection() {
                        cylinder(h = 8.8, d = 19.5);
                        translate([0.8, 0, 0]) rotate([0, -5, 0]) cylinder(h = 18.8, d = 19.5);
                    }
                    translate([0, -19.5/2, 0]) cube([10.75, 19.5, 8.8]);

                    translate([13.25, 0, -26.0]) rotate([0, 90, 0]) cylinder(h = 7, r = 30, center = true, $fn = 360);
                    translate([15.5, 0, -23.8]) rotate([0, 90, 0]) cylinder(h = 2.5, r = 30, center = true, $fn = 360);
                }
                translate([0, 0, -21.2]) rotate([0, 90, 0]) cylinder(h = 40, r = 30, center = true, $fn = 360);
            }

            translate([-6.75, 0, 3.8]) rotate([90, 0, 0]) cylinder(h = 20, d = 1.5, center = true);
            translate([-0.8, 0, -1.34]) rotate([0, 25, 0]) cube([10, 20, 10], center = true);
            translate([-10, -10, -0.3]) cube([10, 20, 2]);
            //translate([-3.25, -10, -2.5]) cube([11, 20, 8.8]);
            translate([2.25, 0, -23.2]) rotate([0, 90, 0]) cylinder(h = 11, r = 30, center = true, $fn = 360);
            translate([0, 0, -28.3]) rotate([0, 90, 0]) cylinder(h = 40, r = 30, center = true, $fn = 360);

            translate([15.75, 0, 0]) cube([10, 8.5, 20], center = true);
            translate([18,  7, 5]) rotate([-13, 0, 0]) rotate([0, 45, 0]) cube([6, 8, 6], center = true);
            translate([18, -7, 5]) rotate([ 13, 0, 0]) rotate([0, 45, 0]) cube([6, 8, 6], center = true);
        }

        translate([11.75, 0, 3.8]) cube([2.5, 8.5, 2.0], center = true);
        translate([5.75, 0, 5.8]) cylinder(h = 4, d = 2.5, center = true);
    }
    cube([40, 19.5, 20], center = true);
}
