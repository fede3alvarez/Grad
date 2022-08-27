% Default Settings for Neural Netwroks
function nn = nn_settings(nn)
    % Default Values
    epoch_size = 10000;
    learning_rate = 0.01;
    training_algorithm = 'traingd';
    activation_function = 'tansig';
    performance_function = 'mse';
    
    nn.divideParam.trainRatio = 0.70; 
    nn.divideParam.valRatio = 0.15;
	nn.divideParam.testRatio = 0.15; 
	nn.trainParam.epochs = epoch_size;
    nn.performFcn = performance_function;
    nn.trainParam.lr = learning_rate;
    nn.trainFcn = training_algorithm; 
    nn.performFcn = performance_function;
    
end