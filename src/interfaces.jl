"""
    AbstractECC

Abstract type for error correction code.
"""
abstract type AbstractECC end

"""
    AbstractQECC <: AbstractECC

Abstract type for quantum error correction code.
"""
abstract type AbstractQECC <: AbstractECC end

"""
    AbstractCECC <: AbstractECC

Abstract type for classical error correction code.
"""
abstract type AbstractCECC <: AbstractECC end


"""
    parity_matrix(c::AbstractECC)

The parity check matrix of a error correction code.
"""
function parity_matrix end

"""
    code_n(c::AbstractECC)

The number of physical qubits in a error correction code.
"""
code_n(c::AbstractQECC) = nqubits(parity_matrix(c))
code_n(c::AbstractCECC) = nbits(parity_matrix(c))
nqubits(pm::AbstractMatrix{Bool}) = size(pm, 2) ÷ 2
nbits(pm::AbstractMatrix{Bool}) = size(pm, 2)

"""
    code_s(c::AbstractECC)

The number of stabilizers in a error correction code. They might not be all linearly independent, thus `code_s >= code_n-code_k`. For the number of linearly independent checks you can use `LinearAlgebra.rank`."""
code_s(c::AbstractECC) = nstabilizers(parity_matrix(c))
nstabilizers(pm::AbstractMatrix{Bool}) = size(pm, 1)


"""
    code_k(c::AbstractECC)

The number of logical qubits in a error correction code.
"""
function code_k end

"""
    rate(c::AbstractECC)

The rate of a error correction code.
"""
function rate end

"""
    distance(c::AbstractECC)

The code distance of a error correction code.
"""
function distance end

"""
    AbstractCSSCode <: AbstractQECC

Abstract type for Calderbank-Shor-Steane (CSS) code.
"""
abstract type AbstractCSSCode <: AbstractQECC end

"""
    parity_matrix_x(c::AbstractCSSCode)

Parity check boolean matrix of a code (only the X entries in the tableau, i.e. the checks for Z errors).
Only CSS codes have this method.
"""
function parity_matrix_x end

"""
    parity_matrix_z(c::AbstractCSSCode)

Parity check boolean matrix of a code (only the Z entries in the tableau, i.e. the checks for X errors).
Only CSS codes have this method.
"""
function parity_matrix_z end
