## METODO BISECCIÓN

function biseccion()
  clc;
  funcion1 = input("\nPor favor ingrese la función:","s");
  funcion1 = inline(funcion1);
  limI = input("\nPor favor ingrese el límite inferior:");
  limS = input("\nPor favor ingrese límite superior:");
  iteraciones = input("\nPor favor ingrese el número de iteraciones:");
  if(isnumeric(limI) && isnumeric(limS) && isnumeric(iteraciones))
    if(feval(funcion1,limI) * feval(funcion1,limS) < 0)
     fprintf("%s%s%s%s%s%s%s\n","[iteracion]", "[limite inferior]", "[limite superior]", "[raiz]", "[f(raiz)]","[signo]", "[Error]");
     calcular(funcion1,limI,limS,iteraciones)
    else
     fprintf("%s","no se puede resolver por el método de biscección");
    endif
  else
    print("Los parámetros ingresados son inválidos");
    opcion = menu("Desea Continuar?", "1. Sí, deseo intentar nuevamente", "2. No, deseo salir al menú principal");
    if(opcion==1)
      biseccion();
    endif
  endif
 endfunction

#parámetros necesarios

% funcion:   Ingresar como @(x)(función__a_evaluar)
% limite inferior limI:      Límite inferior para evaluar
% limite superior limS:      Límite superior para evaluar
% nroIteraciones:            Número de iteraciones

function resultado = calcular(funcion, limI, limS, nroIteraciones)
  %datos iniciales
  error = 100;
  raizAnterior = 1;
  iteracion = 0;
  resultado = [];

  while((error > (1 * 10^(-3))) &&  (iteracion < nroIteraciones))
    raiz = (limI + limS) / 2;
    f_raiz = feval(funcion, raiz);
    signo = feval(funcion, limI) * f_raiz;

    if(iteracion ~= 0)
      error = abs((raiz - raizAnterior) / raiz) * 100; #Cálculo del error en iteracion diferente de cero
    endif

    #Ingresa una fila a matriz respuesta
    linea = [iteracion, limI, limS, raiz, f_raiz, signo, error];
    before = resultado;
    resultado = [before; linea];

    if (signo < 0)
      limS = raiz;
    else
      limI = raiz;
    endif
    raizAnterior = raiz;
    iteracion++;
  endwhile


 endfunction
