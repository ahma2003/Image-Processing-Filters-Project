function [img] = brightness(image, op, threshold)
    [h, w, d] = size(image);

    img = double(image);

    for i = 1:h
        for j = 1:w
            if d == 1 % Grayscale
                if op == 1
                    img(i, j) = img(i, j) + threshold;
                elseif op == 2
                    img(i, j) = img(i, j) * threshold;
                elseif op == 3
                    img(i, j) = img(i, j) - threshold;
                elseif op == 4
                    img(i, j) = img(i, j) / threshold;
                end
            elseif d == 3 % RGB
                for k = 1:3
                    if op == 1
                        img(i, j, k) = img(i, j, k) + threshold;
                    elseif op == 2
                        img(i, j, k) = img(i, j, k) * threshold;
                    elseif op == 3
                        img(i, j, k) = img(i, j, k) - threshold;
                    elseif op == 4
                        img(i, j, k) = img(i, j, k) / threshold;
                    end
                end
            end
        end
    end

    img = uint8(img);
end