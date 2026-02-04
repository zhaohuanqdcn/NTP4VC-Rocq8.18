namespace Compound
end Compound
namespace Axiomatic
noncomputable def p_sorted_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) := ∀(i_1 : ℤ) (i : ℤ), i < n → m ≤ i_1 → i_1 < i → mint_0 (Memory.shift a i_1) ≤ mint_0 (Memory.shift a i)
noncomputable def p_lowerbound_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (v : ℤ) := ∀(i : ℤ), m ≤ i → i < n → v ≤ mint_0 (Memory.shift a i)
noncomputable def p_strictupperbound_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (v : ℤ) := ∀(i : ℤ), m ≤ i → i < n → mint_0 (Memory.shift a i) < v
end Axiomatic
