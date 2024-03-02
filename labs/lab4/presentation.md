---
marp: true
title: Marp
paginate: true
backgroundColor: grey
---

## Лабораторная работа №4
### Модель гармонических колебаний
<br/>
дисциплина:  Математическое моделирование

Студент: Койфман Кирилл Дмитриевич
Группа: НПИбд-01-21

---

# Введение.
## Цель работы.
Разработать решение для модели гармонических колебаний с помощью математического моделирования на языках Julia и OpenModelica.

## Описание задания
Постройте фазовый портрет гармонического осциллятора и решение уравнения гармонического осциллятора для следующих случаев:
1. Колебания гармонического осциллятора без затуханий и без действий внешней 
силы &#x0307;$x$&#x0307;$+4.4x=0$
2. Колебания гармонического осциллятора c затуханием и без действий внешней 
силы &#x0307;$x$&#x0307;$+4.4x$&#x0307;$+0.4x=0$ 
3. Колебания гармонического осциллятора c затуханием и под действием внешней 
силы &#x0307;$x$&#x0307;$+4.0x$&#x0307;$+4.0x=0.4sin(4t)$ 

На интервале t&isin;[0; 64] (шаг 0.05) с начальными условиями $x_0=0.4, y_0=0.4$

## Задачи.
1. Реализовать модель и построить фазовый портрет гармонического осциллятора и график решения уравнения гармонического осциллятора на языке Julia для 3-х случаев. 
2. Реализовать модель и построить фазовый портрет гармонического осциллятора и график решения уравнения гармонического осциллятора на языке OpenModelica для 3-х случаев. 

---
## 1 задание
Запишем решение решения уравнения гармонического осциллятора для 3-х случаев на языке Julia:

```
using Plots;
using DifferentialEquations;

# x'' + 4.4x = 0 (NO damping and NO external force)
function no_damping_no_external_force(du, u, p, t)
    a = p
    du[1] = u[2]
    du[2] = -a*u[1]
end

const x = 0.4
const y = 0.4
u0 = [x, y]
p = 4.4
timeSpan = (0.0, 64.0)

problem = ODEProblem(no_damping_no_external_force, u0, timeSpan, p)
solution = solve(problem, dtmax = 0.05)
gr()

plot(solution, xaxis = "t", lable = "", legend = false, title = "Решение уравнения гармонического осциллятора")
savefig("model_1_1.png")
plot(solution, vars=(2,1), xaxis = "x", yaxis = "y", lable = "", legend = false, title = "Фазовый портрет гармонического осциллятора")
savefig("model_1_2.png")
```
---
![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab4/Screenshots/model_1_1.png)
<br/>*РИС.1(Для 1-го случая (без затуханий и без действий внешней силы))*

---
![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab4/Screenshots/model_1_2.png)
<br/>*РИС.2(Для 1-го случая (без затуханий и без действий внешней силы))*

---
## 1 задание
```
using Plots;
using DifferentialEquations;

# x'' + 4.4x' + 0.4x = 0 (WITH damping and NO external force)
function damping_no_external_force(du, u, p, t)
    a, b = p
    du[1] = u[2]
    du[2] = -a*du[1] - b*u[1]
end

const x = 0.4
const y = 0.4
u0 = [x, y]
p = (4.4, 0.4)
timeSpan = (0.0, 64.0)

problem = ODEProblem(damping_no_external_force, u0, timeSpan, p)
solution = solve(problem, dtmax = 0.05)

gr()

plot(solution, xaxis = "t", lable = "", legend = false, title = "Решение уравнения гармонического осциллятора")
savefig("model_2_1.png")
plot(solution, vars=(2,1), xaxis = "x", yaxis = "y", lable = "", legend = false, title = "Фазовый портрет гармонического осциллятора")
savefig("model_2_2.png")
```
---
![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab4/Screenshots/model_2_1.png)
<br/>*РИС.3(Для 2-го случая (с затуханием и без действий внешней силы))*

---
![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab4/Screenshots/model_2_2.png)
<br/>*РИС.4(Для 2-го случая (с затуханием и без действий внешней силы))*

---
## 1 задание
```
using Plots;
using DifferentialEquations;

# x'' + 4.4x' + 0.4x = 0.4sin(4t) (WITH damping and WITH external force)
function damping_external_force(du, u, p, t)
    a, b = p
    du[1] = u[2]
    du[2] = -a*du[1] - b*u[1] + 0.4*sin(4*t)
end

const x = 0.4
const y = 0.4
u0 = [x, y]
p = (4.0, 4.0)
timeSpan = (0.0, 64.0)

problem = ODEProblem(damping_external_force, u0, timeSpan, p)
solution = solve(problem, dtmax = 0.05)
gr()

plot(solution, xaxis = "t", lable = "", legend = false, title = "Решение уравнения гармонического осциллятора")
savefig("model_3_1.png")
plot(solution, vars=(2,1), xaxis = "x", yaxis = "y", lable = "", legend = false, title = "Фазовый портрет гармонического осциллятора")
savefig("model_3_2.png")
```

---
![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab4/Screenshots/model_3_1.png)
<br/>*РИС.5(Для 3-го случая (с затуханием и при воздействии внешней силы))*

---
![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab4/Screenshots/model_3_2.png)
<br/>*РИС.6(Для 3-го случая (с затуханием и при воздействии внешней силы))*

---
## 2 задание
Запишем решение решения уравнения гармонического осциллятора для 3-х случаев на языке OpenModelica:

```
model model_1

Real x(start=0.4);
Real dx(start=0.4);

equation
der(dx) = -4.4*x;
der(x) = dx;

end model_1;
```
![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab4/Screenshots/Screenshot_1.png)
<br/>*РИС.7(Для 1-го случая (без затуханий и без действий внешней силы))*
---

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab4/Screenshots/Screenshot_2.png)
<br/>*РИС.7(Для 1-го случая (без затуханий и без действий внешней силы))*

---
```
model model_2

Real x(start=0.4);
Real dx(start=0.4);

equation
der(dx) = -4.4*dx - 0.4*x;
der(x) = dx;

end model_2;
```

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab4/Screenshots/Screenshot_3.png)
<br/>*РИС.9(Для 2-го случая (с затуханием и без действий внешней силы))*
---

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab4/Screenshots/Screenshot_4.png)
<br/>*РИС.10(Для 2-го случая (с затуханием и без действий внешней силы))*

---
```
model model_3

Real x(start=0.4);
Real dx(start=0.4);

equation
der(dx) = -4.0*dx - 4.0*x + 0.4*sin(4*time);
der(x) = dx;

end model_3;
```

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab4/Screenshots/Screenshot_5.png)
<br/>*РИС.11(Для 3-го случая (с затуханием и при воздействии внешней силы))*
---

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab4/Screenshots/Screenshot_6.png)
<br/>*РИС.12(Для 3-го случая (с затуханием и при воздействии внешней силы))*
---

##
Спасибо за внимание!
---