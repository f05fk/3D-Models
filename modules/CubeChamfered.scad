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

CubeChamfered(size = [40, 30, 20], chamfer = 3, center = true);
translate([40, 0, 0])
CubeChamfered(size = 20, chamfer = 3, center = true);

module CubeChamfered(size, chamfer, center = false) {
    size = is_num(size) ? [size, size, size] : size;
    hull() {
        translate(center == true ? [0, 0, 0] : [size.x / 2, size.y / 2, size.z / 2]) {
           cube([size.x, size.y - 2 * chamfer, size.z - 2 * chamfer], center = true);
           cube([size.x - 2 * chamfer, size.y, size.z - 2 * chamfer], center = true);
           cube([size.x - 2 * chamfer, size.y - 2 * chamfer, size.z], center = true);
        }
    }
}
