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

    hull() {
        cylinder(h = 30, d = 10);
        translate([0, 0, -1])
        cylinder(h = 1, d = 8);

        translate([20, 0, 0])
        cylinder(h = 30, d = 10);
        translate([20, 0, -1])
        cylinder(h = 1, d = 8);
    }

    hull() {
        translate([10, 0, 20])
        rotate([90, 0, 0])
        cylinder(h = 20, d = 11, center = true);

        translate([10, 0, 40])
        rotate([90, 0, 0])
        cylinder(h = 20, d = 11, center = true);
    }

    translate([20, 0, 29])
    hull() {
        cylinder(h = 8, d = 5, center = true);
        cylinder(h = 10, d = 4, center = true);
    }
}

translate([0, 0, 30])
hull() {
    cylinder(h = 8, d = 5, center = true);
    cylinder(h = 10, d = 4, center = true);
}
