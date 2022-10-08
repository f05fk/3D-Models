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

use <../modules/PrismaChamfered.scad>

DEPTH = 40;
CELL_WIDTH = 70;
CELL_HEIGHT = 30;
THICKNESS = 1.8;
DELTA = THICKNESS / 2;
CHAMFER = 0.6;

x0a = 0 * CELL_WIDTH - DELTA;
x0b = 0 * CELL_WIDTH + DELTA;
x1a = 1 * CELL_WIDTH - DELTA;
x1b = 1 * CELL_WIDTH + DELTA;
x2a = 2 * CELL_WIDTH - DELTA;
x2b = 2 * CELL_WIDTH + DELTA;
x3a = 3 * CELL_WIDTH - DELTA;
x3b = 3 * CELL_WIDTH + DELTA;

y0a = 0 * CELL_HEIGHT - DELTA;
y0b = 0 * CELL_HEIGHT + DELTA;
y1a = 1 * CELL_HEIGHT - DELTA;
y1b = 1 * CELL_HEIGHT + DELTA;
y2a = 2 * CELL_HEIGHT - DELTA;
y2b = 2 * CELL_HEIGHT + DELTA;
y3a = 3 * CELL_HEIGHT - DELTA;
y3b = 3 * CELL_HEIGHT + DELTA;
y4a = 4 * CELL_HEIGHT - DELTA;
y4b = 4 * CELL_HEIGHT + DELTA;
y5a = 5 * CELL_HEIGHT - DELTA;
y5b = 5 * CELL_HEIGHT + DELTA;
y6a = 6 * CELL_HEIGHT - DELTA;
y6b = 6 * CELL_HEIGHT + DELTA;

difference() {
    PrismaChamfered(points = sqre(x0a, y0a, x3b, y6b), height = DEPTH, chamfer = CHAMFER);

    translate([0, 0, THICKNESS]) {
        // row 1
        PrismaChamfered(points = sqre(x0b, y0b, x1a, y1a), height = DEPTH - THICKNESS, chamfer = CHAMFER, invert_top = true);
        PrismaChamfered(points = sqre(x1b, y0b, x2a, y1a), height = DEPTH - THICKNESS, chamfer = CHAMFER, invert_top = true);
        //PrismaChamfered(points = sqre(x2b, y0b, x3a, y1a), height = DEPTH - THICKNESS, chamfer = CHAMFER, invert_top = true);
        // row 2
        //PrismaChamfered(points = sqre(x0b, y1b, x1a, y2a), height = DEPTH - THICKNESS, chamfer = CHAMFER, invert_top = true);
        PrismaChamfered(points = sqre(x1b, y1b, x2a, y2a), height = DEPTH - THICKNESS, chamfer = CHAMFER, invert_top = true);
        //PrismaChamfered(points = sqre(x2b, y1b, x3a, y2a), height = DEPTH - THICKNESS, chamfer = CHAMFER, invert_top = true);
        // row 3
        //PrismaChamfered(points = sqre(x0b, y2b, x1a, y3a), height = DEPTH - THICKNESS, chamfer = CHAMFER, invert_top = true);
        //PrismaChamfered(points = sqre(x1b, y2b, x2a, y3a), height = DEPTH - THICKNESS, chamfer = CHAMFER, invert_top = true);
        PrismaChamfered(points = sqre(x2b, y2b, x3a, y3a), height = DEPTH - THICKNESS, chamfer = CHAMFER, invert_top = true);
        // row 4
        //PrismaChamfered(points = sqre(x0b, y3b, x1a, y4a), height = DEPTH - THICKNESS, chamfer = CHAMFER, invert_top = true);
        //PrismaChamfered(points = sqre(x1b, y3b, x2a, y4a), height = DEPTH - THICKNESS, chamfer = CHAMFER, invert_top = true);
        //PrismaChamfered(points = sqre(x2b, y3b, x3a, y4a), height = DEPTH - THICKNESS, chamfer = CHAMFER, invert_top = true);
        // row 5
        //PrismaChamfered(points = sqre(x0b, y4b, x1a, y5a), height = DEPTH - THICKNESS, chamfer = CHAMFER, invert_top = true);
        PrismaChamfered(points = sqre(x1b, y4b, x2a, y5a), height = DEPTH - THICKNESS, chamfer = CHAMFER, invert_top = true);
        //PrismaChamfered(points = sqre(x2b, y4b, x3a, y5a), height = DEPTH - THICKNESS, chamfer = CHAMFER, invert_top = true);
        // row 6
        //PrismaChamfered(points = sqre(x0b, y5b, x1a, y6a), height = DEPTH - THICKNESS, chamfer = CHAMFER, invert_top = true);
        //PrismaChamfered(points = sqre(x1b, y5b, x2a, y6a), height = DEPTH - THICKNESS, chamfer = CHAMFER, invert_top = true);
        //PrismaChamfered(points = sqre(x2b, y5b, x3a, y6a), height = DEPTH - THICKNESS, chamfer = CHAMFER, invert_top = true);
        // special fields

        PrismaChamfered(points = sqre(x2b, y0b, x3a, y2a), height = DEPTH - THICKNESS, chamfer = CHAMFER, invert_top = true);
        PrismaChamfered(points = sqre(x0b, y1b, x1a, y3a), height = DEPTH - THICKNESS, chamfer = CHAMFER, invert_top = true);
        PrismaChamfered(points = sqre(x1b, y2b, x2a, y4a), height = DEPTH - THICKNESS, chamfer = CHAMFER, invert_top = true);
        PrismaChamfered(points = sqre(x0b, y3b, x1a, y6a), height = DEPTH - THICKNESS, chamfer = CHAMFER, invert_top = true);
        PrismaChamfered(points = sqre(x2b, y3b, x3a, y5a), height = DEPTH - THICKNESS, chamfer = CHAMFER, invert_top = true);
        PrismaChamfered(points = sqre(x1b, y5b, x3a, y6a), height = DEPTH - THICKNESS, chamfer = CHAMFER, invert_top = true);
    }
}

function sqre(xmin, ymin, xmax, ymax) = [[xmin, ymin], [xmax, ymin], [xmax, ymax], [xmin, ymax]];
