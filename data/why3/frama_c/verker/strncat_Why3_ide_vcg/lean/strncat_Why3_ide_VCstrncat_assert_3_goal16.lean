import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strnlen.A_Strnlen
open Classical
open Lean4Why3
namespace strncat_Why3_ide_VCstrncat_assert_3_goal16
theorem goal16 (t_2 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (i_2 : ℤ) (t_1 : Memory.addr -> ℤ) (i_3 : ℤ) (i_1 : ℤ) (i : ℤ) (t : ℤ -> ℤ) (t_3 : Memory.addr -> ℤ) (a_2 : Memory.addr) (p : Bool) : let x : ℤ := A_Strlen.l_strlen t_2 a; let a_3 : Memory.addr := Memory.shift a x; let x_1 : ℤ := A_Strnlen.l_strnlen t_2 a_1 i_2; let a_4 : Memory.addr := Memory.shift a_1 x_1; let x_2 : ℤ := t_2 a_4; let a_5 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_3 ((1 : ℤ) + x_1); let a_6 : ℤ := a_5 a_1; let a_7 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_3 ((1 : ℤ) + A_Strnlen.l_strnlen t_2 a_1 i_3); let a_8 : Memory.addr := Memory.shift a i_1; let a_9 : Memory.addr := Memory.shift a i; ¬i_2 = (0 : ℤ) → t_2 a_3 = (0 : ℤ) → (0 : ℤ) ≤ i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i_2 + x ≤ (18446744073709551615 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_uint64 i_2 → Cint.is_uint64 i_3 → Memory.addr_le a_1 a_1 → Cint.is_sint8 (t_3 a_2) → A_Strlen.p_valid_str t t_2 a → Cint.is_uint64 x → A_Strnlen.p_valid_strn t t_2 a_1 i_2 → Cint.is_sint8 (t_3 (Memory.shift a_2 (-(1 : ℤ)))) → Cint.is_uint64 x_1 → Memory.addr_le a a_3 → Memory.addr_le a_3 a_3 → Memory.addr_le a_1 a_4 → Cint.is_sint8 x_2 → A_Strlen.p_valid_str t t_2 a_3 → Memory.valid_rw t (Memory.shift a (0 : ℤ)) ((1 : ℤ) + i_2 + x) → Memory.addr_le a_3 (Memory.shift a (x + x_1)) → Cint.is_sint8 a_6 → A_Strlen.p_valid_str t a_5 a_1 → (if a_6 = (0 : ℤ) then p = false ∧ Function.update a_5 a_3 (0 : ℤ) = t_3 ∧ (0 : ℤ) ≤ i ∧ i < x else p = true ∧ i_3 = i_2 ∧ Cint.to_uint64 (i_3 - (1 : ℤ)) = (0 : ℤ) ∧ Memory.shift a ((1 : ℤ) + x) = a_2 ∧ Function.update (Function.update a_7 a_3 (a_7 a_1)) a_2 (0 : ℤ) = t_3 ∧ (0 : ℤ) ≤ i_1 ∧ i_1 < x) → ((∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 ≤ i_2 → ¬t_2 (Memory.shift a_1 i_4) = (0 : ℤ)) → x_1 = i_2) → ((∃(i_4 : ℤ), t_2 (Memory.shift a_1 i_4) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_4 ∧ i_4 ≤ i_2) → x_2 = (0 : ℤ)) → ((∃(i_4 : ℤ), t_2 (Memory.shift a_1 i_4) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_4 ∧ i_4 ≤ i_2) → (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 < x_1 → ¬t_2 (Memory.shift a_1 i_4) = (0 : ℤ))) → (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 < x → ¬t_2 (Memory.shift a i_4) = (0 : ℤ)) → (if p = true then t_3 a_8 = t_2 a_8 else t_3 a_9 = t_2 a_9)
  := sorry
end strncat_Why3_ide_VCstrncat_assert_3_goal16
