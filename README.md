# Understanding Deep Learning — Julia

Julia ports of the examples and exercises from
**_Understanding Deep Learning_** by Simon J. D. Prince
([udlbook.github.io/udlbook](https://udlbook.github.io/udlbook/)).

The original notebooks are written in Python; this repo reimplements them in
Julia as a way to work through the book.


## Setup

Requires [Julia](https://julialang.org/) (1.9+). Install the project
dependencies:

```julia
using Pkg
Pkg.activate(".")
Pkg.instantiate()
```

## Running

Run a script directly:

```bash
julia --project=. 2_1_Supervise_Learning.jl
```

Or launch the notebooks with IJulia:

```julia
using IJulia
notebook(dir=".")
```

## Dependencies

- `Plots` — figures
- `IJulia` — Jupyter notebooks
- `Revise` — interactive development
