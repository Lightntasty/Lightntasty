classdef PowerSystem < System
    properties (Access = protected)
        name = 'power';
        drymass = sym('.19 * drymass + .07 * drymass');
        launchmass = sym('10');
        averagepower = sym('.10 * (averagepower - 50)');
    end

    methods (Access = protected)
        function entries = latexEntries(self)
            entries = [];
        end
    end
end