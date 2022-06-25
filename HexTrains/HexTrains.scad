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

//connector();

translate([0, 0, -1])
%cylinder(h = 1, r = 100, $fn = 6);

*junction(s1 = true); // straight
*junction(c1 = true); // curved
junction(s1 = true, c1 = true); // junction straight/curved
*junction(c1 = true, c3 = true); // junction curved/curved
*junction(c1 = true, c3 = true, c5 = true); // junction curved/curved/curved
*junction(s1 = true, s2 = true); // crossing straight/straight
*junction(s1 = true, s2 = true, s3 = true); // crossing straight/straight
*junction(s1 = true, s2 = true, s3 = true, c1 = true, c2 = true, c3 = true, c4 = true, c5 = true, c6 = true); // ALL

module junction(s1 = false, s2 = false, s3 = false, c1 = false, c2 = false, c3 = false, c4 = false, c5 = false, c6 = false) {
    difference() {
        union() {
            if (s1)             corpus_straight();
            if (s2) rotate( 60) corpus_straight();
            if (s3) rotate(120) corpus_straight();
            if (c1)             corpus_curved();
            if (c2) rotate( 60) corpus_curved();
            if (c3) rotate(120) corpus_curved();
            if (c4) rotate(180) corpus_curved();
            if (c5) rotate(240) corpus_curved();
            if (c6) rotate(300) corpus_curved();
        }
        union() {
            if (s1)             rails_straight();
            if (s2) rotate( 60) rails_straight();
            if (s3) rotate(120) rails_straight();
            if (c1)             rails_curved();
            if (c2) rotate( 60) rails_curved();
            if (c3) rotate(120) rails_curved();
            if (c4) rotate(180) rails_curved();
            if (c5) rotate(240) rails_curved();
            if (c6) rotate(300) rails_curved();

                        translate([0, 50 * sqrt(3), 0]) connector_extended();
            rotate( 60) translate([0, 50 * sqrt(3), 0]) connector_extended();
            rotate(120) translate([0, 50 * sqrt(3), 0]) connector_extended();
            rotate(180) translate([0, 50 * sqrt(3), 0]) connector_extended();
            rotate(240) translate([0, 50 * sqrt(3), 0]) connector_extended();
            rotate(300) translate([0, 50 * sqrt(3), 0]) connector_extended();
        }
    }
}

module connector() {
    union() {
        translate([0, 11.5, 0]) cylinder(h = 12, d = 13);
        translate([-3.5, -11.5, 0]) cube([7, 23, 12]);
        translate([0, -11.5, 0]) cylinder(h = 12, d = 13);
    }
}

module connector_extended() {
    translate([0, 0, -1])
    union() {
        translate([0, 11.5, 0]) cylinder(h = 14, d = 13);
        translate([-3.5, -11.5, 0]) cube([7, 23, 14]);
        translate([0, -11.5, 0]) cylinder(h = 14, d = 13);
    }
}

module corpus_straight() {
    translate([-20, 0, 0]) 
    rotate([90, 0, 0])
    linear_extrude(height = 100* sqrt(3), center = true, convexity = 10)
    polygon([[1, 0], [39, 0], [40, 1], [40, 11], [39, 12], [1, 12], [0, 11], [0, 1]]);
}

module rails_straight() {
    translate([-20, 0, 0]) 
    rotate([90, 0, 0])
    linear_extrude(height = 120 * sqrt(3), center = true, convexity = 10)
    polygon([[2, 15], [4, 9], [10, 9], [12, 15], [28, 15], [30, 9], [36, 9], [38, 15], [38, 18], [2, 18]]);

    translate([-20, 0, 0]) 
    rotate([90, 0, 0])
    linear_extrude(height = 120 * sqrt(3), center = true, convexity = 10)
    polygon([[2, -3], [4, 3], [10, 3], [12, -3], [28, -3], [30, 3], [36, 3], [38, -3], [38, -6], [2, -6]]);
}

module corpus_curved() {
    translate([-150, -50 * sqrt(3), 0])
    rotate_extrude(angle = 60, convexity = 10)
    translate([130, 0, 0])
    polygon([[1, 0], [39, 0], [40, 1], [40, 11], [39, 12], [1, 12], [0, 11], [0, 1]]);
}

module rails_curved() {
    translate([-150, -50 * sqrt(3), 0])
    rotate(-10)
    rotate_extrude(angle = 80, convexity = 10)
    translate([130, 0, 0])
    polygon([[2, 15], [4, 9], [10, 9], [12, 15], [28, 15], [30, 9], [36, 9], [38, 15], [38, 18], [2, 18]]);

    translate([-150, -50 * sqrt(3), 0])
    rotate(-10)
    rotate_extrude(angle = 80, convexity = 10)
    translate([130, 0, 0])
    polygon([[2, -3], [4, 3], [10, 3], [12, -3], [28, -3], [30, 3], [36, 3], [38, -3], [38, -6], [2, -6]]);
}
