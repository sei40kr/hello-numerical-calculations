# %%
y0 = 1.0
tspan = (0.0, 1.0)
h = 0.1

# %%
function euler(f, y0, tspan, h)
  t0, tf = tspan
  n = round(Int, (tf - t0) / h)
  t = range(t0, tf, length=n + 1)

  y = zeros(n + 1)
  y[1] = y0
  for i in 1:n
    y[i+1] = y[i] + h * f(t[i], y[i])
  end

  return t, y
end

# %%
f(_, y) = y

t_euler, y_euler = euler(f, y0, tspan, h)

# %%
analytic(t) = exp(t)

y_analytic = analytic.(t_euler)

# %%
using Plots

plot(t_euler, y_euler, label="Euler")
plot!(t_euler, y_analytic, label="Analytic")
xlabel!("t")
ylabel!("y")

# %%

