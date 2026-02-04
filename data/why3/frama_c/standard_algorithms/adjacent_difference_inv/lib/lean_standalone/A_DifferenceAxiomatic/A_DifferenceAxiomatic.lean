namespace Compound
end Compound
namespace Axiomatic
noncomputable def p_unchanged_1' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) := ∀(i : ℤ), let a_1 : Memory.addr := Memory.shift a i; m ≤ i → i < n → mint_1 a_1 = mint_0 a_1
end Axiomatic
namespace A_DifferenceAxiomatic
axiom l_difference : (Memory.addr -> ℤ) -> Memory.addr -> ℤ -> ℤ
axiom Q_TL_Difference (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) : Cint.is_sint32 (l_difference mint_0 a n)
axiom Q_DifferenceEmptyOrSingle (n : ℤ) (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (fact0 : n ≤ (0 : ℤ)) : mint_0 (Memory.shift a (0 : ℤ)) = l_difference mint_0 a n
axiom Q_DifferenceNext (n : ℤ) (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (fact0 : (0 : ℤ) < n) : mint_0 (Memory.shift a n) = l_difference mint_0 a n + mint_0 (Memory.shift a (n - (1 : ℤ)))
axiom Q_DifferenceRead (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (fact0 : Axiomatic.p_unchanged_1' mint_0 mint_1 a (0 : ℤ) ((1 : ℤ) + n)) : l_difference mint_1 a n = l_difference mint_0 a n
end A_DifferenceAxiomatic
