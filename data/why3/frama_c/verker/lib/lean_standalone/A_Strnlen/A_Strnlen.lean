namespace A_Strnlen
noncomputable def p_valid_strn (malloc_0 : ℤ -> ℤ) (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) (cnt_0 : ℤ) := let a : Memory.addr := Memory.shift s (0 : ℤ); Memory.valid_rw malloc_0 a ((1 : ℤ) + cnt_0) ∨ (∃(i : ℤ), mchar_0 (Memory.shift s i) = (0 : ℤ) ∧ i < cnt_0 ∧ Cint.is_uint64 i ∧ Memory.valid_rw malloc_0 a ((1 : ℤ) + i)) ∧ (∀(j : ℤ), j ≤ cnt_0 → Cint.is_sint8 (mchar_0 (Memory.shift s j)))
axiom l_strnlen : (Memory.addr -> ℤ) -> Memory.addr -> ℤ -> ℤ
axiom fix_l_strnlen (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) (cnt_0 : ℤ) : if cnt_0 = (0 : ℤ) ∨ mchar_0 (Memory.shift s (0 : ℤ)) = (0 : ℤ) then l_strnlen mchar_0 s cnt_0 = (0 : ℤ) else Cint.to_uint64 ((1 : ℤ) + l_strnlen mchar_0 (Memory.shift s (1 : ℤ)) (Cint.to_uint64 (cnt_0 - (1 : ℤ)))) = l_strnlen mchar_0 s cnt_0
axiom Q_TL_strnlen (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) (cnt_0 : ℤ) : Cint.is_uint64 (l_strnlen mchar_0 s cnt_0)
end A_Strnlen
