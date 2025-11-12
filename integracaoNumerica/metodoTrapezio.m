%%%              METODOS DE INTEGRACAO NUMERICA
%%%  Este programa resolve uma integral definida pela Regra do Trapezio
%%%  IT = h/2[f(a)+2f(x1)+2f(x2)+...+2f(x(n-1))+f(b)]

function TrapezioModelo()
 %clc
 format long

 a = 0.0; %input('Entre com o limite inferior "a" da integral definida: ');
 b = 1.0; %input('Entre com o limite superior "b" da integral definida: ');
 n = input('Entre com o numero "n" de subintervalos: ');
 
 if(n <= 0)
    disp("ERRO: Valor de n deve ser maior que zero");
    return
 end
 if (mod(n,1) ~= 0)
    disp("ERRO: Valor de n deve ser inteiro");
    return
 end

 % Instancias de testes:
 %   Intervalo sempre sera [0,1].
 %   Valores de n: 4 e 100. Funcoes: y=4, y=x, y=x^2, y=x^3 e y=x^4. 
 
 % Calcular h 
 % Calcular soma = f(x1)+f(x2)+...+f(x(n-1)). Lembrar: xi = a+i*h, i=1,...,n-1
 % Calcular Integral = h/2*( f(a) + 2*soma + f(b) )
 h = (b-a)/n;
 soma = 0;
 for i=1:(n-1)
    xi = a + (i*h);
    soma = soma + f(xi);
 end
 Integral = (h/2)*(f(a) + 2*soma + f(b));
 
 fprintf('\nValor da integral pela Regra do Trapezio: %9.7f \n\n', Integral);
end

function y = f(t)
 %y = 4;
 %y = t;                     
 %y = t^2;
 %y = t^3;
 y = t^4;
 
 % -------- ExercÃ­cios para casa
 %y = sqrt(t); 
 %y = exp(-t^2/2);
 %y = exp(sin(t));
 
 %y = sin(t)/t;
 %y = sqrt(3*(sin(t))^2 + 5*(cos(t))^2);
 %y = nthroot(t^2+1,3); %nthroot(a,n) calcula raiz n-esima de a
 %y = (cos(t))^2/t^2;
end
