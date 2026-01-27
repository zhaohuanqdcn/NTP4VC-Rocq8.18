import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.copy_backward.lib.lean.Compound.Compound
import frama_c.standard_algorithms.copy_backward.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace copy_backward_Why3_ide_VCcopy_backward_loop_inv_bound_preserved_goal1
theorem goal1 (i_1 : ℤ) (a_1 : Memory.addr) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := i_1 - (1 : ℤ); let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_3 : Memory.addr := Memory.shift a (0 : ℤ); let a_4 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_3 i; (0 : ℤ) < i_1 → i_1 ≤ i → (0 : ℤ) ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 x → Memory.valid_rd t a_2 i → Memory.valid_rw t a_3 i → Memory.separated a_2 i (Memory.shift a i) (1 : ℤ) → Memory.valid_rd t (Memory.shift a_1 x) (1 : ℤ) → Memory.valid_rw t (Memory.shift a x) (1 : ℤ) → Axiomatic.p_unchanged_1' a_4 t_2 a_1 (0 : ℤ) i_1 → Axiomatic.p_equalranges_2' a_4 t_2 a_1 i_1 i a → i_1 ≤ (1 : ℤ) + i
  := sorry
end copy_backward_Why3_ide_VCcopy_backward_loop_inv_bound_preserved_goal1
