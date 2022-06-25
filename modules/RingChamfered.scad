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

RingChamfered(h = 10, dout = 20, din = 10, chamfer = 1, center = true);

module RingChamfered(h, dout, din, chamfer, center = false) {
    translate(center == true ? [0, 0, 0] : [0, 0, h / 2])
    difference() {
        // cylinder
        union() {
            // bottom
            translate([0, 0, (chamfer - h) / 2])
            cylinder(h = chamfer, d1 = dout - 2 * chamfer, d2 = dout, center = true);

            // middle
            cylinder(h = h - 2 * chamfer, d = dout, center = true);

            // top
            translate([0, 0, (h - chamfer) / 2])
            cylinder(h = chamfer, d1 = dout, d2 = dout - 2 * chamfer, center = true);
        }
        // hole
        union() {
            // bottom
            translate([0, 0, (chamfer - h) / 2])
            cylinder(h = 2 * chamfer, d1 = din + 3 * chamfer, d2 = din - chamfer, center = true);

            // middle
            cylinder(h = h - 2 * chamfer, d = din, center = true);

            // top
            translate([0, 0, (h - chamfer) / 2])
            cylinder(h = 2 * chamfer, d1 = din - chamfer, d2 = din + 3 * chamfer, center = true);
        }
    }
}
