
clear
clc

% gauss seidel method for n of equations

no_iter = input('Enter Number of iteration \n');
no_equ = input('Enter Number of equations \n');
x = zeros(1, no_equ); %fixed size array
x_old = zeros(1, no_equ); %fixed size array

% make the user input every single inital values of x
for no = 1:no_equ
    x(no)= input(['Enter inital value of X' num2str(no) '\n']);    
end

% check that the enterd matrix is the right one in size or not
while(true)
    Augmented_matrix = input('Enter Augmented matrix\n');
    if(isequal(size(Augmented_matrix) ,[no_equ,  (no_equ+1)]))
        break;
    end
    fprintf('Error!\n Write the matrix in the correct way:  %d * %d Matix\n ' ,no_equ , no_equ +1);
end


for i = 1:no_iter
  fprintf('==== Iteration no. %d ====\n', i)
  x_old = x;
  % This (for) loop is for going through every row in the matrix. 
  for row_num = 1:no_equ
      
      % we put the value after = sign first to subtracte every other
      % element in the vector from it
      x(row_num) = Augmented_matrix(row_num, no_equ + 1);
      
      % This for loop is for going through every element in the 
      % row for calculating the actual values we need.
      for element_num = 1:no_equ
          
         if(element_num ~= row_num)
             x(row_num) = x(row_num) - Augmented_matrix(row_num, element_num) * x(element_num); 
         end  
         
      end
   
      x(row_num) = x(row_num) / Augmented_matrix(row_num,row_num); %calculate the num value of x(n)
      err = abs( (x(row_num) - x_old(row_num) ) / x(row_num) ) * 100; %calculate the error
      
      %print the values
      fprintf('x%d = %4.6f \n',row_num,x(row_num))
      fprintf('Err of x%d = %4.6f \n',row_num,err)
      
  end
  
end
