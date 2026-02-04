namespace Axiomatic
noncomputable def p_iota (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (v : ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i → i < n → mint_0 (Memory.shift a i) = v + i
end Axiomatic
