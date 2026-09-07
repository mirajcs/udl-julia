### A Pluto.jl notebook ###
# v1.0.3

using Markdown
using InteractiveUtils

# ╔═╡ cfefe42a-aabb-11f1-9e20-b3ba54431c78
md"# Notebook 6.5 - Adam

This notebook investigates the Adam algorithm as illustrated in figure 6.9 from the book. "

# ╔═╡ 66270d6a-9656-4281-95e6-cbeba0e2b6c3
md"Define function that we wish to find the minimum of (normally would be defined implicitly by data and loss)"

# ╔═╡ 9e7f5e60-8bdc-4f13-abf4-4afa0cc98e8a
function Loss(ϕ₀, ϕ₁)
	height¹ = exp(-0.5* (ϕ₁^2)*4.0)
	height² = height¹*exp(-0.5*(ϕ₀ - 0.7)^2/4.0)
	return 1.0 - height²
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.12.7"
manifest_format = "2.0"
project_hash = "71853c6197a6a7f222db0f1978c7cb232b87c5ee"

[deps]
"""

# ╔═╡ Cell order:
# ╟─cfefe42a-aabb-11f1-9e20-b3ba54431c78
# ╟─66270d6a-9656-4281-95e6-cbeba0e2b6c3
# ╠═9e7f5e60-8bdc-4f13-abf4-4afa0cc98e8a
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
