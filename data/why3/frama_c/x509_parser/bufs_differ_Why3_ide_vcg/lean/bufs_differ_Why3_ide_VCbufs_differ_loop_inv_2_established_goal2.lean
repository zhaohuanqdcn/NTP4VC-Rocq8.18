import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.x509_parser.lib.lean.Compound.Compound
import frama_c.x509_parser.lib.lean.Axiomatic12.Axiomatic12
open Classical
open Lean4Why3
namespace bufs_differ_Why3_ide_VCbufs_differ_loop_inv_2_established_goal2
theorem goal2 (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact2 : Memory.linked t) (fact3 : Cint.is_uint16 i) (fact4 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) (fact5 : Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i) : Axiomatic12.p_bmatch t_1 a_1 a (0 : ℤ)
  := sorry
end bufs_differ_Why3_ide_VCbufs_differ_loop_inv_2_established_goal2
