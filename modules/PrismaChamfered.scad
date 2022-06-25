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

include <../functions/polygons.scad>

points = [[0, 0], [20, 0], [15, 10], [20, 20], [0, 20]];

PrismaChamfered(points = shrink_edges(points, 1), height = 10, chamfer = 1, invert_bottom = false, invert_middle = false, invert_top = false);

module PrismaChamfered(points, height, chamfer, invert_bottom = false, invert_middle = false, invert_top = false) {
    data = generate_data(points, chamfer, invert_bottom, invert_middle, invert_top);
    indexes = calculate_indexes(data);
    polyhedron(generate_poly_points(data, height, chamfer), generate_poly_faces(data, indexes), convexity = 10);
}

function generate_data(points, chamfer, invert_bottom = false, invert_middle = false, invert_top = false) = 
    [ for (i = [0 : 1 : len(points) - 1])
        let (p1 = cyclic_array(points, i - 1), p2 = cyclic_array(points, i), p3 = cyclic_array(points, i + 1),
                v1 = p2 - p1, v2 = p3 - p2,
                n1 = unit_vector_2D(normal_vector_2D(v1)), n2 = unit_vector_2D(normal_vector_2D(v2)),
                convex = cross(n1, n2))
        [

            // bottom

            if (convex > 0)
                if (invert_bottom)
                    if (intersection_coefficient1(p2,  v2, p1 - n1 * chamfer, v1) > -0.5 &&
                        intersection_coefficient1(p2, -v1, p2 - n2 * chamfer, v2) > -0.5)
                        [
                            intersection_point(p1 - n1 * chamfer, v1, p2,                v2),
                            intersection_point(p1,                v1, p2 - n2 * chamfer, v2),
                        ]
                    else
                        [
                            intersection_point(p1 - n1 * chamfer, v1, p2 - n2 * chamfer, v2),
                        ]
                else
                    [
                        intersection_point(p1 + n1 * chamfer, v1, p2 + n2 * chamfer, v2),
                    ]
            else // if (convex < 0)
                if (invert_bottom)
                    [
                        intersection_point(p1 - n1 * chamfer, v1, p2 - n2 * chamfer, v2),
                    ]
                else
                    if (intersection_coefficient1(p2,  v2, p1 + n1 * chamfer, v1) > -0.5 &&
                        intersection_coefficient1(p2, -v1, p2 + n2 * chamfer, v2) > -0.5)
                        [
                            intersection_point(p1 + n1 * chamfer, v1, p2,                v2),
                            intersection_point(p1,                v1, p2 + n2 * chamfer, v2),
                        ]
                    else
                        [
                            intersection_point(p1 + n1 * chamfer, v1, p2 + n2 * chamfer, v2),
                        ]
            ,

            // middle

            if (convex > 0 && !invert_middle
                    && intersection_coefficient1(p2, -v1, p2 + n2 * chamfer, v2) < 0.25
                    && intersection_coefficient1(p2,  v2, p1 + n1 * chamfer, v1) < 0.25)
                [
                    intersection_point(p1,                v1, p2 + n2 * chamfer, v2),
                    intersection_point(p1 + n1 * chamfer, v1, p2,                v2),
                ]
            else if (convex < 0 && invert_middle
                    && intersection_coefficient1(p2, -v1, p2 - n2 * chamfer, v2) < 0.25
                    && intersection_coefficient1(p2,  v2, p1 - n1 * chamfer, v1) < 0.25)
                [
                    intersection_point(p1,                v1, p2 - n2 * chamfer, v2),
                    intersection_point(p1 - n1 * chamfer, v1, p2,                v2),
                ]
            else
                [
                    intersection_point(p1,                v1, p2,                v2),
                ]
            ,

            // top

            if (convex > 0)
                if (invert_top)
                    if (intersection_coefficient1(p2,  v2, p1 - n1 * chamfer, v1) > -0.5 &&
                        intersection_coefficient1(p2, -v1, p2 - n2 * chamfer, v2) > -0.5)
                        [
                            intersection_point(p1 - n1 * chamfer, v1, p2,                v2),
                            intersection_point(p1,                v1, p2 - n2 * chamfer, v2),
                        ]
                    else
                        [
                            intersection_point(p1 - n1 * chamfer, v1, p2 - n2 * chamfer, v2),
                        ]
                else
                    [
                        intersection_point(p1 + n1 * chamfer, v1, p2 + n2 * chamfer, v2),
                    ]
            else // if (convex < 0)
                if (invert_top)
                    [
                        intersection_point(p1 - n1 * chamfer, v1, p2 - n2 * chamfer, v2),
                    ]
                else
                    if (intersection_coefficient1(p2,  v2, p1 + n1 * chamfer, v1) > -0.5 &&
                        intersection_coefficient1(p2, -v1, p2 + n2 * chamfer, v2) > -0.5)
                        [
                            intersection_point(p1 + n1 * chamfer, v1, p2,                v2),
                            intersection_point(p1,                v1, p2 + n2 * chamfer, v2),
                        ]
                    else
                        [
                            intersection_point(p1 + n1 * chamfer, v1, p2 + n2 * chamfer, v2),
                        ]

            ,

        ]

    ];

