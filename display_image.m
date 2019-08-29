%Function display_image

%Input -> Image vector
%Ouput -> Display image by converting image vector to image matrix 
 
function display_image(fimage)
    imshow(mat2gray(reshape(fimage,[500,500])));
end
