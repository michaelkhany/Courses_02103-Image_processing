%Preprocessing
f=(imread('cameraman.tif'));
f2=imnoise(f,'Gaussian',0.04,0.003);
figure;imshow(f2);
%Calling Ideal High Pass Filtering (IHPF) function
g = ihpf(f2, 15)
%Showing the result
figure;imshow(g);

%Ideal High Pass Filtering (IHPF) function
% "f" is input image, "D0" is distance from any point to the center of the
%(origin) of the fourier transform.
function g=ihpf(f,D0)
    [M,N]=size(f);
    F=fft2(double(f)); %fouirer transfer
    u=0:(M-1); %u colum for transfer
    v=0:(N-1); %v row for transfer
    idx=find(u>M/2); % ideal of colum no.
    u(idx) =u(idx)-M; % finde a value of colum transfer
    idy =find(v>N/2); % ideal of row no.
    v(idy)=v(idy)-M; % finde a value of row transfer
    [V,U]=meshgrid(v,u); % convert (u,v) to location vector
    D=sqrt(U.^2+V.^2); %find ( u,v) for any point (u,v) to the center orgion of the forior transfer
    H=double(D<=D0); %convert the values betoween d and d0 to double matrix
    H=1-H; % finde value of h
    G=H.*F; % multiplay h with orgion f
    g=real(ifft2(double(G))); % invers fourior transfer
    subplot(1,2,1);imshow(f);title('input image'); % showen the orgion image
    subplot(1,2,2);imshow(g,[]);title('enhanced image'); % showen the Enhanceding image
end
