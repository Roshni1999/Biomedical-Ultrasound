%% Load Resolution Data
load('BE17B009_resolution_ST')
sa = RF_sum;  fs = 40e6;  c = 1540;
no_lines = size(sa,2);
dx = 0.3e-3/2;  
t1 = 25e-9;
min_sample = min(t1)*fs;
figure(1); grid on
env = abs(hilbert(sa));
env_dB = 20*log10(env);
env_dB = env_dB - max(max(env_dB));
dynamic_range= -50;
env_dB(env_dB<dynamic_range)=dynamic_range;
env_gray0 = env_dB;
x = ((1:no_lines)-no_lines/2)*dx;
depth = ((0:size(env,1)-1)+ min_sample)/fs*c/2;
 
figure(1);
imagesc(x*1000, depth*1000,env_gray0) 
colormap(gray)
xlabel('Lateral distance [mm]')
ylabel('Depth [mm]')
axis('image')

%% Lateral Resolution

lateral_profile1 = env_gray0(1457,:); % 28.04725
lateral_profile2 = env_gray0(1468,:); % 28.25900
lateral_profile3 = env_gray0(1475,:); % 28.39375
lateral_profile4 = env_gray0(1482,:); % 28.52850
lateral_profile5 = env_gray0(1484,:); % 28.56700

figure(2);
subplot(3,2,1); hold on; plot(x*1000,lateral_profile1, LineWidth=1); xlabel('Lateral distance [mm]');ylabel('Intensity');
title('Lateral profile at a depth of 28.04725 mm '); xlim([-8 8]); ylim([-50 0]);
ind1 = 91; ind2 = 118;
xline([x(ind1)*1000 x(ind2)*1000], 'k', LineWidth= 1);
dist_from50 = 50-abs(max(lateral_profile1(ind1), lateral_profile1(ind2)));
yline((-50 + 0.5*(dist_from50)),'r', LineWidth= 1)

subplot(3,2,2); grid on; plot(x*1000,lateral_profile2, LineWidth=1); xlabel('Lateral distance [mm]');ylabel('Intensity');
title('Lateral profile at a depth of 28.25900 mm ');  xlim([-8 8]); ylim([-50 0]);
ind1= 118; ind2 = 137;
xline([x(ind1)*1000 x(ind2)*1000], 'k', LineWidth= 1);
dist_from50 = 50-abs(max(lateral_profile2(ind1), lateral_profile2(ind2)));
yline((-50 + 0.5*(dist_from50)),'r', LineWidth= 1)

subplot(3,2,3); grid on; plot(x*1000,lateral_profile3, LineWidth=1); xlabel('Lateral distance [mm]');ylabel('Intensity');
title('Lateral profile at a depth of 28.39375 mm ');  xlim([-8 8]); ylim([-50 0]);
ind1 = 137; ind2 = 151;
xline([x(ind1)*1000 x(ind2)*1000], 'k', LineWidth= 1);
dist_from50 = 50-abs(max(lateral_profile3(ind1), lateral_profile3(ind2)));
yline((-50 + 0.5*(dist_from50)),'r', LineWidth= 1)

subplot(3,2,4); grid on; plot(x*1000,lateral_profile4, LineWidth=1); xlabel('Lateral distance [mm]');ylabel('Intensity');
title('Lateral profile at a depth of 28.52850 mm ');  xlim([-8 8]); ylim([-50 0]);
ind1 = 151; ind2 = 157;
xline([x(ind1)*1000 x(ind2)*1000], 'k', LineWidth= 1);
dist_from50 = 50-abs(max(lateral_profile4(ind1), lateral_profile4(ind2)));
yline((-50 + 0.5*(dist_from50)),'r', LineWidth= 1)

subplot(3,2,5); grid on; plot(x*1000,lateral_profile5, LineWidth=1); xlabel('Lateral distance [mm]');ylabel('Intensity');
title('Lateral profile at a depth of 28.56700 mm ');  xlim([-8 8]); ylim([-50 0]);
ind1 = 157; ind2 = 164;
xline([x(ind1)*1000 x(ind2)*1000], 'k', LineWidth= 1);
dist_from50 = 50-abs(max(lateral_profile5(ind1), lateral_profile5(ind2)));
yline((-50 + 0.5*(dist_from50)),'r', LineWidth= 1)


