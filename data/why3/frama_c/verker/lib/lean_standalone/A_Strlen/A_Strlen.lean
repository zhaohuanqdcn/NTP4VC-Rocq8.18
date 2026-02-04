namespace Compound
end Compound
namespace A_Strlen
noncomputable def p_valid_str (malloc_0 : ℤ -> ℤ) (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) := ∃(i : ℤ), mchar_0 (Memory.shift s i) = (0 : ℤ) ∧ Cint.is_uint64 i ∧ Memory.valid_rw malloc_0 (Memory.shift s (0 : ℤ)) ((1 : ℤ) + i) ∧ (∀(j : ℤ), j ≤ i → Cint.is_sint8 (mchar_0 (Memory.shift s j)))
axiom l_strlen : (Memory.addr -> ℤ) -> Memory.addr -> ℤ
axiom fix_l_strlen (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) : if mchar_0 (Memory.shift s (0 : ℤ)) = (0 : ℤ) then l_strlen mchar_0 s = (0 : ℤ) else Cint.to_uint64 ((1 : ℤ) + l_strlen mchar_0 (Memory.shift s (1 : ℤ))) = l_strlen mchar_0 s
axiom Q_TL_strlen (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) : Cint.is_uint64 (l_strlen mchar_0 s)
end A_Strlen
