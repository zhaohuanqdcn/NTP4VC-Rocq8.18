import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.rotate_copy.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace rotate_copy_Why3_ide_VCrotate_copy_call_copy_pre_valid_goal6
theorem goal6 (a_1 : Memory.addr) (a : Memory.addr) (i_1 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_3 : Memory.addr := Memory.shift a (0 : ℤ); i_1 ≤ i → (0 : ℤ) ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i ≤ (4294967295 : ℤ) + i_1 → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.valid_rd t a_2 i → Memory.valid_rw t a_3 i → Memory.separated a_2 i a_3 i → Memory.valid_rd t a_2 i_1
  := sorry
end rotate_copy_Why3_ide_VCrotate_copy_call_copy_pre_valid_goal6