%% Axial Resolution

axial_profile1=env_gray0(:,138); % 1.5
axial_profile2=env_gray0(:,116); % -1.8
axial_profile3=env_gray0(:,90);  % -5.7

figure(3);
subplot(3,1,1); hold on; plot(depth*1000,axial_profile1, LineWidth=1); 
xlabel('Axial distance [mm]');ylabel('Intensity');
title('Axial profile at a lateral distance of 1.5 mm ');
xlim([26 29]); ylim([-50 0]);
ind1 = 1414; ind2 = 1466;
xline([depth(ind1)*1000 depth(ind2)*1000], 'k', LineWidth= 1);
dist_from50 = 50-abs(max(axial_profile1(ind1), axial_profile1(ind2)));
yline((-50 + 0.5*(dist_from50)),'r', LineWidth= 1)

subplot(3,1,2); hold on; plot(depth*1000,axial_profile2, LineWidth=1); 
xlabel('Axial distance [mm]');ylabel('Intensity');
title('Axial profile at a lateral distance of -1.8 mm ');
xlim([26 29]); ylim([-50 0]);
ind1 = 1430; ind2 = 1459;
xline([depth(ind1)*1000 depth(ind2)*1000], 'k', LineWidth= 1);
dist_from50 = 50-abs(max(axial_profile2(ind1), axial_profile2(ind2)));
yline((-50 + 0.5*(dist_from50)),'r', LineWidth= 1)

subplot(3,1,3); hold on; plot(depth*1000,axial_profile3, LineWidth=1); 
xlabel('Axial distance [mm]');ylabel('Intensity');
title('Axial profile at a lateral distance of -5.7 mm ');
xlim([26 29]); ylim([-50 0]);
ind1 = 1432; ind2 = 1447;
xline([depth(ind1)*1000 depth(ind2)*1000], 'k', LineWidth= 1);
dist_from50 = 50-abs(max(axial_profile3(ind1), axial_profile3(ind2)));
yline((-50 + 0.5*(dist_from50)),'r', LineWidth= 1)



%% Load Contrast Data

load('BE17B009_contrast_ST')
sa = RF_sum;  fs = 40e6;  c = 1540;
no_lines = size(sa,2);
dx = 0.3e-3/2;  
t1 = 25e-9;
min_sample = min(t1)*fs;
figure(4); grid on
env = abs(hilbert(sa));
env_dB = 20*log10(env);
env_dB = env_dB - max(max(env_dB));
dynamic_range= -50;
env_dB(env_dB<dynamic_range)=dynamic_range;
env_gray0 = env_dB;
x = ((1:no_lines)-no_lines/2)*dx;
depth = ((0:size(env,1)-1)+ min_sample)/fs*c/2;
 
figure(4);
imagesc(x*1000, depth*1000,env_gray0) 
colormap(gray)
xlabel('Lateral distance [mm]')
ylabel('Depth [mm]')
axis('image')

%% Contrast

% Cyst pixels
c1 = env_gray0(728: 936, 192:205); 

% Background pixels
b1 = env_gray0(572: 1092, 153:173);
b2 = env_gray0(1014:1092, 153:243);
b3 = env_gray0(572:1092, 224:243); 
b4 = env_gray0(572:650, 153:243);

cyst_intensity = c1(:);
background_intensity = [b1(:); b2(:); b3(:); b4(:)];

mean_cyst = mean(cyst_intensity);
mean_bg = mean(background_intensity);

std_cyst = std(cyst_intensity);
std_bg = std(background_intensity);

CR = 20*log10(mean_cyst/mean_bg);
CNR = abs(mean_cyst - mean_bg)/sqrt(std_cyst^2 + std_bg^2);
disp(CR); disp(CNR);

%% Shade area of cyst and background pixels

% Cyst pixels
env_gray0(728: 936, 192:205) = 0; 

% Background pixels
env_gray0(572: 1092, 153:173) = 0;
env_gray0(1014:1092, 153:243) = 0;
env_gray0(572:1092, 224:243) = 0;
env_gray0(572:650, 153:243) = 0;

figure(6);
imagesc(x*1000, depth*1000,env_gray0) 
colormap(gray)
xlabel('Lateral distance [mm]')
ylabel('Depth [mm]')
axis('image')

%%





