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

cylinder(d = 11, h = 6, center = false);
difference() {
    translate([0, 0, 4]) hull() {
        cylinder(d = 35, h = 2, center = false);
        cylinder(d = 33, h = 3, center = false);
    }
    cylinder(d = 15, h = 5, center = false);
}

translate([0, 0, 38]) cube([35, 3, 64], center = true);
translate([0, 0, 38]) cube([3, 35, 64], center = true);

hull() {
    translate([0, 0, 70]) cylinder(d = 15, h = 3, center = false);
    translate([0, 0, 60]) cylinder(d = 1, h = 1, center = false);
}
