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

$r = 20;
$d = 6;

translate([-$r, 0, 0]) {
    rotate_extrude(angle = 270, convexity = 10)
    translate([$r, 0, 0])
    circle(d = $d);
    translate([0, -$r, 0])
    sphere(d = $d);
}


translate([$r, 0, 0])
rotate(180) {
    rotate_extrude(angle = 270, convexity = 10)
    translate([$r, 0, 0])
    circle(d = $d);
    translate([0, -$r, 0])
    sphere(d = $d);
}
