import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.swap_ranges.lib.lean.Compound.Compound
import frama_c.standard_algorithms.swap_ranges.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace swap_ranges_Why3_ide_VCswap_ranges_loop_inv_unchanged_2_preserved_goal10
theorem goal10 (a : Memory.addr) (a_1 : Memory.addr) (t_2 : Memory.addr -> ℤ) (t_1 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) (i_1 : ℤ) (i_2 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_4 : Memory.addr -> ℤ := Memory.havoc t_2 (Memory.havoc t_1 t_3 a_2 i_1) a_3 i_1; let a_5 : Memory.addr := Memory.shift a i_2; let a_6 : Memory.addr := Memory.shift a_1 i_2; let a_7 : ℤ := a_4 a_5; let a_8 : Memory.addr -> ℤ := Function.update (Function.update a_4 a_5 i) a_6 a_7; let a_9 : ℤ := a_8 a_5; let a_10 : ℤ := a_4 a_6; let x : ℤ := (1 : ℤ) + i_2; a_9 = a_10 → i_2 ≤ i_1 → (0 : ℤ) ≤ i_2 → i_2 < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i_2 ≤ (4294967294 : ℤ) → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 x → Memory.valid_rw t a_2 i_1 → Memory.valid_rw t a_5 (1 : ℤ) → Memory.valid_rw t a_3 i_1 → Memory.valid_rw t a_6 (1 : ℤ) → Memory.separated a_3 i_1 a_2 i_1 → Cint.is_sint32 a_7 → Cint.is_sint32 a_10 → Cint.is_sint32 a_9 → Axiomatic.p_equalranges_1' a_4 t_3 a i_2 a_1 → Axiomatic.p_equalranges_1' a_4 t_3 a_1 i_2 a → Axiomatic.p_unchanged_1' a_4 t_3 a i_2 i_1 → Axiomatic.p_unchanged_1' a_4 t_3 a_1 i_2 i_1 → Axiomatic.p_unchanged_1' a_8 t_3 a x i_1
  := sorry
end swap_ranges_Why3_ide_VCswap_ranges_loop_inv_unchanged_2_preserved_goal10
