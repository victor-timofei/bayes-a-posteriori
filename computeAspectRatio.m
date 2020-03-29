function aRatio = computeAspectRatio(image)
    [ignore,num_rows, num_cols] = size(image);

    % Fill your code
    w0=0;
    h0=0;
    w1=num_cols;
    h1=num_rows;
    for i = 1:num_rows
        for j = 1:num_cols
            if image(1,i,j) ~= 0
                h0 = i;
            end
        end
    end
    for i = num_rows:j
        for j = 1:num_cols
            if image(1,i,j) ~= 0
                h1 = i;
            end
        end
    end
    for j = 1:num_rows
        for i = 1:num_cols
            if image(1,i,j) ~= 0
                w0 = j;
            end
        end
    end
    for j = num_rows:j
        for i = 1:num_cols
            if image(1,i,j) ~= 0
                w1 = j;
            end
        end
    end
    width = w1-w0;
    height = h1-h0;
    aRatio = width / height;
end

