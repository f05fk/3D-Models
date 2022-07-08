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

use <../modules/CylinderChamfered.scad>
use <../modules/RingChamfered.scad>

difference() {
    RingChamfered(h = 10, din = 52, dout = 68, chamfer = 1, center = true);

    linear_extrude(11, center = true) {
        polygon([[0, 0], [40, 40], [40, 40], [40, -40], [40, -40]]);
    }
}

translate([40, 40, 0] / sqrt(3200) * 34) {
    CylinderChamfered(h = 10, d = 16, chamfer = 1, center = true);
}
translate([40, -40, 0] / sqrt(3200) * 34) {
    CylinderChamfered(h = 10, d = 16, chamfer = 1, center = true);
}
