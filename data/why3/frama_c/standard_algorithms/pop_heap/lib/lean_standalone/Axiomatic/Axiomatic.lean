namespace Compound
end Compound
namespace Axiomatic
noncomputable def p_unchanged_1' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) := ∀(i : ℤ), let a_1 : Memory.addr := Memory.shift a i; m ≤ i → i < n → mint_1 a_1 = mint_0 a_1
noncomputable def p_upperbound_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (v : ℤ) := ∀(i : ℤ), m ≤ i → i < n → mint_0 (Memory.shift a i) ≤ v
noncomputable def p_maxelement (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (max_0 : ℤ) := (0 : ℤ) ≤ max_0 ∧ max_0 < n ∧ p_upperbound_1' mint_0 a (0 : ℤ) n (mint_0 (Memory.shift a max_0))
noncomputable def l_heapparent (i : ℤ) := Int.tdiv (i - (1 : ℤ)) (2 : ℤ)
noncomputable def p_isheap (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) := ∀(i : ℤ), (0 : ℤ) < i → i < n → mint_0 (Memory.shift a i) ≤ mint_0 (Memory.shift a (l_heapparent i))
noncomputable def l_heapright (i : ℤ) := (2 : ℤ) + (2 : ℤ) * i
noncomputable def l_heapleft (i : ℤ) := (1 : ℤ) + (2 : ℤ) * i
end Axiomatic
