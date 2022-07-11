#MENU PRINCIPAL

function menuPrincipal
fprintf ("***Taller Menu principal***\n");

bandera = true;
while bandera
  option = menu("Menu principal", "1. Metodos cerrados\n","2. Metodos abiertos\n", "3. Solución de sistemas de ecuaciones lineales\n", "4. Ajuste de curva\n", "5. Metodos de Runge-Kutta\n", "6. Salir\n");
  if ((isnumeric(option)) && (option<=6 && option>=0))
    option = int8(option);
    if(option == 1)
      fprintf ("***Metodos cerrados***\n");
      menuMetodosCerrados();
      bandera = false;
    elseif(option == 2)
      fprintf ("***Metodos abiertos***\n");
      menuMetodosAbiertos();
      bandera = false;
    elseif(option == 3)
      fprintf ("***Solución de sistemas de ecuaciones lineales***\n");
      eLineales();
      bandera = false;
    elseif(option == 4)
      fprintf ("***Ajuste de curva***\n");
      ajusteCurva();
      bandera = false;
    elseif(option == 5)
      fprintf ("***Metodos de Runge-Kutta***\n");
      kutta();
      bandera = false;
    elseif(option == 6 || option == 0)
      printf ("Sistema finalizado\n");
      bandera = false;
   endif
  else
    printf ("\nOpción invalida, por favor intenta nuevamente");
  end
endwhile
endfunction

function menuMetodosCerrados
  bandera = true;
  while bandera
    option = menu("Menu Metodos Cerrados", "1. Bisección\n","2. Falsa posición\n", "3. Menu Principal\n", "4. Salir\n");
    if ((isnumeric(option)) && (option<=4 && option>=0))
       if(option == 1)
        biseccion();
       elseif(option == 2)
        falsaPosicion();
       elseif(option == 3)
         menuPrincipal();
         bandera = false;
       elseif(option == 4 || option == 0)
        printf ("Sistema finalizado\n");
        bandera = false;
    endif
    else
      printf ("\nOpción invalida, por favor intenta nuevamente");
    end
  endwhile
endfunction

function menuMetodosAbiertos
  bandera = true;
  while bandera
    option = menu("Menu Metodos Cerrados", "1. Newton Raphson\n","2. Punto fijo\n", "3. Secante\n", "4. Menu Principal\n", "5. Salir\n");
    if ((isnumeric(option)) && (option<=5 && option>=0))
       if(option == 1)
        newtonRaphson();
       elseif(option == 2)
         puntoFijo();
       elseif(option == 3)
         printf ("Metodos secante\n")
       elseif(option == 4)
         menuPrincipal();
         bandera = false;
       elseif(option == 5 || option == 0)
        printf ("\nSistema finalizado");
        bandera = false;
    endif
    else
      printf ("\nOpción invalida, por favor intenta nuevamente");
    end
  endwhile
 endfunction

 function eLineales
   bandera = true;
  while bandera
    option = menu("Solución de sistemas de ecuaciones lineales", "1. Cramer\n","2. Sarrus\n", "3. Laplace\n", "4. Gauss-Seidel\n", "5. Diagonal Dominante\n", "6. Menu Principal\n", "7. Salir\n");
    if ((isnumeric(option)) && (option<=7 && option>=0))
       if(option == 1)
        printf ("Metodos Cramer\n");
       elseif(option == 2)
         printf ("Metodos Sarrus\n");
       elseif(option == 3)
         printf ("Metodos Laplace\n")
       elseif(option == 4)
         printf ("Metodos Gauss-Seidel\n")
       elseif(option == 5)
         printf ("Sistema Diagonal Dominante\n")
       elseif(option == 6)
         menuPrincipal();
         bandera = false;
       elseif(option == 7 || option == 0)
        printf ("\nSistema finalizado");
        bandera = false;
    endif
    else
      printf ("\nOpción invalida, por favor intenta nuevamente");
    end
  endwhile

 endfunction

 function ajusteCurva
    bandera = true;
  while bandera
    option = menu("Ajuste de curva", "1. Newton\n","2. Lagrange\n", "3. Polinomial por minimo cuadrado\n", "4. Menu Principal\n", "5. Salir\n");
    if ((isnumeric(option)) && (option<=5 && option>=0))
       if(option == 1)
        printf ("Polinomio de interpolación de Newton\n");
       elseif(option == 2)
         printf ("Polinomio de interpolación de Lagrange\n");
       elseif(option == 3)
         printf ("Regresion polinomial por minimo cuadrado\n")
       elseif(option == 4)
         menuPrincipal();
         bandera = false;
       elseif(option == 5 || option == 0)
        printf ("\nSistema finalizado");
        bandera = false;
    endif
    else
      printf ("\nOpción invalida, por favor intenta nuevamente");
    end
  endwhile

 endfunction

 function kutta
    bandera = true;
  while bandera
    option = menu("Metodos de Runge-Kutta", "1. Euler\n","2. Euler modificado\n", "3. Menu Principal\n", "4. Salir\n");
    if ((isnumeric(option)) && (option<=4 && option>=0))
       if(option == 1)
        printf ("Metodo de Euler\n");
       elseif(option == 2)
         printf ("Metodo de Euler modificado\n");
       elseif(option == 3)
         menuPrincipal();
         bandera = false;
       elseif(option == 4 || option == 0)
        printf ("\nSistema finalizado");
        bandera = false;
    endif
    else
      printf ("\nOpción invalida, por favor intenta nuevamente");
    end
  endwhile
 endfunction

