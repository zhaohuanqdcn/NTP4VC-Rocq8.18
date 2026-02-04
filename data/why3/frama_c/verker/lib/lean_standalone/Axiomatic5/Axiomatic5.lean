namespace Axiomatic5
noncomputable def p_kstrtobool_fmt_false (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) := let x : ℤ := mchar_0 (Memory.shift s (0 : ℤ)); let x_1 : ℤ := mchar_0 (Memory.shift s (1 : ℤ)); x = (48 : ℤ) ∨ x = (78 : ℤ) ∨ x = (110 : ℤ) ∨ (x = (79 : ℤ) ∨ x = (111 : ℤ)) ∧ (x_1 = (70 : ℤ) ∨ x_1 = (102 : ℤ))
noncomputable def p_kstrtobool_fmt_true (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) := let x : ℤ := mchar_0 (Memory.shift s (0 : ℤ)); let x_1 : ℤ := mchar_0 (Memory.shift s (1 : ℤ)); x = (49 : ℤ) ∨ x = (89 : ℤ) ∨ x = (121 : ℤ) ∨ (x = (79 : ℤ) ∨ x = (111 : ℤ)) ∧ (x_1 = (78 : ℤ) ∨ x_1 = (110 : ℤ))
noncomputable def p_kstrtobool_fmt (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) := p_kstrtobool_fmt_false mchar_0 s ∨ p_kstrtobool_fmt_true mchar_0 s
end Axiomatic5
