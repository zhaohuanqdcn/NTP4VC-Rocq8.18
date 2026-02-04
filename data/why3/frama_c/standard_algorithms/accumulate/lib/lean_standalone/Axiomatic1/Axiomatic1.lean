namespace Axiomatic1
noncomputable def p_accumulatebounds_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (init_0 : ℤ) := ∀(i : ℤ), let x : ℤ := A_AccumulateAxiomatic.l_accumulate mint_0 a i init_0; i ≤ n → (0 : ℤ) ≤ i → -(2147483648 : ℤ) ≤ x ∧ x ≤ (2147483647 : ℤ)
end Axiomatic1
