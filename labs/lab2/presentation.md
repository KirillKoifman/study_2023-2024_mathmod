---
marp: true
title: Marp
paginate: true
backgroundColor: grey
---

## Лабораторная работа №2
### Моделирование задачи "Погоня"
<br/>
дисциплина:  Математическое моделирование

Студент: Койфман Кирилл Дмитриевич
Группа: НПИбд-01-21

---

# Введение.
## Цель работы.
Разработать решение для задачи "Погоня" с помощью математического моделирования на языке Julia.

## Задачи.
1. Записать уравнение, описывающее движение катера, с начальными условиями для двух случаев (в зависимости от расположения катера относительно лодки в начальный момент времени). 
2. Построить траекторию движения катера и лодки для двух случаев.
3. Найти точку пересечения траектории катера и лодки. 

---
## 1 задание
Для начала запишем уравнение, описывающее движение катера, с начальными условиями для 2-х случаев:
$$
\frac{x}{v}=\frac{19.5-x}{4.9v},
\frac{x}{v}=\frac{19.5+x}{4.9v} \\
$$

<br/>
И их решения для 2-х случаев:

$$
x_1=5 \\
x_2=3.305
$$
---
## Система дифференциальных уравнений:
$$
\left\{
\begin{aligned}
    \frac{dr}{dt}=v \\
    \sqrt{23.01}v= r\frac{d\Theta}{dt}
\end{aligned}
\right.
$$

Либо при условиях №1 и №2:
$$
\left\{
\begin{aligned}
    \Theta=0 \\
    r_0=x1=5
\end{aligned}
\right.
\left\{
\begin{aligned}
    \Theta=-\pi \\
    r_0=x2=3.305
\end{aligned}
\right.
$$
---
Исключив из этой системы уравнений производную по $t$, получаем такое уравнение:
$$
\frac{dr}{d\Theta}=\frac{r}{\sqrt{23.01}}
$$
---
## 2 задание
Построим траекторию движения катера и лодки для двух случаев, написав алгоритм для этого:

```
using Plots 
using DifferentialEquations

s = 19.5
fi = 3 * π / 4
dr(r, p, tetha) = r / sqrt(23.01)
x = (s*10)/39
r = x
tetha = 0
tethaRange = (tetha, tetha + 2*pi)

problem = ODEProblem(dr, r, tethaRange)
solution = solve(problem, Tsit5(), reltol=1e-8, abstol=1e-8)
solution.u[1]

gr()
plot(solution.t[1:21], solution.u[1:21], proj = :polar, line = (:blue, 2), label = "Лодка браконьеров")
plot!([fi, fi+0.000001], [0,10], line = (:red, 1), label = "Катер береговой охраны", legend = :bottomright)

savefig("test1.png")
```
---
## Траектории движения катера и лодки в 1-м случае
![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab2/Screenshots/test1.png)
<br/>

---
## 
```
using Plots 
using DifferentialEquations

s = 19.5
fi = 3 * π / 4
dr(r, p, tetha) = r / sqrt(23.01)
x = (s*10)/59
r = x
tetha = -pi
tethaRange = (tetha + 2*pi, tetha)

problem = ODEProblem(dr, r, tethaRange)
solution = solve(problem, Tsit5(), reltol=1e-8, abstol=1e-8)
solution.u[1]

gr()
plot!(solution.t[1:21], solution.u[1:21], proj = :polar, line = (:green, 2), label = "Лодка браконьеров")
plot!([fi, fi+0.000001], [0,10], line = (:red, 1), label = "Катер береговой охраны", legend = :bottomright)

savefig("test2.png")
```
---
## Траектории движения катера и лодки во 2-м случае
![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab2/Screenshots/test2.png)
<br/>

---
## 3 задание
Найдём точку пересечения траектории катера и лодки для обоих случаев:
В 1-м случае значение tetha = 2.4, а значение расстояния r = 8.2.

Во 2-м случае значение tetha = 2.3, а значение расстояния r = 2.7.

---
##
Спасибо за внимание!
---