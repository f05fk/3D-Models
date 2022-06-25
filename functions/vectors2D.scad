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

include <utils.scad>

function normal_vector_2D(vector) = [-vector.y, vector.x];
function unit_vector_2D(vector) = vector / norm(vector);

/*
 * Calculates the coefficient for v1 to get from p1 to the intersection point of the two lines p1/v1 and p2/v2:
 * intersection_point = p1 + v1 * intersection_coefficient1.
 */
function intersection_coefficient1(p1, v1, p2, v2) = ( v2.x * (p1.y - p2.y) - v2.y * (p1.x - p2.x) ) / (v1.x * v2.y - v1.y * v2.x);

/*
 * Calculates the coefficient for v2 to get from p2 to the intersection point of the two lines p1/v1 and p2/v2:
 * intersection_point = p2 + v2 * intersection_coefficient2.
 */
function intersection_coefficient2(p1, v1, p2, v2) = intersection_coefficient1(p2, v2, p1, v1);

/*
 * Calculates the intersection point of the two lines p1/v1 and p2/v2.
 */
function intersection_point(p1, v1, p2, v2) = p1 + v1 * intersection_coefficient1(p1, v1, p2, v2);
