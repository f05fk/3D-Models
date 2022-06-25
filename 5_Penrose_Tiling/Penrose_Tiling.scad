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

P2_KITE = [[0,0], [cos(108), sin(108)], [-PHI, 0], [cos(-108), sin(-108)]] * UNIT;
PrismaChamfered(points = shrink_edges(P2_KITE, 0.1), height = 5, chamfer = 1);

P2_DART = [[0,0], [cos(-108), sin(-108)], [1, 0], [cos(108), sin(108)]] * UNIT;
PrismaChamfered(points = shrink_edges(P2_DART, 0.1), height = 5, chamfer = 1);

P3_THIN =  [[0,0], [cos( 108), sin( 108)], [-1/PHI, 0], [cos(-108), sin(-108)]] * UNIT;
*PrismaChamfered(points = shrink_edges(P3_THIN, 0.1), height = 5, chamfer = 1);

P3_THICK = [[0,0], [cos(-36), sin(-36)], [PHI, 0], [cos(36), sin(36)]] * UNIT;
*PrismaChamfered(points = shrink_edges(P3_THICK, 0.1), height = 5, chamfer = 1);
