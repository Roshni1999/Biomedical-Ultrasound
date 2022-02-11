%% Load resolution data

load('BE17B009_resolution.mat');
fs = 19.2308e6/4; c = 1540; dx = 0.3e-3;
no_lines = size(IQData{1,1},2);
env=abs(IQData{1,1});
env_dB = 20*log10(env);
env_dB = env_dB - max(max(env_dB));
dynamic_range= -50;
env_dB(env_dB<dynamic_range)=dynamic_range;
env_gray0 = env_dB;
x = ((1:no_lines)-no_lines/2)*dx;
depth = ((0:size(env_gray0,1)-1))/fs*c/2;
 
figure(1);
imagesc(x*1000, depth*1000,env_gray0) 
colormap(gray)
xlabel('Lateral distance [mm]')
ylabel('Depth [mm]')
axis('image')

%% Lateral Resolution

lateral_profile1 = env_gray0(193,:); % 30.7507
lateral_profile2 = env_gray0(193,:); % 30.7507
lateral_profile3 = env_gray0(197,:); % 31.3913
lateral_profile4 = env_gray0(197,:); % 31.3913
lateral_profile5 = env_gray0(197,:); % 31.3913

figure(2);
subplot(3,2,1); hold on; plot(x*1000,lateral_profile1, LineWidth=1); xlabel('Lateral distance [mm]');ylabel('Intensity');
title('Lateral profile at a depth of 30.7507 mm '); xlim([-9 5]); ylim([-50 0]);
ind1 = 38; ind2 = 52;
xline([x(ind1)*1000 x(ind2)*1000], 'k', LineWidth= 1);
dist_from50 = 50-abs(max(lateral_profile1(ind1), lateral_profile1(ind2)));
yline((-50 + 0.5*(dist_from50)),'r', LineWidth= 1)

subplot(3,2,2); grid on; plot(x*1000,lateral_profile2, LineWidth=1); xlabel('Lateral distance [mm]');ylabel('Intensity');
title('Lateral profile at a depth of 30.7507 mm ');  xlim([-9 5]); ylim([-50 0]);
ind1= 52; ind2 = 63;
xline([x(ind1)*1000 x(ind2)*1000], 'k', LineWidth= 1);
dist_from50 = 50-abs(max(lateral_profile2(ind1), lateral_profile2(ind2)));
yline((-50 + 0.5*(dist_from50)),'r', LineWidth= 1)

subplot(3,2,3); grid on; plot(x*1000,lateral_profile3, LineWidth=1); xlabel('Lateral distance [mm]');ylabel('Intensity');
title('Lateral profile at a depth of 31.3913 mm ');  xlim([-9 5]); ylim([-50 0]);
ind1 = 62; ind2 = 69;
xline([x(ind1)*1000 x(ind2)*1000], 'k', LineWidth= 1);
dist_from50 = 50-abs(max(lateral_profile3(ind1), lateral_profile3(ind2)));
yline((-50 + 0.5*(dist_from50)),'r', LineWidth= 1)

subplot(3,2,4); grid on; plot(x*1000,lateral_profile4, LineWidth=1); xlabel('Lateral distance [mm]');ylabel('Intensity');
title('Lateral profile at a depth of 31.3913 mm ');  xlim([-9 5]); ylim([-50 0]);
ind1 = 69; ind2 = 72;
xline([x(ind1)*1000 x(ind2)*1000], 'k', LineWidth= 1);
dist_from50 = 50-abs(max(lateral_profile4(ind1), lateral_profile4(ind2)));
yline((-50 + 0.5*(dist_from50)),'r', LineWidth= 1)

subplot(3,2,5); grid on; plot(x*1000,lateral_profile5, LineWidth=1); xlabel('Lateral distance [mm]');ylabel('Intensity');
title('Lateral profile at a depth of 31.3913 mm ');  xlim([-9 5]); ylim([-50 0]);
ind1 = 72; ind2 = 74;
xline([x(ind1)*1000 x(ind2)*1000], 'k', LineWidth= 1);
dist_from50 = 50-abs(max(lateral_profile5(ind1), lateral_profile5(ind2)));
yline((-50 + 0.5*(dist_from50)),'r', LineWidth= 1)


%% Axial Resolution

axial_profile1=env_gray0(:,61); % -0.9 mm
axial_profile2=env_gray0(:,54); % -3.0 mm
axial_profile3=env_gray0(:,38);  % -7.8 mm

figure(3);
subplot(3,1,1); hold on; plot(depth*1000,axial_profile1, LineWidth=1); 
xlabel('Axial distance [mm]');ylabel('Intensity');
title('Axial profile at a lateral distance of -0.9 mm ');
xlim([28 33]); ylim([-50 0]);
ind1 = 189; ind2 = 196;
xline([depth(ind1)*1000 depth(ind2)*1000], 'k', LineWidth= 1);
dist_from50 = 50-abs(max(axial_profile1(ind1), axial_profile1(ind2)));
yline((-50 + 0.5*(dist_from50)),'r', LineWidth= 1)

