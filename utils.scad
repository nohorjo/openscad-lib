module cross_section(x = 0) {
    difference() {
        children();
        translate([x, -500, -500])
        cube(1000);
    }
}

module radial_cross_section(d = 1000) {
    difference() {
        children();
        difference() {
            cylinder(1000, d = 1000);
            cylinder(1000, d = d);
        }
    }
}
