# Understanding Deep Learning — Julia

Julia ports of the examples and exercises from
**_Understanding Deep Learning_** by Simon J. D. Prince
([udlbook.github.io/udlbook](https://udlbook.github.io/udlbook/)).

The original notebooks are written in Python; this repo reimplements them in
Julia as a way to work through the book.

This is an **unofficial** port. It is not affiliated with or endorsed by the
author.


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

Launch the notebooks with IJulia:

```julia
using IJulia
notebook(dir=".")
```

## Dependencies

- `Plots` — figures
- `IJulia` — Jupyter notebooks
- `Revise` — interactive development
