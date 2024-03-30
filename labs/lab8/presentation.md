---
marp: true
title: Marp
paginate: true
backgroundColor: grey
---

## Лабораторная работа №8
### Модель "конкуренция двух фирм"
<br/>
дисциплина:  Математическое моделирование

Студент: Койфман Кирилл Дмитриевич
Группа: НПИбд-01-21

---
## Введение.
### Цель работы.
Разработать решение для модели "конкуренция двух фирм" с помощью математического моделирования на языках Julia и OpenModelica.

### Описание задания
Случай 1. Рассмотрим две фирмы, производящие взаимозаменяемые товары 
одинакового качества и находящиеся в одной рыночной нише. Считаем, что в рамках 
нашей модели конкурентная борьба ведётся только рыночными методами. То есть, 
конкуренты могут влиять на противника путем изменения параметров своего 
производства: себестоимость, время цикла, но не могут прямо вмешиваться в 
ситуацию на рынке («назначать» цену или влиять на потребителей каким-либо иным 
способом.) Будем считать, что постоянные издержки пренебрежимо малы, и в 
модели учитывать не будем. В этом случае динамика изменения объемов продаж 
фирмы 1 и фирмы 2 описывается следующей системой уравнений:

$\frac{dM_1}{d\Theta}=M_1-\frac{b}{c_1}M_1M_2-\frac{a_1}{c_1}M_1^2$

$\frac{dM_2}{d\Theta}=\frac{c_2}{c_1}M_2-\frac{b}{c_1}M_1M_2-\frac{a_2}{c_1}M_2^2$

где $a_1=\frac{p_{cr}}{\tau_1^2\widetilde{p_1}^2Nq}$,
$a_2=\frac{p_{cr}}{\tau_2^2\widetilde{p_2}^2Nq}$,
$b=\frac{p_{cr}}{\tau_1^2\widetilde{p_1}^2\tau_2^2\widetilde{p_2}^2Nq}$,
$c_1=\frac{p_{cr}-\widetilde{p_1}}{\tau_1\widetilde{p_1}}$,
$c_2=\frac{p_{cr}-\widetilde{p_2}}{\tau_2\widetilde{p_2}}$.

Также введена нормировка $t=c_1\Theta$.

Случай 2. Рассмотрим модель, когда, помимо экономического фактора
влияния (изменение себестоимости, производственного цикла, использование 
кредита и т.п.), используются еще и социально-психологические факторы –
формирование общественного предпочтения одного товара другому, не зависимо от 
их качества и цены. В этом случае взаимодействие двух фирм будет зависеть друг 
от друга, соответственно коэффициент перед 
$M_1M_2$ будет отличаться. Пусть в рамках рассматриваемой модели динамика изменения объемов продаж фирмы 1 и фирмы 2 описывается следующей системой уравнений:

$\frac{dM_1}{d\Theta}=M_1-(\frac{b}{c_1}+0.00069)M_1M_2-\frac{a_1}{c_1}M_1^2$

$\frac{dM_2}{d\Theta}=\frac{c_2}{c_1}M_2-\frac{b}{c_1}M_1M_2-\frac{a_2}{c_1}M_2^2$
---
Для обоих случаев рассмотрим задачу со следующими начальными условиями и параметрами:

$M_0^1=7.5, M_0^2=6.5$,

$p_{cr}=40,N=45,q=1,$

$\tau_1=20,\tau_2=25,$

$\widetilde{p_1}=15.5,\widetilde{p_2}=9$

1. Постройте графики изменения оборотных средств фирмы 1 и фирмы 2 без 
учета постоянных издержек и с веденной нормировкой для случая 1.
2. Постройте графики изменения оборотных средств фирмы 1 и фирмы 2 без 
учета постоянных издержек и с веденной нормировкой для случая 2.
---

### Задачи.
1. Реализовать модель "конкуренция двух фирм" и построить графики изменения оборотных средств фирмы 1 и фирмы 2 без учета постоянных издержек и с веденной нормировкой для случаев 1 и 2 на языке Julia. 
2. Реализовать модель "конкуренция двух фирм" и построить графики изменения оборотных средств фирмы 1 и фирмы 2 без учета постоянных издержек и с веденной нормировкой для случаев 1 и 2 на языке OpenModelica. 

## 1 задание
```
using Plots;
using DifferentialEquations;

const M1_0 = 7.5 #working capital of the 1st firm
const M2_0 = 6.5 #working capital of the 2nd firm
const p_cr = 40 #critical cost of the product
const N = 45 #number of consumers of the produced product
const q = 1 #maximum need of one person for a product per unit of time
const t1 = 20 #production cycle duration for 1st firm
const p1 = 15.5 #market price of the product for 1st firm
const t2 = 25 #production cycle duration for 2nd firm
const p2 = 9 #market price of the product for 2nd firm

const a1 = p_cr / (t1 * t1 * p1 * p1 * N * q)
const a2 = p_cr / (t2 * t2 * p2 * p2 * N * q)
const b = p_cr / (t1 * t1 * p1 * p1 * t2 * t2 * p2 * p2 * N * q)
const c1 = (p_cr - p1) / (t1 * p1)
const c2 = (p_cr - p2) / (t2 * p2)

function equations_system(du, u, p, t)
    M1, M2 = u
    du[1] = M1 - (b / c1) * M1 * M2 - (a1 / c1) * M1 * M1
    du[2] = (c2 / c1) * M2 - (b / c1) * M1 * M2 - (a2 / c1) * M2 * M2
end

u0 = [M1_0, M2_0]
timeSpan = (0.0, 20.0)

problem = ODEProblem(equations_system, u0, timeSpan)
solution = solve(problem, dtmax = 0.01)

M1 = [u[1] for u in solution.u]
M2 = [u[2] for u in solution.u]
time = [t for t in solution.t]

plot(time, M1, label = "оборотные средства фирмы №1",legend = true, title = "Изменение оборотных средств\n(1-й сценарий)")
plot!(time, M2, label = "оборотные средства фирмы №2")
savefig("julia_1.png")
```
---
![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab8/Screenshots/julia_1.png)

