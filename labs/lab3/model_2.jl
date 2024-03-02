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

savefig(myPlot, "test2.png")