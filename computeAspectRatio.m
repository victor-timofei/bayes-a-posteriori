function aRatio = computeAspectRatio(image)
    [num_rows, num_cols] = size(image);

    % Fill your code
    w0=0;
    h0=0;
    for i = 1:num_rows
        for j = 1:num_cols
            if image(i,j) ~= 0
                w0 = j;
                h0 = i;
            end
        end
    end
    w0=num_cols;
    h0=num_rows;
    for i = num_rows:j
        for j = 1:num_cols
            if image(i,j) ~= 0
                w0 = j;
                h0 = i;
            end
        end
    end

end

