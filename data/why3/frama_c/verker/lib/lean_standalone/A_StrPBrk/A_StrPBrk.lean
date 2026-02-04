namespace A_StrSpn
noncomputable def p_in_array (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) (c : ℤ) := ∃(a : Memory.addr), mchar_0 a = c ∧ Memory.addr_le s a ∧ Memory.addr_lt a (Memory.shift s (A_Strlen.l_strlen mchar_0 s))
axiom l_strspn : Memory.addr -> Memory.addr -> ℤ
axiom Q_strspn_base_case (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) (accept_0 : Memory.addr) (fact0 : mchar_0 s = (0 : ℤ)) : l_strspn s accept_0 = (0 : ℤ)
axiom Q_strspn_not_in_accept (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) (accept_0 : Memory.addr) : ¬mchar_0 s = (0 : ℤ) → ¬p_in_array mchar_0 accept_0 (mchar_0 s) → l_strspn s accept_0 = (0 : ℤ)
axiom Q_strspn_in_accept (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) (accept_0 : Memory.addr) : ¬mchar_0 s = (0 : ℤ) → p_in_array mchar_0 accept_0 (mchar_0 s) → (1 : ℤ) + l_strspn (Memory.shift s (1 : ℤ)) accept_0 = l_strspn s accept_0
end A_StrSpn
namespace A_StrPBrk
axiom l_strpbrk : Memory.addr -> Memory.addr -> Memory.addr
axiom Q_strpbrk_base_case (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) (ct_0 : Memory.addr) (fact0 : mchar_0 s = (0 : ℤ)) : l_strpbrk s ct_0 = Memory.addr.mk (0 : ℤ) (0 : ℤ)
axiom Q_strpbrk_found (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) (ct_0 : Memory.addr) : ¬mchar_0 s = (0 : ℤ) → A_StrSpn.p_in_array mchar_0 ct_0 (mchar_0 s) → l_strpbrk s ct_0 = s
axiom Q_strpbrk_not_found (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) (ct_0 : Memory.addr) : ¬mchar_0 s = (0 : ℤ) → ¬A_StrSpn.p_in_array mchar_0 ct_0 (mchar_0 s) → l_strpbrk (Memory.shift s (1 : ℤ)) ct_0 = l_strpbrk s ct_0
end A_StrPBrk
