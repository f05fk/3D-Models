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
    cube([60, 77, 10], center = true);

    translate([10, 0, 0]) cube([60, 57, 12], center = true);
    translate([-13, 20.5, 0]) cube([14, 20, 12], center = true);

    translate([ 35,  43.5, 0]) rotate(45) cube([20, 20, 20], center = true);
    translate([ 35, -43.5, 0]) rotate(45) cube([20, 20, 20], center = true);
    translate([-35, -43.5, 0]) rotate(45) cube([20, 20, 20], center = true);
    translate([-35,  43.5, 0]) rotate(45) cube([20, 20, 20], center = true);
}
