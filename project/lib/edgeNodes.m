function edgeNodesIndex = edgeNodes(nDim, nElemNode, edge)
%{
If you want to calculate the equivalent nodal forces when a traction force
is applied on an edge of the 2D domain, this function can be useful in 
proving the indices of the side nodes for each element side.

For instance, if a traction force is applied on the second edge of a
first-order (linear) quadrilateral element, the output (edgeNodeIndex) will
be [2,3], becuase nDim=2 and nElemNode=4. In this case, the list [2,3]
means that the traction force is applied on the edge between the second and
the third nodes of the quadrilateral element.
%}
if nDim == 1 % 1D
    switch nElemNode
        case 2
            edgeNodesList = [1, 2];
        case 3
            edgeNodesList = [1, 2, 3];
    end
elseif nDim == 2  % 2D
    switch nElemNode
        case 2
            edgeNodesList = [1, 2];
        case 3
            edgeNodesList = [1, 2 ;
                             2, 3 ;
                             3, 1];
        case 4
            edgeNodesList = [1, 2 ;
                             2, 3 ;
                             3, 4 ;
                             4, 1];
        case 6
            edgeNodesList = [1, 2, 4 ;
                             2, 3, 5 ;
                             3, 1, 6];
        case 8
            edgeNodesList = [1, 2, 5 ;
                             2, 3, 6 ;
                             3, 4, 7 ;
                             4, 1, 8];
    end
end

edgeNodesIndex = edgeNodesList(edge, :);
end
