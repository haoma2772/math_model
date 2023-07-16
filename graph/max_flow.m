clear
clc
a = zeros(9);
a(1,2) = 6; a(1,3) = 4;a(1,4) = 5;
a(2,3) = 3;a(2,5) = 9;a(2,6) = 9;
a(3,4) = 4;a(3,5) = 6;a(3,6) = 7;a(3,7) = 3;
a(4,7) = 5;a(4,9) = 2;
a(5,8) = 12;
a(6,5) = 8;a(6,8) = 10;
a(7,6) = 4;a(7,8) = 15;
a(9,3) = 2;
b= sparse(a);
% [MaxFlow, FlowMatrix, Cut] = graphmaxflow(G, SNode, TNode)
% x 是最大流的结果  y是 flowmatrix z是 cut
[x,y,z] = graphmaxflow(b,1,8);




% problem two:
cm = sparse([1 1 2 2 3 3 4 5],[2 3 4 5 4 5 6 6],...
     [2 3 3 1 1 1 2 3],6,6)
 % [MaxFlow, FlowMatrix, Cut] = graphmaxflow(G, SNode, TNode)
 [M,F,K] = graphmaxflow(cm,1,6);
 
 h = view(biograph(cm,[],'ShowWeights','on')); % the original graph
   set(h.Nodes(K(1,:)),'Color',[1 0 0]);
 view(biograph(F,[],'ShowWeights','on')); % the max_flow graph
