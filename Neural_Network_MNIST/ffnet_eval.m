function net_out=ffnet_eval(net_in, input_layer)

%net_in : Neural Network
%input_layer : input for input_layer of net_in

if net_in.Nneurons(1)~=length(input_layer)
    fprintf('length of input array incorrect');
    return;
end

net_in.O{1}((1:net_in.Nneurons(1)))=input_layer';

for i=2:net_in.Nlayers
    net_in.I{i}(1:net_in.Nneurons(i))= net_in.w{i-1}'*net_in.O{i-1};
    net_in.O{i}(1:net_in.Nneurons(i))= arrayfun(net_in.factiv{i},net_in.I{i}(1:net_in.Nneurons(i)));
end
net_out=net_in;
end