clear all
close all
clc
%read the image
I=imread('eight.tif');
figure(1);
subplot(1,3,1);
imshow(I);
title('original image');
%nosiy image'
J=imnoise(I,'salt & pepper',0.1);
subplot(1,3,2)
imshow(J)
title('nosiy image');
m=size(J,1);
n=size(J,2);
%filtre nagao
N=5;
I0=zeros(m+(N-1),n+(N-1));
I0(((N+1)/2):m+((N-1)/2),((N+1)/2):n+((N-1)/2))=J;
m1=size(I0,1);
n1=size(I0,2);
%filtre nagao
for i=1:1:m1-(N-1)
    for k=1:1:n1-(N-1)
        if I0(i+((N-1)/2),k+((N-1)/2)) ==0 || I0(i+((N-1)/2),k+((N-1)/2))==255
       M=I0(i:i+N-1,k:k+N-1);
          D1=[M(1,1:2) M(2,1:3) M(3,2:3)];
          D2=[M(1,2:4) M(2,2:4) M(3,3)];
          D3=[M(1,4:5) M(2,3:5) M(3,3:4)];
          D4=[M(2,1:2) M(3,1:3) M(3,1:2)];
          D5=[M(2,2:4) M(3,2:4) M(4,2:4)];
          D6=[M(2,4:5) M(3,3:5) M(4,4:5)];
          D7=[M(3,2:3) M(4,1:3) M(5,1:2)];
          D8=[M(3,3) M(4,2:4) M(5,2:4)];
          D9=[M(3,3:4) M(4,3:5) M(5,4:5)];
 V=[Var(D1) Var(D2) Var(D3) Var(D4) Var(D5) Var(D6) Var(D7) Var(D8) Var(D9)];
   Moy=[mean(D1) mean(D2) mean(D3) mean(D4) mean(D5) mean(D6) mean(D7) mean(D8) mean(D9)];
               a=min(V);
               for j=1:1:9
                   if V(j)==a
                       I0(i+((N-1)/2),k+((N-1)/2)) = Moy(j);
               
                   end
               end
              
       end
    end
    
end
          
    
% reconstructed image
J=I0(((N+1)/2):m1-((N-1)/2),((N+1)/2):n1-((N-1)/2));
 
   figure(1)
  subplot(1,3,3)
  imshow(uint8(J))
  title(' filtered image')
