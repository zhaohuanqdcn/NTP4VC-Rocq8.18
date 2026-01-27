import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_CheckBytes8.A_CheckBytes8
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace check_bytes8_Why3_ide_VCcheck_bytes8_found_post_2_goal12
theorem goal12 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_2 : Memory.addr) (a_1 : Memory.addr) (i : ℤ) (a_3 : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := t_1 a; let x_1 : ℤ := Memory.addr.offset a_2; let x_2 : ℤ := Memory.addr.offset a_1; let x_3 : ℤ := i + x_1 - x_2; let a_4 : Memory.addr := A_CheckBytes8.l_check_bytes8 t_1 a_2 x i; let x_4 : ℤ := i + x_1; let x_5 : ℤ := t_1 a_1; let a_5 : Memory.addr := Memory.shift a_2 i; ¬t_1 a_3 = x → A_CheckBytes8.l_check_bytes8 t_1 a_1 x x_3 = a_4 → x_1 ≤ x_2 → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → x_2 ≤ x_4 → Memory.linked t → Cint.is_uint32 i → Memory.addr_le a_2 a_1 → Memory.addr_le a_2 a_3 → Cint.is_uint8 x → Cint.is_uint8 x_5 → Memory.addr_lt a_3 a_5 → Memory.addr_le a_1 a_5 → Memory.valid_rd t (Memory.shift a_2 (0 : ℤ)) i → Cint.is_uint32 x_3 → (if x_4 = x_2 then a_4 = Memory.addr.mk (0 : ℤ) (0 : ℤ) else ¬x_5 = x) → ¬(∀(a_6 : Memory.addr), Memory.addr_lt a_6 a_1 → Memory.addr_le a_2 a_6 → x = t_1 a_6)
  := sorry
end check_bytes8_Why3_ide_VCcheck_bytes8_found_post_2_goal12
