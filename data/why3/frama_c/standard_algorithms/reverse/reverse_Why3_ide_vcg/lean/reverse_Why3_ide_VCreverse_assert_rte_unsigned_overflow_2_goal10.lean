import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.reverse.lib.lean.Compound.Compound
import frama_c.standard_algorithms.reverse.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace reverse_Why3_ide_VCreverse_assert_rte_unsigned_overflow_2_goal10
theorem goal10 (i : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Int.tdiv i (2 : ℤ); let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let a_2 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_1 i; let x_1 : ℤ := i - i_1; (0 : ℤ) ≤ i_1 → i_1 < x → i_1 ≤ x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i_1 + x ≤ i → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 x → Memory.valid_rw t a_1 i → Axiomatic.p_unchanged_1' a_2 t_2 a i_1 x_1 → Axiomatic.p_reverse_4' a_2 t_2 a (0 : ℤ) i_1 x_1 → Axiomatic.p_reverse_4' a_2 t_2 a x_1 i (0 : ℤ) → i_1 ≤ Cint.to_uint32 (i - (1 : ℤ))
  := sorry
end reverse_Why3_ide_VCreverse_assert_rte_unsigned_overflow_2_goal10
