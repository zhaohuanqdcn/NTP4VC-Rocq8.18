import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.swap_ranges.lib.lean.Compound.Compound
import frama_c.standard_algorithms.swap_ranges.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace swap_ranges_Why3_ide_VCswap_ranges_assign_exit_part2_goal14
theorem goal14 (a : Memory.addr) (i_1 : ℤ) (a_1 : Memory.addr) (t_2 : Memory.addr -> ℤ) (t_1 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) (i : ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a i_1; let a_4 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_5 : Memory.addr := Memory.shift a_1 i_1; let a_6 : Memory.addr -> ℤ := Memory.havoc t_2 (Memory.havoc t_1 t_3 a_2 i) a_4 i; i_1 ≤ i → (0 : ℤ) ≤ i_1 → i_1 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.valid_rw t a_2 i → Memory.valid_rw t a_3 (1 : ℤ) → Memory.valid_rw t a_4 i → Memory.valid_rw t a_5 (1 : ℤ) → Memory.separated a_4 i a_2 i → Axiomatic.p_equalranges_1' a_6 t_3 a i_1 a_1 → Axiomatic.p_equalranges_1' a_6 t_3 a_1 i_1 a → Axiomatic.p_unchanged_1' a_6 t_3 a i_1 i → Axiomatic.p_unchanged_1' a_6 t_3 a_1 i_1 i → (¬Memory.invalid t a_3 (1 : ℤ) → Memory.included a_3 (1 : ℤ) a_2 i ∨ Memory.included a_3 (1 : ℤ) a_4 i) ∧ (¬Memory.invalid t a_5 (1 : ℤ) → Memory.included a_5 (1 : ℤ) a_2 i ∨ Memory.included a_5 (1 : ℤ) a_4 i)
  := sorry
end swap_ranges_Why3_ide_VCswap_ranges_assign_exit_part2_goal14
