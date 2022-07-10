#PUNTO FIJO

% funcion:   Ingresar como @(x)(función__a_evaluar)
% a:      Punto para comenzar a evaluar la función (X_0)

function answer = puntoFijo(funcion, a)
  error = 100;
  i = 0;
  answer = [-1, -2, -3, -4]

  while((error > (1 * 10^(-3))) && i<50)
    f_a = feval(funcion, a); #cálculo de X_n+1
    if(i ~= 0)
      error = abs((f_a - a) / f_a * 100); #Cálculo del error
    endif
    #Ingresa nueva fila a matriz respuesta
    newLine = [i, a, f_a, error];
    before = answer;
    answer = [before; newLine];

    a = f_a;
    i++;
  endwhile
  titles = ['[-1 = i]', '[-2 = a]', '[-3 = f(a)]', '[-7 = Error]']
 endfunction

