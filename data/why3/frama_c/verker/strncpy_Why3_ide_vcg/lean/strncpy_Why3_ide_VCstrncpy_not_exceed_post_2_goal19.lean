import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strnlen.A_Strnlen
open Classical
open Lean4Why3
namespace strncpy_Why3_ide_VCstrncpy_not_exceed_post_2_goal19
theorem goal19 (a_3 : Memory.addr) (a_1 : Memory.addr) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) (t : ℤ -> ℤ) (a_2 : Memory.addr) : let x : ℤ := Memory.addr.base a_3; let x_1 : ℤ := Memory.addr.base a_1; let a_4 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x_2 : ℤ := Memory.addr.offset a_1; let x_3 : ℤ := Memory.addr.offset a; let x_4 : ℤ := x_3 - x_2; ¬x = x_1 → Memory.havoc t_1 t_2 a_4 ((1 : ℤ) + A_Strnlen.l_strnlen t_3 a_3 (0 : ℤ)) = t_3 → x_2 ≤ x_3 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → x_3 < x_2 + A_Strlen.l_strlen t_2 a_3 → Memory.linked t → Memory.sconst t_2 → Memory.addr_le a_1 a → Memory.addr_le a_3 a_2 → A_Strlen.p_valid_str t t_2 a_3 → A_Strlen.p_valid_str t t_3 a_2 → Cint.is_uint64 x_4 → A_Strnlen.p_valid_strn t t_2 a_3 x_4 → A_Strnlen.p_valid_strn t t_3 a x_4 → Memory.addr_le a (Memory.shift a_1 x_4) → Memory.addr_le a_2 (Memory.shift a_3 (A_Strnlen.l_strnlen t_3 a_3 x_4)) → Memory.valid_rw t a_4 ((1 : ℤ) + A_Strnlen.l_strnlen t_2 a_3 x_4) → (∀(i : ℤ), (0 : ℤ) ≤ i → i + Memory.addr.offset a_3 < Memory.addr.offset a_2 → t_3 (Memory.shift a_3 i) = t_3 (Memory.shift a_1 i)) → A_Strnlen.p_valid_strn t t_3 a_1 x_4
  := sorry
end strncpy_Why3_ide_VCstrncpy_not_exceed_post_2_goal19
