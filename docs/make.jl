using QECCore
using Documenter
using DocumenterCitations
using LiveServer

DocMeta.setdocmeta!(QECCore, :DocTestSetup, :(using QECCore); recursive=true)

bib = CitationBibliography(joinpath(@__DIR__,"src/references.bib"),style=:authoryear)

makedocs(
    plugins = [bib],
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
        "References" => "references.md",
        "Manual" => "man.md",
    ],
)

deploydocs(;
    repo="github.com/QuantumSavory/QECCore.jl",
    devbranch="main",
)
