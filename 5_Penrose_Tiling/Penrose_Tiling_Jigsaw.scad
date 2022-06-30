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
use <../modules/PrismaChamfered.scad>

// the length (mm) of the shorter edge
UNIT = 30;
// the height (mm)
HEIGHT = 5;
// shrink by (mm)
SHRINK = 0.1;
// chamfer (mm) of the prisma
CHAMFER = 0.3;
// the radius (mm; before scaling) of the tabs and blanks
RADIUS = 0.1;
// the displacement (mm; before scaling) of the tabs and blanks from the center of the edge
DISPLACEMENT = 0.1;

// the P2 kite
P2_KITE = tabs_and_blanks([[0,0], [cos(108), sin(108)], [-PHI, 0], [cos(-108), sin(-108)]], RADIUS) * UNIT;
translate([-10, 35, 0])
PrismaChamfered(points = shrink_edges(P2_KITE, SHRINK), height = HEIGHT, chamfer = CHAMFER);

// the P2 dart
P2_DART = tabs_and_blanks([[cos(-108), sin(-108)], [1, 0], [cos(108), sin(108)], [0,0]], RADIUS) * UNIT;
translate([15, 35, 0])
PrismaChamfered(points = shrink_edges(P2_DART, SHRINK), height = HEIGHT, chamfer = CHAMFER);

// the P3 thin rhomb
P3_THIN =  tabs_and_blanks([[cos( 108), sin( 108)], [-1/PHI, 0], [cos(-108), sin(-108)], [0,0]], RADIUS) * UNIT;
translate([-10, -35, 0])
PrismaChamfered(points = shrink_edges(P3_THIN, SHRINK), height = HEIGHT, chamfer = CHAMFER);

// the P3 thick rhomb
P3_THICK = tabs_and_blanks([[0,0], [cos(-36), sin(-36)], [PHI, 0], [cos(36), sin(36)]], RADIUS) * UNIT;
translate([10, -35, 0])
PrismaChamfered(points = shrink_edges(P3_THICK, SHRINK), height = HEIGHT, chamfer = CHAMFER);

/*
 * create a 2D polygon from the points with alternating tabs and blanks
 */
function tabs_and_blanks(points, radius) = [
    points[0], each tab_or_blank(points[0], points[1], radius, +1),
    points[1], each tab_or_blank(points[1], points[2], radius, -1),
    points[2], each tab_or_blank(points[2], points[3], radius, +1),
    points[3], each tab_or_blank(points[3], points[0], radius, -1),
];

/*
 * create a single tab or blank between the two given points
 */
function tab_or_blank(p1, p2, radius, tab) =
    let (v = p2 - p1, u = unit_vector_2D(v), n = normal_vector_2D(u),
        p12 = (p1 + p2) / 2 + DISPLACEMENT * tab * u,
        alpha = atan2(u.y, u.x),
        radius_small = radius * (3 - 2 * sqrt(2)),
        distance_small = radius * (2 * sqrt(2) - 2),
        center1 = p12 + tab * n * radius_small - u * distance_small,
        center2 = p12 + tab * n * radius,
        center3 = p12 + tab * n * radius_small + u * distance_small
    )
    [
        each [ for (i = [270:10:400]) center1 + [cos(tab * i + alpha), sin(tab * i + alpha)] * radius_small ],
        each [ for (i = [220:-5:-40]) center2 + [cos(tab * i + alpha), sin(tab * i + alpha)] * radius ],
        each [ for (i = [140:10:270]) center3 + [cos(tab * i + alpha), sin(tab * i + alpha)] * radius_small ],
    ];
