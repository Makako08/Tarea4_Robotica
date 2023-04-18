%Programación para el punto b del problema 1

%Defino variables
kx = 0.773;
ky = 0.624;
kz = -0.117;
theta = 46.4;
v = 1-cos(theta);

%Defino los ángulos de rotación para los ejes fijos
x = 40;
y = 25;
z = -15;

%Defino las matrices de rotación pura sobre Z, Y y X


%Obtengo la matriz Rk
Rk = [(kx)^2*v+cos(theta) kx*ky*v-kz*sin(theta) kx*kz*v+ky*sin(theta);
      kx*ky*v+kz*sin(theta) (ky)^2*v+cos(theta) ky*kz*v-kx*sin(theta);
      kx*kz*v-ky*sin(theta) ky*kz*v+kx*sin(theta) (kz)^2*v+cos(theta)];
  
%Obtengo la matriz final que sale de rotar sobre ejes fijos

  
  
  