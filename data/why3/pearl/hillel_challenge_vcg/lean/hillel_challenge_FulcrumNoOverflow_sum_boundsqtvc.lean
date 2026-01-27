import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Sum
open Classical
open Lean4Why3
namespace hillel_challenge_FulcrumNoOverflow_sum_boundsqtvc
axiom big : Type
axiom inhabited_axiom_big : Inhabited big
attribute [instance] inhabited_axiom_big
axiom q : big -> BitVec 32
axiom r : big -> BitVec 32
axiom v : big -> ℤ
axiom big'invariant (self : big) : -((2147483647 : ℤ) + (1 : ℤ)) ≤ BitVec.toInt (q self) ∧ BitVec.toInt (q self) ≤ (2147483647 : ℤ) + (1 : ℤ) - (1 : ℤ) ∧ (0 : ℤ) ≤ BitVec.toInt (r self) ∧ BitVec.toInt (r self) ≤ (2147483647 : ℤ) + (1 : ℤ) - (1 : ℤ) ∧ v self = BitVec.toInt (q self) * ((2147483647 : ℤ) + (1 : ℤ)) + BitVec.toInt (r self)
noncomputable def big'eq (a : big) (b : big) := q a = q b ∧ r a = r b ∧ v a = v b
axiom big'inj (a : big) (b : big) (fact0 : big'eq a b) : a = b
axiom big_zero : Unit -> big
axiom big_zero'def (x : Unit) : q (big_zero x) = (0 : BitVec 32) ∧ r (big_zero x) = (0 : BitVec 32) ∧ v (big_zero x) = (0 : ℤ)
axiom fc : array32 (BitVec 32) -> ℤ -> ℤ
axiom fc'def (a : array32 (BitVec 32)) (i : ℤ) : fc a i = BitVec.toInt (array32_elts a i)
noncomputable def sum (a : array32 (BitVec 32)) (l : ℤ) (u : ℤ) := int.Sum.sum (fc a) l u
theorem sum_bounds'vc (l : ℤ) (u : ℤ) (a : array32 (BitVec 32)) (fact0 : (0 : ℤ) ≤ l) (fact1 : l ≤ u) (fact2 : u ≤ BitVec.toInt (array32_length a)) : (u - l) * BitVec.toInt (-(2147483648 : BitVec 32)) ≤ sum a l u ∧ sum a l u ≤ (u - l) * BitVec.toInt (2147483647 : BitVec 32)
  := sorry
end hillel_challenge_FulcrumNoOverflow_sum_boundsqtvc
