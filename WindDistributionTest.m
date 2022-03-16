%Inputs
%Weibull Parameters
k = 2;      %Shape/k
C = 9.7;    %Scale/C
%Site Parameters
Turbines = 7;
CapacityFactor = 0.25; %Estimation
PowerCurve = [0 0 0 0 0 15 35 70 109 170 236 350 467 580 720 890 1086 1325 1564 1810 2057 2370 2684 2940 3133 3280 3393 3475 3542 3570 3593 3600 3600 3600 3600 3600 3600 3600 3600 3600 3600 3600 3600 3600 3600 3600 3600 3600 3600 3600 3600 0 0 0 0 0 0 0 0 0 0];
%Plot Weibull Distribution
x = linspace(0,30,61);
plot(x,wblpdf(x,9.7,2))
title('Weibull Distribution')
xlabel('Wind Speed (m/s)')'
ylabel('Density')
%Plot Turbine Power Curve
pcurve = zeros(2,61);
pcurve(1,:) = 0:60;
pcurve(2,:) = PowerCurve;
pcurve(1,:) = pcurve(1,:).*0.5;
figure
plot(pcurve(1,:),pcurve(2,:));
title('Turbine Power Curve')
%Plot Energy Generation Density
power = wblpdf(x,9.7,2).*pcurve(2,:);
figure
plot(x,power)
title('Power Density')
EnergyOut = sum(sum(power))*60*60*24*365    %Yearly Production per Turbine
TotalSiteGeneration = CapacityFactor*Turbines*EnergyOut    %Yearly Production per Site