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

union() {
    translate([0, 14.4, 0])
    CubeChamfered([26.4, 8.8, 6], 1, center = true);
    CubeChamfered([8.8, 37.6, 6], 1, center = true);
}

*union() {
    translate([0, 33.8, 0])
    CubeChamfered([80, 12.4, 7], 1, center = true);
    translate([0, -33.8, 0])
    CubeChamfered([80, 12.4, 7], 1, center = true);
    translate([33.8, 0, 0])
    CubeChamfered([12.3, 80, 7], 1, center = true);
    translate([-33.8, 0, 0])
    CubeChamfered([12.3, 80, 7], 1, center = true);
    translate([0, 0, -3])
    hull() {
        cube([78, 80, 1], center = true);
        cube([80, 78, 1], center = true);
    }
}

*union() {
    translate([0, 32.5, 0])
    CubeChamfered([80, 15, 7], 1, center = true);
    translate([0, -32.5, 0])
    CubeChamfered([80, 15, 7], 1, center = true);
    translate([32.5, 0, 0])
    CubeChamfered([15, 80, 7], 1, center = true);
    translate([-32.5, 0, 0])
    CubeChamfered([15, 80, 7], 1, center = true);
    translate([0, 0, -3])
    hull() {
        cube([78, 80, 1], center = true);
        cube([80, 78, 1], center = true);
    }
}

module CubeChamfered(size, d, center = false) {
    pos = center == true ? [0, 0, 0] : [size.x / 2, size.y / 2, size.z / 2];
    hull() {
        translate([pos.x, pos.y, pos.z]) {
           cube([size.x, size.y - 2 * d, size.z - 2 * d], center = true);
           cube([size.x - 2 * d, size.y, size.z - 2 * d], center = true);
           cube([size.x - 2 * d, size.y - 2 * d, size.z], center = true);
        }
    }
}
