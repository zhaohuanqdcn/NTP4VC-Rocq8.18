import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Ctype.A_Ctype
open Classical
open Lean4Why3
namespace hex2bin_Why3_ide_VChex2bin_err_fail_post_goal17
theorem goal17 (a : Memory.addr) (a_1 : Memory.addr) (a_2 : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (a_3 : Memory.addr) : let x : ℤ := Memory.addr.offset a; let x_1 : ℤ := Memory.addr.offset a_1; let a_4 : Memory.addr := Memory.shift a_1 (0 : ℤ); Int.tdiv (x - x_1) (2 : ℤ) = (0 : ℤ) → Int.tmod (x_1 - x) (2 : ℤ) = (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Memory.addr_le a_1 a → Memory.addr_le a_1 a_3 → Memory.addr_le a_2 a_2 → ¬A_Ctype.p_isxdigit (t_1 a_3) → Memory.addr_lt a_3 a_4 → Memory.valid_rd t a_4 (1 : ℤ) → Memory.valid_rw t (Memory.shift a_2 (0 : ℤ)) (1 : ℤ) → ¬(∀(a_5 : Memory.addr), Memory.addr_lt a_5 a → Memory.addr_le a_1 a_5 → A_Ctype.p_isxdigit (t_1 a_5))
  := sorry
end hex2bin_Why3_ide_VChex2bin_err_fail_post_goal17
