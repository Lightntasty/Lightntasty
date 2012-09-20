function I = minimumSolarIntensity(planet)
    global solarConstant;
    global astronomicalUnit;
    apoapsis = planet.a / (1 - planet.e);
    I = solarConstant * (astronomicalUnit / apohelion)^2;
end