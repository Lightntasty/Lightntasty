classdef Payload < System
    properties (Access = protected)
        name = 'payload';
        drymass = sym('80');
        launchmass = sym('10');
        averagepower = sym('50');
    end

    methods (Access = protected)
        function entries = latexentries(self)
            entries = [];
        end
    end
end