classdef System < LatexData
    properties (Access = protected)
        parent
        subsystems
        propnames = {'drymass', 'launchmass', 'averagepower'};
    end
    
    properties (Access = protected, Abstract)
        name
        drymass
        launchmass
        averagepower
    end
    
    methods (Access = public)
        function self = System(children)
            if (nargin == 1)
                for child = children
                    if isa(child{1}, 'System')
                        child{1}.parent = self;
                        self.subsystems = [self.subsystems, child];
                    end
                end
            
                self.children = children;
            else
                self.children = [];
            end
        end
        
        function iterate(self)
            eqns = sym(zeros(size(self.propnames)));
            
            for k = 1:length(self.propnames)
                propname = self.propnames(k);
                propname = propname{1};
                eqns(k) = self.equation(propname);
            end

            soln = solve(eqns(:));
            solnnames = fieldnames(soln);
            
            for k = 1:length(solnnames)
                propname = solnnames{k};
                self.(propname) = soln.(propname);
            end
            
            for subsystem = self.subsystems
                subsystem{1}.substitute()
            end
        end
        
        function plot(self, propname)
            name = cell(size(self.subsystems));
            value = zeros(size(self.subsystems));
            
            for k = 1:length(self.subsystems)
                subsystem = self.subsystems(k);
                subsystem = subsystem{1};
                name{k} = subsystem.name;
                value(k) = subsystem.(propname);
            end
            
            bar(value);
            title(propname);
            set(gca, 'XTickLabel', name);
        end
    end
    
    methods (Access = protected)    
        function total = equation(self, prop)
            total = sym('0');

            for subsystem = self.subsystems
                total = total + subsystem{1}.(prop);
            end
            
            total = total - self.(prop);
        end
        
        function substitute(self)
            for k = 1:length(self.propnames)
                propname = self.propnames(k);
                propname = propname{1};
            
                for l = 1:length(self.propnames)
                    subsname = self.propnames(l);
                    subsname = subsname{1};
                    self.(propname) = subs(self.(propname), subsname, ...
                                           self.parent.(subsname));
                end
            end
        end
    end
end