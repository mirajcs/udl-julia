# Understanding Deep Learning — Julia

Julia ports of the examples and exercises from
**_Understanding Deep Learning_** by Simon J. D. Prince
([udlbook.github.io/udlbook](https://udlbook.github.io/udlbook/)).

The original notebooks are written in Python (Jupyter); this repo reimplements
them as Julia [Pluto](https://plutojl.org/) notebooks as a way to work through
the book.



## Attribution and licensing

The original notebooks in [udlbook/udlbook](https://github.com/udlbook/udlbook)
are © Simon J. D. Prince and licensed
[CC BY-NC-ND 4.0](https://creativecommons.org/licenses/by-nc-nd/4.0/), whose
NoDerivatives term would otherwise not permit publishing a translated version.
These Julia ports are published with the author's express permission.

The Julia code in this repository is licensed MIT — see [LICENSE](LICENSE).
That covers the port itself; the underlying exercises, figures, and
accompanying text remain the author's work under the terms above.


## Setup

Requires [Julia](https://julialang.org/) (1.9+). Install the project
dependencies:

```julia
using Pkg
Pkg.activate(".")
Pkg.instantiate()
```

## Running

The notebooks are [Pluto](https://plutojl.org/) notebooks (`.jl` files).
Launch Pluto and open one from the file picker:

```julia
using Pluto
Pluto.run()
```

## Dependencies

- `Plots` — figures
- `Pluto` — reactive notebooks
