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