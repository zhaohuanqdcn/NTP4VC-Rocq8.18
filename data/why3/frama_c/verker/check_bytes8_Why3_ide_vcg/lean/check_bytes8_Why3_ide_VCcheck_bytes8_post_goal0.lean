import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_CheckBytes8.A_CheckBytes8
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace check_bytes8_Why3_ide_VCcheck_bytes8_post_goal0
theorem goal0 (a_1 : Memory.addr) (a : Memory.addr) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (t : ℤ -> ℤ) (a_2 : Memory.addr) : let x : ℤ := Memory.addr.offset a_1; let x_1 : ℤ := Memory.addr.offset a; let x_2 : ℤ := i_1 + x - x_1; let a_3 : Memory.addr := A_CheckBytes8.l_check_bytes8 t_1 a_1 i i_1; let x_3 : ℤ := i_1 + x; A_CheckBytes8.l_check_bytes8 t_1 a i x_2 = a_3 → x ≤ x_1 → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → x_1 ≤ x_3 → Memory.linked t → Cint.is_uint8 i → Cint.is_uint32 i_1 → Memory.addr_le a_1 a → Memory.addr_le a (Memory.shift a_1 i_1) → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_1 → Cint.is_uint32 x_2 → (if x_3 = x_1 then Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 ∧ a_3 = a_2 else ¬t_1 a = i) → (∀(a_4 : Memory.addr), Memory.addr_lt a_4 a → Memory.addr_le a_1 a_4 → t_1 a_4 = i) → a_3 = a_2
  := sorry
end check_bytes8_Why3_ide_VCcheck_bytes8_post_goal0
