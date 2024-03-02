model model1

Real x;
Real y;
Real a = 0.312;
Real b = 0.741;
Real c = 0.36;
Real h = 0.591;
Real t = time;

initial equation
x = 23450;
y = 11250;

equation
der(x) = -a*x - b*y + abs(cos(t + 2));
der(y) = -c*x - h*y + abs(sin(t + 2));

end model1;
