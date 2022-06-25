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

Gear(height = 2, z = 20, m = 2);
translate([50, 0, 0]) rotate(90) Gear(height = 2, z = 30, m = 2);

module Gear(height, z, m, alpha0 = 20) {
    // m ... the module
    // z ... the number of teeth
    // height ... the height
    // alpha0 ... the pressure angle

    // preferential modules according DIN 780:
    //  0.05, 0.06, 0.08, 0.1, 0.12, 0.16, 0.2, 0.25, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9,
    //  1, 1.25, 1.5, 2, 2.5, 3, 4, 5, 6, 8, 10, 12, 16, 20, 25, 32, 40, 50, 60

    // addendum
    ha = m;
    // clearance
    c = 0.167 * m;
    // dedendum
    hd = m + c;
    // whole depth
    h = ha + hd;

    // standard reference pitch diameter/radius
    d0 = m * z;
    r0 = d0 / 2;
    // circular pitch
    p0 = m * PI;

    // tip diameter/radius (addendum circle diameter/radius)
    da = d0 + 2 * ha;
    ra = da / 2;
    // root diameter/radius (dedendum circle diameter/radius)
    dd = d0 - 2 * hd;
    rd = dd / 2;

    // circular tooth thickness
    s0 = p0 / 2;
    // tooth space width
    e0 = p0 / 2;

    // base circle diameter/radius
    db = d0 * cos(alpha0);
    rb = db / 2;
    // base pitch
    pb = p0 * cos(alpha0);

    // formula for involute:
    //   r^2 = rb^2 * (1 + t^2)
    //   phi = t / PI * 180 - acos(rb / r)
    //   phi = t / PI * 180 - atan(t)

    // involute must go through gamma0|r0
    gamma0 = s0 / 2 / r0 / PI * 180;
    t0 = sqrt(r0^2 / rb^2 - 1);
    phi0 = t0 / PI * 180 - atan(t0);
    gammab = gamma0 + phi0;

    // involute must go up to ra
    ta = sqrt(ra^2 / rb^2 - 1);

    union() {
        intersection() {
            cylinder(h = height + 2, d = da, center = true, $fn = 720);
            for (i = [0:z-1]) {
                rotate(i * 360 / z) hull() {
                    for (tx = [0:0.01:1.04]) {
                        t = tx * ta;
                        r = rb * sqrt(1 + t^2);
                        phi = t / PI * 180 - atan(t);
                        x = r * cos(gammab - phi);
                        y = r * sin(gammab - phi);
                        translate([(rd + x) / 2, 0, 0]) cube([x - rd, y * 2, height], center = true);
                    }
                }
            }
        }

        difference() {
            cylinder(h = height, d = db, center = true);
            cylinder(h = height + 2, d = 5, center = true);
            rotate(36) translate([(rb + 2.5) / 2, 0, 0]) cylinder(h = height + 2, d = (rb + 2.5) / 2, center = true);
            rotate(108) translate([(rb + 2.5) / 2, 0, 0]) cylinder(h = height + 2, d = (rb + 2.5) / 2, center = true);
            rotate(180) translate([(rb + 2.5) / 2, 0, 0]) cylinder(h = height + 2, d = (rb + 2.5) / 2, center = true);
            rotate(-108) translate([(rb + 2.5) / 2, 0, 0]) cylinder(h = height + 2, d = (rb + 2.5) / 2, center = true);
            rotate(-36) translate([(rb + 2.5) / 2, 0, 0]) cylinder(h = height + 2, d = (rb + 2.5) / 2, center = true);
            for (i = [0:z-1]) {
                rotate(i * 360 / z) {
                    beta1 = gammab;
                    beta2 = 360 / z - beta1;
                    x1 = rb * cos(beta1);
                    y1 = rb * sin(beta1);
                    x2 = rb * cos(beta2);
                    y2 = rb * sin(beta2);
                    xc = (x1 + x2) / 2;
                    yc = (y1 + y2) / 2;
                    r = sqrt((xc - x1)^2 + (yc - y1)^2);

                    translate([xc, yc, 0]) cylinder(h = height + 2, r = r, center = true);
                }
            }
        }
    }

*    translate([0, 0, -10]) {
*    color("skyblue") cylinder(h = 8, d = dd, center = true);
*    color("palegreen") cylinder(h = 7, d = db, center = true);
*    color("khaki") cylinder(h = 6, d = d0, center = true);
*    color("sandybrown") cylinder(h = 5, d = da, center = true);
    }

}
