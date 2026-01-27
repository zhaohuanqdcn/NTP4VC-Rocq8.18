import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.rotate.lib.lean.Compound.Compound
import frama_c.standard_algorithms.rotate.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace rotate_Why3_ide_VCrotate_assign_normal_part2_goal5
theorem goal5 (a : Memory.addr) (i_1 : ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let a_2 : Memory.addr := Memory.shift a i_1; let x : ℤ := i - i_1; let a_3 : Memory.addr -> ℤ := Memory.havoc t_1 t_3 a_1 i_1; (0 : ℤ) < i_1 → i_1 ≤ i → i_1 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i ≤ (4294967295 : ℤ) + i_1 → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.valid_rw t a_1 i → Memory.valid_rw t a_1 i_1 → Memory.valid_rw t a_2 x → ¬Memory.invalid t a_2 x → Axiomatic.p_reverse_5' a_3 t_3 a (0 : ℤ) i_1 → Axiomatic.p_reverse_5' (Memory.havoc t_2 a_3 a_2 x) a_3 a_2 (0 : ℤ) x → Memory.included a_2 x a_1 i
  := sorry
end rotate_Why3_ide_VCrotate_assign_normal_part2_goal5
