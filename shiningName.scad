/*
 *  Shining Name
 * 
 *  File:     shiningName.scad
 *
 *  Software: OpenSCAD
 *  Version:  2015.03
 *
 *  https://gitlab.com/green-rab
 *  Markus Schmidt, Germany, created: 21.07.2022
 */


module shiningName() {
    difference() {
        union() {
            // u1:
            linear_extrude(height=_u1_height, center=false, convexity=10, twist=0, slices=10, scale=[1.0, 1.0]) {
                minkowski() {
                    text(text=_u1_text, font=_u1_font, size=_u1_size, valign="center", halign="center", $fn=_fn_u1);
                    circle(r=1.5, $fn=_fn_u1);
                }
            }

            // u2:
            #for(i=[0 : 1 : _u2_n_align+_u2_n_up-1]) {
                if(i < _u2_n_align) {
                    translate(v=[_u2_pos_x[i], _u2_pos_y[i], _u2_h/2]) {
                        cube(size=[_u2_l[i], _u2_w, _u2_h], center=true);
                        translate(v=[0, 0, _u2_h/2]) {
                            rotate(a=90, v=[0, 1, 0]) cylinder(h=_u2_l[i], r=_u2_w/2, $fn=_fn_u2, center=true);
                        }
                    }
                } else {
                    translate(v=[_u2_pos_x[i], _u2_pos_y[i], _u2_h/2])
                    rotate(a=90, v=[0, 0, 1]) {
                        cube(size=[_u2_l[i], _u2_w, _u2_h], center=true);
                        translate(v=[0, 0, _u2_h/2]) {
                            rotate(a=90, v=[0, 1, 0]) cylinder(h=_u2_l[i], r=_u2_w/2, $fn=_fn_u2, center=true);
                        }
                    }
                }
            }
        }

        // d1:
        difference() {
            translate(v=[0, 0, -0.1]) {
                linear_extrude(height=_d1_height+_d1_height2+0.1, center=false, convexity=10, twist=0, slices=10, scale=[1.0, 1.0]) {
                    text(text=_d1_text, font=_d1_font, size=_d1_size, spacing=1.0, valign="center", halign="center", $fn=_fn_d1);
                }
            }

            for(step=[0 : _d1_deltaSteps : _d1_height2-_d1_deltaSteps]) {
                translate(v=[0, 0, _d1_height + step]) union() {
                    for(i=[0 : _d1_deltaAngle : 360]) {
                        difference() {
                            linear_extrude(height=_d1_height2, center=false, convexity=10, twist=0, slices=10, scale=[1.0, 1.0]) {
                                text(text=_d1_text, font=_d1_font, size=_d1_size, spacing=1.0, valign="center", halign="center", $fn=_fn_d1);
                            }

                            deltaX = (step+_d1_deltaSteps)/2.0;
                            deltaY = deltaX;
                            translate(v=[sin(i)*deltaX, cos(i)*deltaY, -0.1]) {
                                linear_extrude(height=_d1_height2+0.2, center=false, convexity=10, twist=0, slices=10, scale=[1.0, 1.0]) {
                                    text(text=_d1_text, font=_d1_font, size=_d1_size, spacing=1.0, valign="center", halign="center", $fn=_fn_d1);
                                }
                            }
                        }
                    }
                }
            }
        }

        // d2:
        for(i=[0 : 1 : _u2_n_align+_u2_n_up-1]) {
            if(i < _u2_n_align) {
                translate(v=[_u2_pos_x[i], _u2_pos_y[i], 0]) {
                    rotate(a=45, v=[1, 0, 0]) {
                        tmp_d2_w = (1.0 / sqrt(2.0)) * _d2_width;
                        cube(size=[_u2_l[i] + 0.2, tmp_d2_w, tmp_d2_w], center=true);
                    }
                }
            } else {
                translate(v=[_u2_pos_x[i], _u2_pos_y[i], 0]) {
                    rotate(a=90, v=[0, 0, 1]) {
                        rotate(a=45, v=[1, 0, 0]) {
                            tmp_d2_w = (1.0 / sqrt(2.0)) * _d2_width;
                            cube(size=[_u2_l[i] + 0.2, tmp_d2_w, tmp_d2_w], center=true);
                        }
                    }
                }
            }
        }
    }
}


/*
    end of shiningName.scad
*/