function calculate_indexes(data, index = 0, i = 0) =
    (i >= len(data)) ? [] :
    let (n0 = len(data[i][0]), n1 = len(data[i][1]), n2 = len(data[i][2]))
        concat([[index, index + n0, index + n0 + n1, index + n0 + 2 * n1]], calculate_indexes(data, index + n0 + 2 * n1 + n2, i + 1));

function generate_poly_points(data, height, chamfer) = 
    [ for (i = [0 : 1 : len(data) - 1])
        each [
            for (j = [0 : 1 : len(data[i][0]) - 1])
                [data[i][0][j].x, data[i][0][j].y,                0],
            for (j = [0 : 1 : len(data[i][1]) - 1])
                [data[i][1][j].x, data[i][1][j].y,          chamfer],
            for (j = [0 : 1 : len(data[i][1]) - 1])
                [data[i][1][j].x, data[i][1][j].y, height - chamfer],
            for (j = [0 : 1 : len(data[i][2]) - 1])
                [data[i][2][j].x, data[i][2][j].y, height          ],
        ]
    ];

function generate_poly_faces(data, indexes) = 
    [ 

        // bottom face

        [ for (i = [0 : 1 : len(data) - 1])
            if (len(data[i][0]) == 2)
                each [
                    indexes[i][0], indexes[i][0] + 1,
                ]
            else
                each [
                    indexes[i][0],
                ]
        ],

        // bottom row

        for (i = [0 : 1 : len(data) - 1])
            [indexes[i][0] + len(data[i][0]) - 1, indexes[i][1] + len(data[i][1]) - 1, indexes[(i + 1) % len(data)][1], indexes[(i + 1) % len(data)][0]]
        ,

        for (i = [0 : 1 : len(data) - 1])
            concat(
                [for (j = [len(data[i][0]) - 1 : -1 : 0]) indexes[i][0] + j],
                [for (j = [0 : 1 : len(data[i][1]) - 1])  indexes[i][1] + j]
            )
        ,

        // middle row

        for (i = [0 : 1 : len(data) - 1])
            if (len(data[i][1]) == 2)
                each [
                    [indexes[i][1],     indexes[i][2],     indexes[i][2] + 1, indexes[i][1] + 1],
                    [indexes[i][1] + 1, indexes[i][2] + 1, indexes[(i + 1) % len(data)][2], indexes[(i + 1) % len(data)][1]],
                ]
            else
                [indexes[i][1], indexes[i][2], indexes[(i + 1) % len(data)][2], indexes[(i + 1) % len(data)][1]]
        ,

        // top row

        for (i = [0 : 1 : len(data) - 1])
            [indexes[i][2] + len(data[i][1]) - 1, indexes[i][3] + len(data[i][2]) - 1, indexes[(i + 1) % len(data)][3], indexes[(i + 1) % len(data)][2]]
        ,

        for (i = [0 : 1 : len(data) - 1])
            concat(
                [for (j = [len(data[i][1]) - 1 : -1 : 0]) indexes[i][2] + j],
                [for (j = [0 : 1 : len(data[i][2]) - 1])  indexes[i][3] + j]
            )
        ,

        // top face

        [ for (i = [len(data) - 1 : -1 : 0])
            if (len(data[i][2]) == 2)
                each [
                    indexes[i][3] + 1, indexes[i][3],
                ]
            else
                each [
                    indexes[i][3],
                ]
        ],

    ];
