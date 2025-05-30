module QECCore

# interfaces
export distance, parity_matrix, code_n, code_s, code_k, parity_matrix_x, parity_matrix_z, rate

# codes 
export Perfect5

include("interfaces.jl")
include("codes/fivequbit.jl")
end
