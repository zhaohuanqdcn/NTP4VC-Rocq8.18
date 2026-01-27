import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace div_u64_rem_0_Why3_ide_VCdiv_u64_rem_0_post_goal0
theorem goal0 (i_1 : ℤ) (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := Int.tmod i_1 i; ¬i = (0 : ℤ) → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint64 i_1 → Memory.valid_rw t a (1 : ℤ) → x = Cint.to_uint32 x
  := sorry
end div_u64_rem_0_Why3_ide_VCdiv_u64_rem_0_post_goal0
