import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_CheckBytes8.A_CheckBytes8
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace check_bytes8_Why3_ide_VCcheck_bytes8_loop_inv_2_preserved_goal3
theorem goal3 (a_1 : Memory.addr) (i : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.offset a_1; let x_1 : ℤ := i + x; let x_2 : ℤ := Memory.addr.offset a; let x_3 : ℤ := t_1 a; let x_4 : ℤ := i + x - x_2; let a_2 : Memory.addr := Memory.shift a_1 i; let a_3 : Memory.addr := Memory.shift a (1 : ℤ); ¬x_1 = x_2 → A_CheckBytes8.l_check_bytes8 t_1 a x_3 x_4 = A_CheckBytes8.l_check_bytes8 t_1 a_1 x_3 i → x ≤ x_2 → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → x_2 ≤ x_1 → Memory.linked t → Cint.is_uint32 i → Memory.addr_le a_1 a → Cint.is_uint8 x_3 → Memory.addr_le a a_2 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i → Cint.is_uint32 x_4 → (∀(a_4 : Memory.addr), Memory.addr_lt a_4 a → Memory.addr_le a_1 a_4 → x_3 = t_1 a_4) → Memory.addr_le a_1 a_3 ∧ Memory.addr_le a_3 a_2
  := sorry
end check_bytes8_Why3_ide_VCcheck_bytes8_loop_inv_2_preserved_goal3
