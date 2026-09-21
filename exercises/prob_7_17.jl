using GLMakie

using Lux, Random, Optimisers, Zygote, MLUtils, Printf

# define input size, hidden layer size, output size.
Dᵢ, Dₖ, D₀ = 10, 40, 5

# Random input generator
rng = Random.default_rng()
Random.seed!(rng, 0)

# create model with two hidden layers
model = Chain(
    Dense(Dᵢ => Dₖ, relu; init_weight=kaiming_normal, init_bias=zeros32),
    Dense(Dₖ => Dₖ, relu; init_weight=kaiming_normal, init_bias=zeros32),
    Dense(Dₖ => D₀, sigmoid; init_weight=kaiming_normal, init_bias=zeros32)
)

# parameters and states 
ps, st = Lux.setup(rng, model)

#Choose binary cross-entropy
criterion = BinaryFocalLoss()

#SGD with Momentum
opt = Optimisers.Momentum(0.1f0, 0.9f0)

# create 100 random data points and store in a data loader
x = randn(rng, Float32, Dᵢ, 100)
y = rand(0:1, D₀, 100)
data_loader = DataLoader((x,y); batchsize=10, shuffle = true)

# bundles model, parameters, states, and Optimisers 
function train(model, ps, st, opt, criterion, data_loader; epochs = 100)
   train_state = Training.TrainState(model, deepcopy(ps), st, opt) 
    losses = Float32[]

    for epoch in 1:epochs 
        epoch_loss = 0.0f0 

        # loop over batches 
        for (x_batch, y_batch) in data_loader
            # forward pass, backward pass, and SGD update in one call
            _, loss, _, train_state = Training.single_train_step!(
                AutoZygote(), criterion, (x_batch, y_batch), train_state
            )

            # update statistics 
            epoch_loss += loss 
        end

        # append the epoch loss to the list 
        push!(losses, epoch_loss)

        # print error 
        @printf("Epoch %5d, loss %.3f\n", epoch, epoch_loss)

        # decrease the learning rate by half every 10 epochs 
        if epoch % 10 == 0
            Optimisers.adjust!(train_state, 0.1f0 * 0.5f0^((epoch + 1) ÷ 10))
        end


    end
    return losses, train_state
end 

losses, train_state = train(model, ps, st, opt, criterion, data_loader)


function PlotLosses(losses)
    fig = Figure(size=(1000, 600))
    ax = Axis(
        fig[1,1];
        title = "Training Loss over Epochs",
        xlabel = "Epochs", 
        ylabel = "Loss",
        ygridcolor = (:grey, 0.2)
    )

    lines!(ax, 1:(length(losses)), losses; color= :red, linewidth = 2)    

    return fig 
end

PlotLosses(losses)

