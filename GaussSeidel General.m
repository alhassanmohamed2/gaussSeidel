
clear
clc

% gauss seidel method for n of equations

no_iter = input('Enter Number of iteration \n');
no_equ = input('Enter Number of equations \n');
x = zeros(1, no_equ); %fixed size array
x_old = zeros(1, no_equ); %fixed size array

for no = 1:no_equ
    x(no)= input(['Enter inital value of X' num2str(no) '\n']);    
end

Augmented_matrix = input('Enter Augmented matrix\n');

for i = 1:no_iter
  x_old = x;
  for j = 1:no_equ
      x(j) = Augmented_matrix(j, no_equ + 1);
      for r = 1:no_equ
         if(r ~= j)
             x(j) = x(j) - Augmented_matrix(j, r) * x(r); 
         end  
      end
      x(j) = x(j) / Augmented_matrix(j,j);
      
      err = abs( (x(j) - x_old(j) ) / x(j) ) * 100;
      fprintf('============ Iteration no. %d/n', i)
      fprintf('x%d = %4.6f \n',j,x(j))
      fprintf('Err of x%d = %4.6f \n',j,err)
  end
  
end
