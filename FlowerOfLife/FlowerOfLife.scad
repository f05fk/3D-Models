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

$height = 1;
$length = 10;
$cross = $length * sqrt(3) / 2;

axis();
rotate( 60) axis();
rotate(-60) axis();

module axis() {
*    translate([-1.0 * $length, -3 * $cross, 0]) arc();
*    translate([ 0.0 * $length, -3 * $cross, 0]) arc();
*    translate([ 1.0 * $length, -3 * $cross, 0]) arc();

*    translate([-1.5 * $length, -2 * $cross, 0]) arc();
*    translate([-0.5 * $length, -2 * $cross, 0]) arc();
*    translate([ 0.5 * $length, -2 * $cross, 0]) arc();
*    translate([ 1.5 * $length, -2 * $cross, 0]) arc();

*    translate([-2.0 * $length, -1 * $cross, 0]) arc();
*    translate([-1.0 * $length, -1 * $cross, 0]) arc();
    translate([ 0.0 * $length, -1 * $cross, 0]) arc();
*    translate([ 1.0 * $length, -1 * $cross, 0]) arc();
*    translate([ 2.0 * $length, -1 * $cross, 0]) arc();

*    translate([-2.5 * $length,  0 * $cross, 0]) arc();
*    translate([-1.5 * $length,  0 * $cross, 0]) arc();
    translate([-0.5 * $length,  0 * $cross, 0]) arc();
    translate([ 0.5 * $length,  0 * $cross, 0]) arc();
*    translate([ 1.5 * $length,  0 * $cross, 0]) arc();
*    translate([ 2.5 * $length,  0 * $cross, 0]) arc();

*    translate([-2.0 * $length,  1 * $cross, 0]) arc();
*    translate([-1.0 * $length,  1 * $cross, 0]) arc();
    translate([ 0.0 * $length,  1 * $cross, 0]) arc();
*    translate([ 1.0 * $length,  1 * $cross, 0]) arc();
*    translate([ 2.0 * $length,  1 * $cross, 0]) arc();

*    translate([-1.5 * $length,  2 * $cross, 0]) arc();
*    translate([-0.5 * $length,  2 * $cross, 0]) arc();
*    translate([ 0.5 * $length,  2 * $cross, 0]) arc();
*    translate([ 1.5 * $length,  2 * $cross, 0]) arc();

*    translate([-1.0 * $length,  3 * $cross, 0]) arc();
*    translate([ 0.0 * $length,  3 * $cross, 0]) arc();
*    translate([ 1.0 * $length,  3 * $cross, 0]) arc();
}

module arc() {
    intersection() {
        translate([0, $cross, 0])
        cylinder(h = $height, r = $length, center = true);
        translate([0, -$cross, 0])
        cylinder(h = $height, r = $length, center = true);
    }
}
