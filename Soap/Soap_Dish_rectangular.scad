* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\
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

module bevelCube(size, bevel) {
    hull() {
        cube([size[0] - 2 * bevel, size[1] - 2 * bevel, size[2]], center = true);
        cube([size[0] - 2 * bevel, size[1], size[2] - 2 * bevel], center = true);
        cube([size[0], size[1] - 2 * bevel, size[2] - 2 * bevel], center = true);
    }
}

translate([0,  38, 0]) bevelCube([120, 4, 15], 1);
translate([0, -38, 0]) bevelCube([120, 4, 15], 1);

for (i = [0:10]) {
    translate([-58 + i * 116 / 10, 0, 0]) bevelCube([4, 80, 15], 1);
}

translate([-58, -38, 5]) bevelCube([4, 4, 15], 1);
translate([-58, +38, 5]) bevelCube([4, 4, 15], 1);
translate([+58, +38, 5]) bevelCube([4, 4, 15], 1);
translate([+58, -38, 5]) bevelCube([4, 4, 15], 1);

