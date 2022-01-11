% Preparing the environment
clc;
clear;
close all;
disp('Mean Filtering using 3x3 Mask');

%Implementaion
img =double(imread('rice.png'));
%make the original image noisy
img =double(imnoise(uint8(img),'salt & pepper'));
% Mask sample
mask =[2 2 2; 2 1 2; 2 2 2];
%mask =ones(5,5);

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
        %Loops for checking the mask
        for i = 1: size(mask, 1)
            for j = 1: size(mask, 2)
                mean_result =mean_result+(img_org(x+i,y+j)*mask(i,j)); %Summarization method
            end
        end
        mean_result =mean_result/(size(mask, 1)*size(mask, 2)); %Devision
        img_new(x+1,y+1) =mean_result;
    end
end

%Changing the size of matrix to original size
z =zeros(size(img_new,1),size(img_new,2));
z = img_new(1+changes:end-changes, 1+changes:end-changes);
img_new =z;

result =img_new;
end

% Function img_max addCorners(img_org, mask)
% for i =1:size(mask,1)
%     img_max =img_org;
% %     img_max =[img_org; img_org(size(img_org,1))];
% %     img_max =[img_org, img_org(size(img_org,2))];
%     img_max( end+1, : ) = img_org(size(img_org,1)); 
%     img_max( : ,end+1 ) = img_org(size(img_org,2));
% end
% end
