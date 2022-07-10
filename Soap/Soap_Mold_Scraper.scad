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
    cube([130, 80, 4]);

    translate([-4, 9, -2]) cylinder(h = 8, r = 10);
    translate([-2, 31, -2]) cylinder(h = 8, r = 18);
    translate([-2, 55, -2]) cylinder(h = 8, r = 12);
    translate([-7, 70, -2]) cylinder(h = 8, r = 12);

    translate([120, 10, -2]) rotate(-45) cube([100, 100, 8]);
    translate([110, 30, -2]) rotate(-45) cube([100, 100, 8]);
    translate([115, 40, -2]) rotate(-45) cube([100, 100, 8]);
    translate([120, 65, -2]) rotate(-45) cube([100, 100, 8]);
    translate([125, 75, -2]) rotate(-45) cube([100, 100, 8]);
}
