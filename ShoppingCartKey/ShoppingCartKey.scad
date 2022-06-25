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

ShoppingCartKey();

module ShoppingCartKey() {
    union(){
        hull() {
            cylinder(h = 2.3, d = 22, center = true);
            cylinder(h = 1.3, d = 23, center = true);
        }
        difference() {
            hull() {
                translate([15, 0, 0]) cube([30, 14, 2.3], center = true);
                translate([15, 0, 0]) cube([30, 15, 1.3], center = true);
                translate([30, 0, 0]) cylinder(h = 2.3, d = 14, center = true);
                translate([30, 0, 0]) cylinder(h = 1.3, d = 15, center = true);
            }
            translate([30, 0, 0]) cylinder(h = 2.3, d = 10, center = true);
            hull() {
                translate([30, 0, 1.8]) cylinder(h = 2.3, d = 10, center = true);
                translate([30, 0, 2.3]) cylinder(h = 2.3, d = 11, center = true);
            }
            hull() {
                translate([30, 0, -1.8]) cylinder(h = 2.3, d = 10, center = true);
                translate([30, 0, -2.3]) cylinder(h = 2.3, d = 11, center = true);
            }
        }
    }
}
