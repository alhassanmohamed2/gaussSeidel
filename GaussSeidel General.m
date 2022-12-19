
clear
clc

% gauss seidel method for n of equations

no_iter = input('no iter \n');
no_equ = input('no equ \n');
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
      
      fprintf('x%d = %d \n',j,x(j))
      fprintf('Err of x%d = %d \n',j,err)
  end
  fprintf('============')
end