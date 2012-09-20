function p = dayPowerRequired(power, day, eclipse)
    total = day + eclipse;
    p = power * total / day;
end