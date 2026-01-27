import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strcat_Why3_ide_VCstrcat_loop_term_positive_goal26
theorem goal26 (t_1 : Memory.addr -> ℤ) (a_2 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := t_1 a_2; let x_1 : ℤ := A_Strlen.l_strlen t_1 a; let a_3 : Memory.addr := Memory.shift a x_1; let x_2 : ℤ := A_Strlen.l_strlen t_1 a_1; let x_3 : ℤ := Memory.addr.offset a; let x_4 : ℤ := Memory.addr.offset a_2; ¬x = (0 : ℤ) → t_1 a_3 = (0 : ℤ) → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → x_1 + x_2 ≤ (18446744073709551615 : ℤ) → Memory.linked t → Memory.sconst t_1 → Memory.addr_le a a_2 → Cint.is_sint8 x → A_Strlen.p_valid_str t t_1 a → A_Strlen.p_valid_str t t_1 a_1 → A_Strlen.p_valid_str t t_1 a_2 → Cint.is_uint64 x_1 → Memory.addr_le a_2 a_3 → Memory.valid_rw t (Memory.shift a (0 : ℤ)) ((1 : ℤ) + x_1 + x_2) → (∀(i : ℤ), (0 : ℤ) ≤ i → i < x_1 → ¬t_1 (Memory.shift a i) = (0 : ℤ)) → (∀(i : ℤ), (0 : ℤ) ≤ i → i + x_3 < x_4 → ¬t_1 (Memory.shift a i) = (0 : ℤ)) → x_4 ≤ x_3 + x_1
  := sorry
end strcat_Why3_ide_VCstrcat_loop_term_positive_goal26
