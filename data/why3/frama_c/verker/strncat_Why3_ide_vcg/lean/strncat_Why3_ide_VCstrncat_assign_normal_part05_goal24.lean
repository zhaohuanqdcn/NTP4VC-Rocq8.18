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
namespace strncat_Why3_ide_VCstrncat_assign_normal_part05_goal24
theorem goal24 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := A_Strlen.l_strlen t_1 a; let a_2 : Memory.addr := Memory.shift a x; let x_1 : ℤ := A_Strnlen.l_strnlen t_1 a_1 i; let x_2 : ℤ := t_1 (Memory.shift a_1 x_1); ¬i = (0 : ℤ) → t_1 a_2 = (0 : ℤ) → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → (0 : ℤ) ≤ x_1 → i + x ≤ (18446744073709551615 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint64 i → A_Strlen.p_valid_str t t_1 a → Cint.is_uint64 x → A_Strnlen.p_valid_strn t t_1 a_1 i → Cint.is_uint64 x_1 → Memory.addr_le a a_2 → Memory.addr_le a_2 a_2 → Cint.is_sint8 x_2 → A_Strlen.p_valid_str t t_1 a_2 → Memory.valid_rw t (Memory.shift a (0 : ℤ)) ((1 : ℤ) + i + x) → ¬Memory.invalid t a_2 ((1 : ℤ) + x_1) → ((∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 ≤ i → ¬t_1 (Memory.shift a_1 i_1) = (0 : ℤ)) → x_1 = i) → ((∃(i_1 : ℤ), t_1 (Memory.shift a_1 i_1) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_1 ∧ i_1 ≤ i) → x_2 = (0 : ℤ)) → ((∃(i_1 : ℤ), t_1 (Memory.shift a_1 i_1) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_1 ∧ i_1 ≤ i) → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 < x_1 → ¬t_1 (Memory.shift a_1 i_1) = (0 : ℤ))) → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 < x → ¬t_1 (Memory.shift a i_1) = (0 : ℤ)) → x_1 ≤ i
  := sorry
end strncat_Why3_ide_VCstrncat_assign_normal_part05_goal24
