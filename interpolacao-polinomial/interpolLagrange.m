%%  Este programa calcula o polinomio interpolador na FORMA DE LAGRANGE
%%  Interpola conjunto de pontos (xk,yk), para k = 0,...,n
%%  pn(x) = Sum(k=0,n) yk Lk(x)
%%          (x -x0)(x -x1)...(x -x(k-1))(x -x(k+1))...(x -xn)
%%  Lk(x) = -------------------------------------------------,  k=0,...,n.
%%          (xk-x0)(xk-x1)...(xk-x(k-1))(xk-x(k+1))...(xk-xn)

function InterpolLagrangeModelo
 clc
 format long

 % Exemplo1 - funcao y = 6./t
 x = [1 2 3];

 % Exemplo2 - funcao y = 12./(t+2)
 % x = [-1 0 1 2];
 % x = [-1 0 1 2 10];

 y = f(x);
 n = length(x)-1;      % n eh o grau do polinomio interpolador
 c = zeros(1, n);
 
 % Calculo dos "coeficientes" c(k) = y(k)/denominador da forma de Lagrange
 
 for i=1:(n+1)
    acc = 1;
    for j=1:(n+1)
       if x(i) ~= x(j)
           acc = acc * (x(i)-x(j));
       end
    end
    c(i) = y(i) / (acc);
 end
 
 % Impressao dos coeficientes
 disp('Coeficientes do polinomio de Lagrange:');
 for k=1:(n+1)
  fprintf('c%1d: %1.2f\n', k, c(k));
 end
 disp('');

 apresentarPolinomio(c, x, n);
end

 % Montar uma funcao para apresentar o polinomio na forma de Lagrange

 function apresentarPolinomio(c, x, n)
    coefsP = zeros(1, n+1);
 
    for j = 1:(n+1)
        primeiro = 1;
        array1 = zeros(1, n+1);
        array2 = array1;

        for i = 1:(n+1)
           if i ~= j
               array2 = circshift(array1, -1);
               if primeiro == 1
                   array2(n+1) = -x(i);
                   array2(n) = 1;
               else
                   array2 = array2 + (array1 * (-x(i)));
               end
               array1 = array2;
               primeiro = 0;
           end
        end
        
        coefsP = coefsP + (c(j) * array2);
    end
    
    disp(' ');
    disp('Polinômio na forma de Lagrange:');
    fprintf('P%d(x) = ', n);
    for i = 1:(n+1)
       if (i ~= 1)
        if(c(i) > 0)
           fprintf("+ %d", c(i));
         else
           fprintf("- %d", -c(i));
        end
       else 
        if(c(i) > 0)
           fprintf("%d", c(i));
         else
           fprintf("-%d", -c(i));
        end
       end
       for j = 1:(n+1)
           if (j ~= i)
                fprintf('(x ');
                v = -x(j);
                if (v ~= 1)
                    if (mod(v, 1) ~= 0)
                     if(v > 0)
                       fprintf("+ %1.4f", v);
                     else
                       fprintf("- %1.4f", -v);
                     end
                    else
                     if(v > 0)
                       fprintf("+ %d", v);
                     else
                       fprintf("- %d", -v);
                     end
                    end
                end
               fprintf(')');
           end
       end
       fprintf(' ');
    end
    disp(' ');
        
    disp(' ');
    disp('Polinômio interpolado:');
    fprintf('P%d(x) = ', n);
    for i=1:(n+1)
     if(coefsP(i) ~= 0)
        if (coefsP(i) ~= 1)
          if(i ~= 1)
            if (mod(coefsP(i), 1) ~= 0)
             if(coefsP(i) > 0)
               fprintf("+ %1.4f", coefsP(i));
             else
               fprintf("- %1.4f", -coefsP(i));
             end
            else
             if(coefsP(i) > 0)
               fprintf("+ %d", coefsP(i));
             else
               fprintf("- %d", -coefsP(i));
             end
            end
          else
            if (mod(coefsP(i), 1) == 0)
              fprintf("%d", coefsP(i));
            else
              fprintf("%1.4f", coefsP(i));
            end
          end
        end

       if n-i+1 > 1
         fprintf('x^%d ', n-i+1);
       elseif n-i+1 == 1
         fprintf('x ');
       end
      end
    end
    disp(' ');
 end
 
function y = f(t)
  y = 6./t;             % x=1:3 
  %y = 12./(t+2);
end

