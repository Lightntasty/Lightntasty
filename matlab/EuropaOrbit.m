classdef EuropaOrbit < LatexData
    properties (Constant)
        % altitude, km
        h = 200;
        % semi-major axis, km
        a = Europa.r + EuropaOrbit.h;
        % minimum solar intensity, W/m^2
        Imin = Constants.I * (Constants.AU * (1 - Jupiter.e) / ...
                              Jupiter.a)^2;
        % mean motion, 1/s
        n = sqrt(Europa.mu / EuropaOrbit.a^3);
        % angular span of eclipse, 1
        eclipseAngle = 2 * asin(Europa.r / EuropaOrbit.a);
        % duration of orbit, s
        T = 2 * pi / EuropaOrbit.n;
        % duration of eclipse, s
        Teclipse = EuropaOrbit.eclipseAngle / EuropaOrbit.n;
        % duration of day, s
        Tday = EuropaOrbit.T - EuropaOrbit.Teclipse;
    end
    
    methods (Access = protected)
        function entries = latexentries(self)
            entries = ...
            [self.unitentry('europaorbith', self.h, 'km');
             self.unitentry('europaorbita', self.a, 'km');
             self.unitentry('europaorbitI', self.Imin, 'W/m^2');
             self.unitentry('europaorbitn', ...
                            self.n / pi * 180 * 60 * 60, '\degree/h');
             self.unitentry('europaorbittheta', ...
                            self.eclipseAngle / pi * 180, '\degree');
             self.unitentry('europaorbitT', self.T / 60, 'min');
             self.unitentry('europaorbitTe', self.Teclipse / 60, 'min');
             self.unitentry('europaorbitTd', self.Tday / 60, 'min')];
        end
    end
end