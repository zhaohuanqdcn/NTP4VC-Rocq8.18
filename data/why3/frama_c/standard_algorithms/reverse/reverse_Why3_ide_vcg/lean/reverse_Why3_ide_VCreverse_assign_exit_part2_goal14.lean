import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.reverse.lib.lean.Compound.Compound
import frama_c.standard_algorithms.reverse.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace reverse_Why3_ide_VCreverse_assign_exit_part2_goal14
theorem goal14 (i : ℤ) (a : Memory.addr) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let x : ℤ := Int.tdiv i (2 : ℤ); let x_1 : ℤ := Cint.to_uint32 (i - (1 : ℤ)); let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let a_2 : Memory.addr := Memory.shift a i_1; let a_3 : Memory.addr := Memory.shift a (i - (1 : ℤ) - i_1); let a_4 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_1 i; let x_3 : ℤ := i - i_1; (0 : ℤ) < i → (0 : ℤ) ≤ i_1 → i_1 < x → i_1 ≤ x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i_1 + x ≤ i → i_1 ≤ x_1 → x_1 ≤ (4294967295 : ℤ) + i_1 → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 x → Memory.valid_rw t a_1 i → Memory.valid_rw t a_2 (1 : ℤ) → Memory.valid_rw t a_3 (1 : ℤ) → Axiomatic.p_unchanged_1' a_4 t_2 a i_1 x_3 → Axiomatic.p_reverse_4' a_4 t_2 a (0 : ℤ) i_1 x_3 → Axiomatic.p_reverse_4' a_4 t_2 a x_3 i (0 : ℤ) → (¬Memory.invalid t a_2 (1 : ℤ) → Memory.included a_2 (1 : ℤ) a_1 i) ∧ (¬Memory.invalid t a_3 (1 : ℤ) → Memory.included a_3 (1 : ℤ) a_1 i)
  := sorry
end reverse_Why3_ide_VCreverse_assign_exit_part2_goal14
