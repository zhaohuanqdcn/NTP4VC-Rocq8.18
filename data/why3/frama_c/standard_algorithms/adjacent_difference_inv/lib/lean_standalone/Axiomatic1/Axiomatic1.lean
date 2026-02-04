namespace A_AccumulateAxiomatic
axiom l_accumulate_1' : (Memory.addr -> ℤ) -> Memory.addr -> ℤ -> ℤ -> ℤ
axiom Q_TL_Accumulate_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (init_0 : ℤ) : Cint.is_sint32 (l_accumulate_1' mint_0 a n init_0)
axiom Q_AccumulateEmpty (n : ℤ) (init_0 : ℤ) (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (fact0 : n ≤ (0 : ℤ)) (fact1 : Cint.is_sint32 init_0) : l_accumulate_1' mint_0 a n init_0 = init_0
axiom Q_AccumulateNext (n : ℤ) (init_0 : ℤ) (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) : (0 : ℤ) < n → Cint.is_sint32 init_0 → mint_0 (Memory.shift a (n - (1 : ℤ))) + l_accumulate_1' mint_0 a (n - (1 : ℤ)) init_0 = l_accumulate_1' mint_0 a n init_0
axiom Q_AccumulateRead (init_0 : ℤ) (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (fact0 : Cint.is_sint32 init_0) (fact1 : Axiomatic.p_unchanged_1' mint_0 mint_1 a (0 : ℤ) n) : l_accumulate_1' mint_1 a n init_0 = l_accumulate_1' mint_0 a n init_0
end A_AccumulateAxiomatic
namespace Axiomatic1
noncomputable def p_partialsum (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (b : Memory.addr) := ∀(i : ℤ), (0 : ℤ) ≤ i → i < n → mint_0 (Memory.shift b i) = A_AccumulateAxiomatic.l_accumulate_1' mint_0 a ((1 : ℤ) + i) (0 : ℤ)
noncomputable def p_accumulatebounds_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (init_0 : ℤ) := ∀(i : ℤ), let x : ℤ := A_AccumulateAxiomatic.l_accumulate_1' mint_0 a i init_0; i ≤ n → (0 : ℤ) ≤ i → -(2147483648 : ℤ) ≤ x ∧ x ≤ (2147483647 : ℤ)
axiom Q_TL_Accumulate_2' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) : Cint.is_sint32 (A_AccumulateAxiomatic.l_accumulate_1' mint_0 a n (0 : ℤ))
end Axiomatic1
