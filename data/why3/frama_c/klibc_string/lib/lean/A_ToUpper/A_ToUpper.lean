import Why3.Base
import Why3.Qed.Qed
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Axiomatic2.Axiomatic2
open Classical
open Lean4Why3
namespace A_ToUpper
axiom l_toupper : ℤ -> ℤ
axiom Q_TL_ToUpper (c : ℤ) (fact0 : Cint.is_uint8 c) : Cint.is_sint8 (l_toupper c)
axiom Q_to_upper_char (c : ℤ) (fact0 : Cint.is_uint8 c) (fact1 : Axiomatic2.p_is_lower c) : (32 : ℤ) + l_toupper c = c ∧ (∀(i : ℤ), Cint.is_uint8 i → Axiomatic2.p_is_upper i → l_toupper i = i ∧ (∀(i_1 : ℤ), Cint.is_uint8 i_1 → ¬Axiomatic2.p_is_lower i_1 → ¬Axiomatic2.p_is_upper i_1 → l_toupper i_1 = i_1))
end A_ToUpper
