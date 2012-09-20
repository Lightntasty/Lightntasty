function I = minimumSolarIntensity(planet)
    global solarConstant;
    global astronomicalUnit;
    apoapsis = planet.a / (1 - planet.e);
    I = solarConstant * (astronomicalUnit / apoapsis)^2;
end