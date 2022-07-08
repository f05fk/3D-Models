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
    cylinder(h = 9, d = 18);

    translate([0, 0, 8]) cylinder(h = 3, d = 8.4, center = true);

    translate([0, 0, 5])
    intersection() {
        cylinder(h = 12, d = 8.4, center = true);
        cube([10, 6.5, 12], center = true);
    }

    translate([0, 0, 2]) {
        rotate([90, 0, 0]) cylinder(h = 20, d = 3, center = true);
        translate([0, 0, -4]) cube([3, 20, 8], center = true);
    }

    for (i = [15:15:360])
        translate([0, 0, 9.24])
            rotate([0, 45, i])
            cube([2, 20, 2], center = true);

}
