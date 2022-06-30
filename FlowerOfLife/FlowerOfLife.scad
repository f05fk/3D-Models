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

use <../modules/Ring.scad>

FlowerOfLife(height = 3, size = 30, n = 3);

module FlowerOfLife(height, size, n = 3, ring = true, center = false) {
    radius = size;
    cross = size * sqrt(3) / 2;

    // draw the ring
    if (ring == true) {
        Ring(h = height, dout = 2 * (n + 0.15) * radius, din = 2 * n * radius, center = center);
    }

    // draw the lenses
    for (alpha = [-60, 0, 60]) {
        rotate(alpha)
        // there are 2 * n + 1 rows
        for (i = [-n:1:n]) {
            // there are 2 * n - abs(i) lenses in a row
            j = n - abs(i) / 2 - 0.5;
            for (k = [-j:1:j]) {
                // draw a single lens
                intersection() {
                    translate([k * radius, (i + 1) * cross, 0])
                        cylinder(h = height, r = radius, center = center);
                    translate([k * radius, (i - 1) * cross, 0])
                        cylinder(h = height, r = radius, center = center);
                }
            }
        }
    }
}
