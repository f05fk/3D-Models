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

*#translate([-20, -20, 0]) cube([40, 40, 5]);
*#translate([-20, -20, 0]) cube([20, 20, 5.1]);

*number1();
*number2();
*number3();
*number4();

*top1();
*top2();
*top3();
*top4();

*middle123();
*middle4();

*lower123();
*lower4();

*topF();
*middleF();
*lowerF();
*bottomF();

module number1() {
    bar([0, 10, 0], [0, -10, 0], height = 1, radius = 1);
}

module number2() {
    bar([-5,   5, 0], [-5,  10, 0], height = 1, radius = 1);
    bar([-5,  10, 0], [ 5,  10, 0], height = 1, radius = 1);
    bar([ 5,   2, 0], [ 5,  10, 0], height = 1, radius = 1);
    bar([-5, -10, 0], [ 5,   2, 0], height = 1, radius = 1);
    bar([-5, -10, 0], [ 5, -10, 0], height = 1, radius = 1);
}

module number3() {
    bar([-5, -10, 0], [ 5, -10, 0], height = 1, radius = 1);
    bar([-5,   0, 0], [ 5,   0, 0], height = 1, radius = 1);
    bar([-5,  10, 0], [ 5,  10, 0], height = 1, radius = 1);
    bar([ 5, -10, 0], [ 5,  10, 0], height = 1, radius = 1);
}

module number4() {
    bar([-5,   0, 0], [-5, 10, 0], height = 1, radius = 1);
    bar([-5,   0, 0], [ 5,  0, 0], height = 1, radius = 1);
    bar([ 5, -10, 0], [ 5, 10, 0], height = 1, radius = 1);
}

module bar(start, end, height, radius) {
    hull() {
        translate(start + [0, 0, height]) sphere(r = radius);
        translate(end   + [0, 0, height]) sphere(r = radius);
        translate(start - [0, 0, height]) sphere(r = radius);
        translate(end   - [0, 0, height]) sphere(r = radius);
    }
}

module top1() {
    difference() {
        lower123();

        translate([0, 0, 1]) rotate([180, 0, 0]) number1();
    }
}

module top2() {
    difference() {
        lower123();

        translate([0, 0, 1]) rotate([180, 0, 0]) number2();
    }
}

module top3() {
    difference() {
        lower123();

        translate([0, 0, 1]) rotate([180, 0, -90]) number3();
    }
}

module top4() {
    difference() {
        lower4();

        translate([0, 0, 1]) rotate([180, 0, 0]) number4();
    }
}

module middle123() {
    difference() {
        translate([-20, -20, 0]) cube([20, 20, 5]);

        translate([-15, -15, -2]) cylinder(d = 4, h = 9);
        translate([ -5, -15, -2]) cylinder(d = 4, h = 9);
        translate([ -5,  -5, -2]) cylinder(d = 4, h = 9);
        translate([-15,  -5, -2]) cylinder(d = 4, h = 9);
    }
    translate([-19,  -1, 0]) cube([19, 20, 5]);
    translate([ -1,   1, 0]) cube([20, 18, 5]);
}

module middle4() {
    difference() {
        translate([-20, -20, 0]) cube([40, 40, 5]);

        translate([-15, -15, -2]) cylinder(d = 4, h = 9);
        translate([ 15, -15, -2]) cylinder(d = 4, h = 9);
        translate([ 15,  15, -2]) cylinder(d = 4, h = 9);
        translate([-15,  15, -2]) cylinder(d = 4, h = 9);
    }
}

module lower123() {
    translate([-20, -20, 0]) cube([40, 40, 4]);
    translate([-20, -20, 0]) cube([20, 20, 5]);
    translate([-15, -15, 2]) cylinder(d = 4, h = 5);
    translate([ -5, -15, 2]) cylinder(d = 4, h = 5);
    translate([ -5,  -5, 2]) cylinder(d = 4, h = 5);
    translate([-15,  -5, 2]) cylinder(d = 4, h = 5);
}

module lower4() {
    translate([-20, -20, 0]) cube([40, 40, 5]);
    translate([-15, -15, 2]) cylinder(d = 4, h = 5);
    translate([ 15, -15, 2]) cylinder(d = 4, h = 5);
    translate([ 15,  15, 2]) cylinder(d = 4, h = 5);
    translate([-15,  15, 2]) cylinder(d = 4, h = 5);
}

