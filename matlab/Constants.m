classdef Constants < LatexData
    properties (Constant)
        % solar constant (intensity at 1 AU), W / m^2
        I = 1361;
        % astronomical unit (1 AU), km
        AU = 149597871;
    end
    
    methods (Access = protected)
        function entries = latexentries(self)
            entries = ...
                [self.unitentry('solarconstant', self.I, 'W/m^2');
                 self.unitentry('AU', self.AU, 'km')];
        end
    end
end