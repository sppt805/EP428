%% Testing Script

x0 = [0.0001;0];

x = NewtonRaphsonMultivar(@TestingEq,x0,1E-4);
f = TestingEq(x);

disp(['Roots are located at: x = ', num2str(x(1)), ' and ', num2str(x(2))]);