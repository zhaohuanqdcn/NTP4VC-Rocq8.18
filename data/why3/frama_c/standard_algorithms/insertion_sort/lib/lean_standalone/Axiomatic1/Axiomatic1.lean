namespace Axiomatic
noncomputable def p_unchanged_1' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) := ∀(i : ℤ), let a_1 : Memory.addr := Memory.shift a i; m ≤ i → i < n → mint_1 a_1 = mint_0 a_1
noncomputable def p_equalranges_1' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (b : Memory.addr) := ∀(i : ℤ), (0 : ℤ) ≤ i → i < n → mint_1 (Memory.shift a i) = mint_0 (Memory.shift b i)
noncomputable def p_equalranges_3' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (b : Memory.addr) (p : ℤ) := p_equalranges_1' mint_0 mint_1 (Memory.shift a m) (n - m) (Memory.shift b p)
noncomputable def p_equalranges_4' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (p : ℤ) := p_equalranges_3' mint_0 mint_1 a m n a p
end Axiomatic
namespace A_Count
axiom l_count_1' : (Memory.addr -> ℤ) -> Memory.addr -> ℤ -> ℤ -> ℤ -> ℤ
axiom Q_CountSectionEmpty (n : ℤ) (m : ℤ) (v : ℤ) (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (fact0 : n ≤ m) (fact1 : Cint.is_sint32 v) : l_count_1' mint_0 a m n v = (0 : ℤ)
axiom Q_CountSectionHit (n : ℤ) (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (v : ℤ) (m : ℤ) : mint_0 (Memory.shift a (n - (1 : ℤ))) = v → m < n → Cint.is_sint32 v → (1 : ℤ) + l_count_1' mint_0 a m (n - (1 : ℤ)) v = l_count_1' mint_0 a m n v
axiom Q_CountSectionMiss (n : ℤ) (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (v : ℤ) (m : ℤ) : ¬mint_0 (Memory.shift a (n - (1 : ℤ))) = v → m < n → Cint.is_sint32 v → l_count_1' mint_0 a m (n - (1 : ℤ)) v = l_count_1' mint_0 a m n v
axiom Q_CountSectionRead (v : ℤ) (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (fact0 : Cint.is_sint32 v) (fact1 : Axiomatic.p_unchanged_1' mint_0 mint_1 a m n) : l_count_1' mint_1 a m n v = l_count_1' mint_0 a m n v
end A_Count
namespace Axiomatic1
noncomputable def p_sorted_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) := ∀(i_1 : ℤ) (i : ℤ), i < n → m ≤ i_1 → i_1 < i → mint_0 (Memory.shift a i_1) ≤ mint_0 (Memory.shift a i)
noncomputable def p_multisetunchanged_1' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (first_0 : ℤ) (last_0 : ℤ) := ∀(i : ℤ), Cint.is_sint32 i → A_Count.l_count_1' mint_1 a first_0 last_0 i = A_Count.l_count_1' mint_0 a first_0 last_0 i
noncomputable def p_strictlowerbound_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (v : ℤ) := ∀(i : ℤ), m ≤ i → i < n → v < mint_0 (Memory.shift a i)
noncomputable def p_upperbound_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (v : ℤ) := ∀(i : ℤ), m ≤ i → i < n → mint_0 (Memory.shift a i) ≤ v
end Axiomatic1
