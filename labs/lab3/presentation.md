---
marp: true
title: Marp
paginate: true
backgroundColor: grey
---

## Лабораторная работа №3
### Модель боевых действий
<br/>
дисциплина:  Математическое моделирование

Студент: Койфман Кирилл Дмитриевич
Группа: НПИбд-01-21

---

# Введение.
## Цель работы.
Разработать решение для модели боевых действий с помощью математического моделирования на языках Julia и OpenModelica.

## Описание задания
Между страной $X$ и страной $Y$ идет война. Численность состава войск 
исчисляется от начала войны, и являются временными функциями 
$x(t)$ и $y(t)$. В начальный момент времени страна $X$ имеет армию численностью $23 450$ человек, а в распоряжении страны $Y$ армия численностью в $11 250$ человек. Для упрощения модели считаем, что коэффициенты $a$, $b$, $c$, $h$ постоянны. Также считаем $P(t)$ и $Q(t)$ непрерывные функции.

Постройте графики изменения численности войск армии $Х$ и армии $Y$ для 
следующих случаев:

1. Модель боевых действий между регулярными войсками
$$
\frac{dx}{dy}=-0.312x(t)-0.741y(t)+|cos(t+2)|
$$

<br/>

$$
\frac{dx}{dy}=-0.36x(t)-0.591y(t)+|sin(t+2)|
$$

2. Модель ведение боевых действий с участием регулярных войск и 
партизанских отрядов
$$
\frac{dx}{dy}=-0.355x(t)-0.799y(t)+cos(2t)+1
$$

<br/>

$$
\frac{dx}{dy}=-0.299x(t)y(t)-0.566y(t)+sin(10t)+1
$$

## Задачи.
1. Реализовать модель и построить графики боевых действий на языке Julia для обоих случаев. 
2. Реализовать модель и построить графики боевых действий на языке OpenModelica для обоих случаев. . 

---
## 1 задание
Запишем решение для симуляции боевых действий для 1-го и 2-го варианта на языке Julia (рис.1, рис.2):

```
using Plots;
using DifferentialEquations;

function battleVariant(du, u, p, t)
    du[1] = - 0.312*u[1] - 0.741*u[2] + abs(cos(t + 2))
    du[2] = - 0.36*u[1] - 0.591*u[2] + abs(sin(t + 2))
end

const peopleNum = Float64[23450, 11250]
const timeSpan = [0.0, 2.0]

problem = ODEProblem(battleVariant, peopleNum, timeSpan)
solution = solve(problem, dt = 0.0001)

A1 = [u[1] for u in solution.u]
A2 = [u[2] for u in solution.u]
T = [t for t in solution.t]

myPlot = plot(xaxis = "time", yaxis = "Army strength", label = ["X" "Y"], title = "Модель боевых действий между регулярными войсками")
plot!(myPlot, T, A1, label="Army X", color =:red)
plot!(myPlot, T, A2, label="Army Y", color =:blue)
```
---
## 1 задание
![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab3/Screenshots/test1.png)

---
## 1 задание
```
using Plots;
using DifferentialEquations;

function battleVariant(du, u, p, t)
    du[1] = - 0.355*u[1] - 0.799*u[2] + cos(2 * t) + 1
    du[2] = - 0.299*u[1] - 0.566*u[2] + sin(10 * t) + 1
end

const peopleNum = Float64[23450, 11250]
const timeSpan = [0.0, 2.0]

problem = ODEProblem(battleVariant, peopleNum, timeSpan)
solution = solve(problem, dt = 0.0001)

A1 = [u[1] for u in solution.u]
A2 = [u[2] for u in solution.u]
T = [t for t in solution.t]

myPlot = plot(xaxis = "Time", yaxis = "Army strength", label = ["X" "Y"], title = "Модель ведение боевых действий с участием регулярных войск и партизанских отрядов")
plot!(myPlot, T, A1, label="Army X", color =:red)
plot!(myPlot, T, A2, label="Army Y", color =:blue)
```

---
## 1 задание
![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab3/Screenshots/test2.png)

---
## 2 задание
А теперь запишем решение для симуляции боевых действий для 1-го и 2-го варианта на языке OpenModelica (рис.3, рис.4):

```
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
```
---
## 2 задание
![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab3/Screenshots/test3.png)
<br/>*РИС.3(Для 1-го случая)*

---
## 2 задание
```
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
```
---
## 2 задание

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab3/Screenshots/test4.png)
<br/>*РИС.4(Для 2-го случая)*

---
##
Спасибо за внимание!
---