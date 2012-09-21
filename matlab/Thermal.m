classdef Thermal < System
    properties (Access = protected)
        name = 'thermal';
        drymass = sym('.03 * drymass');
        launchmass = sym('10');
        averagepower = sym('64');
    end

    methods (Access = protected)
        function entries = latexEntries(self)
            entries = [];
        end
    end
end