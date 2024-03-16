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
