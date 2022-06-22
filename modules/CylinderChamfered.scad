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

CylinderChamfered(h = 10, d = 20, chamfer = 1, center = true);

module CylinderChamfered(h, d, chamfer, center = false, invert_bottom = false, invert_top = false) {
    d1 = invert_bottom ? d + 2 * chamfer : d - 2 * chamfer;
    d2 = invert_top    ? d + 2 * chamfer : d - 2 * chamfer;
    translate(center == true ? [0, 0, 0] : [0, 0, h / 2])
    union() {
        // bottom
        translate([0, 0, (chamfer - h) / 2])
        cylinder(h = chamfer, d1 = d1, d2 = d, center = true);

        // middle
        cylinder(h = h - 2 * chamfer, d = d, center = true);

        // top
        translate([0, 0, (h - chamfer) / 2])
        cylinder(h = chamfer, d1 = d, d2 = d2, center = true);
    }
}