---
```
using Plots;
using DifferentialEquations;

const M1_0 = 7.5 #working capital of the 1st firm
const M2_0 = 6.5 #working capital of the 2nd firm
const p_cr = 40 #critical cost of the product
const N = 45 #number of consumers of the produced product
const q = 1 #maximum need of one person for a product per unit of time
const t1 = 20 #production cycle duration for 1st firm
const p1 = 15.5 #market price of the product for 1st firm
const t2 = 25 #production cycle duration for 2nd firm
const p2 = 9 #market price of the product for 2nd firm

const a1 = p_cr / (t1 * t1 * p1 * p1 * N * q)
const a2 = p_cr / (t2 * t2 * p2 * p2 * N * q)
const b = p_cr / (t1 * t1 * p1 * p1 * t2 * t2 * p2 * p2 * N * q)
const c1 = (p_cr - p1) / (t1 * p1)
const c2 = (p_cr - p2) / (t2 * p2)

function equations_system(du, u, p, t)
    M1, M2 = u
    du[1] = M1 - (b / c1 + 0.00069) * M1 * M2 - (a1 / c1) * M1 * M1
    du[2] = (c2 / c1) * M2 - (b / c1) * M1 * M2 - (a2 / c1) * M2 * M2
end

u0 = [M1_0, M2_0]
timeSpan = (0.0, 20.0)

problem = ODEProblem(equations_system, u0, timeSpan)
solution = solve(problem, dtmax = 0.01)

M1 = [u[1] for u in solution.u]
M2 = [u[2] for u in solution.u]
time = [t for t in solution.t]

plot(time, M1, label = "оборотные средства фирмы №1",legend = true, title = "Изменение оборотных средств\n(2-й сценарий)")
plot!(time, M2, label = "оборотные средства фирмы №2")
savefig("julia_2.png")
```
---
![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab8/Screenshots/julia_2.png)

---
## 2 задание
```
model model_1
constant Real p_cr = 40; //critical cost of the product
constant Real N = 45; //number of consumers of the produced product
constant Real q = 1; //maximum need of one person for a product per unit of time
constant Real t1 = 20; //production cycle duration for 1st firm
constant Real p1 = 15.5; //market price of the product for 1st firm
constant Real t2 = 25; //production cycle duration for 2nd firm
constant Real p2 = 9; //market price of the product for 2nd firm

constant Real a1 = p_cr / (t1 * t1 * p1 * p1 * N * q);
constant Real a2 = p_cr / (t2 * t2 * p2 * p2 * N * q);
constant Real b = p_cr / (t1 * t1 * p1 * p1 * t2 * t2 * p2 * p2 * N * q);
constant Real c1 = (p_cr - p1) / (t1 * p1);
constant Real c2 = (p_cr - p2) / (t2 * p2);

Real M1; //working capital of the 1st firm
Real M2; //working capital of the 2nd firm

initial equation
M1 = 7.5;
M2 = 6.5;

equation
der(M1) = M1 - (b / c1) * M1 * M2 - (a1 / c1) * M1 * M1;
der(M2) = (c2 / c1) * M2 - (b / c1) * M1 * M2 - (a2 / c1) * M2 * M2;

end model_1;
```
---
![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab8/Screenshots/om_1.png)

---
```
model model_2
constant Real p_cr = 40; //critical cost of the product
constant Real N = 45; //number of consumers of the produced product
constant Real q = 1; //maximum need of one person for a product per unit of time
constant Real t1 = 20; //production cycle duration for 1st firm
constant Real p1 = 15.5; //market price of the product for 1st firm
constant Real t2 = 25; //production cycle duration for 2nd firm
constant Real p2 = 9; //market price of the product for 2nd firm

constant Real a1 = p_cr / (t1 * t1 * p1 * p1 * N * q);
constant Real a2 = p_cr / (t2 * t2 * p2 * p2 * N * q);
constant Real b = p_cr / (t1 * t1 * p1 * p1 * t2 * t2 * p2 * p2 * N * q);
constant Real c1 = (p_cr - p1) / (t1 * p1);
constant Real c2 = (p_cr - p2) / (t2 * p2);

Real M1; //working capital of the 1st firm
Real M2; //working capital of the 2nd firm

initial equation
M1 = 7.5;
M2 = 6.5;

equation
der(M1) = M1 - (b / c1 + 0.00069) * M1 * M2 - (a1 / c1) * M1 * M1;
der(M2) = (c2 / c1) * M2 - (b / c1) * M1 * M2 - (a2 / c1) * M2 * M2;

end model_2;
```

---
![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab8/Screenshots/om_2.png)

##
Спасибо за внимание!
---