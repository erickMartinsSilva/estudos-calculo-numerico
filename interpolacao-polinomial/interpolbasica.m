% Forma Basica do polinomio interpolador - Exemplos

clc
format long

% Exemplo 1
%x = [1; 2; 3];
%y = [6; 3; 2];         % f(x) = 6/x;
%v = 2.5;

% Exemplo 2
%x = [-1; 0;  2];
%y = [ 4; 1; -1];
%v = 1;

% Exemplo 3
x = [ -2;  -1;  0;  1;  2];
y = [ 33; -11; -9; -3; 13];
v = 3;

% Processamento
n = length(x)-1;    % n eh o grau do polinomio interpolador

% Criar matriz X
% Calcular o vetor "a" resolvendo sistema com recursos do Matlab
% aplicar o "flip" ao vetor "a"

X = zeros(n,n);

for i=1:n+1
  for j=0:n
    X(i,j+1) = x(i)^j;
  endfor
endfor

a = gauss(X, y);
a = flip(a);

% Impressao dos coeficientes
disp('Coeficientes do polinomio interpolador'); %disp(a);
for i=1:(n+1)
 fprintf('coef. de x%1d: %1.2f\n', n-i+1, a(i));
end
disp('');

% Impressao do valor interpolado
% Usar funcao polyval e armazenar na variavel "r"
r = polyval(a,v);
disp('Valor interpolado:');
disp(r);
disp('');

% Impressao do polinomio interpolador
fprintf('Polinomio Interpolador:\n');
fprintf('p%1d(x)= ',n);
for i=1:(n+1)
 if(a(i) != 0)
    if (a(i) != 1)
      if(i != 1)
        if (mod(a(i), 1) != 0)
         if(a(i) > 0)
           fprintf("+ %1.4f", a(i));
         else
           fprintf("- %1.4f", -a(i));
         endif
        else
         if(a(i) > 0)
           fprintf("+ %d", a(i));
         else
           fprintf("- %d", -a(i));
         endif
        endif
      else
        if (mod(a(i), 1) == 0)
          fprintf("%d", a(i));
        else
          fprintf("%1.4f", a(i));
        endif
      end
   endif

   if n-i+1 > 1
     fprintf('x^%d ', n-i+1);
   elseif n-i+1 == 1
     fprintf('x ');
   end
  end
end
fprintf('\n\n');
