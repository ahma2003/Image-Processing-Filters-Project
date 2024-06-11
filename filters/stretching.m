function [new_ph] = stretching(ph, new_min, new_max)
    % Get the size of the input image
    [H, W, L] = size(ph);

    % Initialize the new image matrix
    new_ph = zeros(H, W, L);

    % Convert matrices to double-precision for accurate calculations
    new_ph = double(new_ph);
    ph = double(ph);

    % Calculate old_min and old_max based on the entire image (for all channels)
    old_min = min(ph(:));
    old_max = max(ph(:));

    % Loop over color channels (L)
    for k = 1:L
        % Loop over image height (H)
        for i = 1:H
            % Loop over image width (W)
            for j = 1:W
                % Perform contrast stretching for each pixel
                new_ph(i, j, k) = ((ph(i, j, k) - old_min) / (old_max - old_min)) * (new_max - new_min) + new_min;
            end
        end
    end

    % Convert the result to uint8 for display
    new_ph = uint8(new_ph);

    
    
end