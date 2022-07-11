#METODO NEWTON RAPHSON

#Solicitud de datos
function newtonRaphson()
  clc;
  printf ("Metodo Newton Rapshon\n");
  funcion1 = input("\nPor favor ingrese la función principal:","s");
  funcion1 = inline(funcion1);
  funcion2 = input("\nPor favor ingrese la derivada de la funcion:","s");
  funcion2 = inline(funcion2);
  x = input("\nPor favor ingrese el valor inicial:");
  # opciones a mostrar
  mostrar = menuOpcion();
  if(isnumeric(x))
    calcular(funcion1,funcion2,x,mostrar)
  else
    print("Los parámetros ingresados son inválidos");
    opcion = menu("Desea Continuar?", "1. Sí, deseo intentar nuevamente", "2. No, deseo salir al menú principal");
    if(opcion==1)
      newtonRaphson();
    endif
  endif
 endfunction

% funcion:       Ingresar como función_a_evaluar
% der_funcion:       Ingresar como derivada de la funcion a evaluar
% x:         Punto para comenzar a evaluar la función (X_0)

function calcular(funcion, der_funcion, xi, mostrar)
  %datos iniciales
  grafica = mostrar(1);
  tabla = mostrar (2);
  vraiz = mostrar (3);
  error = 100;
  i = 0;
  resultado = [];
  x=[];
  y=[];

  while(error > (1 * 10^(-3)))
    f_der = feval(der_funcion, xi);
    f_xi = feval(funcion, xi);
    siguiente = xi - (f_xi / f_der); #cálculo de X_n+1

    if(i ~= 0)
      error = abs((siguiente - xi) / siguiente * 100); #Cálculo del error
    endif
    #Ingresa nueva fila a matriz respuesta
    newLine = [i, xi ,f_xi, f_der, error];
    before = resultado;
    resultado = [before; newLine];
    x=[x,xi];
    y=[y,f_xi];
    xi = siguiente;
    i++;
  endwhile


   if(grafica == true)
    plot(x,y);
   endif
    if(tabla == true)
    fprintf("%s%s%s%s%s\n","[iteracion]", "[Xi]", "[Funcion(Xi)]", "[Derivada(Xi)]","[Error]");
    resultado
  endif
  if(vraiz == true)
    fprintf("La raiz aproximada es:%d y el porcentaje de error es:%d \n", xi, error);
  endif

 endfunction

