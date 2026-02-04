namespace A_SkipSpaces
axiom l_skip_spaces : Memory.addr -> Memory.addr
axiom Q_skip_spaces_def (mchar_0 : Memory.addr -> ℤ) (str_0 : Memory.addr) : if mchar_0 str_0 = (32 : ℤ) ∨ mchar_0 str_0 = (23654 : ℤ) ∨ mchar_0 str_0 = (23662 : ℤ) ∨ mchar_0 str_0 = (23666 : ℤ) ∨ mchar_0 str_0 = (23668 : ℤ) then l_skip_spaces (Memory.shift str_0 (1 : ℤ)) = l_skip_spaces str_0 else l_skip_spaces str_0 = str_0
end A_SkipSpaces
