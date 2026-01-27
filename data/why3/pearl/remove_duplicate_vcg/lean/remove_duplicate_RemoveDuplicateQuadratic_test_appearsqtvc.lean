import Why3.Base
import Why3.why3.Ref.Ref
import pearl.remove_duplicate_vcg.lean.remove_duplicate.Spec
open Classical
open Lean4Why3
namespace remove_duplicate_RemoveDuplicateQuadratic_test_appearsqtvc
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom eq : t -> t -> Prop
axiom eq'spec (x : t) (y : t) : eq x y = (x = y)
theorem test_appears'vc (s : ℤ) (a : List t) (v : t) (fact0 : (0 : ℤ) ≤ s) (fact1 : s ≤ Int.ofNat (List.length a)) : if (0 : ℤ) < s then let o1 : ℤ := s - (1 : ℤ); ((0 : ℤ) ≤ o1 ∧ o1 < Int.ofNat (List.length a)) ∧ (let o2 : t := a[Int.toNat o1]!; eq o2 v = (o2 = v) → (if eq o2 v then Spec.appears v a s ∧ ((0 : ℤ) ≤ s - (1 : ℤ) ∧ s - (1 : ℤ) < s) ∧ a[Int.toNat (s - (1 : ℤ))]! = v else let o3 : ℤ := s - (1 : ℤ); (((0 : ℤ) ≤ s ∧ o3 < s) ∧ (0 : ℤ) ≤ o3 ∧ o3 ≤ Int.ofNat (List.length a)) ∧ (∀(w : ℤ), (Spec.appears v a o3 → ((0 : ℤ) ≤ w ∧ w < o3) ∧ a[Int.toNat w]! = v) → Spec.appears v a o3 = Spec.appears v a s ∧ (Spec.appears v a o3 → ((0 : ℤ) ≤ w ∧ w < s) ∧ a[Int.toNat w]! = v)))) else ¬Spec.appears v a s
  := sorry
end remove_duplicate_RemoveDuplicateQuadratic_test_appearsqtvc
