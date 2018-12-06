function net=make_ffnet(Nlayers, Nneurons, hasBiasNeuron)

hasBiasNeuron(Nlayers)=false;
op=@(x) tanh(x);
relu=@(x) max(0,x);
dop=@(x) (1/cosh(x))^2;
drelu=@(x) x==max(0,x);
Error=@(out,exact) mean((out-exact).^2);
DError=@(out,exact) 2*mean(out-exact);
temp=struct;
temp.Nlayers=Nlayers;
temp.Nneurons=Nneurons;
temp.hasBiasNeuron=hasBiasNeuron;
temp.I{1}=[];
for i=1:Nlayers-1
    temp.factiv{i}=relu;
    temp.defactiv{i}=drelu;
    temp.w{i}=sqrt(2/(Nneurons(i)+hasBiasNeuron(i)+Nneurons(i+1)))*randn(Nneurons(i)+hasBiasNeuron(i),Nneurons(i+1));
    temp.O{i}=zeros(Nneurons(i)+hasBiasNeuron(i),1);
    temp.I{i+1}=[];
end
temp.factiv{Nlayers}=op;
temp.defactiv{Nlayers}=dop;
temp.O{Nlayers}=zeros(Nneurons(Nlayers),1);
temp.E=Error;
temp.dE=DError;
net=temp;
end


