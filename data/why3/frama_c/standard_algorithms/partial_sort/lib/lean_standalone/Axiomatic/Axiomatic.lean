namespace Axiomatic
noncomputable def p_unchanged_1' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) := ∀(i : ℤ), let a_1 : Memory.addr := Memory.shift a i; m ≤ i → i < n → mint_1 a_1 = mint_0 a_1
noncomputable def p_sorted_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) := ∀(i_1 : ℤ) (i : ℤ), i < n → m ≤ i_1 → i_1 < i → mint_0 (Memory.shift a i_1) ≤ mint_0 (Memory.shift a i)
noncomputable def p_partition (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) := (0 : ℤ) ≤ m → m ≤ n → (∀(i_1 : ℤ) (i : ℤ), m ≤ i → i < n → (0 : ℤ) ≤ i_1 → i_1 < m → mint_0 (Memory.shift a i_1) ≤ mint_0 (Memory.shift a i))
end Axiomatic
