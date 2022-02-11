% ============== Program to estimate axial resolution ===============
clear;
clc;
close all;

% Determine the axial resolution for fc = 3MHz, 5MHz, and 7.5MHz
fc = 7.5e6; % transmit frequency in Hz

c = 1540; % speed of sound in m/s
lambda = c/fc; % wavelength in m
fs = 10*fc; % sampling frequency in Hz
fract_BW = 0.6; % fractional bandwidth
Q = 1/fract_BW; % Q factor
sample_dist = c/fs/2; % sampling rate

lz = ceil(0.04/sample_dist) ;
z_size = 40/1000; % Depth in m
z = -z_size/2 : 0.04/lz : z_size/2;            

x_size = 40/1000; % Length of transducer in m
lr = 1/1000;    % beamwidth

n = 128; % Number of elements
x = linspace(-x_size/2,x_size/2,n);
m = length(z);

% ============================ PSF ========================

BW = fract_BW * fc;
FWHM = BW/2.35;
sigzf = FWHM;
sigzt = 1/(2*pi*sigzf);
sigz = sigzt*c; 
sigx = lr/2.35;                      

h = zeros(m,n);
amp = zeros(m,n);
target = zeros(m,n);

for zi = 1:m
    for xi = 1:n
        zl = z(zi);
        xl = x(xi);
        h(zi,xi) = exp(-0.5 * (zl.^2/sigz.^2 + xl.^2/sigx.^2)) * cos(2*pi*fc*zl);
    end
end
hf = fft2(h);

% ========================== TSF ==========================

amp = zeros(m,n);
 
% To vary the distance between 2 scatters.
amp(1000,n/2) = 10;
amp(1020,n/2) = 10;

% figure;
% imagesc(amp);

ampf = fft2(amp);

% ======================== RF lines =========================
rfd = zeros(m,n);
rf = zeros(m,n);

rfd = hf .* ampf;  % Convolution between PSF and TSF in time domain becomes multiplication in frequqency domain
rf = fftshift(ifft2(rfd));
rf = rf + awgn(rf,40);  % uncorrelated random noise of snr 40db

rfh = abs(hilbert(rf)); % Envelope detection
B_db = 20*log10(rfh);
B_db = B_db - max(max(B_db));
B_gray = 127*(B_db +40)/40;  % Log compression

figure(1);
image(B_gray)
colormap(gray);
title(' PSF with 2 point scatters separated axially','FontSize',12);
xlabel('Lateral distance [mm]','FontSize',12);
set(gca, 'XTick', [0:.25:1]*size(B_gray,2), 'XTickLabel', [linspace(-20,20,5)],'FontSize',12);
ylabel('Depth [mm]','FontSize',12);
set(gca, 'YTick', [0:0.25:1]*size(B_gray,1), 'YTickLabel', [linspace(0,40,5)],'FontSize',12);

figure(2); hold on;
plot(rfh(:,n/2), LineWidth=1); grid on
title('Axial profile', 'FontSize',12);
% xlabel('Depth [mm]');
% set(gca, 'XTick', [0:.25:1]*size(B_gray,1), 'XTickLabel', [linspace(0,40,5)]);
ylabel('Amplitude');
X = rfh(:, n/2);
[max1, ind1] = max(X);
X(ind1)      = -Inf;
[max2, ind2] = max(X);
X(ind2)      = -Inf;
xline([ind1 ind2], 'k', LineWidth= 1);
yline([0.7071*max(max1, max2)],'r', LineWidth= 1)
