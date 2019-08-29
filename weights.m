%Function weights_image_vector

%Input -> Image Matrix , k best eigenvectors , Train variable
%Output if train = 1 -> Weights matrix where columns are weights of each training image.
%Output if train = 0 -> Weights vector of test image. 

function [weights_image_vector] = weights(A,u,train)
    weights_image_vector = [];
    if train == 1
        
        nfiles = size(A,2);
        for i = 1:nfiles    
            image_vector = A(:,i);                                          %Image Vector - Mean
            weights_image_vector(:,i) = u'*image_vector;                    %Weights of image vector
            image_vector_eigfaces = u*weights_image_vector(:,i);            %Image Vector reconstruction using linear combination of weights and eigenfaces       
            image_matrix = reshape(image_vector_eigfaces,[500,500]);        %Reshaping to original dimensions
            image = mat2gray(image_matrix);                                 %Converting image matrix to original grayscale image
        end
    else
            image_vector = A;                                               %Image vector of test image
            weights_image_vector = u'*image_vector;                         %Weights of image vector
            image_vector_eigfaces = u*weights_image_vector;                 %Image Vector reconstruction using linear combination of weights and eigenfaces
            image_matrix = reshape(image_vector_eigfaces,[500,500]);        %Reshaping to original dimensions
            image = mat2gray(image_matrix);                                 %Converting image matrix to original grayscale image
    end       
end


