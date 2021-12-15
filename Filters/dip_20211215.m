% Preparing the environment
clc;
clear;
close all;
disp('Min-Max Filtering using 3x3 Mask');

%Implementaion
img =double(imread('rice.png'));
%make the original image noisy
img =double(imnoise(uint8(img),'salt & pepper'));
% Mask sample
mask =zeros(3,3);

img_new =MeanFilter(img,mask);

figure(1); imshow(uint8(img));
figure(2); imshow(uint8(img_new))

function result =MeanFilter(img_org,mask)
%Copy the image to another variable to update //Convert to Grayscale
img_new =img_org;   %rgb2gray(img);

%Changing the size of matrix to process all pixels(+Corners)
changes =(size(mask, 1)-1)/2;
z =zeros(size(img_org,1)+(changes*2),size(img_org,2)+(changes*2));
z(1+changes:end-changes, 1+changes:end-changes) = img_org;
img_org =z;

%Applying Mean Filtering
%Loops for checking original image
for x = 1:size(img_org,1) - size(mask, 1)
    for y = 1:size(img_org,2) - size(mask, 2)
        mean_result =0;
        mask =double(img_org(x:x+2, y:y+2));
        mask_1d = reshape(mask.',1,[]);
        mask_1d(5) =[]; %removing the center value of the dynamic mask (3x3)
        min_val =min(mask_1d);
        max_val =max(mask_1d);
        %Replacing the target pixel
        if (img_org(x+1,y+1) > max_val)
            img_new(x+1,y+1) =max_val;
        elseif (img_org(x+1,y+1) < min_val)
            img_new(x+1,y+1) =min_val;
        end
    end
end

%Changing the size of matrix to original size
z =zeros(size(img_new,1),size(img_new,2));
z = img_new(1+changes:end-changes, 1+changes:end-changes);
img_new =z;

result =img_new;
end
