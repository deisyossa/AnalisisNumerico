#METODO SECANTE

function secante()
  clc;
  printf ("Metodos de la Secante\n");
  funcion1 = input("\nPor favor ingrese la función:","s");
  funcion1 = inline(funcion1);
  xi = input("\nPor favor ingrese el valor de xi:");
  xi_1 = input("\nPor favor ingrese el valor de xi+1:");
  # opciones a mostrar
  mostrar = menuOpcion();
  if(isnumeric(xi) && isnumeric(xi_1))
     calcular(funcion1,xi,xi_1,mostrar)
  else
    print("Los parámetros ingresados son inválidos");
    opcion = menu("Desea Continuar?", "1. Sí, deseo intentar nuevamente", "2. No, deseo salir al menú principal");
    if(opcion==1)
      secante();
    endif
  endif
 endfunction


% funcion:    Función a evaluar
% xi:         Punto para comenzar a evaluar la función (X_0)
% xi_1:       Punto para comenzar a evaluar la función (X_1)

function calcular(funcion, xi, xi_1,mostrar)
  grafica = mostrar(1);
  tabla = mostrar (2);
  vraiz = mostrar (3);
  error = 100;
  i = 0;
  resultado = [];
  x=[];
  y=[];

  while((error > (1 * 10^(-3))) &&  (i < 50))

    f_xi = feval(funcion, xi);
    f_xi_1 = feval(funcion, xi_1);
    x1_2 = xi_1 - ( ((xi - xi_1) * f_xi_1) / (f_xi - f_xi_1)); #cálculo de X_n+1

    if(i ~= 0)
      error = abs((x1_2 - xi_1) / x1_2 * 100); #Cálculo del error
    endif
    #Ingresa nueva fila a matriz respuesta
    newLine = [i, xi, f_xi, error];
    before = resultado;
    resultado = [before; newLine];
    # valores para graficar
    x=[x,xi];
    y=[y,xi_1];

    xi = xi_1;
    xi_1 = x1_2;
    i++;
  endwhile

  if(grafica == true)
    plot(x,y)
  endif
  if(tabla == true)
    fprintf("%s%s%s%s\n","[iteracion]", "[Xi]", "[f_Xi]","[Error]");
    resultado
  endif
  if(vraiz == true)
    fprintf("La raiz aproximada es:%d y el porcentaje de error es:%d \n", xi, error);
  endif
 endfunction

