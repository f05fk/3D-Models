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

include <../functions/constants.scad>

scale(20) DodecahedronFrame();

module DodecahedronFrame(radius = 0.1) {
    factor = 1 / sqrt(10 - 2 * sqrt(5));

    points = [ [-2 *       cos(  0), -2 *       sin(  0), -PHI - 1],
               [-2 *       cos( 72), -2 *       sin( 72), -PHI - 1],
               [-2 *       cos(144), -2 *       sin(144), -PHI - 1],
               [-2 *       cos(216), -2 *       sin(216), -PHI - 1],
               [-2 *       cos(288), -2 *       sin(288), -PHI - 1],
               [-2 * PHI * cos(  0), -2 * PHI * sin(  0), -PHI + 1],
               [-2 * PHI * cos( 72), -2 * PHI * sin( 72), -PHI + 1],
               [-2 * PHI * cos(144), -2 * PHI * sin(144), -PHI + 1],
               [-2 * PHI * cos(216), -2 * PHI * sin(216), -PHI + 1],
               [-2 * PHI * cos(288), -2 * PHI * sin(288), -PHI + 1],
               [+2 * PHI * cos(  0), +2 * PHI * sin(  0), +PHI - 1],
               [+2 * PHI * cos( 72), +2 * PHI * sin( 72), +PHI - 1],
               [+2 * PHI * cos(144), +2 * PHI * sin(144), +PHI - 1],
               [+2 * PHI * cos(216), +2 * PHI * sin(216), +PHI - 1],
               [+2 * PHI * cos(288), +2 * PHI * sin(288), +PHI - 1],
               [+2 *       cos(  0), +2 *       sin(  0), +PHI + 1],
               [+2 *       cos( 72), +2 *       sin( 72), +PHI + 1],
               [+2 *       cos(144), +2 *       sin(144), +PHI + 1],
               [+2 *       cos(216), +2 *       sin(216), +PHI + 1],
               [+2 *       cos(288), +2 *       sin(288), +PHI + 1],
             ] * factor;

    wire(points[0], points[1], radius);
    wire(points[1], points[2], radius);
    wire(points[2], points[3], radius);
    wire(points[3], points[4], radius);
    wire(points[4], points[0], radius);

    wire(points[0], points[5], radius);
    wire(points[1], points[6], radius);
    wire(points[2], points[7], radius);
    wire(points[3], points[8], radius);
    wire(points[4], points[9], radius);

    wire(points[5], points[12], radius);
    wire(points[5], points[13], radius);
    wire(points[6], points[13], radius);
    wire(points[6], points[14], radius);
    wire(points[7], points[14], radius);
    wire(points[7], points[10], radius);
    wire(points[8], points[10], radius);
    wire(points[8], points[11], radius);
    wire(points[9], points[11], radius);
    wire(points[9], points[12], radius);

    wire(points[10], points[15], radius);
    wire(points[11], points[16], radius);
    wire(points[12], points[17], radius);
    wire(points[13], points[18], radius);
    wire(points[14], points[19], radius);

    wire(points[15], points[16], radius);
    wire(points[16], points[17], radius);
    wire(points[17], points[18], radius);
    wire(points[18], points[19], radius);
    wire(points[19], points[15], radius);
}

module wire(from, to, radius) {
    hull() {
        translate(from) sphere(r = radius);
        translate(to) sphere(r = radius);
    }
}
