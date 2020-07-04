% Owner : Suman Kumar
% Nlayers : Number of total Layers
% Nneurons: Number of Non-Bais Neurons in each layer
% hasBiasNeuron : each layer may or may not have a bais neuron which is determined by this logical vector

Nlayers = 3; %basic
Nneurons = [2,3,2];
hasBiasNeuron = [0,0,0];%basic

O=cell(Nlayers,1);
I=cell(Nlayers,1);
w=cell(Nlayers,1);
factiv = cell(Nlayers,1);
dfactiv = cell(Nlayers,1);
out = @(x) tanh(x);
dout = @(x) 1-tanh(x)^2;
rest = @(x) max(x,0);
drest = @(x) x>0;
E = @(Y,y)  mean((Y-y).^2);
dE = @(Y,y) 2*(Y-y)/length(Y);

    for i = 1:Nlayers
        O{i} = zeros(Nneurons(i) + hasBiasNeuron(i),1);
        I{i} = zeros(Nneurons(i) + hasBiasNeuron(i),1);
        factiv{i} = rest;
        dfactiv{i} = drest;
        if i<Nlayers
            w{i} = normrnd(0,2/(Nneurons(i)+Nneurons(i+1)),[Nneurons(i),Nneurons(i+1)]);
        end
        if i==Nlayers
            factiv{i} = out;
            dfactiv{i} = dout;
        end
    end
    
net = {O,I,w,factiv,dfactiv,E,dE};

disp("Now displaying neural network's Construct");
disp("Input Layer:");
net{1}{1}
disp("Hidden Layer:");
net{1}{2}
disp("Output Layer:");
net{1}{3}

disp("Now displaying neural network's Weight");
disp("Input Layer:");
net{3}{1}
disp("Hidden Layer:");
net{3}{2}
disp("Output Layer:");
net{3}{3}
