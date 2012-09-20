data;
I = minimumSolarIntensity(jupiter);
fprintf(1, 'Minimum solar intensity at Jupiter: %g W/m^2\n', I);
fprintf(1, 'Orbital altitude at Europa: %g km\n', europaOrbit.h);
[day, eclipse] = dayEclipseDuration(europa, europaOrbit.h);
total = day + eclipse;
fprintf(1, 'Europa orbital period: %g min\n', total / 60);
fprintf(1, 'Europa eclipse duration: %g min\n', eclipse / 60);
fprintf(1, 'Europa day duration: %g min\n', day / 60);
fprintf(1, 'Average power: %g W\n', averagePower);
fprintf(1, 'Solar day power: %g W\n', ...
        dayPowerRequired(averagePower, day, eclipse));
fprintf(1, 'Battery capacity: %g MJ\n', ...
        batteryRequired(averagePower, eclipse) / 10e6);