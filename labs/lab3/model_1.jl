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

savefig(myPlot, "test1.png")