import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Sum
open Classical
open Lean4Why3
namespace hillel_challenge_FulcrumNoOverflow_big_ltqtvc
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
theorem big_lt'vc (x : big) (y : big) (result : Bool) (fact0 : (0 : ℤ) ≤ v x) (fact1 : (0 : ℤ) ≤ v y) (fact2 : if BitVec.toInt (q x) < BitVec.toInt (q y) then result = true else let o1 : BitVec 32 := q y; let o2 : BitVec 32 := q x; (BitVec.toInt o2 = BitVec.toInt o1 → o2 = o1) ∧ (if o2 = o1 then result = (if BitVec.toInt (r x) < BitVec.toInt (r y) then true else false) else result = false)) : (result = true) = (v x < v y)
  := sorry
end hillel_challenge_FulcrumNoOverflow_big_ltqtvc
