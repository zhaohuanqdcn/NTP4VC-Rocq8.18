import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace bitvector_examples_Test_proofinuse_testVariantqtvc
axiom bitvec8 : Type
axiom inhabited_axiom_bitvec8 : Inhabited bitvec8
attribute [instance] inhabited_axiom_bitvec8
axiom bitvec64 : Type
axiom inhabited_axiom_bitvec64 : Inhabited bitvec64
attribute [instance] inhabited_axiom_bitvec64
theorem testVariant'vc (i : BitVec 32) (fact0 : i ≥ (2 : BitVec 32)) : (0 : ℤ) ≤ BitVec.toUInt i ∧ BitVec.toUInt (i >>> BitVec.toNat (2 : BitVec 32)) < BitVec.toUInt i
  := sorry
end bitvector_examples_Test_proofinuse_testVariantqtvc
