import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_CheckBytes8.A_CheckBytes8
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace check_bytes8_Why3_ide_VCcheck_bytes8_loop_inv_5_preserved_goal8
theorem goal8 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := t_1 a; let x_1 : ℤ := Memory.addr.offset a; let x_2 : ℤ := Memory.addr.offset a_1; let x_3 : ℤ := i + x_1 - x_2; let a_2 : Memory.addr := A_CheckBytes8.l_check_bytes8 t_1 a_1 x x_3; ¬i = (0 : ℤ) → a_2 = A_CheckBytes8.l_check_bytes8 t_1 a x i → (0 : ℤ) ≤ i → x_2 ≤ x_1 → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Memory.addr_le a_1 a → Cint.is_uint8 x → Cint.is_uint32 x_3 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) x_3 → Memory.addr_le a (Memory.shift a_1 x_3) → (∀(a_3 : Memory.addr), Memory.addr_lt a_3 a → Memory.addr_le a_1 a_3 → x = t_1 a_3) → a_2 = A_CheckBytes8.l_check_bytes8 t_1 (Memory.shift a (1 : ℤ)) x (Cint.to_uint32 (i - (1 : ℤ)))
  := sorry
end check_bytes8_Why3_ide_VCcheck_bytes8_loop_inv_5_preserved_goal8
