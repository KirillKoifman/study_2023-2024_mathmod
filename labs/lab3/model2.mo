model model2

Real x;
Real y;
Real a = 0.355;
Real b = 0.799;
Real c = 0.299;
Real h = 0.566;
Real t = time;

initial equation
x = 23450;
y = 11250;

equation
der(x) = -a*x - b*y + cos(2*t) + 1;
der(y) = -c*x - h*y + sin(10*t) + 1;

end model2;
