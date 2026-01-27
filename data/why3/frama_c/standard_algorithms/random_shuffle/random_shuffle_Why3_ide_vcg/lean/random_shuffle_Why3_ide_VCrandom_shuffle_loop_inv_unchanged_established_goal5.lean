import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.random_shuffle.lib.lean.Compound.Compound
import frama_c.standard_algorithms.random_shuffle.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace random_shuffle_Why3_ide_VCrandom_shuffle_loop_inv_unchanged_established_goal5
theorem goal5 (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : (0 : ℤ) < i) (fact1 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact2 : Memory.linked t) (fact3 : Cint.is_uint32 i) (fact4 : Memory.valid_rw t (Memory.shift a (0 : ℤ)) i) : Axiomatic.p_unchanged_1' t_1 t_1 a (1 : ℤ) i
  := sorry
end random_shuffle_Why3_ide_VCrandom_shuffle_loop_inv_unchanged_established_goal5
