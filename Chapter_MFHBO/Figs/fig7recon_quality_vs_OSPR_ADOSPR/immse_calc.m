% target = rgb2gray(imread("mandrill.tiff"));
% captured = rgb2gray(imread("MFHO_m.JPG"));
% captured = rgb2gray(imread("AD-OSPR_m.JPG"));
% captured = rgb2gray(imread("OSPR_m.JPG"));

target = imread("holography_ambigram_smaller.png");
captured = rgb2gray(imread("MFHO_h.JPG"));
% captured = rgb2gray(imread("ADOSPR_h.JPG"));
% captured = rgb2gray(imread("OSPR_h.JPG"));

%% Align the captured image with the target image
% [mp,fp] = cpselect(captured,target,Wait=true);

%% Apply the alignment result
t = fitgeotform2d(mp,fp,"projective");
Rfixed = imref2d(size(target));
captured_aligned = imwarp(captured,t,OutputView=Rfixed);
imshowpair(target,captured_aligned)

%% Compute NMSE and SSIM
immse(captured_aligned, target) / sum(target(:).^2)
ssim(captured_aligned, target)


