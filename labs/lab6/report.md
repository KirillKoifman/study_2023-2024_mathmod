# РОССИЙСКИЙ УНИВЕРСИТЕТ ДРУЖБЫ НАРОДОВ

### Факультет физико-математических и естественных наук 

<br/>
<br/>
<br/>
<br/>

ОТЧЕТ
ПО ЛАБОРАТОРНОЙ РАБОТЕ №6
===============
## Модель "эпидемия"

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
Разработать решение для модели "эпидемия" с помощью математического моделирования на языках Julia и OpenModelica.

### Описание задания
На одном острове вспыхнула эпидемия. Известно, что из всех проживающих 
на острове $(N=13013)$ в момент начала эпидемии $(t=0)$ число заболевших людей 
(являющихся распространителями инфекции) $I(0)=113$, а число здоровых людей с 
иммунитетом к болезни $R(0)=31$. Таким образом, число людей восприимчивых к 
болезни, но пока здоровых, в начальный момент времени $S(0)=N-I(0)- R(0)$.

Постройте графики изменения числа особей в каждой из трех групп. 

Рассмотрите, как будет протекать эпидемия в случае: 
1) если $I(0)\leq I^*$
2) если $I(0)> I^*$

### Задачи.
1. Реализовать модель "эпидемии" и построить графики изменения числа особей в каждой из 3-х групп для обоих случаев на языке Julia. 
2. Реализовать модель "эпидемии" и построить графики изменения числа особей в каждой из 3-х групп для обоих случаев на языке OpenModelica. 

## Ход работы
### 1 задание
---
Реализуем данную модель на языке Julia и построим графики изменения численности каждой из 3-х групп в процессе эпидемии для обоих случаев: 
- в случае $I(0)\leq I^*$(начальная численность инфицированных меньше или равна критичнскому значению)(рис.1); 
- в случае $I(0)>I^*$(начальная численность инфицированных больше критического значения)(рис.2); 

```
using Plots;
using DifferentialEquations;

const N = 13013 #number of all citizens living on the island
const I0 = 113 #number of infected people at t=0
const R0 = 31 #number of immune people at t=0
const S0 = N - I0 - R0 #number of healthy people at t=0
const alpha = 0.23 #coefficient of disease
const beta = 0.085  #coefficient of recure

function equations_system(du, u, p, t)
    S, I, R = u
    du[1] = 0
    du[2] = -beta * u[2]
    du[3] = beta * I
end

u0 = [S0, I0, R0]
timeSpan = (0.0, 80.0)

problem = ODEProblem(equations_system, u0, timeSpan)
solution = solve(problem, dtmax = 0.01)

S = [u[1] for u in solution.u] #number of healthy people during 'time'
I = [u[2] for u in solution.u] #number of infected people during 'time'
R = [u[3] for u in solution.u] #number of immune people during 'time'
time = [t for t in solution.t] #defined period of epidemia

plot(time, S, label = "Восприимчивые к болезни", color = :blue, legend = :top, title = "Протекание эпидемии\n(1-й сценарий)")
plot!(time, I, label = "Инфицированные", color = :green)
plot!(time, R, label = "Носители иммунитета", color = :red)
savefig("julia_1.png")
```

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab6/Screenshots/julia_1.png)
<br/>*РИС.1(протекание эпидемии при 1-м сценарии)*

```
using Plots;
using DifferentialEquations;

const N = 13013 #number of all citizens living on the island
const I0 = 113 #number of infected people at t=0
const R0 = 31 #number of immune people at t=0
const S0 = N - I0 - R0 #number of healthy people at t=0
const alpha = 0.23 #coefficient of disease
const beta = 0.085  #coefficient of recure

function equations_system(du, u, p, t)
    S, I, R = u
    du[1] = -alpha * u[1]
    du[2] = alpha * u[1] - beta * u[2]
    du[3] = beta * I
end

u0 = [S0, I0, R0]
timeSpan = (0.0, 80.0)

problem = ODEProblem(equations_system, u0, timeSpan)
solution = solve(problem, dtmax = 0.01)

S = [u[1] for u in solution.u] #number of healthy people during 'time'
I = [u[2] for u in solution.u] #number of infected people during 'time'
R = [u[3] for u in solution.u] #number of immune people during 'time'
time = [t for t in solution.t] #defined period of epidemia

plot(time, S, label = "Восприимчивые к болезни", color = :blue, legend = :top, title = "Протекание эпидемии\n(2-й сценарий)")
plot!(time, I, label = "Инфицированные", color = :green)
plot!(time, R, label = "Носители иммунитета", color = :red)
savefig("julia_2.png")
```

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab6/Screenshots/julia_2.png)
<br/>*РИС.2(протекание эпидемии при 2-м сценарии)*

Исходя из данных, полученных от графиков на рис.1, рис.2, при таких коэффициентах заболеваемости и выздоровления в 1-м случае мы можем наблюдать быстрые рост и падение числа людей с иммунитетом и инфицированных соответственно. При этом количество здоровых, но восприимчивых к болезни людей остаётся неизменных напротяжении всей эпидемии по причине того, что в такой модели заражённые изолированы и не могут заражать здоровых людей.

Тем не менее, во 2-й модели можно увидеть иное развитие эпидемии. При реализации такой модели здоровые люди могут быть заражены инфицированы, что и видно на графике: быстрый рост инфицированных, стремительное падение числа восприимчивых к болезни и соответствующий рост количества переболевших, то есть людей с иммунитетом.
### 2 задание
---
Теперь реализуем данную модель на языке OpenModelica и построим графики изменения численности каждой из 3-х групп в процессе эпидемии для обоих случаев: 
- в случае $I(0)\leq I^*$(начальная численность инфицированных меньше или равна критичнскому значению)(рис.3); 
- в случае $I(0)>I^*$(начальная численность инфицированных больше критического значения)(рис.4); 

```
model model_1
  constant Real N = 13013; //number of all citizens living on the island
  Real I; //number of infected people at t=0
  Real R; //number of immune people at t=0
  Real S; //number of healthy people at t=0
  constant Real alpha = 0.23; //coefficient of disease
  constant Real beta = 0.085;  //coefficient of recure
  
initial equation
  I = 113;
  R = 31;
  S = N - I - R;
  
equation
  der(S) = 0;
  der(I) = -beta * I;
  der(R) = beta * I;

end model_1;
```

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab6/Screenshots/om_1.png)
<br/>*РИС.3(протекание эпидемии при 1-м сценарии)*

```
model model_2
  constant Real N = 13013; //number of all citizens living on the island
  Real I; //number of infected people at t=0
  Real R; //number of immune people at t=0
  Real S; //number of healthy people at t=0
  constant Real alpha = 0.23; //coefficient of disease
  constant Real beta = 0.085;  //coefficient of recure
  
initial equation
  I = 113;
  R = 31;
  S = N - I - R;
  
equation
  der(S) = -alpha * S;
  der(I) = alpha * S - beta * I;
  der(R) = beta * I;

end model_2;
```

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab6/Screenshots/om_2.png)
<br/>*РИС.4(протекание эпидемии при 2-м сценарии)*

Исходя из полученных данных (рис.3, рис.4), мы получили результаты, идентичные тем, что были представлены в ходе выполнения 1-го задания.

## Заключение
В ходе продеданной лабораторной работы мной были усвоены навыки решения задачи математического моделирования с применением языков программирования для работы с математическими вычислениями Julia и OpenModelica.