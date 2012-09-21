classdef Structures < System
    properties (Access = protected)
        name = 'structures';
        drymass = sym('.26 * drymass');
        launchmass = sym('10');
        averagepower = sym('0');
    end

    methods (Access = protected)
        function entries = latexEntries(self)
            entries = [];
        end
    end
end