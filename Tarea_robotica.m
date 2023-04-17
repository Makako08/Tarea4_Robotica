kx = 0.773;
ky = 0.624;
kz = -0.117;
theta = 46.4;
v = 1-cos(theta);

Rk = [(kx)^2*v+cos(theta) kx*ky*v-kz*sin(theta) kx*kz*v+ky*sin(theta);
      ]