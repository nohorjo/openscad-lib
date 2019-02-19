module prism(points, height) {
    top_points = [ for (p = points) [p[0], p[1], height] ];
    
    points = concat(points, top_points);
    vertices = len(points);
    sides_count = vertices / 2;
    faces = concat(
        [[ for (i = [0:sides_count - 1]) i ]],
        [ for (i = [0:sides_count - 1]) 
            [
                (i + sides_count) % vertices,
                i == sides_count - 1 ? i + 1 : (i + sides_count + 1) % vertices,
                i != sides_count - 1 ? i + 1 : (i + sides_count + 1) % vertices,
                i,
            ]
        ],
        [[ for (i = [vertices - 1:-1:sides_count]) i ]]
    );

    polyhedron(points, faces);
}

module regular_prism(
    sides_count,
    radius = 0,
    sides_length,
    height,
) {
    radius = radius != 0 ? radius : (sides_length / (2 * sin(180 / sides_count)));
    angles = [ for (i = [0:sides_count - 1]) i * (360 / sides_count) ];
    
    base_points = [ for (i = angles) [radius * cos(i), radius * sin(i), 0] ];

    prism(points = base_points, height = height);
}

