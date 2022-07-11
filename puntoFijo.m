# Algoritmo de punto fijo

#Solicitud de datos
function puntoFijo()
  clc;
  printf ("Metodo Punto Fijo\n");
  funcionGx = input("\nPor favor ingrese la función g(x):","s");
  funcionGx = inline(funcionGx);
  x = input("\nPor favor ingrese el valor inicial:");
  # opciones a mostrar
  mostrar = menuOpcion();
  if(isnumeric(x))
    calcular(funcionGx,x, mostrar)
  else
    print("Los parámetros ingresados son inválidos");
    opcion = menu("Desea Continuar?", "1. Sí, deseo intentar nuevamente", "2. No, deseo salir al menú principal");
    if(opcion==1)
      puntoFijo();
    endif
  endif
 endfunction



# [a,fa] intervalo de búsqueda
#ejemplo f(x)= (e^-x) - x = 0; x= (e^-x)
# g(x) = (e^-x)
function calcular(funcionGx, a, mostrar)
  i = 0; # iteracion
  error = 100;
  resultado = [];

  grafica = mostrar(1);
  tabla = mostrar (2);
  vraiz = mostrar (3);
  x=[];
  y=[];

  while(error > (1 * 10^(-3)) && i<100)
    fa = feval(funcionGx, a);
    if(i ~= 0)
      error = abs((fa - a) / fa); #Cálculo del error
    endif

    #Ingresa nueva fila a matriz respuesta
    newLine = [i, a, fa, error];
    before = resultado;
    resultado = [before; newLine];

    # datos para graficar
    x=[x,a];
    y=[y,fa];

    # asigno siguiente valor de la raiz
    a = fa;
    i++;
  endwhile


   if(grafica == true)
    plot(x,y);
   endif
   if(tabla == true)
    fprintf("%s%s%s%s\n","[iteracion]", "[raiz (x)]", "[Funcion g(x)]", "[Error]");
    resultado
   endif
   if(vraiz == true)
    fprintf("La raiz aproximada es:%d y el porcentaje de error es:%d \n", a, error);
   endif
endfunction

