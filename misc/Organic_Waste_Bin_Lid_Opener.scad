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

c = 2;
e = 30;
w = 20;

h0 = -50;
h1 = 27.5;
h2 = 53.0;
h3 = 62.5;
h4 = 150;

l0 = -50;
l1 =  4.5;
l2 = 46.0;
l3 = 57.5;
lx = l3 - 5;

polygon = [[0, h0], [0, h3], [l1, h3], [l1, h2], [l2, h2], [l2, h1], [l3, h1], [l3, 0], [lx, 0], [lx, -w],
           [l3+w, -w], [l3+w, h1], [l2, h3+w], [0, h3+w], [0, h4+w], [l0, h4+w], [l0, h4], [-w, h4], [-w, h0]];

PrismaChamfered(points = polygon, height = e, chamfer = c);
