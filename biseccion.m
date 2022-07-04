## METODO BISECCIÓN

#Solicitud de datos
function biseccion()
  clc;
  printf ("Metodos Bisección\n");
  funcion1 = input("\nPor favor ingrese la función:","s");
  funcion1 = inline(funcion1);
  limI = input("\nPor favor ingrese el límite inferior:");
  limS = input("\nPor favor ingrese límite superior:");
  iteraciones = input("\nPor favor ingrese el número de iteraciones:");
  # opciones a mostrar
  mostrar = menuOpcion();
  if(isnumeric(limI) && isnumeric(limS) && isnumeric(iteraciones))
    if(feval(funcion1,limI) * feval(funcion1,limS) < 0)
     calcular(funcion1,limI,limS,iteraciones, mostrar)
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

% funcion:                   función a evaluar
% limite inferior limI:      Límite inferior para evaluar
% limite superior limS:      Límite superior para evaluar
% nroIteraciones:            Número de iteraciones

function calcular(funcion, limI, limS, nroIteraciones, mostrar)
  %datos iniciales
  grafica = mostrar(1);
  tabla = mostrar (2);
  vraiz = mostrar (3);
  error = 100;
  raizAnterior = 1;
  iteracion = 0;
  resultado = [];
  x=[];
  y=[];
  raiz=0;
 # iteraciones
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
    x=[x,raiz];
    y=[y,f_raiz];


    if (signo < 0)
      limS = raiz;
    else
      limI = raiz;
    endif
    raizAnterior = raiz;
    iteracion++;
  endwhile
  if(grafica == true)
    plot(x,y);
  endif
  if(tabla == true)
    fprintf("%s%s%s%s%s%s%s\n","[iteracion]", "[limite inferior]", "[limite superior]", "[raiz]", "[f(raiz)]","[signo]", "[Error]");
    resultado
  endif
  if(vraiz == true)
    fprintf("La raiz aproximada es:%d y el porcentaje de error es:%d \n", raiz, error);
  endif


endfunction

