---
marp: true
title: Marp
paginate: true
backgroundColor: grey
---

## Лабораторная работа №7
### Модель "эффективность рекламы"
<br/>
дисциплина:  Математическое моделирование

Студент: Койфман Кирилл Дмитриевич
Группа: НПИбд-01-21

---
## Введение.
### Цель работы.
Разработать решение для модели "эффективность рекламы" с помощью математического моделирования на языках Julia и OpenModelica.

### Описание задания
Постройте график распространения рекламы, математическая модель которой описывается 
следующим уравнением:

1. $\frac{dn}{dt}=(0.88+0.000066n(t))(N-n(t))$
2. $\frac{dn}{dt}=(0.000055+0.44n(t))(N-n(t))$
3. $\frac{dn}{dt}=(0.52cos(t)+0.37sin(t)n(t))(N-n(t))$

При этом объем аудитории $N=1656$, в начальный момент о товаре знает 17 человек.
### Задачи.
1. Реализовать модель "эффективность рекламы" и построить графики распространения рекламы для всех 3-х случаев на языке Julia. 
2. Реализовать модель "эффективность рекламы" и построить графики распространения рекламы для всех 3-х случаев на языке OpenModelica. 

---
## 1 задание
```
using Plots;
using DifferentialEquations;

const N = 1656 #number of all people (audicity)
const n0 = 17 #people knowing about product at t=0
#[first member of eq.]advertising campaign intensity
#[second  member of eq.]effectiveness of word of mouth marketing

function equation_function(du, u, p, t)
    (n) = u
    du[1] = (0.88 + 0.000066 * u[1]) * (N - u[1])
end

u0 = [n0]
timeSpan = (0.0, 8.0)

problem = ODEProblem(equation_function, u0, timeSpan)
solution = solve(problem, dtmax = 0.01)

n = [u[1] for u in solution.u]
time = [t for t in solution.t]

plot(time, n, legend = false, title = "Распространение рекламы\n(1-й сценарий)")
savefig("julia_1.png")
```
---
![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab7/Screenshots/julia_1.png)
---
```
using Plots;
using DifferentialEquations;

const N = 1656 #number of all people (audicity)
const n0 = 17 #people knowing about product at t=0
#[first member of eq.]advertising campaign intensity
#[second  member of eq.]effectiveness of word of mouth marketing

function equation_function(du, u, p, t)
    (n) = u
    du[1] = (0.000055 + 0.44 * u[1]) * (N - u[1])
end

u0 = [n0]
timeSpan = (0.0, 0.02)

problem = ODEProblem(equation_function, u0, timeSpan)
solution = solve(problem, dtmax = 0.0005)

n = [u[1] for u in solution.u]
time = [t for t in solution.t]

plot(time, n, legend = false, title = "Распространение рекламы\n(2-й сценарий)")
savefig("julia_2.png")
```
---
![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab7/Screenshots/julia_2.png)
---
```
using Plots;
using DifferentialEquations;

const N = 1656 #number of all people (audicity)
const n0 = 17 #people knowing about product at t=0
#[first member of eq.]advertising campaign intensity
#[second  member of eq.]effectiveness of word of mouth marketing

function equation_function(du, u, p, t)
    (n) = u
    du[1] = (0.52 * cos(t) + 0.37 * sin(t) * u[1]) * (N - u[1])
end

u0 = [n0]
timeSpan = (0.0, 0.3)

problem = ODEProblem(equation_function, u0, timeSpan)
solution = solve(problem, dtmax = 0.0005)

n = [u[1] for u in solution.u]
time = [t for t in solution.t]

plot(time, n, legend = false, title = "Распространение рекламы\n(3-й сценарий)")
savefig("julia_3.png")
```
---
![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab7/Screenshots/julia_3.png)
---
## 2 задание
```
model model_1
constant Real N = 1656;
Real n;

initial equation
n = 17;

equation
der(n) = (0.88 + 0.000066 * n) * (N - n);

end model_1;
```
![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab7/Screenshots/om_1.png)
---
```
model model_2
constant Real N = 1656;
Real n;

initial equation
n = 17;

equation
der(n) = (0.000055 + 0.44 * n) * (N - n);

end model_2;
```
![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab7/Screenshots/om_2.png)
---
```
model model_3
constant Real N = 1656;
Real n;

initial equation
n = 17;

equation
der(n) = (0.52 * cos(time) + 0.37 * sin(time) * n) * (N - n);

end model_3;
```
![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab7/Screenshots/om_3.png)
---
##
Спасибо за внимание!
---