import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_CheckBytes8.A_CheckBytes8
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace check_bytes8_Why3_ide_VCcheck_bytes8_assert_2_goal9
theorem goal9 (a : Memory.addr) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.offset a; let x_1 : ℤ := Memory.addr.offset a_1; let x_2 : ℤ := x - x_1; let a_2 : Memory.addr := A_CheckBytes8.l_check_bytes8 t_1 a_1 i x_2; a_2 = A_CheckBytes8.l_check_bytes8 t_1 a i (0 : ℤ) → x_1 ≤ x → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint8 i → Memory.addr_le a_1 a → Cint.is_uint32 x_2 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) x_2 → Memory.addr_le a (Memory.shift a_1 x_2) → (∀(a_3 : Memory.addr), Memory.addr_lt a_3 a → Memory.addr_le a_1 a_3 → t_1 a_3 = i) → a_2 = Memory.addr.mk (0 : ℤ) (0 : ℤ)
  := sorry
end check_bytes8_Why3_ide_VCcheck_bytes8_assert_2_goal9
