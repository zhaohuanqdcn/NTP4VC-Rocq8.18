import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace esterel_Esterel_maxUnionqtvc
axiom s : Type
axiom inhabited_axiom_s : Inhabited s
attribute [instance] inhabited_axiom_s
axiom bv : s -> BitVec 64
axiom mdl : s -> Finset ℤ
axiom s'invariant (i : ℤ) (self : s) : (((0 : ℤ) ≤ i ∧ i < (64 : ℤ)) ∧ (bv self)[Int.toNat i]! = true) = (i ∈ mdl self)
noncomputable def s'eq (a : s) (b : s) := bv a = bv b ∧ mdl a = mdl b
axiom s'inj (a : s) (b : s) (fact0 : s'eq a b) : a = b
theorem maxUnion'vc (a : s) (b : s) (fact0 : ¬mdl a = ∅) (fact1 : ¬mdl b = ∅) : ¬mdl b = ∅ ∧ (∀(o1 : s), mdl o1 = Finset.Ico (Finset.min'' (mdl b)) (64 : ℤ) → ¬mdl a = ∅ ∧ (∀(o2 : s), mdl o2 = Finset.Ico (Finset.min'' (mdl a)) (64 : ℤ) → (∀(o3 : s), mdl o3 = mdl o2 ∩ mdl o1 → (∀(o4 : s), mdl o4 = mdl b ∪ mdl a → (∀(res : s), mdl res = mdl o4 ∩ mdl o3 → (∀(x : ℤ), (x ∈ mdl res) = (x ∈ mdl a ∪ mdl b ∧ max (Finset.min'' (mdl a)) (Finset.min'' (mdl b)) ≤ x)) ∧ (∀(x : ℤ), (x ∈ mdl res) = (∃(y : ℤ) (z : ℤ), y ∈ mdl a ∧ z ∈ mdl b ∧ x = max y z)))))))
  := sorry
end esterel_Esterel_maxUnionqtvc
