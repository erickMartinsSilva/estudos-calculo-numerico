% Metodo de Jacobi para resolver sistema linear Ax=b
clc
format short

% Calcular a solução x para cada sistema abaixo.
% Exemplo 1
A = [3 -1 -1; 1  5  1; 1  1  7];      
b = [-2; 14; 24];                  

% Exemplo 2
%A = [1  5  1; 0 -1 -1; 1  1  7];     
%b = [14; -2; 24];  

% Exemplo 3
%A = [1  1; 1 -3]; 
%b = [3; -3];                     

% Exemplo 4
%A = [7 4 3 5 8; 0 4 8 5 2; 6 9 9 4 6; 0 9 9 7 0; 9 9 8 0 3];
%b = [84; 62; 97; 73; 66];   


n = size(A,2);      % numero de variaveis do problema
x = zeros(n,1);     % solucao inicial (aproximada)

ee = 10^(-8);       % Precisao ou Tolerancia para o teste de parada
MAXITER = 600;     % Numero maximo de iteracoes
conv = false;       % Variavel que informa se convergiu ou nao
acc = zeros(n,1);

% Realizar a iteracao de Gauss Seidel sobre o vetor x
% Para a iteracao "iter" de 1 até MAXITER:
%   Para as linhas i de 1 até n:
%     Para a coluna j de 1 até n:
%       Se a coluna j for diferente de i:  (diferente no Octave: ~=)
%         Acumular produto coeficiente * variavel
%     Calcular valor da i-esima variavel
%
%   Se norm(A*x-b,inf) < ee  % Testa se x eh solucao aproximada
%     Se sim, fazer conv = true e abandonar iteracoes (usar "break")

for k = 1:MAXITER
    for i = 1:n
        acc(i) = b(i);
        for j = 1:n
            if j ~= i
                acc(i) = acc(i) - (A(i,j) * x(j));
            end
        end
        acc(i) = acc(i) / A(i,i);
    end
    
    x = acc;
    
    if norm(A*x-b,inf) < ee
        conv = true;
        break;
    end
end

% Se "conv" for "verdadeiro" (true)
%   Imprimir "O metodo convergiu !!"
%   Imprimir o número de iteracoes utilizadas (valor de iter)
%   Imprimir o valor de "x" (solucao aproximada)
% Se "conv" for "falso" (false)   
%   Imprimir "O metodo nao convergiu !!"

if conv
    disp("O metodo convergiu !!");
    disp(iter);
    disp(x);
else
    disp("O metodo nao convergiu !!");
end












