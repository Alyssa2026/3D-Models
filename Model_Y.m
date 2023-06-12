% Model in terms of Y_A, Y_B. Assigned constant values.
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
del_H_AC = 1;
del_H_BC = 1;
y_A = 1;
y_B = 1;
y_C = 1;
X_A = 0.1;
X_B = 0.1;

% Defining y_a and y_b vectors
y_b = linspace(0,1,100);
y_a = linspace(0, 1, 100);

% Grid of points
[Y_A,Y_B] = meshgrid(y_a,y_b);

% Evaluate points with log condition
del_G = zeros(size(Y_A));
for i = 1:numel(Y_A)
    if (1-Y_A(i) - Y_B(i) > 0) && (Y_A(i) > 0) && (Y_B(i) > 0)
    del_G(i) = (z.*w_AB.*X_A.*X_B+z.*w_AC.*X_A.* ...
    (1-X_A-X_B)+z.* w_BC.*X_B.*(1-X_A-X_B)+ ...
    R.*T.*(X_A.*log(X_A)+X_B.*log(X_B)+(1-X_A-X_B).* ...
    log(1-X_A-X_B))).*(1-f)...
    +(a.*z.*w_AB.*Y_A(i).*Y_B(i)+a.*z.*w_AC.*Y_A(i).*(1-Y_A(i)-Y_B(i))+ ...
    a.*z.*w_BC.*Y_B(i)*(1-Y_A(i)-Y_B(i))+o_A.*y_A.*Y_A(i)+ ...
    o_B.*y_B.*Y_B(i)+o_C.*y_C.*(1-Y_A(i)-Y_B(i))+del_H_AC.*Y_A(i)+ ...
    del_H_BC.*Y_B(i)+ R.*T.*(Y_A(i).*log(Y_A(i))+Y_B(i).*log(Y_B(i))+ ...
    (1-Y_A(i)-Y_B(i)).*log(1-Y_A(i)-Y_B(i)))).*(f);
    end
end

figure
mesh(Y_A,Y_B,del_G)
xlabel('Y_A')
ylabel('Y_B')
zlabel('del_G')
grid on
title('Model_Y')
