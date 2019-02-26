use <prism.scad>

module ratchet_gear(
    thickness,
    inner_diameter,
    teeth_length,
    teeth_count,
) {
    inner_radius = inner_diameter / 2;
    angle = 360 / teeth_count;
    angles = [ for (i = [0:angle:360]) i ];

    for (i = [0:teeth_count - 1]) {
        rotate(i * (360 / teeth_count))
        prism(
            [
                [0, 0],
                [0, teeth_length + inner_radius],
                [inner_radius * sin(angle), inner_radius * cos(angle)],
            ],
            thickness
        );
    }
}

module ratchet_stick_pawl(
    thickness,
    length,
    inner_width,
    teeth_length,
    teeth_count,
) {
    teeth_base = length / teeth_count;

    cube([length, inner_width, thickness]);
    translate([0, inner_width])
    for (i = [0:teeth_count - 1]) {
        translate([i * teeth_base, 0])
        prism(
            [
                [0, 0],
                [teeth_base, 0],
                [teeth_base, teeth_length],
            ],
            thickness
        );
    }
}

