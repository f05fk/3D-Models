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
include <vectors2D.scad>

/*
 * Shrinks the polygon by moving the edges "inwards" by the given distance.
 * The points need to be given in the counter-clockwise order, i.e. applying the
 * right-hand rule with the thumb pointing in the z direction.
 */
function shrink_edges(points, distance) =
    [ for (i = [0 : 1 : len(points) - 1])
        let (p1 = cyclic_array(points, i - 1), p2 = cyclic_array(points, i), p3 = cyclic_array(points, i + 1),
                v1 = p2 - p1, v2 = p3 - p2,
                n1 = unit_vector_2D(normal_vector_2D(v1)), n2 = unit_vector_2D(normal_vector_2D(v2)))
            intersection_point(p1 + n1 * distance, v1, p2 + n2 * distance, v2)
    ];

/*
 * Grows the polygon by moving the edges "outwards" by the given distance.
 * The points need to be given in the counter-clockwise order, i.e. applying the
 * right-hand rule with the thumb pointing in the z direction.
 */
function grow_edges(points, distance) = shrink_edges(points, -distance);

/*
 * Flattens the corners of the polygon by cutting off at the intersection points where one of the edges
 * is moved "inwards" by the given distance, while the other edge is not, and vice-versa.
 * The points need to be given in the counter-clockwise order, i.e. applying the
 * right-hand rule with the thumb pointing in the z direction.
 */
function flatten_corners(points, distance) = 
    [ for (i = [0 : 1 : len(points) - 1])
        let (p1 = cyclic_array(points, i - 1), p2 = cyclic_array(points, i), p3 = cyclic_array(points, i + 1),
                v1 = p2 - p1, v2 = p3 - p2,
                n1 = unit_vector_2D(normal_vector_2D(v1)), n2 = unit_vector_2D(normal_vector_2D(v2)))
            each [
                intersection_point(p1, v1, p2 + n2 * distance, v2),
                intersection_point(p1 + n1 * distance, v1, p2, v2)
            ]
    ];
