using QECCore
using Documenter
using LiveServer

DocMeta.setdocmeta!(QECCore, :DocTestSetup, :(using QECCore); recursive=true)

makedocs(;
    modules=[QECCore],
    authors="nzy1997",
    sitename="QECCore.jl",
    format=Documenter.HTML(;
        canonical="https://QuantumSavory.github.io/QECCore.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/QuantumSavory/QECCore.jl",
    devbranch="main",
)
