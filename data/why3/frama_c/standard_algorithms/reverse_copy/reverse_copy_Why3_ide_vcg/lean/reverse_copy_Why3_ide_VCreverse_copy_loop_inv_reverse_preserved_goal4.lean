import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.reverse_copy.lib.lean.Compound.Compound
import frama_c.standard_algorithms.reverse_copy.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace reverse_copy_Why3_ide_VCreverse_copy_loop_inv_reverse_preserved_goal4
theorem goal4 (i : ℤ) (i_1 : ℤ) (a_1 : Memory.addr) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let x : ℤ := Cint.to_uint32 (i - (1 : ℤ)); let x_1 : ℤ := (1 : ℤ) + i_1; let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_3 : Memory.addr := Memory.shift a (0 : ℤ); let a_4 : Memory.addr := Memory.shift a i_1; let a_5 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_3 i; let x_3 : ℤ := i - (1 : ℤ) - i_1; (0 : ℤ) < i → i_1 ≤ i → (0 : ℤ) ≤ i_1 → i_1 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i_1 ≤ x → i_1 ≤ (4294967294 : ℤ) → x ≤ (4294967295 : ℤ) + i_1 → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 x_1 → Memory.valid_rd t a_2 i → Memory.valid_rw t a_3 i → Memory.valid_rw t a_4 (1 : ℤ) → Memory.separated a_2 i a_3 i → Axiomatic.p_reverse_2' t_2 a_5 a (0 : ℤ) i_1 a_1 (i - i_1) → Memory.valid_rd t (Memory.shift a_1 (Cint.to_uint32 (x - i_1))) (1 : ℤ) → Axiomatic.p_reverse_2' t_2 (Function.update a_5 a_4 (a_5 (Memory.shift a_1 x_3))) a (0 : ℤ) x_1 a_1 x_3
  := sorry
end reverse_copy_Why3_ide_VCreverse_copy_loop_inv_reverse_preserved_goal4
