using Plots

x = [0.03, 0.19, 0.34, 0.46, 0.78, 0.81, 1.08, 1.18, 1.39, 1.60, 1.65, 1.90]
y = [0.67, 0.85, 1.05, 1.0, 1.40, 1.5, 1.3, 1.54, 1.55, 1.68, 1.73, 1.6]

println(x)
println(y)

# Define 1D linear regression model 
function f(x, ϕ₀, ϕ₁)
    y = ϕ₀ .+ ϕ₁ .* x 
    return y
end

function plot_model(x, y, ϕ₀, ϕ₁)
    scatter(x, y;
        xlims = (0, 2.0),
        ylims = (0, 2.0),
        xlabel = "Input, x",
        ylabel = "Output, y",
        legend = false,
        title = "1D Linear Regression Model")
    
    #Draw line 
    x_line = 0:0.01:2.0
    y_line = f(x_line, ϕ₀, ϕ₁)
    plot!(x_line, y_line, color = :red, lw = 2)
end

plot_model(x, y, 0.82, 0.52)