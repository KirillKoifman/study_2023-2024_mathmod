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