% Metodo de eliminacao de Gauss para resolver sistemas lineares Ax=b
% A: Matriz dos coeficientes e b: vetor de constantes

clc
format short

% Calcular a solução x para cada sistema abaixo.
% Exemplo 1
%A = [3 -1 -1; 1  5  1; 1  1  7];  
%b = [-2; 14; 24];  

% Exemplo 2
%A = [1  5  1; 0 -1 -1; 1  1  7];     
%b = [14; -2; 24];  

% Exemplo 3
%A = [1  1; 1  -3];  
%b = [ 3; -3];      

% Exemplo 4
A = [7 4 3 5 8; 0 4 8 5 2; 6 9 9 4 6; 0 9 9 7 0; 9 9 8 0 3];
b = [84; 62; 97; 73; 66];   

n = size(A,2);      % numero de variaveis do problema
x = zeros(n,1);     % criacao do vetor solucao
     
disp('Resolucao do sistema linear Ax=b');
disp('Matriz A: '); disp(A);
disp('Matriz coluna b de constantes: ');  disp(b);

U = A; bG = b; L = eye(n);

% Realizar a eliminação de Gauss, operando com as matrizes L, U e bG.
% Para o k-ésimo elemento da diagonal da matriz U, de k de 1 até n-1:
%   Para as linhas i desde k+1 até n:
%     Calcular L(i,k) = U(i,k)/U(k,k);
%     Fazer U(i,k) = 0;
%     Para j da coluna k+1 até a coluna n:
%       Fazer U(i,j) = U(i,j) - L(i,k)*U(k,j)
%     Fazer bG(i) = bG(i) - L(i,k)*bG(k);

for k = 1:n
   for i = k+1:n
      L(i,k) = U(i,k) / U(k,k);
      U(i,k) = 0;
      for j = k+1:n
         U(i,j) = U(i,j) - L(i,k) * U(k,j);
      end
      bG(i) = bG(i) - L(i,k) * bG(k);
   end
end

% Solucionar o sistema triangular resultante, encontrando a solução x.
% Para a linha i de n até 1, em ordem decrescente:
%   Fazer o acumulador S = 0;
%   Para a coluna j de i+1 até n:
%     Fazer S = S + U(i,j)*x(j);
%   Fazer x(i) = (bG(i) - S)/U(i,i)

for i = n:-1:1
    S = 0;
    for j = i+1:n
        S = S + U(i,j)*x(j);
    end
    x(i) = (bG(i) - S) / U(i,i);
end

% Impressão dos resultados 
disp('-----------------------------');
disp('Matriz U triang. sup. do metodo de eliminacao de Gauss: '); disp(U);
disp('Matriz coluna de constantes modificadas: '); disp(bG);
disp('Matriz L:'); disp(L);
disp('Solucao x encontrada: '); disp(x);