subplot(3,1,2); hold on; plot(depth*1000,axial_profile2, LineWidth=1); 
xlabel('Axial distance [mm]');ylabel('Intensity');
title('Axial profile at a lateral distance of -3.0 mm ');
xlim([28 33]); ylim([-50 0]);
ind1 = 195; ind2 = 197;
xline([depth(ind1)*1000 depth(ind2)*1000], 'k', LineWidth= 1);
dist_from50 = 50-abs(max(axial_profile2(ind1), axial_profile2(ind2)));
yline((-50 + 0.5*(dist_from50)),'r', LineWidth= 1)

subplot(3,1,3); hold on; plot(depth*1000,axial_profile3, LineWidth=1); 
xlabel('Axial distance [mm]');ylabel('Intensity');
title('Axial profile at a lateral distance of -7.8 mm ');
xlim([28 33]); ylim([-50 0]);
ind1 = 193; ind2 = 195;
xline([depth(ind1)*1000 depth(ind2)*1000], 'k', LineWidth= 1);
dist_from50 = 50-abs(max(axial_profile3(ind1), axial_profile3(ind2)));
yline((-50 + 0.5*(dist_from50)),'r', LineWidth= 1)


%% Load contrast data

load('BE17B009_contrast.mat');
fs = 19.2308e6/4; c = 1540; dx = 0.3e-3;
no_lines = size(IQData{1,1},2);
env=abs(IQData{1,1});
env_dB = 20*log10(env);
env_dB = env_dB - max(max(env_dB));
dynamic_range=-50;
env_dB(env_dB<dynamic_range)=dynamic_range;
env_gray = env_dB;
x = ((1:no_lines)-no_lines/2)*dx;
depth = ((0:size(env_gray,1)-1))/fs*c/2;
 
figure(4);
imagesc(x*1000, depth*1000,env_gray) 
colormap(gray)
xlabel('Lateral distance [mm]')
ylabel('Depth [mm]')
axis('image')

%% Contrast - Top cyst

% Cyst pixels
c1 = env_gray(98: 108, 36:42); 

% Background pixels
b1 = env_gray(77: 126, 25:29);
b2 = env_gray(77:126, 47:51);
b3 = env_gray(77: 88, 25:51); 
b4 = env_gray(119:126, 25:51);

cyst_intensity1 = c1(:);
background_intensity2 = [b1(:); b2(:); b3(:); b4(:)];

mean_cyst1 = mean(cyst_intensity1);
mean_bg1 = mean(background_intensity2);

std_cyst1 = std(cyst_intensity1);
std_bg1 = std(background_intensity2);

CR1 = 20*log10(mean_cyst1/mean_bg1);
CNR1 = abs(mean_cyst1 - mean_bg1)/sqrt(std_cyst1^2 + std_bg1^2);
disp(CR1); disp(CNR1);

%% Shade area of top cyst and background pixels 

% Cyst pixels
env_gray(98: 108, 36:42) = 0; 

% Background pixels
env_gray(77: 126, 25:29) = 0;
env_gray(77:126, 47:51) = 0;
env_gray(77: 88, 25:51) = 0;
env_gray(119:126, 25:51) = 0;

figure(5);
imagesc(x*1000, depth*1000,env_gray) 
colormap(gray)
xlabel('Lateral distance [mm]')
ylabel('Depth [mm]')
axis('image')


%% Contrast - Bottom cyst

load('BE17B009_contrast.mat');
fs = 19.2308e6/4; c = 1540; dx = 0.3e-3;
no_lines = size(IQData{1,1},2);
env=abs(IQData{1,1});
env_dB = 20*log10(env);
env_dB = env_dB - max(max(env_dB));
dynamic_range=-50;
env_dB(env_dB<dynamic_range)=dynamic_range;
env_gray = env_dB;
x = ((1:no_lines)-no_lines/2)*dx;
depth = ((0:size(env_gray,1)-1))/fs*c/2;
 
figure(6);
imagesc(x*1000, depth*1000,env_gray) 
colormap(gray)
xlabel('Lateral distance [mm]')
ylabel('Depth [mm]')
axis('image')

% Cyst pixels
c1 = env_gray(282: 295, 40:46); 

% Background pixels
b1 = env_gray(263: 307, 30:34);
b2 = env_gray(263: 307, 52:56);
b3 = env_gray(263: 270, 30:56); 
b4 = env_gray(301:307, 30:56);

cyst_intensity2 = c1(:);
background_intensity2 = [b1(:); b2(:); b3(:); b4(:)];

mean_cyst2 = mean(cyst_intensity2);
mean_bg2 = mean(background_intensity2);

std_cyst2 = std(cyst_intensity2);
std_bg2 = std(background_intensity2);

CR2 = 20*log10(mean_cyst2/mean_bg2);
CNR2 = abs(mean_cyst2 - mean_bg2)/sqrt(std_cyst2^2 + std_bg2^2);
disp(CR2); disp(CNR2);

%% Shade area of bottom cyst and background pixels 

% Cyst pixels
env_gray(282: 295, 40:46) = 0; 

% Background pixels
env_gray(263: 307, 30:34) = 0;
env_gray(263: 307, 52:56) = 0;
env_gray(263: 270, 30:56) = 0;
env_gray(301:307, 30:56) = 0;

figure(7);
imagesc(x*1000, depth*1000,env_gray) 
colormap(gray)
xlabel('Lateral distance [mm]')
ylabel('Depth [mm]')
axis('image')
