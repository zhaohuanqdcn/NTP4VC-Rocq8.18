namespace Axiomatic1
noncomputable def p_multisetadd (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (val_0 : ℤ) := (1 : ℤ) + A_Count.l_count_1' mint_1 a (0 : ℤ) n val_0 = A_Count.l_count_1' mint_0 a (0 : ℤ) n val_0
noncomputable def p_multisetminus (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (val_0 : ℤ) := (1 : ℤ) + A_Count.l_count_1' mint_0 a (0 : ℤ) n val_0 = A_Count.l_count_1' mint_1 a (0 : ℤ) n val_0
noncomputable def p_multisetretain (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (v : ℤ) := A_Count.l_count_1' mint_1 a (0 : ℤ) n v = A_Count.l_count_1' mint_0 a (0 : ℤ) n v
noncomputable def p_multisetretainrest_3' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (n : ℤ) (v : ℤ) (w : ℤ) := ∀(i : ℤ), ¬i = v → ¬i = w → Cint.is_sint32 i → p_multisetretain mint_0 mint_1 a n i
noncomputable def p_multisetunchanged_1' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (first_0 : ℤ) (last_0 : ℤ) := ∀(i : ℤ), Cint.is_sint32 i → A_Count.l_count_1' mint_1 a first_0 last_0 i = A_Count.l_count_1' mint_0 a first_0 last_0 i
end Axiomatic1
