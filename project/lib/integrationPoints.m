function [xi, w] = integrationPoints(nDim,nElemNode)
%{
This function takes the nDim and nElemNode as inputs and returns the
following outputs:

(1) xi: a (nDim-by-nIntegrationPoints) matrix including the gauss
quadrature points

(2) w:  a list (vector) of gauss quadrature weights
%}

switch nDim
    % nPoints = number of the integration points
    %=====================================================================%
    case 1 % 1D
        nPoints = nElemNode;
        %-----------------------------------------------------------------%
        if nElemNode == 1
            xi = 0.0;
            w  = 2.0;
        %-----------------------------------------------------------------%    
        elseif nElemNode == 2
            xi = [-1/sqrt(3), 1/sqrt(3)];
            w  = [1.0       , 1.0      ];
        %-----------------------------------------------------------------%    
        elseif nElemNode == 3
            % TODO
            % xi = ...
            % w  = ...
            
        %-----------------------------------------------------------------%    
        end
    %=====================================================================%    
    case 2 % 2D
        %-----------------------------------------------------------------%
        if (nElemNode == 2) || (nElemNode == 3)
            nPoints = 1;
            
            % TODO
            % xi = ...
            % w  = ...
            
        %-----------------------------------------------------------------%    
        elseif nElemNode == 6
            nPoints = 3;
            
            % TODO
            % xi = ...
            % w  = ...
            
        %-----------------------------------------------------------------%    
        elseif nElemNode == 4
            nPoints = 4;
            
            % TODO
            % xi = ...
            % w  = ...
            
        %-----------------------------------------------------------------%    
        elseif nElemNode == 8
            nPoints = 9;
            
            % TODO
            % xi = ...
            % w  = ...
            
            
        %-----------------------------------------------------------------%   
        end   
    %=====================================================================%
end

end