module topF() {
    difference() {
        bottom();
        translate([-40.5, -40.5, -2]) cube([81, 81, 9]);
    }
    translate([ 65, -45, 2]) cylinder(d = 4, h = 5);
    translate([ 65,   0, 2]) cylinder(d = 4, h = 5);
    translate([ 65,  45, 2]) cylinder(d = 4, h = 5);
    translate([ 45,  65, 2]) cylinder(d = 4, h = 5);
    translate([  0,  65, 2]) cylinder(d = 4, h = 5);
    translate([-45,  65, 2]) cylinder(d = 4, h = 5);
    translate([-65,  45, 2]) cylinder(d = 4, h = 5);
    translate([-65,   0, 2]) cylinder(d = 4, h = 5);
    translate([-65, -45, 2]) cylinder(d = 4, h = 5);
    translate([-45, -65, 2]) cylinder(d = 4, h = 5);
    translate([  0, -65, 2]) cylinder(d = 4, h = 5);
    translate([ 45, -65, 2]) cylinder(d = 4, h = 5);
}

module middleF() {
    difference() {
        bottom();
        translate([-60, -60, -2]) cube([120, 120, 9]);

        translate([ 65, -45, -2]) cylinder(d = 4, h = 9);
        translate([ 65,   0, -2]) cylinder(d = 4, h = 9);
        translate([ 65,  45, -2]) cylinder(d = 4, h = 9);
        translate([ 45,  65, -2]) cylinder(d = 4, h = 9);
        translate([  0,  65, -2]) cylinder(d = 4, h = 9);
        translate([-45,  65, -2]) cylinder(d = 4, h = 9);
        translate([-65,  45, -2]) cylinder(d = 4, h = 9);
        translate([-65,   0, -2]) cylinder(d = 4, h = 9);
        translate([-65, -45, -2]) cylinder(d = 4, h = 9);
        translate([-45, -65, -2]) cylinder(d = 4, h = 9);
        translate([  0, -65, -2]) cylinder(d = 4, h = 9);
        translate([ 45, -65, -2]) cylinder(d = 4, h = 9);
    }
}

module lowerF() {
    difference() {
        topF();

        translate([ 65, -50, -2]) cylinder(d = 4, h = 9);
        translate([ 65, -20, -2]) cylinder(d = 4, h = 9);
        translate([ 65,  20, -2]) cylinder(d = 4, h = 9);
        translate([ 65,  50, -2]) cylinder(d = 4, h = 9);
        translate([ 50,  65, -2]) cylinder(d = 4, h = 9);
        translate([ 20,  65, -2]) cylinder(d = 4, h = 9);
        translate([-20,  65, -2]) cylinder(d = 4, h = 9);
        translate([-50,  65, -2]) cylinder(d = 4, h = 9);
        translate([-65,  50, -2]) cylinder(d = 4, h = 9);
        translate([-65,  20, -2]) cylinder(d = 4, h = 9);
        translate([-65, -20, -2]) cylinder(d = 4, h = 9);
        translate([-65, -50, -2]) cylinder(d = 4, h = 9);
        translate([-50, -65, -2]) cylinder(d = 4, h = 9);
        translate([-20, -65, -2]) cylinder(d = 4, h = 9);
        translate([ 20, -65, -2]) cylinder(d = 4, h = 9);
        translate([ 50, -65, -2]) cylinder(d = 4, h = 9);
    }
}

module bottomF() {
    bottom();
    translate([ 65, -50, 2]) cylinder(d = 4, h = 5);
    translate([ 65, -20, 2]) cylinder(d = 4, h = 5);
    translate([ 65,  20, 2]) cylinder(d = 4, h = 5);
    translate([ 65,  50, 2]) cylinder(d = 4, h = 5);
    translate([ 50,  65, 2]) cylinder(d = 4, h = 5);
    translate([ 20,  65, 2]) cylinder(d = 4, h = 5);
    translate([-20,  65, 2]) cylinder(d = 4, h = 5);
    translate([-50,  65, 2]) cylinder(d = 4, h = 5);
    translate([-65,  50, 2]) cylinder(d = 4, h = 5);
    translate([-65,  20, 2]) cylinder(d = 4, h = 5);
    translate([-65, -20, 2]) cylinder(d = 4, h = 5);
    translate([-65, -50, 2]) cylinder(d = 4, h = 5);
    translate([-50, -65, 2]) cylinder(d = 4, h = 5);
    translate([-20, -65, 2]) cylinder(d = 4, h = 5);
    translate([ 20, -65, 2]) cylinder(d = 4, h = 5);
    translate([ 50, -65, 2]) cylinder(d = 4, h = 5);
}

module bottom() {
    hull() {
        translate([ 50,  50, 0]) cylinder(r = 20, h = 5);
        translate([-50,  50, 0]) cylinder(r = 20, h = 5);
        translate([-50, -50, 0]) cylinder(r = 20, h = 5);
        translate([ 50, -50, 0]) cylinder(r = 20, h = 5);
    }
}
