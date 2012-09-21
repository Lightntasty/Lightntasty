classdef LatexData < handle
    properties (Access = protected)
        children
    end
    
    methods (Access = public)
        function exportlatex(self, file, map)
            narginchk(2, 3);
            
            if (nargin == 2)
                file = fopen(file, 'w');
                map = containers.Map();
            end
            
            entries = self.latexentries();
            
            for k = 1:size(entries, 1)
                entry = entries(k, 1);
                entry = entry{1};
                value = entries(k, 2);
                value = value{1};
                
                if isKey(map, entry)
                    error('duplicate latex data entry: %s', entry);
                end
                
                map(entry) = 1;
                fprintf(file, '%s\n', self.command(entry, value));
            end
            
            for child = self.children
                if isa(child{1}, 'LatexData')
                    child{1}.exportlatex(file, map);
                end
            end
            
            if (nargin == 2)
                fclose(file);
            end
        end
    end
    
    methods (Access = protected)
        function entries = latexentries(self)
            entries = [];
        end
    end
    
    methods (Static = true)
        function entry = mathentry(key, value)
            entry = {key, sprintf('\\ensuremath{%s}', value)};
        end
        
        function entry = unitentry(key, value, unit)
            value = regexprep(sprintf('%.4g', value), '(e\D?)0(\d+)', ...
                              '$1$2');
            entry = {key, sprintf('\\SI{%s}{%s}', value, unit)};
        end
        
        function latex = command(key, value)
            latex = sprintf('\\newcommand{\\%s}{%s}', key, value);
        end
    end
end