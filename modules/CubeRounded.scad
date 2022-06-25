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

CubeRounded(size = [40, 30, 20], r = 5, center = true);
translate([40, 0, 0])
CubeRounded(size = 20, r = 5, center = true);

module CubeRounded(size, r, center = false) {
    size = is_num(size) ? [size, size, size] : size;
    a = (center == true ? -size / 2 : [0, 0, 0]) + [r, r, r];
    b = (center == true ?  size / 2 :      size) - [r, r, r];
    hull() {
        translate([a.x, a.y, a.z]) sphere(r = r);
        translate([a.x, a.y, b.z]) sphere(r = r);
        translate([a.x, b.y, b.z]) sphere(r = r);
        translate([a.x, b.y, a.z]) sphere(r = r);
        translate([b.x, b.y, a.z]) sphere(r = r);
        translate([b.x, b.y, b.z]) sphere(r = r);
        translate([b.x, a.y, b.z]) sphere(r = r);
        translate([b.x, a.y, a.z]) sphere(r = r);
    }
}
