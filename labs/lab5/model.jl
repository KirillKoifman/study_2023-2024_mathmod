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

plot(solution, idxs=(1,2), xaxis = "x", yaxis = "y", label = "", legend = false, title = "Зависимость изменения численности\n хищников и численности жертв")
savefig("julia_2.png")

x0 = c/d
y0 = a/b
u0 = [x0, y0]
timeSpan = (0.0, 80.0)

problem = ODEProblem(equations_system, u0, timeSpan)
solution = solve(problem, dtmax = 0.01)

plot(solution, label = "", legend = false, title = "Стационарное состояние системы")
savefig("julia_3.png")