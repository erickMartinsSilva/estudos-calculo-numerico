%%  Este programa calcula o polinomio interpolador na FORMA DE NEWTON
%%  pn(x) = d0 + d1(x-x0) + d2(x-x0)(x-x1) +...+ dn(x-x0)(x-x1)...(x-x(n-1))
%%  onde dk, k=0,...,n sao as diferencas divididas de ordem k entre os
%%  pontos (xj,f(xj)), j=0,1,...,k: dk=f[x0,x1,...,xk].

function InterpolNewtonModelo()
 %clc
 format long

 %       Diferencas divididas
 %         ordem (j)
 %    | 0  ....   j-1       j ..... n
 % ---+-------------------------------
 % x0 |y0          .        .
 %  . | .          .        .
 % xi |yi  ....   i,j-1 -> i,j
 %    |         i+1,j-1 /
 %    |          .
 %    |         .
 %    |        .
 %    |       .
 %    |      .
 %    |     .
 %xi+j|yi+j
 %  . |
 %  . |
 % xn |yn

 %       Implementacao com uma matriz:
 %            dd_i+1,j-1 - dd_i,j-1
 %  dd_i,j = -----------------------
 %                x_i+j - x_i

 % Tarefa: interpolaÃ§Ã£o da funÃ§Ã£o f(x) nos pontos dados pelo vetor x

 % Exemplo1 - funcao y = 6./t
 %x = [1 2 3];

 % Exemplo2 - funcao y = 12./(t+2)
 x = [-1 0 1 2];
 %x = [-1 0 1 2 10];

 y = f(x);
 n = length(x)-1;      % n eh o grau do polinomio interpolador

 dd = zeros(n+1);      % Comecamos com uma matriz zerada
 dd(:,1) = y;          % Primeira coluna sÃ£o os valores de y

 % Montar loop de ordem  (1 ate n)
 %  Montar loop de linha (0 ate ???)
 %   Fazer dd(i,j) = (Num) / (den);
 % CUIDADO: somar 1 a cada indice, pois no Matlab nao existe posicao zero !!!
for j=1:n
    for i=0:n-j
        dd(i+1,j+1) = (dd(i+2,j)-dd(i+1,j))/(x(i+j+1)-x(i+1));
    end
end
disp(dd);
 
 
 % Impressao dos coeficientes
 disp('Coeficientes do polinomio de Newton:');
 for j=0:n             % ordem 0 ate ordem n
  fprintf('dif.div.%d: %1.2f\n', j, dd(1,j+1));
 end
 disp('');             % pula linha

 % Impressao do Polinomio de Newton
 printpol(x,dd);
end

function y = f(t)
 %y = 6./t;             % x=1:3
 y = 12./(t+2);
end

function printpol(x, dd)
 n = length(x)-1;

 fprintf('Polinomio de Newton:\n');
 fprintf('N%1d(x)= ',n);

 % Imprimir polinomio
 for j=0:n
    coef = dd(1,j+1);
    if(coef == 0)
        continue
    end
    
    if j == 0
        printnum(coef);
        continue
    end
    
    if coef == 1
        fprintf(" + ");
    elseif coef == -1
        fprintf(" - ");
    elseif coef < 0
        fprintf(" - ");
        printnum(-coef);
    else
        fprintf(" + ");
        printnum(coef);
    end
    
    for i=1:j
        if x(i) == 0
            fprintf("x");
            continue
        end
        
        fprintf("(x");
        if -x(i) < 0
            fprintf(" - ");
            printnum(x(i));
        else
            fprintf(" + ");
            printnum(-x(i));
        end
        fprintf(")");
    end
 end

 fprintf('\n\n');
end

function printnum(num)
    if mod(num, 1) ~= 0
       fprintf("%.4f", num);
    else
       fprintf("%d", num);
    end
end
