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
    cylinder(h = 3, d = 130, center = true);
    cylinder(h = 5, d = 124, center = true);
}

difference() {
    cylinder(h = 3, d = 80, center = true);
    cylinder(h = 5, d = 74, center = true);
}

difference() {
    union() {
        cylinder(h = 3, d = 30, center = true);
        cube([160, 3, 3], center = true);
        rotate(90) cube([160, 3, 3], center = true);
        rotate(45) cube([125, 3, 3], center = true);
        rotate(-45) cube([125, 3, 3], center = true);
    }
    cylinder(h = 5, d = 24, center = true);
}

for (i = [0:90:270]) {
    rotate(i) hull() {
        translate([78.5, 0, 4.5]) cube([3, 3, 9], center = true);
        translate([75.5, 0, 0]) cube([3, 3, 3], center = true);
    }
}
