% Preparing the environment
clc;
clear;
close all;
disp('Mean Filtering using 3x3 Mask to check the nature of filter(is it high pass or low pass?)');
disp('>> Comment: The high frequency pass filters the details(edges) kept.');
disp('>> Comment: The low frequency pass filters the contents kept.');

%Implementaion
img_org =double(imread('cameraman.tif'));
% Mask sample
mask =-ones(3,3);
mask(5) =8;
figure(1); freqz2(mask);

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
         %mean_result =mean_result/9; %Devision for low frq. pass filtering not
         %%high frq. pass
         img_new(x+1,y+1) =mean_result;
    end
end
figure(3); imshow(uint8(img_new))


figure(2); imshow(uint8(img_org));

% function image = MeanFiltering(img ,mask)