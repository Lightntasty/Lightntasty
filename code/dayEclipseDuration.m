function [day, eclipse] = dayEclipseDuration(body, orbitAltitude)
    orbitRadius = body.r + orbitAltitude;
    theta = 2 * asin(body.r / orbitRadius);
    n = sqrt(body.mu / orbitRadius^3);
    day = (2 * pi - theta) / n;
    eclipse = theta / n;
