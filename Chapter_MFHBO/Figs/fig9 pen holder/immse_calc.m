target = rgb2gray(imread("IMG_5800.JPG"));
captured = rgb2gray(imread("IMG_5825.JPG"));

%% Align the captured image with the target image
% [mp,fp] = cpselect(captured,target,Wait=true);

%% Apply the alignment result
t = fitgeotform2d(mp,fp,"projective");
Rfixed = imref2d(size(target));
captured_aligned = imwarp(captured,t,OutputView=Rfixed);
imshowpair(captured_aligned, target)

%% Compute NMSE and SSIM
immse(captured_aligned, target) / sum(target(:).^2)
ssim(captured_aligned, target)


