% Preparing the environment
clc;
clear;
close all;
disp('Mean Filtering using 3x3 Mask');

%Implementaion
img_org =double(imread('rice.png'));
%make the original image noisy
img_org =double(imnoise(uint8(img_org),'salt & pepper'));
% Mask sample
mask =ones(3,3);

%STARTS
%Copy the image to another variable to update //Convert to Grayscale
img_new =img_org;   %rgb2gray(img);

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
         mean_result =mean_result/9; %Devision
         img_new(x+1,y+1) =mean_result;
    end
end
figure(2); imshow(uint8(img_new))


figure(1); imshow(uint8(img_org));

% function image = MeanFiltering(img ,mask)
