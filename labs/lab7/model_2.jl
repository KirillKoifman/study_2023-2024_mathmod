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