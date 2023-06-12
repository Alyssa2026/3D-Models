% Model in terms of X_A, X_B. Assigned constant values.
% User inputs T constant value in command window when running

% Create constants
z = 1;
w_AB = 1;
w_AC = 1;
w_BC = 1;
R = 1;
T = input ('Enter value for T');
f = 0.1;
a = 0.1;
o_A = 1;
o_B = 1;
o_C =1;
Y_A =0.1;
Y_B = 0.1;
del_H_AC = 1;
del_H_BC = 1;
y_A = 1;
y_B = 1;
y_C = 1;

% Defining x_a and x_b vectors
x_b = linspace(0,1,100);
x_a = linspace(0, 1, 100);

% Grid of points
[X_A,X_B] = meshgrid(x_a,x_b);

% Evaluate points with log condition
del_G = zeros(size(X_A));
for i = 1:numel(X_A)
    if (1-X_A(i) - X_B(i) > 0) && (X_A(i) > 0) && (X_B(i) > 0)
    del_G(i) = (z.*w_AB.*X_A(i).*X_B(i)+z.*w_AC.*X_A(i).* ...
    (1-X_A(i)-X_B(i))+z.* w_BC.*X_B(i).*(1-X_A(i)-X_B(i))+ ...
    R.*T.*(X_A(i).*log(X_A(i))+X_B(i).*log(X_B(i))+(1-X_A(i)-X_B(i)).* ...
    log(1-X_A(i)-X_B(i)))).*(1-f)...
    +(a.*z.*w_AB.*Y_A.*Y_B+a.*z.*w_AC.*Y_A.*(1-Y_A-Y_B)+ ...
    a.*z.*w_BC.*Y_B*(1-Y_A-Y_B)+o_A.*y_A.*Y_A+ ...
    o_B.*y_B.*Y_B+o_C.*y_C.*(1-Y_A-Y_B)+del_H_AC.*Y_A+del_H_BC.*Y_B+ ...
    R.*T.*(Y_A.*log(Y_A)+Y_B.*log(Y_B)+(1-Y_A-Y_B).*log(1-Y_A-Y_B))).*(f);
    end
end

figure
mesh(X_A,X_B,del_G)
xlabel('X_A')
ylabel('X_B')
zlabel('del_G')
grid on
title('Model_X')







