# РОССИЙСКИЙ УНИВЕРСИТЕТ ДРУЖБЫ НАРОДОВ

### Факультет физико-математических и естественных наук 

<br/>
<br/>
<br/>
<br/>

ОТЧЕТ
ПО ЛАБОРАТОРНОЙ РАБОТЕ №5
===============
## Модель "хищник-жертва"

<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
дисциплина:  Математическое моделирование

Студент: Койфман Кирилл Дмитриевич

Группа: НПИбд-01-21

<br/>
<br/>
<br/>
<br/>

## Введение.
### Цель работы.
Разработать решение для модели "хищник-жертва" с помощью математического моделирования на языках Julia и OpenModelica.

### Описание задания
Для модели «хищник-жертва»:

$$
\left\{
\begin{aligned}
    \frac{dx}{dy}=-0.28x(t)+0.045x(t)y(t) \\
    \frac{dx}{dy}=0.38y(t)-0.035x(t)y(t)
\end{aligned}
\right.
$$

Постройте график зависимости численности хищников от численности жертв, 
а также графики изменения численности хищников и численности жертв при 
следующих начальных условиях: $x_0=10$, $y_0=31$. Найдите стационарное 
состояние системы.

### Задачи.
1. Реализовать модель и построить графики зависимости численности хищников от численности жертв и изменения численности хищников и численности жертв при начальных условиях: $x_0=10$, $y_0=31$ на языке Julia. 
2. Реализовать модель и построить графики зависимости численности хищников от численности жертв и изменения численности хищников и численности жертв при начальных условиях: $x_0=10$, $y_0=31$ на языке OpenModelica. 
3. Найти стационарное состояние системы на языках Julia и OpenModelica.

## Ход работы
### 1 задание
---
Запишем решение для данной системы уравнений на языке Julia, чтобы построить графики зависимости численности хищников от численности жертв и изменения численности хищников и численности жертв(рис.1, рис.2):

```
using Plots;
using DifferentialEquations;

const a = -0.28
const b = -0.045
const c = -0.38
const d = -0.035

function equations_system(du, u, p, t)
    x = u[1]
    y = u[2]
    du[1] = a*x - b*x*y
    du[2] = -c*y + d*x*y
end

x0 = 10.0
y0 = 31.0
u0 = [x0, y0]
timeSpan = (0.0, 80.0)

problem = ODEProblem(equations_system, u0, timeSpan)
solution = solve(problem, dtmax = 0.01)

plot(solution, label = "", legend = false, title = "Зависимость численности хищников\n от численности жертв")
savefig("julia_1.png")

plot(solution, idxs=(1,2), xaxis = "x", yaxis = "y", label = "", legend = false, title = "Изменение численности\n хищников и численности жертв")
```

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab5/Screenshots/julia_1.png)
<br/>*РИС.1(график зависимости численности хищников от численности жертв)*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab5/Screenshots/julia_2.png)
<br/>*РИС.2(график изменения численности хищников и численности жертв)*

### 2 задание
---
А теперь вновь запишем решение для данной системы уравнений, но уже на языке OpenModelica (рис.3, рис.4):

```
model model1
  Real x(start=10);
  Real y(start=31);
  constant Real a = -0.28;
  constant Real b = -0.045;
  constant Real c = -0.38;
  constant Real d = -0.035;

equation
  der(x) = a * x - b * x  *y;
  der(y) = -c * y + d * x * y;

end model1;
```

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab5/Screenshots/om_1.png)
<br/>*РИС.3(график зависимости численности хищников от численности жертв)*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab5/Screenshots/om_2.png)
<br/>*РИС.4(график изменения численности хищников и численности жертв)*

### 3 задание
---
После этого найдём стационарное состояние системы и отобразим его в виде графика (рис.5, рис.6):
```
using Plots;
using DifferentialEquations;

const a = -0.28
const b = -0.045
const c = -0.38
const d = -0.035

function equations_system(du, u, p, t)
    x = u[1]
    y = u[2]
    du[1] = a*x - b*x*y
    du[2] = -c*y + d*x*y
end

x0 = c/d
y0 = a/b
u0 = [x0, y0]
timeSpan = (0.0, 80.0)

problem = ODEProblem(equations_system, u0, timeSpan)
solution = solve(problem, dtmax = 0.01)

plot(solution, label = "", legend = false, title = "Стационарное состояние системы")
```
![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab5/Screenshots/julia_3.png)
<br/>*РИС.5(график стационарного состояния системы)*

```
model model2
  constant Real a = -0.28;
  constant Real b = -0.045;
  constant Real c = -0.38;
  constant Real d = -0.035;
  Real x;
  Real y;
  
initial equation
  x = c / d;
  y = a / b;

equation
  der(x) = a * x - b * x  *y;
  der(y) = -c * y + d * x * y;

end model2;
```
![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab5/Screenshots/om_3.png)
<br/>*РИС.6(график стационарного состояния системы)*

## Заключение
В ходе продеданной лабораторной работы мной были усвоены навыки решения задачи математического моделирования с применением языков программирования для работы с математическими вычислениями Julia и OpenModelica.