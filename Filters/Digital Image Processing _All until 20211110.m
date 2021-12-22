%Initialization
clear all
close all
clc
%Read image file into the matrix variable
I =imread('rice.png');
%How to get the size of matrix
sI =size(I);
%To show the image
figure(1);
imshow(I)

a =100;
b =150;
% %Alg. #1: Loops for Reading and Writing Matrix Values
% %Loop for counting the rows(1st dimension) of matrix
% for x=1:size(I,1)
%     %Loop for counting the columns(2nd dimesion) of matrix
%     for y=1:size(I,2)
%         %If the value is bigger than "a", replace it with "b".
%         if (I(x,y)>a)
%             I(x,y)=b;
%         end
%     end
% end
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

% %Alg. #2: Histogram
% %A variable for saving the number of repeats
% R =zeros(256); %0 to 255
% %Loop for checking the number of repeats
% for i=1:256
%     %Loop for counting the rows(1st dimension) of matrix
%     for x=1:size(I,1)
%         %Loop for counting the columns(2nd dimesion) of matrix
%         for y=1:size(I,2)
%             %If the value was equal to i, increase # of repeats by 1
%             if (I(x,y) == i)
%                R(i) =R(i)+1;
%             end
%         end
%     end
% end
% %
% figure(2); plot(R)
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

% % Alg. #3: Mean, Variance, Entropy
% %Conversion for mathematical calculations
% %J =double(I);
% 
% %Let's start the Histogram Process
% %Look for the image histogram(No. of pixels)
% Hi =imhist(I);
% %Histogram Comulative
% Hci =cumsum(Hi);
% %Multiplication of i and Hi
% iHi =zeros(size(Hi)); %Making an empty array for saving values
% for i=1:size(Hi)
%     iHi =i*Hi;
% end
% %Calculation of probability of presence of each value (H(i)/Sum(H(i))
% Pi =zeros(size(Hi));
% sum_of_Hi =Hci(size(Hci,1));
% for i=1:size(Hi)
%     Pi(i) =Hi(i)/sum_of_Hi; %"Hci(size(Hci))" is Sum of Hi values
% end
% 
% %LET's CALCULATE MEAN:
% % sum(i*h(i)) / sum (h(i))
% sum_iHi =0;
% for i=1:size(iHi) %Finding sum of iH(i)s
%     sum_iHi =sum_iHi+iHi(i);
% end
% Mean =sum_iHi/sum_of_Hi
% 
% %LET's CALCULATE VARIANCE:
% % sum((i-Mean)^2*h(i)) / sum(h(i))
% sum_iMean2nHi =0;
% for i=1:size(Hi)
%     sum_iMean2nHi = sum_iMean2nHi+ ((i-Mean)^2)*Hi(i);
% end
% Variance =sum_iMean2nHi / sum_of_Hi
% 
% %LET's CALCULATE ENTROPY:
% % sum (p(i) *log2(P(i))
% Entropy =0;
% for i=1:size(Pi)      
%         Entropy = Entropy +(Pi(i)*log2(Pi(i))); 
% end
% Entropy %The result will be NaN because the log2 can't get zero values.
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

% % Alg. #4: Image Enhancement -Intensity Transformation Function
% 
% J =double(I);
% a =100;
% b =150;
% %Loop for counting the rows(1st dimension) of matrix
% for x=1:size(I,1)
%     %Loop for counting the columns(2nd dimesion) of matrix
%     for y=1:size(I,2)
%         f =I(x,y);
%         if (a <= f) && (f <= b)          
%             J(x,y) =255*((f-a) / (b-a));
%         elseif(f < a)
%             J(x,y) =0;
%         else
%             J(x,y) =255;
%         end
%     end
% end
% figure(2); imshow(J);
% %+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

% Alg. #5: Image Enhancement -Variants for enhancing contrasts

J =double(I);
a =150;
b =50;
%Loop for counting the rows(1st dimension) of matrix
for x=1:size(I,1)
    %Loop for counting the columns(2nd dimesion) of matrix
    for y=1:size(I,2)
        f =I(x,y);
        if (0 <= f) && (f <= a)          
            J(x,y) =(b / a)*f;
        elseif(a <= f)&& ( a<= 255) 
            J(x,y) = ((255-b)*f+255*(b-a))/(255-a);
        end
    end
end
figure(2); imshow(J);
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

% figure(2);imhist(I)
% I=double(I);
% a=230;
% b=100;
% figure(1);imhist(uint8(I))
% figure(2);imshow(uint8(I))
% for i=1:size(I,1)
%     for j=1:size(I,2)
%         value=I(i,j);
%         if I(i,j)<=a
%             I(i,j)=(b/a)*I(i,j);
%         elseif I(i,j)>a
%             I(i,j)=((255-b)*I(i,j)+255*(b-a))/(155-a);
%         end
%     end
% end
% figure(3);imshow(uint8(I))
% figure(4);imhist(uint8(I))
%
%
%
%
%
%
