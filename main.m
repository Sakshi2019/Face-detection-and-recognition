

%Changing directory for reading images from IMAGE_DB\ folder
cd 'C:\Users\my-pc\Desktop\BTP\DATASET\new\'


%Read Files fn reads jpg images from folder.

images = readFiles();

%Changing directory to code folder to run all fns


error_plot = zeros(1,30);
 cd 'C:\Users\my-pc\Desktop\'
 
 test1=imread('test1.jpg');
 test_image = flatten_image(test1);
 
for no_of_eigenvectors = 29:30
    
	%Face Recognition fn applied on training set of images 
    [u,A,mean_face]=faceRecognition(images,no_of_eigenvectors);
	
	%Flattens the test image matrix into vector
	%Subtracting average face from test image
    test_minus_mean = test_image - mean_face;
	
	%Calculating weights of Training Images
	weights_images =  weights(A,u,1);
    %Calculating weights of Test Images
	weights_test_image = weights(test_minus_mean,u,0);
	
	%Finding no of images in training dataset
    iter = size(weights_images,2);
        
	%Array to store difference in weights between test image and training images to find best match
    err = [];
    
    imagefiles = dir('C:\Users\my-pc\Desktop\BTP\DATASET\new\*.jpg');         

    for i = 1:iter
        err(i) = norm(weights_test_image - weights_images(:,i));
    end
	
	%Storing min error which is our best match
    [error,image_no] = min(err);
    current = imagefiles(image_no).name;
    cd 'C:\Users\my-pc\Desktop\BTP\DATASET\match\';
    final=imread(current);
    display(current);
    cd cd 'C:\Users\my-pc\Desktop\BTP\DATASET\test\'
end
    
   
    %Displaying error values as we increase no of eigenvectors
	fprintf('No of eigen components %d --> Error %d --> Image Name: %s.\n', no_of_eigenvectors,error,current);
    %error_plot(no_of_eigenvectors) = error;


%%Displaying the result
    %B=cell2mat(images(:,image_no));
    test_image=reshape(test_image,[500,500]);
    test_image=uint8(test_image);
   
    subplot(1,3,1),imshow(test1),title('Test Image');
    subplot(1,3,2),imshow(test_image),title('Cropped Gray Test Image');
    subplot(1,3,3),imshow(final),title('Identified Image');



%%Plot of error analysis to check after how many eigenvectors the results are more or less the same
%See the plot and find no of eigenvectors for which error decrease very minimally and recognizes face accurately

%x = 1:1:30;
%figure;
%plot(x,error_plot)
%title('Error Analysis')
%xlabel('No of eigenvectors')
%ylabel('Error')

