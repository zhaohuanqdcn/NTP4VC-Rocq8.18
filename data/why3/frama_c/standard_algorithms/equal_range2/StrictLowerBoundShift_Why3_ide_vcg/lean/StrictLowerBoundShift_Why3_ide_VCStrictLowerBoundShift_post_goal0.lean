import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.equal_range2.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.equal_range2.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace StrictLowerBoundShift_Why3_ide_VCStrictLowerBoundShift_post_goal0
theorem goal0 (i_1 : ℤ) (i_3 : ℤ) (a : Memory.addr) (i_2 : ℤ) (i : ℤ) (t : Memory.addr -> ℤ) : let x : ℤ := i_1 + i_3; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → x ≤ (4294967295 : ℤ) → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_sint32 i → Axiomatic.p_strictlowerbound_1' t (Memory.shift a i_3) i_2 i_1 i → Axiomatic.p_strictlowerbound_1' t a (i_2 + i_3) x i
  := sorry
end StrictLowerBoundShift_Why3_ide_VCStrictLowerBoundShift_post_goal0
