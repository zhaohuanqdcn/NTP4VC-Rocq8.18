import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.x509_parser.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace bufs_differ_Why3_ide_VCbufs_differ_loop_inv_established_part2_goal0
theorem goal0 (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact2 : Memory.linked t) (fact3 : Cint.is_uint16 i) (fact4 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) (fact5 : Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i) : (0 : ℤ) ≤ i
  := sorry
end bufs_differ_Why3_ide_VCbufs_differ_loop_inv_established_part2_goal0
