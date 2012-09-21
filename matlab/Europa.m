classdef Europa < LatexData
    properties (Constant)
        % radius (from core to surface), km
        r = 1560.8;
        % gravitational parameter, km^3 / s^2
        mu = 3201;
    end
    
    methods (Access = protected)
        function entries = latexentries(self)
            entries ...
                = [self.unitentry('europar', self.r, 'km');
                   self.unitentry('europamu', self.mu, 'km^3/s^2')];
        end
    end
end