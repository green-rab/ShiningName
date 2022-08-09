/*
 *  Green-Rab as Shining Name
 * 
 *  File:     name_green-rab.scad
 *
 *  Software: OpenSCAD
 *  Version:  2015.03
 *
 *  https://gitlab.com/green-rab
 *  Markus Schmidt, Germany, created: 07.08.2022
 */
 
 include <shiningName.scad>


// for DEBUG
_fn_u1 =  8;
_fn_u2 =  4;
_fn_d1 =  4;
_fn_d2 =  4;

_tmp_d1_deltaAngle =  60.0; //°
_tmp_d1_deltaSteps =   6.0; //mm


// for RENDERING
/*
_fn_u1 = 16;
_fn_u2 = 12;
_fn_d1 =  6;
_fn_d2 =  4;

_tmp_d1_deltaAngle =  10.0; //°
_tmp_d1_deltaSteps =   0.2; //mm
*/


// u1: text
_u1_text           = "Green-Rab";
_u1_font           = "Dotum:style=Thin";
_u1_size           =  36;
_u1_height         =  30.0; //mm

// u2: connectors
_u2_w              =   5.0; //mm
_u2_h              =  10.0; //mm

_u2_n_align        =   6;
_u2_n_up           =   0;

_u2_l              = [ 34.0,  14.0,  12.0, 26.0,  12.0,   8.0]; //mm
_u2_pos_x          = [-75.0, -39.0, -13.0, 24.0,  67.0,  95.0]; //mm
_u2_pos_y          = [-14.0, -14.0, -14.0, -4.0, -14.0, -16.0]; //mm


// d1: slot for LEDs
_d1_text           = _u1_text;
_d1_font           = _u1_font;
_d1_size           = _u1_size;
_d1_height         =  18.0; //mm
_d1_height2        =   5.0; //mm
_d1_deltaAngle     = _tmp_d1_deltaAngle;
_d1_deltaSteps     = _tmp_d1_deltaSteps;

// d2: notch for connectors
_d2_width          =   2.0; //mm


// call creation
shiningName();


/*
    end of name_green-rab.scad
*/
