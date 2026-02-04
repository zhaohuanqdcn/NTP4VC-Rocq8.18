namespace Axiomatic
noncomputable def p_length_of_str_is (malloc_0 : ℤ -> ℤ) (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) (n : ℤ) := mchar_0 (Memory.shift s n) = (0 : ℤ) ∧ (0 : ℤ) ≤ n ∧ Memory.valid_rw malloc_0 (Memory.shift s (0 : ℤ)) ((1 : ℤ) + n) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i → i < n → ¬mchar_0 (Memory.shift s i) = (0 : ℤ))
end Axiomatic
namespace A_Length
axiom l_length : (Memory.addr -> ℤ) -> Memory.addr -> ℤ
axiom Q_string_length (malloc_0 : ℤ -> ℤ) (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) (n : ℤ) (fact0 : Axiomatic.p_length_of_str_is malloc_0 mchar_0 s n) : l_length mchar_0 s = n
end A_Length
namespace Axiomatic1
noncomputable def p_exists_first_occurence_of_char (malloc_0 : ℤ -> ℤ) (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) (c : ℤ) (pos_0 : ℤ) := let x : ℤ := Cint.to_sint8 c; let x_1 : ℤ := A_Length.l_length mchar_0 s; mchar_0 (Memory.shift s pos_0) = x ∧ (0 : ℤ) ≤ pos_0 ∧ pos_0 ≤ x_1 ∧ -(128 : ℤ) ≤ c ∧ c ≤ (127 : ℤ) ∧ Memory.valid_rw malloc_0 (Memory.shift s (0 : ℤ)) ((1 : ℤ) + x_1) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i → i < pos_0 → ¬mchar_0 (Memory.shift s i) = x)
noncomputable def p_char_in_str (mchar_0 : Memory.addr -> ℤ) (s : Memory.addr) (c : ℤ) := ∃(i : ℤ), mchar_0 (Memory.shift s i) = c ∧ (0 : ℤ) ≤ i ∧ i < A_Length.l_length mchar_0 s
end Axiomatic1
