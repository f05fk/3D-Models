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

include <../functions/constants.scad>

scale(20) DodecahedronBowl();

module DodecahedronBowl() {
    factor = 1 / sqrt(10 - 2 * sqrt(5));
    inner = 0.9;

    polyhedron(
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

                   [-2 *       cos(  0), -2 *       sin(  0), -PHI - 1] * inner,
                   [-2 *       cos( 72), -2 *       sin( 72), -PHI - 1] * inner,
                   [-2 *       cos(144), -2 *       sin(144), -PHI - 1] * inner,
                   [-2 *       cos(216), -2 *       sin(216), -PHI - 1] * inner,
                   [-2 *       cos(288), -2 *       sin(288), -PHI - 1] * inner,
                   [-2 * PHI * cos(  0), -2 * PHI * sin(  0), -PHI + 1] * inner,
                   [-2 * PHI * cos( 72), -2 * PHI * sin( 72), -PHI + 1] * inner,
                   [-2 * PHI * cos(144), -2 * PHI * sin(144), -PHI + 1] * inner,
                   [-2 * PHI * cos(216), -2 * PHI * sin(216), -PHI + 1] * inner,
                   [-2 * PHI * cos(288), -2 * PHI * sin(288), -PHI + 1] * inner,
                   [+2 * PHI * cos(  0), +2 * PHI * sin(  0), +PHI - 1] * inner,
                   [+2 * PHI * cos( 72), +2 * PHI * sin( 72), +PHI - 1] * inner,
                   [+2 * PHI * cos(144), +2 * PHI * sin(144), +PHI - 1] * inner,
                   [+2 * PHI * cos(216), +2 * PHI * sin(216), +PHI - 1] * inner,
                   [+2 * PHI * cos(288), +2 * PHI * sin(288), +PHI - 1] * inner,
                 ] * factor,
        faces = [ [ 0, 1, 2, 3, 4], [ 1,  0,  5, 13,  6], [ 2,  1,  6, 14,  7],
                  [ 3,  2,  7, 10,  8], [ 4,  3,  8, 11,  9], [ 0,  4,  9, 12,  5],
                  
                  [19, 18, 17, 16, 15], [15, 16, 21, 28, 20], [16, 17, 22, 29, 21],
                  [17, 18, 23, 25, 22], [18, 19, 24, 26, 23], [19, 15, 20, 27, 24],
                  
                  [6, 13, 28, 21], [13, 5, 20, 28], [7, 14, 29, 22], [14, 6, 21, 29], [8, 10, 25, 23],
                  [10, 7, 22, 25], [9, 11, 26, 24], [11, 8, 23, 26], [5, 12, 27, 20], [12, 9, 24, 27],
                ],
        convexity = 10);
}
