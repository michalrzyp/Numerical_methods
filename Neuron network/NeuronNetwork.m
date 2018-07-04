clear 
clc

iris_inputs = char(importdata('iris.data.txt'));
iris_inputs1=iris_inputs(1:150,((1:3)));
iris_inputs2=iris_inputs(1:150,((5:7)));
iris_inputs3=iris_inputs(1:150,((9:11)));
iris_inputs4=iris_inputs(1:150,((13:15)));
for i=1:150
X1(i,1)=str2double(iris_inputs1(i,1:3));
X2(i,1)=str2double(iris_inputs2(i,1:3));
X3(i,1)=str2double(iris_inputs3(i,1:3));
X4(i,1)=str2double(iris_inputs4(i,1:3));
end
X=[X1 X2 X3 X4];

iris_target1 = [1 0 0]'; setosa=find(iris_target1);
iris_target2 = [0 1 0]'; versicolor=find(iris_target2);
iris_target3 = [0 0 1]'; verginica=find(iris_target3);

for n=1:(50-1)
   iris_target1=[iris_target1 iris_target1(:,1)];
   iris_target2=[iris_target2 iris_target2(:,1)];
   iris_target3=[iris_target3 iris_target3(:,1)];
end

iris_targets = [iris_target1 iris_target2 iris_target3];

S = 3; %ilosc neuronow

X=X';
net = newff(X,iris_targets ,[S],{'tansig' 'purelin'},'traingd');

net.trainParam.epochs = 150; %liczba epok/iteracji uczenia
net.trainParam.showWindow = false; %brak wyœwietlania okna uczenia
%net.performFcn = 'mse'; %typ funkcji kosztu

 error_before_learn=zeros(1,10);
 error_after_learn=zeros(1,10);

 for i=1:10
%Uczenie sieci
nnet = train(net, X, iris_targets);

%Symulacja dzialania sieci
 D1 = sim(net, X); %siec nienauczona

 for j=1:150
 a=compet(D1(:,j)); a1(j)=find(a);
 b=compet(iris_targets(:,j)); b1(j)=find(b);
 
   if(a1(j)~=b1(j))
    error_before_learn(i)=error_before_learn(i)+1;   
   end
 end
 
 D2 = sim(nnet, X); %siec nauczona
 for k=1:150
 aa=compet(D2(:,k)); a2(k)=find(aa);
 bb=compet(iris_targets(:,k)); b2(k)=find(bb);
 
  if(a2(k)~=b2(k))
    error_after_learn(i)=error_after_learn(i)+1;   
  end
 end
 error_before_learn(i);
 error_after_learn(i);
end
mean_before_learn=mean(error_before_learn)
mean_after_learn=mean(error_after_learn)

  hold on
  plot(X(3,1:50), X(4,1:50), 'ob');
  plot(X(3,51:100), X(4,51:100), 'sr');
  plot(X(3,101:150), X(4,101:150), '*k');
  title('Dane');
  hold off
