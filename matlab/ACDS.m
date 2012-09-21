classdef ACDS < System
    properties (Access = protected)
        name = 'acds';
        drymass = sym('.09 * drymass');
        launchmass = sym('10');
        averagepower = sym('.20 * (averagepower - 50)');
    end

    methods (Access = protected)
        function entries = latexentries(self)
            entries = [];
        end
    end
end