function aRatio = computeAspectRatio(image)
    [ignore,num_rows, num_cols] = size(image);

    % Fill your code
    w0=0;
    h0=0;
    w1=num_cols;
    h1=num_rows;
    found = 0;
    for i = 1:num_rows
        for j = 1:num_cols
            if image(1,i,j) ~= 0
                h0 = i;
                found =1;
                break
            end
        end
        if found
            break
        end
    end
    found = 0;
    for i = num_rows:j
        for j = 1:num_cols
            if image(1,i,j) ~= 0
                h1 = i;
                found =1;
                break
            end
        end
        if found
            break
        end
    end
    found = 0;
    for j = 1:num_rows
        for i = 1:num_cols
            if image(1,i,j) ~= 0
                w0 = j;
                found =1;
                break
            end
        end
        if found
            break
        end
    end
    found = 0;
    for j = num_rows:j
        for i = 1:num_cols
            if image(1,i,j) ~= 0
                w1 = j;
                found =1;
                break
            end
        end
        if found
            break
        end
    end
    width = w1-w0;
    height = h1-h0;
    aRatio = width / height;
end

