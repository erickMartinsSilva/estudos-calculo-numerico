%%%%%   Este programa encontra um zero REAL de uma funcao pelo  %%%%%%
%%%%%                    METODO DA BISSECAO                     %%%%%%

function BissecModelo()
 %clc
 format long

 %%% Criterio para x ser raiz: valor absoluto de f(x) menor que "prec"
 %%% Se os dados fossem digitados:
 %a =    input('Entre com o limite inferior do intervalo [a,b]: ');
 %b =    input('Entre com o limite superior do intervalo [a,b]: ');
 %prec = input('Entre com a precisao desejada: ');

 %%% Intervalos e precisoes utilizados para cada funcao
 %a=1; b=3; prec=10^-6;     %y = t*log10(t) - 1
 %a=0; b=2; prec=10^-4;     %y = t^2 - .5
 a=2; b=4; prec=10^-4;     %y = t^3 - 9*t + 3

 fa = f(a);
 fb = f(b);

 % Abandonar se a for um zero
 % Abandonar se b for um zero
 % Abandonar se nao houver garantia de raiz no intervalo
 if (abs(fa) < prec)
   disp("a já é um zero da função");
 endif
 if (abs(fb) < prec)
   disp("b já é um zero da função");
 endif
 if (fa * fb > 0)
  disp("Erro: Não há garantia de raiz no intervalo");
 endif

 MaxIter = 1000;
 for k = 1:MaxIter
   % Calcular a bissecao x e o valor da funcao em x
   x = (a+b)/2;
   fx = f(x);

   % Verificar se x jah eh um zero: se sim abandonar iteracoes
   if(abs(fx) < prec)
    break;
   endif

   % Ajustar "a" ou "b" e o valor correspondente da funcao para que o inter-
   % valo [a,b] diminua mas continue contendo a raiz
   if(fa * fx < 0)
    b = x;
    fb = fx;
   else
    a = x;
    fa = fx;
   endif
 end

 # imprimir raiz encontrada, valor da funcao na raiz e o numero de iteracoes
 disp ('*****  A SOLUCAO ENCONTRADA PELO METODO DA BISSECCAO FOI:  *****');
 disp (x);
 disp ('O valor de f(x) calculado na solucao foi: ');
 disp (fx);
 disp ('O numero de iteracoes foi: ');
 disp (k);
end

function y = f(t)
 %y = t*log10(t) - 1;
 %y = t^2 - .5;
 y = t^3 - 9*t + 3;
end
