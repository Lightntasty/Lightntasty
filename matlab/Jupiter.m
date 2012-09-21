classdef Jupiter < LatexData
    properties (Constant)
        % semi-major axis, km
        a = 778570000;
        % eccentricity
        e = 0.0489
        % gravitational parameter, km^3 / s^2
        mu = 126686534;
    end
    
    methods (Access = protected)
        function entries = latexentries(self)
            entries = ...
                [self.unitentry('jupitera', self.a, 'km');
                 self.unitentry('jupitere', self.e, '');
                 self.unitentry('jupitermu', self.mu, 'km^3/s^2')];
        end
    end
end