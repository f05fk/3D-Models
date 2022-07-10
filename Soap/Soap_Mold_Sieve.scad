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

difference() {
    cube([250, 80, 3]);

    num = 10;
    for (i = [0:num - 1]) {
        translate([10 + i * 230 / num, 20, -2]) scale([10, 30, 1]) cylinder(h = 7, d = 1);
        translate([10 + i * 230 / num, 60, -2]) scale([10, 30, 1]) cylinder(h = 7, d = 1);
        translate([10 + (i + 0.5) * 230 / num, 00, -2]) scale([10, 30, 1]) cylinder(h = 7, d = 1);
        translate([10 + (i + 0.5) * 230 / num, 40, -2]) scale([10, 30, 1]) cylinder(h = 7, d = 1);
        translate([10 + (i + 0.5) * 230 / num, 80, -2]) scale([10, 30, 1]) cylinder(h = 7, d = 1);
    }
    translate([240, 20, -2]) scale([10, 30, 1]) cylinder(h = 7, d = 1);
    translate([240, 60, -2]) scale([10, 30, 1]) cylinder(h = 7, d = 1);

//    translate([ 10, 20, -2]) scale([10, 30, 1]) cylinder(h = 7, d = 1);
//    translate([ 10, 60, -2]) scale([10, 30, 1]) cylinder(h = 7, d = 1);
//    translate([ 25, 40, -2]) scale([10, 30, 1]) cylinder(h = 7, d = 1);
}
