import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.swap_ranges.lib.lean.Compound.Compound
import frama_c.standard_algorithms.swap_ranges.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace swap_ranges_Why3_ide_VCswap_ranges_post_equal_2_goal1
theorem goal1 (a : Memory.addr) (a_1 : Memory.addr) (t_2 : Memory.addr -> ℤ) (t_1 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_4 : Memory.addr -> ℤ := Memory.havoc t_2 (Memory.havoc t_1 t_3 a_2 i) a_3 i; i_1 ≤ i → (0 : ℤ) ≤ i_1 → i ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.valid_rw t a_2 i → Memory.valid_rw t a_3 i → Memory.separated a_3 i a_2 i → Axiomatic.p_equalranges_1' a_4 t_3 a i_1 a_1 → Axiomatic.p_equalranges_1' a_4 t_3 a_1 i_1 a → Axiomatic.p_unchanged_1' a_4 t_3 a i_1 i → Axiomatic.p_unchanged_1' a_4 t_3 a_1 i_1 i → Axiomatic.p_equalranges_1' (Memory.havoc t_2 (Memory.havoc t_1 t_3 a_2 i_1) a_3 i_1) t_3 a i_1 a_1
  := sorry
end swap_ranges_Why3_ide_VCswap_ranges_post_equal_2_goal1
