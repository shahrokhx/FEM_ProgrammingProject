function r = elemEquivalentLoad(edgeCoord, load)
%{
This function takes the coordinates of an edge of an element, and the
componenets of the applied traction force [Tx, Ty], and calculates the
equivalent nodal forces by conducting numerical integration
%}

[nEdgeNode, nDim] = size(edgeCoord);
nDof = length(load);

% initializing the variable to store the equivalent nodal forces
r = zeros(nDof*nEdgeNode, 1);

% calling the "integrationPoints" function to generate a list of
% Guass quadrature integration points and weights
[xiList, wList] = integrationPoints(nDim-1,nEdgeNode);



% loop over integration points to conduct the numerical integration and
% calculate the equivalent nodal forces
%#ok<TODO>














end

