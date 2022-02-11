load('BUS_lab_developed_system_data');
fs = 32e6; c = 1540; dx = 0.3e-3;
no_lines = size(RF_DAS_filtered,2);
env=abs(RF_DAS_filtered);
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
lateral_profile1 = env_gray0(477,:);  % 11.4537
lateral_profile2 = env_gray0(786,:);  % 18.8891
lateral_profile3 = env_gray0(1373,:); % 33.0137

xq = x(1)*1000: 0.01 :x(end)*1000;
lateral_profile1_interp = interp1(x*1000, lateral_profile1,xq);
lateral_profile2_interp = interp1(x*1000, lateral_profile2,xq);
lateral_profile3_interp = interp1(x*1000, lateral_profile3,xq);

figure(2);
subplot(3,1,1); hold on; plot(xq,lateral_profile1_interp, LineWidth=1); xlabel('Lateral distance [mm]');ylabel('Intensity');
title('Lateral profile at a depth of 11.4537 mm '); xlim([-8 8]); ylim([-50 0]);
X1 = lateral_profile1_interp; [max1, ind1] = max(X1); 
xline(xq(ind1), 'k', LineWidth= 1);
dist_from50 = 50-abs(max1);
yline((-50 + 0.5*(dist_from50)),'r', LineWidth= 1)

subplot(3,1,2); grid on; plot(xq,lateral_profile2_interp, LineWidth=1); xlabel('Lateral distance [mm]');ylabel('Intensity');
title('Lateral profile at a depth of 18.8891 mm ');  xlim([-8 8]); ylim([-50 0]);
X2 = lateral_profile2_interp; [max1, ind1] = max(X2); 
xline(xq(ind1), 'k', LineWidth= 1);
dist_from50 = 50-abs(max1);
yline((-50 + 0.5*(dist_from50)),'r', LineWidth= 1)

subplot(3,1,3); grid on; plot(xq,lateral_profile3_interp, LineWidth=1); xlabel('Lateral distance [mm]');ylabel('Intensity');
title('Lateral profile at a depth of 33.0137 mm ');  xlim([-8 8]); ylim([-50 0]);
X3 = lateral_profile3_interp; [max1, ind1] = max(X3); 
xline(xq(ind1), 'k', LineWidth= 1);
dist_from50 = 50-abs(max1);
yline((-50 + 0.5*(dist_from50)),'r', LineWidth= 1)


%% Axial Resolution

axial_profile1=env_gray0(427:2030,45); % 4.95
axial_profile2=env_gray0(427:2030,25); % -1.050
axial_profile3=env_gray0(427:2030,20); % -2.550

xq = depth(427)*1000: 0.005 :depth(2030)*1000;
axial_profile1_interp = interp1(depth(427:2030)*1000, axial_profile1,xq);
axial_profile2_interp = interp1(depth(427:2030)*1000, axial_profile2,xq);
axial_profile3_interp = interp1(depth(427:2030)*1000, axial_profile3,xq);

figure(3);
subplot(3,1,1); hold on; plot(xq,axial_profile1_interp, LineWidth=1); 
xlabel('Axial distance [mm]');ylabel('Intensity'); 
title('Axial profile at a lateral distance of 4.950 mm '); ylim([-50 0]);
X1 = axial_profile1_interp; [max1, ind1] = max(X1); 
xline(xq(ind1), 'k', LineWidth= 1);
dist_from50 = 50-abs(max1);
yline((-50 + 0.5*(dist_from50)),'r', LineWidth= 1)

subplot(3,1,2); grid on; plot(xq,axial_profile2_interp, LineWidth=1); 
xlabel('Axial distance [mm]');ylabel('Intensity'); 
title('Axial profile at a lateral distance of -1.050 mm '); ylim([-50 0]);
X2 = axial_profile2_interp; [max1, ind1] = max(X2); 
xline(xq(ind1), 'k', LineWidth= 1);
dist_from50 = 50-abs(max1);
yline((-50 + 0.5*(dist_from50)),'r', LineWidth= 1)

subplot(3,1,3); grid on; plot(xq,axial_profile3_interp, LineWidth=1); 
xlabel('Axial distance [mm]');ylabel('Intensity'); 
title('Axial profile at a lateral distance of -2.550 mm '); ylim([-50 0]);
X3 = axial_profile3_interp; [max1, ind1] = max(X3); 
xline(xq(ind1), 'k', LineWidth= 1);
dist_from50 = 50-abs(max1);
yline((-50 + 0.5*(dist_from50)),'r', LineWidth= 1)


%%




