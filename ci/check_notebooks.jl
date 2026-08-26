# Headless check that every cell in each Pluto notebook runs without error.
# Usage: julia --project=. ci/check_notebooks.jl [notebook_dir]
# Exits non-zero if any cell errors, so it can gate CI.
ENV["GKSwstype"] = "100"  # GR: render off-screen, no display needed

import Pluto

nbdir = get(ARGS, 1, pwd())
notebooks = String[]
for (root, _, files) in walkdir(nbdir)
    for f in files
        path = joinpath(root, f)
        if endswith(f, ".jl") && occursin("Pluto.jl notebook", read(path, String))
            push!(notebooks, relpath(path, nbdir))
        end
    end
end

isempty(notebooks) && (println("No Pluto notebooks found in $nbdir"); exit(1))

session = Pluto.ServerSession()
session.options.server.disable_writing_notebook_files = true

total_errors = 0
for nbfile in sort(notebooks)
    path = joinpath(nbdir, nbfile)
    print("▶ $nbfile … ")
    nb = Pluto.SessionActions.open(session, path; run_async=false)
    errored = [c for c in nb.cells if c.errored]
    if isempty(errored)
        println("OK ($(length(nb.cells)) cells)")
    else
        global total_errors += length(errored)
        println("$(length(errored)) ERROR(S)")
        for c in errored
            snippet = first(strip(c.code), 70)
            println("    ✗ ", replace(snippet, "\n" => " ⏎ "))
            println("      → ", strip(string(c.output.body)))
        end
    end
    Pluto.SessionActions.shutdown(session, nb)
end

println("\n", total_errors == 0 ? "All notebooks run clean." :
                                  "$total_errors errored cell(s) total.")
exit(total_errors == 0 ? 0 : 1)
