classdef Propulsion < System
    properties (Access = protected)
        name = 'propulsion';
        drymass = sym('.13 * drymass');
        launchmass = sym('10');
        averagepower = sym('.01 * (averagepower - 50)');
    end

    methods (Access = protected)
        function entries = latexEntries(self)
            entries = [];
        end
    end
end