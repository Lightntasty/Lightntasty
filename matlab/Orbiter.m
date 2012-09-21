classdef Orbiter < System
    properties (Access = protected)
        name = 'orbiter';
        drymass = sym('drymass', 'positive');
        launchmass = sym('launchmass', 'positive');
        averagepower = sym('averagepower', 'positive');
    end

    methods (Access = public)
        function self = Orbiter(children)
            self = self@System(children);
        end
    end

    methods (Access = protected)
        function entries = latexentries(self)
            entries = [];
        end
    end
end