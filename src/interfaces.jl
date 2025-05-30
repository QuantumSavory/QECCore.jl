"""Parity check boolean matrix of a code (only the X entries in the tableau, i.e. the checks for Z errors).

Only CSS codes have this method.

See also: [`parity_checks`](@ref)"""
function parity_checks_x(code::AbstractECC)
    throw(lazy"Codes of type $(typeof(code)) do not have separate X and Z parity checks, either because they are not a CSS code and thus inherently do not have separate checks, or because its separate checks are not yet implemented in this library.")
end

"""Parity check boolean matrix of a code (only the Z entries in the tableau, i.e. the checks for X errors).

Only CSS codes have this method.

See also: [`parity_checks`](@ref)"""
function parity_checks_z(code::AbstractECC)
    throw(lazy"Codes of type $(typeof(code)) do not have separate X and Z parity checks, either because they are not a CSS code and thus inherently do not have separate checks, or because its separate checks are not yet implemented in this library.")
end

"""The number of physical qubits in a code."""
function code_n end

nqubits(c::AbstractECC) = code_n(c::AbstractECC)

code_n(c::AbstractECC) = code_n(parity_checks(c))

code_n(s::Stabilizer) = nqubits(s)

"""The number of stabilizer checks in a code. They might not be all linearly independent, thus `code_s >= code_n-code_k`. For the number of linearly independent checks you can use `LinearAlgebra.rank`."""
function code_s end
code_s(s::Stabilizer) = length(s)
code_s(c::AbstractECC) = code_s(parity_checks(c))

"""
The number of logical qubits in a code.

Note that when redundant rows exist in the parity check matrix, the number of logical qubits `code_k(c)` will be greater than `code_n(c) - code_s(c)`, where the difference equals the redundancy.
"""
function code_k(s::Stabilizer)
    _, _, r = canonicalize!(Base.copy(s), ranks=true)
    return code_n(s) - r
end

code_k(c::AbstractECC) = code_k(parity_checks(c))

"""The rate of a code."""
function rate(c)
    rate = code_k(c)//code_n(c)
    return rate
end


"""The distance of a code."""
function distance end

"""Parity matrix of a code, given as a stabilizer tableau."""
function parity_matrix(c::AbstractECC)
    paritym = stab_to_gf2(parity_checks(c::AbstractECC))
    return paritym
end