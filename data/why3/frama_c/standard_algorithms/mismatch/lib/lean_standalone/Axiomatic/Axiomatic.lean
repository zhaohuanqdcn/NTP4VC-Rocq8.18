namespace Axiomatic
noncomputable def p_equalranges_1' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (b : Memory.addr) := ∀(i : ℤ), (0 : ℤ) ≤ i → i < n → mint_1 (Memory.shift a i) = mint_0 (Memory.shift b i)
end Axiomatic
