import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.copy.lib.lean.Compound.Compound
import frama_c.standard_algorithms.copy.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace copy_Why3_ide_VCcopy_assert_rte_unsigned_overflow_goal9
theorem goal9 (a_1 : Memory.addr) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_3 : Memory.addr := Memory.shift a (0 : ℤ); let a_4 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_3 i; i_1 ≤ i → (0 : ℤ) ≤ i_1 → i_1 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.valid_rd t a_2 i → Memory.valid_rd t (Memory.shift a_1 i_1) (1 : ℤ) → Memory.valid_rw t a_3 i → Memory.valid_rw t (Memory.shift a i_1) (1 : ℤ) → Memory.separated a_2 i a (1 : ℤ) → Axiomatic.p_equalranges_1' a_4 t_2 a_1 i_1 a → Axiomatic.p_unchanged_1' a_4 t_2 a_1 i_1 i → i_1 ≤ (4294967294 : ℤ)
  := sorry
end copy_Why3_ide_VCcopy_assert_rte_unsigned_overflow_goal9
