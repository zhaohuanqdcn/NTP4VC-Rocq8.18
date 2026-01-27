import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Sum
open Classical
open Lean4Why3
namespace hillel_challenge_FulcrumNoOverflow_big_zeroqtvc
axiom big : Type
axiom inhabited_axiom_big : Inhabited big
attribute [instance] inhabited_axiom_big
axiom q : big -> BitVec 32
axiom r : big -> BitVec 32
axiom v : big -> ℤ
axiom big'invariant (self : big) : -((2147483647 : ℤ) + (1 : ℤ)) ≤ BitVec.toInt (q self) ∧ BitVec.toInt (q self) ≤ (2147483647 : ℤ) + (1 : ℤ) - (1 : ℤ) ∧ (0 : ℤ) ≤ BitVec.toInt (r self) ∧ BitVec.toInt (r self) ≤ (2147483647 : ℤ) + (1 : ℤ) - (1 : ℤ) ∧ v self = BitVec.toInt (q self) * ((2147483647 : ℤ) + (1 : ℤ)) + BitVec.toInt (r self)
noncomputable def big'eq (a : big) (b : big) := q a = q b ∧ r a = r b ∧ v a = v b
axiom big'inj (a : big) (b : big) (fact0 : big'eq a b) : a = b
theorem big_zero'vc : -((2147483647 : ℤ) + (1 : ℤ)) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (2147483647 : ℤ) + (1 : ℤ) - (1 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (2147483647 : ℤ) + (1 : ℤ) - (1 : ℤ) ∧ (0 : ℤ) = (0 : ℤ) * ((2147483647 : ℤ) + (1 : ℤ)) + (0 : ℤ)
  := sorry
end hillel_challenge_FulcrumNoOverflow_big_zeroqtvc
