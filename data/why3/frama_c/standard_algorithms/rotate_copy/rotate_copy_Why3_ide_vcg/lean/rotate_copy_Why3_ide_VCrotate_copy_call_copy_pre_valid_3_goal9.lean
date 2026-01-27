import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.rotate_copy.lib.lean.Compound.Compound
import frama_c.standard_algorithms.rotate_copy.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace rotate_copy_Why3_ide_VCrotate_copy_call_copy_pre_valid_3_goal9
theorem goal9 (a_1 : Memory.addr) (a : Memory.addr) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_3 : Memory.addr := Memory.shift a (0 : ℤ); let x : ℤ := i - i_1; let a_4 : Memory.addr := Memory.shift a x; i_1 ≤ i → (0 : ℤ) ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i ≤ (4294967295 : ℤ) + i_1 → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.valid_rd t a_2 i → Memory.valid_rd t a_2 i_1 → Memory.valid_rw t a_3 i → Memory.separated a_2 i a_3 i → Memory.valid_rw t a_4 i_1 → Memory.separated a_2 i_1 a_4 (1 : ℤ) → Axiomatic.p_equalranges_1' (Memory.havoc t_1 t_2 a_4 i_1) t_2 a_1 i_1 a_4 → Memory.valid_rd t (Memory.shift a_1 i_1) x
  := sorry
end rotate_copy_Why3_ide_VCrotate_copy_call_copy_pre_valid_3_goal9
