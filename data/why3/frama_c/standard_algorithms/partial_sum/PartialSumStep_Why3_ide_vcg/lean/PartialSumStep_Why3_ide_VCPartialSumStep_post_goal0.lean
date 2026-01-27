import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.partial_sum.lib.lean.Compound.Compound
import frama_c.standard_algorithms.partial_sum.lib.lean.Axiomatic1.Axiomatic1
import frama_c.standard_algorithms.partial_sum.lib.lean.A_AccumulateAxiomatic.A_AccumulateAxiomatic
import Why3.Cint.Cint
import frama_c.standard_algorithms.partial_sum.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace PartialSumStep_Why3_ide_VCPartialSumStep_post_goal0
theorem goal0 (t : Memory.addr -> ℤ) (a : Memory.addr) (i : ℤ) (a_1 : Memory.addr) : let x : ℤ := t (Memory.shift a i); let x_1 : ℤ := (1 : ℤ) + i; x = A_AccumulateAxiomatic.l_accumulate_1' t a_1 x_1 (0 : ℤ) → (0 : ℤ) < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Cint.is_uint32 i → Axiomatic1.p_partialsum t a_1 i a → Cint.is_sint32 x → Axiomatic1.p_partialsum t a_1 x_1 a
  := sorry
end PartialSumStep_Why3_ide_VCPartialSumStep_post_goal0
