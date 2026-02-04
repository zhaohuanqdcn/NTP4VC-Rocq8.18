namespace Axiomatic12
noncomputable def p_bmatch (mint_0 : Memory.addr -> ℤ) (b1_0 : Memory.addr) (b2_0 : Memory.addr) (n : ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i → i < n → mint_0 (Memory.shift b2_0 i) = mint_0 (Memory.shift b1_0 i)
end Axiomatic12
