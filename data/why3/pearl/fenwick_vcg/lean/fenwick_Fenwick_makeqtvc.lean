import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Sum
open Classical
open Lean4Why3
namespace fenwick_Fenwick_makeqtvc
structure fenwick where
  t : List ℤ
  leaves : ℤ
axiom inhabited_axiom_fenwick : Inhabited fenwick
attribute [instance] inhabited_axiom_fenwick
noncomputable def valid (f : fenwick) := (0 : ℤ) ≤ fenwick.leaves f ∧ Int.ofNat (List.length (fenwick.t f)) = (if fenwick.leaves f = (0 : ℤ) then (0 : ℤ) else (2 : ℤ) * fenwick.leaves f - (1 : ℤ)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < fenwick.leaves f - (1 : ℤ) → (fenwick.t f)[Int.toNat i]! = (fenwick.t f)[Int.toNat ((2 : ℤ) * i + (1 : ℤ))]! + (fenwick.t f)[Int.toNat ((2 : ℤ) * i + (2 : ℤ))]!)
noncomputable def get (f : fenwick) (i : ℤ) := (fenwick.t f)[Int.toNat (i + fenwick.leaves f - (1 : ℤ))]!
axiom get_closure : fenwick -> ℤ -> ℤ
axiom get_closure_def (y : fenwick) (y1 : ℤ) : get_closure y y1 = get y y1
noncomputable def rget (f : fenwick) (a : ℤ) (b : ℤ) := int.Sum.sum (get_closure f) a b
theorem make'vc (lv : ℤ) (fact0 : (0 : ℤ) ≤ lv) : (if lv = (0 : ℤ) then (0 : ℤ) ≤ (0 : ℤ) else (0 : ℤ) ≤ (2 : ℤ) * lv - (1 : ℤ)) ∧ (∀(o1 : List ℤ), (if lv = (0 : ℤ) then (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) → o1[Int.toNat i]! = (0 : ℤ)) ∧ Int.ofNat (List.length o1) = (0 : ℤ) else let o2 : ℤ := (2 : ℤ) * lv - (1 : ℤ); (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < o2 → o1[Int.toNat i]! = (0 : ℤ)) ∧ Int.ofNat (List.length o1) = o2) → (let result : fenwick := fenwick.mk o1 lv; valid result ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < lv → get result i = (0 : ℤ))))
  := sorry
end fenwick_Fenwick_makeqtvc
