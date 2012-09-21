classdef OtherSystems < System
    properties (Access = protected)
        name = 'othersystems';
        drymass = sym('.12 * drymass');
        launchmass = sym('10');
        averagepower = sym('(.01 + .23 + .17) * (averagepower - 50)');
    end

    methods (Access = protected)
        function entries = latexentries(self)
            entries = [];
        end
    end
end