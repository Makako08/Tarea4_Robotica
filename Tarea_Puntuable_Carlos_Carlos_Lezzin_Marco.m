
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%% Tarea puntuable         %%%%')
disp('%%%% Integrantes:            %%%%')
disp('%%%% Carlos Echandi Jara     %%%%')
disp('%%%% Carlos Elizondo Rojas   %%%%')
disp('%%%% Lezzin Leiva Leiva      %%%%')
disp('%%%% Marco Rodríguez Morales %%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')


disp('--------------------------------------------------------------------------------------------------------------')

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
disp('Punto b del problema 1')
disp("Rot")
disp(Rot)
disp("Rk")
disp(Rk)

disp('R/ Las matrices resultantes son equivalentes con diferencias muy pequeñas')

disp('--------------------------------------------------------------------------------------------------------------')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Programación para el punto a del problema 2
disp('Punto a del problema 2')

%Guardo en una variable la matriz de las rotaciones del enunciado
Mat_Tr_rot = [0.966 -0.109 0.236;
              0.243 0.694 -0.678;
              -0.088 0.712 0.670];

%Multiplicando las matrices de rotaciones puras en el orden Rx*Rz*Rx
%obtengo la siguiente matriz:
%
%[cβ -sβcγ sγsβ;
% cαsβ cβcα-sαsγ -cαcβsγ-sαcγ;
% sαsβ sαcβcγ+sγcα cαcγ-sαcβsγ]
%
%Cada una de las operaciones de la matriz anterior corresponde al resultado
%de la Mat_Tr_rot, por lo tanto, γ se obtiene con el arcocoseno de 0.966:

beta = acosd(0.966);

%Ahora, usando las posiciones r12 y r31 de la Mat_Tr_rot y de la matriz
%multiplicada obtengo el ángulo α:

alfa = atan2d(0.109, -0.088);

%Por último, sabiendo los dos ángulos anteriores obtengo gamma despejándola 
%con r13 de ambas matrices:

gamma = asind(0.236/sind(beta));

%E imprimo los valores de α, β y γ
disp("α: ")
disp(alfa)
disp("β:")
disp(beta)
disp("γ:")
disp(gamma)

disp('--------------------------------------------------------------------------------------------------------------')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Programación para el inciso e del problema 3
disp('Inciso e del problema 3')

L2 = 0.150;
L3 = 0.080;
d3max = 0.040;
theta1 = 25*pi/180;
theta2 = -160*pi/180;

Link1 = Link('d', 0, 'a', L2, 'alpha', pi/2);
Link2 = Link('d', 0, 'a', L3, 'alpha', -pi/2);
Link3 = Prismatic('theta', 0, 'a', 0, 'alpha', 0);
Link3.qlim = [0 d3max];

bot = SerialLink([Link1 Link2 Link3], 'name', 'my robot');
bot.fkine([theta1 theta2 d3max])
bot.plot([theta1 theta2  d3max])



