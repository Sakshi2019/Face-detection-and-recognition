%Function faceRecognition

%Input  -> Images,nc(number of best eigenvectors to select)
%Output -> Eigenfaces,Image Matrix,Average Face Vector

%----------Function Process----------

%1)Calculates mean face of all images 
%2)Subtract mean face from all images
%3)Stack all image vectors as columns of matrix to form image matrix
%4)Calculate best k eigenvectors

function [u,A,mean_face] = faceRecognition(images,nc)%images returned by reaFiles function
        
        [a,b] = size(images);%a=500*500,b=1
        [m,n] = size(cell2mat(images(1)));
    
        sum_images = double(zeros(m,n));
 
        for i = a:b
            sum_images = sum_images + cell2mat(images(i));
        end

        mean_face = sum_images/m;
        A = [];
        u = [];
        for i = a:b
           image_mean = cell2mat(images(i)) - mean_face;
           A = [A image_mean];
        end
        U = transpose(A)*A;
        [v,D] = eigs(U,nc);
        u = A*v;
        
end    
