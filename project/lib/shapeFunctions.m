function [N, dNdxi] = shapeFunctions(nDim,nElemNode,xi)
%{
This function calculates the shape functions and their derivatives at a
given integration point, xi, in the natural coordinates. Ouputs:

(1) N: shape functions which is a vertical vector (nElemNode-by-1) including
[N1; N2;...]

(2) dNdxi: a matrix including shape functions derivatives (nElemNode-by-nDim)
%}


% initializing the variables to store the shape functions and the
% derivatives 
N     = zeros(nElemNode,1   );
dNdxi = zeros(nElemNode,nDim);

switch nDim
    %=====================================================================%
    case 1  % 1D
        %-----------------------------------------------------------------%
        if nElemNode == 2   % a bar element (first order)
            N     = [0.5*(1 + xi(1)) ;
                     0.5*(1 - xi(1))];
            dNdxi = [ 0.5  ;
                     -0.5 ];
        %-----------------------------------------------------------------%         
        elseif nElemNode == 3   % a bar element (second order)
            N     = [-0.5*xi(1)*(1-xi(1)) ;
                      0.5*xi(1)*(1+xi(1)) ;
                      (1-xi(1))*(1+xi(1))];
            dNdxi = [-0.5 + xi(1) ;
                      0.5 + xi(1) ;
                     -2.0 * xi(1)];
        %-----------------------------------------------------------------%
        end
    %=====================================================================%    
    case 2  % 2D
        if ( nElemNode == 3 )   % a triangular element (first order)
        %-----------------------------------------------------------------%    
            % TODO
            % N =  ...
            %      
            % dNdxi = ...
            %
            
            
        %-----------------------------------------------------------------%         
        elseif ( nElemNode == 6 ) % a triangular element (second order)
            % TODO
            % N =  ...
            %      
            % dNdxi = ...
            %
            
            
        %-----------------------------------------------------------------%
        elseif ( nElemNode == 4 ) % a quadrilateral element (first order)
            % TODO
            % N =  ...
            %      
            % dNdxi = ...
            %
            
            
        %-----------------------------------------------------------------%
        elseif (nElemNode == 8)  % a quadrilateral element (second order)
            % TODO
            % N =  ...
            %      
            % dNdxi = ...
            %
            
            
        %-----------------------------------------------------------------%
        end
    %=====================================================================%
end



end
