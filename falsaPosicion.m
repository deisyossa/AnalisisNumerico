#METODO FALSA POSICION

#Solicitud de datos
function falsaPosicion()
  clc;
  printf ("Metodos Falsa posición\n");
  funcionFalsaPosicion = input("\nPor favor ingrese la función:","s");
  funcionFalsaPosicion = inline(funcionFalsaPosicion);
  limI = input("\nPor favor ingrese el límite inferior:");
  limS = input("\nPor favor ingrese límite superior:");
  mostrar = menuOpcion();
  if(isnumeric(limI) && isnumeric(limS))
    if(feval(funcionFalsaPosicion,limI) * feval(funcionFalsaPosicion,limS) < 0)
     calculoFalsaPosicion(funcionFalsaPosicion,limI,limS,mostrar)
    else
     fprintf("%s","no se puede resolver por el método de falsa Posicion");
    endif
  else
    print("Los parámetros ingresados son inválidos");
    opcion = menu("Desea Continuar?", "1. Sí, deseo intentar nuevamente", "2. No, deseo salir al menú principal");
    if(opcion==1)
      falsaPosicion();
    endif
  endif
 endfunction


% funcion:   Ingresar como @(x)(función__a_evaluar)
% limite inferios limI:      Límite inferior para evaluar
% limite superior limS:      Límite superior para evaluar

function calculoFalsaPosicion(funcion, limI, limS, mostrar)
  grafica = mostrar(1);
  tabla = mostrar (2);
  vraiz = mostrar (3);
  error = 100;
  mnAnterior = 1;
  i = 0;
  resultado = [];
  x=[];
  y=[];
  mn=0;

  while((error > (1 * 10^(-3))))
    f_limI = feval(funcion, limI);
    f_limS = feval(funcion, limS);
    mn = (((limI * f_limS ) - (limS * f_limI))/(f_limS - f_limI)); #cálculo de la raiz
    f_mn = feval(funcion, mn);
    sign = feval(funcion, limI) * f_mn;
    if(i ~= 0)
      error = abs((mn - mnAnterior) / mn )* 100; #Cálculo del error
    endif
    #Ingresa nueva fila a matriz respuesta
    linea = [i, limI, limS, f_limI, f_limS, mn, f_mn, sign, error];
    before = resultado;
    resultado = [before; linea];
    x=[x,mn];
    y=[y,f_mn];
    if (sign < 0) #evaluación dela nueva raiz
      limS = mn;
    else
      limI = mn;
    endif
    mnAnterior = mn;
    i++;
  endwhile

   if(grafica == true)
    plot(x,y);
  endif
  if(tabla == true)
    fprintf("%s%s%s%s%s%s%s%s%s\n","[iteracion]", "[lim inferior]", "[lim superior]", "[f(Inferior)]", "[f(Superior)]", "[raiz]", "[f(raiz)]","[signo]", "[Error]");
    resultado
  endif
  if(vraiz == true)
    fprintf("La raiz aproximada es:%d y el porcentaje de error es:%d \n", mn, error);
  endif

 endfunction

