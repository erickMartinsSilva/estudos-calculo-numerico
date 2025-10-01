function resultado = gauss(A, b)
  n = size(A,2);      % numero de variaveis do problema
  x = zeros(n,1);     % criacao do vetor solucao

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

  resultado = x;
endfunction





