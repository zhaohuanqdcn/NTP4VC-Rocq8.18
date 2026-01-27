import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Sum
open Classical
open Lean4Why3
namespace hillel_challenge_FulcrumNoOverflow_sub_bigqtvc
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
theorem sub_big'vc (b : big) (x : BitVec 32) (fact0 : -((2147483647 : ℤ) + (1 : ℤ)) * ((2147483647 : ℤ) + (1 : ℤ)) ≤ v b - BitVec.toInt x) (fact1 : v b - BitVec.toInt x ≤ ((2147483647 : ℤ) + (1 : ℤ)) * ((2147483647 : ℤ) + (1 : ℤ)) - (1 : ℤ)) (fact2 : BitVec.toInt x = BitVec.toInt (-(2147483648 : BitVec 32)) → x = -(2147483648 : BitVec 32)) : if x = -(2147483648 : BitVec 32) then let o1 : BitVec 32 := q b; int'32_in_bounds (BitVec.toInt o1 + (1 : ℤ)) ∧ (∀(o2 : BitVec 32), BitVec.toInt o2 = BitVec.toInt o1 + (1 : ℤ) → (∀(b1 : big), ((-((2147483647 : ℤ) + (1 : ℤ)) ≤ BitVec.toInt o2 ∧ BitVec.toInt o2 ≤ (2147483647 : ℤ) + (1 : ℤ) - (1 : ℤ)) ∧ ((0 : ℤ) ≤ BitVec.toInt (r b) ∧ BitVec.toInt (r b) ≤ (2147483647 : ℤ) + (1 : ℤ) - (1 : ℤ)) ∧ v b - BitVec.toInt x = BitVec.toInt o2 * ((2147483647 : ℤ) + (1 : ℤ)) + BitVec.toInt (r b)) ∧ (v b - BitVec.toInt x = v b1 ∧ r b = r b1 ∧ o2 = q b1 → v b1 = v b - BitVec.toInt x))) else int'32_in_bounds (-BitVec.toInt x) ∧ (∀(o1 : BitVec 32), BitVec.toInt o1 = -BitVec.toInt x → (-((2147483647 : ℤ) + (1 : ℤ)) * ((2147483647 : ℤ) + (1 : ℤ)) ≤ v b + BitVec.toInt o1 ∧ v b + BitVec.toInt o1 ≤ ((2147483647 : ℤ) + (1 : ℤ)) * ((2147483647 : ℤ) + (1 : ℤ)) - (1 : ℤ)) ∧ (∀(b1 : big), v b1 = v b + BitVec.toInt o1 → v b1 = v b - BitVec.toInt x))
  := sorry
end hillel_challenge_FulcrumNoOverflow_sub_bigqtvc
