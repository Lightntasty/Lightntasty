function I = minimumSolarIntensity(planet)
    global solarConstant
    global astronomicalUnit
    I = solarConstant * (astronomicalUnit / (planet.a / (1 - planet.e)))^2;
end