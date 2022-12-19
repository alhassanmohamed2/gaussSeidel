
clc
clear

% gauss seidel method for 3 equations

n=input('please inter no of iterations');
x1=input(' please inter intial value of x1');
x2=input(' please inter intial value of x2');
x3=input(' please inter intial value of x3');
A=input(' please inter Augmented matrix '); 

for i=1:n
    % For Calculate Erorr Later
    x1_old = x1;
    x2_old = x2;
    x3_old = x3;
    
    x1=(A(1,4)-A(1,2)*x2-A(1,3)*x3)/A(1,1);
    x2=(A(2,4)-A(2,1)*x1-A(2,3)*x3)/A(2,2);
    x3=(A(3,4)-A(3,1)*x1-A(3,2)*x2)/A(3,3);
    
    %error
    err1=abs((x1-x1_old)/x1)*100;
    err2=abs((x2-x2_old)/x2)*100;
    err3=abs((x3-x3_old)/x3)*100;
   
    
    %results
    fprintf('======= iterration:- %d ======= \n',i);
    fprintf('x1 = %d\n',x1);
    fprintf('err1 = %d\n',err1);
    fprintf('x2 = %d\n',x2);
    fprintf('err2 = %d\n',err2);
    fprintf('x3 = %d\n',x3);
    fprintf('err3 = %d\n',err3);
       
end
    