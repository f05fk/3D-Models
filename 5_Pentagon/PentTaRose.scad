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

scale(10) PenTaRose();

module PenTaRose(h = 0.2, s = 1, d = 0.05, center = true) {
    A = [        1,         0, 0] * s;
    B = [cos(  72), sin(  72), 0] * s;
    C = [cos( 144), sin( 144), 0] * s;
    D = [cos(-144), sin(-144), 0] * s;
    E = [cos( -72), sin( -72), 0] * s;
    X = [cos( 108), sin( 108), 0] * s * sqrt(14 - 6 * sqrt(5)) / 2;
    r = s * d;
    hull() {
        translate(A) cylinder(h = h, r = r, center = center);
        translate(B) cylinder(h = h, r = r, center = center);
    }
    hull() {
        translate(B) cylinder(h = h, r = r, center = center);
        translate(C) cylinder(h = h, r = r, center = center);
    }
    hull() {
        translate(C) cylinder(h = h, r = r, center = center);
        translate(D) cylinder(h = h, r = r, center = center);
    }
    hull() {
        translate(D) cylinder(h = h, r = r, center = center);
        translate(E) cylinder(h = h, r = r, center = center);
    }
    hull() {
        translate(E) cylinder(h = h, r = r, center = center);
        translate(A) cylinder(h = h, r = r, center = center);
    }
    hull() {
        translate(A) cylinder(h = h, r = r, center = center);
        translate(C) cylinder(h = h, r = r, center = center);
    }
    hull() {
        translate(C) cylinder(h = h, r = r, center = center);
        translate(E) cylinder(h = h, r = r, center = center);
    }
    hull() {
        translate(B) cylinder(h = h, r = r, center = center);
        translate(X) cylinder(h = h, r = r, center = center);
    }
}
