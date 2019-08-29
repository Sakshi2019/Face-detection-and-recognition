    cd 'C:\Users\my-pc\Desktop\BTP\DATASET\new\'
    imagefiles = dir('C:\Users\my-pc\Desktop\BTP\DATASET\new\*.jpg');         
    nfiles = length(imagefiles); 
 for ii=1:nfiles
         cd 'C:\Users\my-pc\Desktop\BTP\DATASET\new\'
     
        currentfilename = imagefiles(ii).name;
        currentimage = imread(currentfilename);
      
        A=currentimage;
        cd 'C:\Users\my-pc\Desktop\';
        detection_face(A,currentfilename)
end
        