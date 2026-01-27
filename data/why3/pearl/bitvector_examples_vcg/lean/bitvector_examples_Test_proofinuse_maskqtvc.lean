import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace bitvector_examples_Test_proofinuse_maskqtvc
axiom bitvec8 : Type
axiom inhabited_axiom_bitvec8 : Inhabited bitvec8
attribute [instance] inhabited_axiom_bitvec8
axiom bitvec64 : Type
axiom inhabited_axiom_bitvec64 : Inhabited bitvec64
attribute [instance] inhabited_axiom_bitvec64
theorem mask'vc (x : BitVec 32) : BitVec.truncate 8 ((x &&& (4294967040 : BitVec 32) ||| (1 : BitVec 32)) &&& (255 : BitVec 32)) = (1 : BitVec 8)
  := sorry
end bitvector_examples_Test_proofinuse_maskqtvc
