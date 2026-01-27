import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace bitvector_examples_Test_proofinuse_tttqtvc
axiom bitvec8 : Type
axiom inhabited_axiom_bitvec8 : Inhabited bitvec8
attribute [instance] inhabited_axiom_bitvec8
axiom bitvec64 : Type
axiom inhabited_axiom_bitvec64 : Inhabited bitvec64
attribute [instance] inhabited_axiom_bitvec64
noncomputable def in_range (n : BitVec 32) := (0 : BitVec 32) ≤ n ∧ n ≤ (255 : BitVec 32)
noncomputable def add_over (x : BitVec 32) (y : BitVec 32) := x + y ≥ x ∧ x + y ≥ y
theorem ttt'vc (x : BitVec 32) (y : BitVec 32) (i : BitVec 32) (fact0 : add_over x y) (fact1 : i < x) : add_over i y
  := sorry
end bitvector_examples_Test_proofinuse_tttqtvc
