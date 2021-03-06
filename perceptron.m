clear();
clc; 
%data base
database1 = 'perceptron_database.xlsx' ;
Input_DataBase = xlsread (database1,'A2:D100'); 
Desired_Output_DataBase = xlsread (database1,'E2:E100'); 

X= [1 2 -1 3]; %Quections 
W= [1 ; 3 ; 2 ; 4]; %Weights 

S=0;% Student Answer (either 1 or 0)
T=0;% Teachers Answer (either 1 or 0 )
error_count = 0;
success_count = 0;
success_rate =0;
itterations = 99;
tita = 0;

input = 0; 


for i = 1 : 80
    X = Input_DataBase(i,:); %Quections 
    
    input = X*W; %Matrix multiplication( This is silimar to DOT product)
    
    if (input >= tita ) % We can compair with a value of 'tita' where if (S=0 and T=1, tita = tita + 1) else if (S=1 and T=0, tita = tita - 1): As Perceptron Inplies 
        S=1;
        
    elseif (input < tita)
        S=0;

    end
    
    T = Desired_Output_DataBase(i,1); 
    if (S == 1)&&(T == 0)
        W = W - transpose(X);
        tita= tita + 1;
        fprintf('Iteration %d ,S=%d ,T=%d ,W is deduct from the input',i,S,T);
    elseif (S == 0)&&(T == 1)
        W = W + transpose(X);
        tita= tita - 1;
        fprintf('Iteration %d ,S=%d ,T=%d ,W is Added by the input',i,S,T);
    else         
       fprintf('Iteration %d ,S=%d ,T=%d ,Nothing has done to W',i,S,T);
    
    end
    
    fprintf('\n');
    
end

disp(W);
fprintf('tita :%d\n', tita);
%disp(W);
        
for i=1 :itterations
   X = Input_DataBase(i,:); %Quections 
    
    input = X*W; %Matrix multiplication( This is silimar to DOT product)
    
    if (input >= tita ) % We can compair with a value of 'tita' where if (S=0 and T=1, tita = tita + 1) else if (S=1 and T=0, tita = tita - 1): As Perceptron Inplies 
        S=1;
        
    elseif (input < tita)
        S=0;
    end
    
    T = Desired_Output_DataBase(i,1); 
    if (S == 1)&&(T == 0)
        error_count=   error_count +1 ;
    elseif (S == 0)&&(T == 1)
        error_count=   error_count +1 ;
    else         
       success_count = success_count +1; 
     
    end
    
    
end

success_rate = success_count*100/(success_count+error_count);
fprintf('Success Rate= %d \n',success_rate);
    
X= [6 10 0 3]; 
input = X*W; %Matrix multiplication( This is silimar to DOT product)
    
    if (input >= tita ) % We can compair with a value of 'tita' where if (S=0 and T=1, tita = tita + 1) else if (S=1 and T=0, tita = tita - 1): As Perceptron Inplies 
        S=1;
        
    elseif (input < tita)
        S=0;

    end
    
fprintf('Student Ans :%d\n', S);
   
    if (X(1,1)+X(1,2)+X(1,3)+X(1,4))>= 5
        T=1;
    else 
        T=0;
        
    end
    
fprintf('Teachers Ans :%d\n', T);
       
