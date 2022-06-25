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

include <../functions/constants.scad>;
use <../modules/PrismaChamfered.scad>

UNIT = 30;
R = sqrt((5 + sqrt(5)) / 10) * PHI * UNIT;

big = [[0,0], [cos(108), sin(108)], [-PHI, 0]] * UNIT;
PrismaChamfered(points = big, height = 8, chamfer = 1);

small = [[0,0], [1, 0], [cos(108), sin(108)]] * UNIT;
PrismaChamfered(points = small, height = 8, chamfer = 1);

pentagon = [[1, 0], [cos(72), sin(72)], [cos(144), sin(144)], [cos(-144), sin(-144)], [cos(-72), sin(-72)]] * R;
difference() {
    PrismaChamfered(points = grow_edges(pentagon, 8), height = 12, chamfer = 1, invert_bottom = false, invert_middle = false, invert_top = false);
    translate([0, 0, 4])
    PrismaChamfered(points = grow_edges(pentagon, 0.25), height = 8, chamfer = 1, invert_bottom = false, invert_middle = true, invert_top = true);
}
