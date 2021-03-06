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

*color("lightgrey")
linear_extrude(18)
import("Martin_Schmall_40er_Mountains.svg", convexity=10);

*color("lightgreen")
linear_extrude(25)
import("Martin_Schmall_40er_40.svg", convexity=10);

color("white")
linear_extrude(25)
import("Martin_Schmall_40er_Martin+Wheel.svg", convexity=10);

color("white")
translate([0, 3, 2.65])
rotate(90, [1, 0, 0])
linear_extrude(3)
import("Martin_Schmall_40er_Claus.svg", convexity=10);
