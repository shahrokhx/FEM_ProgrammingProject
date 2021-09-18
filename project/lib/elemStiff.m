function k = elemStiff(elemCoord, materials, problem)
%{
This function takes the coordinates of the element (elemCoord matrix), a
vector of the element material properties [E, nu, t], and the problem type
('plane stress / plane strain) as the input arguments and the conduct the
numerical integration to calculate of the element stiffness matrix
%}

[nElemNode,nDim] = size(elemCoord);

% extracting the associated material properties
E  = materials(1);
nu = materials(2);
t  = materials(3);

% calling the "strainStressMatrix" function to calculate the [D] matrix
D = strainStressMatrix (E, nu, problem);


% generating a list of gauss quadrature integration points and weights
% (in natural coordinates)
[xiList, wList] = integrationPoints(nDim,nElemNode);

% initializing the variable to store the [B] and [k] matrices values
B = zeros(3, nElemNode*2);
k = zeros(2*nElemNode);

% loop over all integration points to conduct the numerical integration and
% obtaining the element stiffness matrix
%#ok<TODO>




















end
