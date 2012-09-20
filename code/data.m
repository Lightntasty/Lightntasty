global solarConstant;
solarConstant = 1361;
global astronomicalUnit;
astronomicalUnit = 149597871;
global jupiter;
jupiter.a = 778570000;
jupiter.e = 0.0489;
jupiter.mu = 126686534;
global juno;
juno.r = 1560.8;
juno.mu = 3201;
global averagePower;
averagePower = 480;
global junoSolarPanel;
junoSolarPanel.eta = .6;
% per year
junoSolarPanel.degradation = log(1 - .3);