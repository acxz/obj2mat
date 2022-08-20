function obj2mat(obj_filename)
    display(obj_filename)
    display("Parsing...")

    obj_text = fileread(obj_filename);

    % Extract vertices
    vertex_expr = '[^\n]*v [^\n]*';
    vertex_matches = regexp(obj_text, vertex_expr, 'match');

    % Extract vertex normals
    vertex_normals_expr = '[^\n]*vn [^\n]*';
    vertex_normals_matches = regexp(obj_text, vertex_normals_expr, 'match');

    % Parse
    len_vertex_matches = length(vertex_matches);
    vertex_arr = zeros(len_vertex_matches, 3);
    vertex_normals_arr = zeros(len_vertex_matches, 3);
    for idx = 1:len_vertex_matches
        vertex_arr(idx, :) = str2double(strsplit(vertex_matches{idx})(2:4));
        vertex_normals_arr(idx, :) = str2double(strsplit(vertex_normals_matches{idx})(2:4));
    end

    % Create obj struct
    obj.v = vertex_arr;
    obj.vn = vertex_normals_arr;

    % Save data
    [~, obj_name, ~] = fileparts(obj_filename);
    mat_filename = strcat(obj_name, ".mat");
    save(mat_filename, 'obj', '-mat')
    display("Saved")
    display(mat_filename)
end
