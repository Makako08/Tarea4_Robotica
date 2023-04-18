%Programación para el punto b del problema 1

%Defino variables
kx = 0.773;
ky = 0.624;
kz = -0.117;
theta = 46.4;
v = 1-cosd(theta);

%Defino los ángulos de rotación para los ejes fijos
x = 40;
y = 25;
z = -15;

%Defino las matrices de rotación pura sobre Z, Y y X
Rx = [1 0 0;
      0 cosd(x) -sind(x);
      0 sind(x) cosd(x)];
  
Ry =  [cosd(y) 0 sind(y);
       0 1 0;
       -sind(y) 0 cosd(y)];
   
Rz = [cosd(z) -sind(z) 0;
      sind(z) cosd(z) 0;
      0 0 1];

%Obtengo la matriz Rk
Rk = [(kx)^2*v+cosd(theta) kx*ky*v-kz*sind(theta) kx*kz*v+ky*sind(theta);
      kx*ky*v+kz*sind(theta) (ky)^2*v+cosd(theta) ky*kz*v-kx*sind(theta);
      kx*kz*v-ky*sind(theta) ky*kz*v+kx*sind(theta) (kz)^2*v+cosd(theta)];
  
%Obtengo la matriz final que sale de rotar sobre ejes fijos
%El orden de la multiplicación de las matrices será Rx*Ry*Rz
Rot = Rx*Ry*Rz;

%Imprimo los valores de Rot y Rk
disp("Rot")
disp(Rot)
disp("Rk")
disp(Rk)

%R/ Las matrices resultantes son equivalentes con diferencias muy pequeñas


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




