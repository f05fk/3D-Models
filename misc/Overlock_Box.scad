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

// back
hull() {
    translate([  1,   1,   1]) sphere(r = 1);
    translate([  1,   1,  94]) sphere(r = 1);
    translate([149,   1,  74]) sphere(r = 1);
    translate([149,   1,   1]) sphere(r = 1);
}

// bottom
hull() {
    translate([  1,   1,   1]) sphere(r = 1);
    translate([  1,  39,   1]) sphere(r = 1);
    translate([149,  39,   1]) sphere(r = 1);
    translate([149,   1,   1]) sphere(r = 1);
}

// front
hull() {
    translate([  1,  39,   1]) sphere(r = 1);
    translate([  1,  39,  41]) sphere(r = 1);
    translate([149,  39,  41]) sphere(r = 1);
    translate([149,  39,   1]) sphere(r = 1);
}

// right
hull() {
    translate([  1,   1,   1]) sphere(r = 1);
    translate([  1,   1,  41]) sphere(r = 1);
    translate([  1,  39,  41]) sphere(r = 1);
    translate([  1,  39,   1]) sphere(r = 1);
}

// left
hull() {
    translate([149,   1,   1]) sphere(r = 1);
    translate([149,   1,  41]) sphere(r = 1);
    translate([149,  39,  41]) sphere(r = 1);
    translate([149,  39,   1]) sphere(r = 1);
}

// slope right
hull() {
    translate([  1,  39,  41]) sphere(r = 1);
    translate([  1,  74, 104]) sphere(r = 1);
    translate([ 44,  74, 104]) sphere(r = 1);
    translate([ 44,  39,  41]) sphere(r = 1);
}

// slope left
hull() {
    translate([149,  39,  41]) sphere(r = 1);
    translate([149,  49, 104]) sphere(r = 1);
    translate([ 48,  49, 104]) sphere(r = 1);
    translate([ 44,  39,  41]) sphere(r = 1);
}

// connector
hull() {
    translate([ 44,  74, 104]) sphere(r = 1);
    translate([ 44,  39,  41]) sphere(r = 1);
    translate([ 48,  49, 104]) sphere(r = 1);
}

// close left
hull() {
    translate([149,   1,  41]) sphere(r = 1);
    translate([149,  39,  41]) sphere(r = 1);
    translate([149,  49, 104]) sphere(r = 1);
    translate([149,   1,  74]) sphere(r = 1);
}

// close right
difference() {
hull() {
    translate([  1,   1,  41]) sphere(r = 1);
    translate([  1,  39,  41]) sphere(r = 1);
    translate([  1,  74, 104]) sphere(r = 1);
    translate([  1,   1,  94]) sphere(r = 1);
}

translate([1, 53, 92])
rotate([0, 90, 0])
cylinder(h = 4, d = 6, center = true);
}
