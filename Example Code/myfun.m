function y=myfun(K)
%
%
% global x3;
% % y=(x1+x2)/x3;
% y=yourfun(x1,x2)*x3;
% function yy=yourfun(x1,x2)
% yy=x1*x2;
%9.4508
%3.3693
%2.2438
%0.0152
%1.0324

assignin('base','Kp',K(1));
assignin('base','Kd',K(2));
assignin('base','Ki',K(3));
assignin('base','K1',K(4));
assignin('base','K2',K(5));
sim('OPModel');

y=sum(abs(YY));

