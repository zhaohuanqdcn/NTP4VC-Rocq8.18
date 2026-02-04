namespace Compound
end Compound
namespace Axiomatic15
noncomputable def p_valid_size (n : ℤ) := (0 : ℤ) ≤ n ∧ n ≤ (2147483646 : ℤ)
noncomputable def p_rvalid_float_mat_2' (malloc_0 : ℤ -> ℤ) (mptr_0 : Memory.addr -> Memory.addr) (a : Memory.addr) (m : ℤ) (n : ℤ) := p_valid_size m ∧ p_valid_size n ∧ Memory.valid_rd malloc_0 (Memory.shift a (0 : ℤ)) m ∧ (∀(i : ℤ), (0 : ℤ) ≤ i → i < m → Cint.is_sint32 i → Memory.valid_rd malloc_0 (Memory.shift (mptr_0 (Memory.shift a i)) (0 : ℤ)) n)
end Axiomatic15
