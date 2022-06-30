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

scale(20) DodecahedronCube();

module DodecahedronCube() {
    factor = 1 / (sqrt(5) - 1);
    polyhedron(
        points = [ [+1, +1, +1], [+1, +1, -1], [+1, -1, +1], [+1, -1, -1],
                   [-1, +1, +1], [-1, +1, -1], [-1, -1, +1], [-1, -1, -1],
                   [   0, +PHI, +phi], [   0, +PHI, -phi], [   0, -PHI, +phi], [   0, -PHI, -phi],
                   [+phi,    0, +PHI], [-phi,    0, +PHI], [+phi,    0, -PHI], [-phi,    0, -PHI],
                   [+PHI, +phi,    0], [+PHI, -phi,    0], [-PHI, +phi,    0], [-PHI, -phi,    0],
                 ] * factor,
        faces = [ [0, 12, 13, 4,  8], [ 5, 15, 14, 1,  9], [6, 13, 12, 2, 10],
                  [3, 14, 15, 7, 11], [ 0, 16, 17, 2, 12], [6, 19, 18, 4, 13],
                  [3, 17, 16, 1, 14], [ 5, 18, 19, 7, 15], [0,  8,  9, 1, 16],
                  [3, 11, 10, 2, 17], [ 5,  9,  8, 4, 18], [6, 10, 11, 7, 19],
                ],
        convexity = 2);
}
