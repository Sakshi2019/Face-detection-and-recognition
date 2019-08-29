%Function flatten_image 

%Input  - Image Matrix of dimension [m,n]
%Output  - Reshaped Image Vector of dimension [m*n,1]

%Using reshape function in matlab to convert image matrix into vector

function [fimage] = flatten_image(filename)
A=imread(filename);
FaceDetector = vision.CascadeObjectDetector();
BBOX=step(FaceDetector,A);
B=insertObjectAnnotation(A,'rectangle',BBOX,'Face');
%imshow(B), title('Detected Faces');
n=size(BBOX,1);
str_n=num2str(n);
%str=strcat('Number of detected faces are',str_n);
%display(str);


%% Draw boxes around detected faces and display results             

%shapeInserter = vision.ShapeInserter('BorderColor','Custom','CustomBorderColor',[255 255 0]);

%I_faces = step(shapeInserter, I, int32(bbox));

%imshow(I_faces);


%%
for i=1:n;

Icrop = imcrop(A,BBOX(i,:));


%figure;imshow(Icrop);

    FaceDetector1 = vision.CascadeObjectDetector('EyePairBig');
    BBOX1 = step(FaceDetector1,Icrop);
    B1=insertObjectAnnotation(Icrop,'rectangle',BBOX1,'Eyes');
    figure,imshow(B1), title('detected eyes');
    n1=size(BBOX1,1);
    str_n1=num2str(n1);
    %str1=strcat('no of detected eyes are= ',str_n1);
    %disp(str1);

    
    FaceDetector2 = vision.CascadeObjectDetector('Mouth');
    BBOX2 = step(FaceDetector2,Icrop);
    B2=insertObjectAnnotation(Icrop,'rectangle',BBOX2,'Mouth');
    %figure,imshow(B2), title('detected mouth');
    n2=size(BBOX2,1);
    str_n2=num2str(n2);
    %str2=strcat('no of detected mouth are= ',str_n2);
    %disp(str2);
    
    if n1>0&&n2>0
        cd 'C:\Users\my-pc\Desktop';
        imwrite(Icrop,sprintf('test.jpg'));
        A=Icrop;
    else
        A=zeros(size(A),size(A));
    end
        
end
    fimage = imresize(double(rgb2gray(A)),[500,500]);
    [testm,testn] = size(fimage);
    fimage = reshape(fimage,[testm*testn,1]);
end
