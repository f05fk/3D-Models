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

use <../functions/polygons.scad>;
use <../modules/PrismaChamfered.scad>;

length = 20;
width = 8;
height = 6;
thick = 0.9;
chamfer = 0.3;

points = flatten_corners(points = [[0, 0], [length, 0], [length, width], [0, width]], distance = 1);

difference() {
    PrismaChamfered(grow_edges(points, thick), height = height, chamfer = chamfer);
    PrismaChamfered(           points,         height = height, chamfer = chamfer, invert_bottom = true, invert_top = true);
}
