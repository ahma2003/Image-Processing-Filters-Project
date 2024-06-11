
function sharpenedImage = unsharpMask(image,k)
 [H,W,L]=size(image);
 sharpenedImage=double(zeros(H, W, L));
    % Apply Gaussian blur to the image
    blurredImage = average(image);

    % Calculate the unsharp mask
    mask = image - blurredImage;

    % Adjust the strength of the sharpening
    sharpenedMask = strength * mask;

    % Add the sharpened mask back to the original image
    sharpenedImage = image + sharpenedMask;

    % Clip values to be within [0, 255]
    sharpenedImage = max(0, min(255, sharpenedImage));

    % Convert to uint8 for display
    sharpenedImage = uint8(sharpenedImage);