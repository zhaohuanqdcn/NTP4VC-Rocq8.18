import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace esterel_Esterel_aboveMinqtvc
axiom s : Type
axiom inhabited_axiom_s : Inhabited s
attribute [instance] inhabited_axiom_s
axiom bv : s -> BitVec 64
axiom mdl : s -> Finset ℤ
axiom s'invariant (i : ℤ) (self : s) : (((0 : ℤ) ≤ i ∧ i < (64 : ℤ)) ∧ (bv self)[Int.toNat i]! = true) = (i ∈ mdl self)
noncomputable def s'eq (a : s) (b : s) := bv a = bv b ∧ mdl a = mdl b
axiom s'inj (a : s) (b : s) (fact0 : s'eq a b) : a = b
theorem aboveMin'vc (a : s) (fact0 : ¬mdl a = ∅) : let res : BitVec 64 := bv a ||| -bv a; let o1 : Finset ℤ := Finset.Ico (Finset.min'' (mdl a)) (64 : ℤ); (∀(i : ℤ), (((0 : ℤ) ≤ i ∧ i < (64 : ℤ)) ∧ res[Int.toNat i]! = true) = (i ∈ o1)) ∧ (∀(result : s), bv result = res ∧ mdl result = o1 → mdl result = Finset.Ico (Finset.min'' (mdl a)) (64 : ℤ))
  := sorry
end esterel_Esterel_aboveMinqtvc
