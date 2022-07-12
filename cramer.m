#METODO DE CRAMER

#Solicitud de datos
function cramer()
  clc;
  printf ("Metodos de Metodo\n");
  matrizA = input("\nPor favor ingrese la matriz A:");
  matrizB = input("\nPor favor ingrese la matriz B:");
  # opciones a mostrar
#  mostrar = menuOpcion();
  calcular(matrizA,matrizB)
 endfunction

% matrizA:       matriz A (Sin coeficientes)
% matrizB:       Vector columna de términos independientes

function calcular(matrizA, matrizB)
  da = det(matrizA)
  long = size(matrizA, 2); #Número de columnas matriz matrizA
  for i = 1:long #bucle para generar las matrices d
    d = matrizA;
    d(:, i) = matrizB
    D = det(d)
    answer = ['X', num2str(i), ' = ', num2str(D / da)]
  endfor
 endfunction

 function mostrar = menuCramer()
  #inicio de variables
  matrices = false;
  x = false;
  a = false;
  opcion = menu("Resultado a ver", "1. Matrices DXn\n","2. Resultado Xn\n", "3. Resultado |A| \n", "4. Todo\n");

  if(opcion == 1)
    matrices = true;
  elseif(opcion == 2)
    x = true;
  elseif(opcion == 3)
    a = true;
  elseif(opcion == 4)
    matrices = true;
    x = true;
    a = true;
  endif

  mostrar = [matrices, x, a];

 endfunction

