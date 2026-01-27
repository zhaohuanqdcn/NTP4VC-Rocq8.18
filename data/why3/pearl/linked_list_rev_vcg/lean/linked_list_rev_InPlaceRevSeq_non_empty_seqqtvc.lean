import Why3.Base
open Classical
open Lean4Why3
namespace linked_list_rev_InPlaceRevSeq_non_empty_seqqtvc
axiom result :  {α : Type} -> [Inhabited α] -> List α -> ℤ -> α
axiom result'def {α : Type} [Inhabited α] (s : List α) (i : ℤ) : result s i = s[Int.toNat (Int.ofNat (List.length s) - (1 : ℤ) - i)]!
axiom loc : Type
axiom inhabited_axiom_loc : Inhabited loc
attribute [instance] inhabited_axiom_loc
axiom null : loc
axiom eq_loc : loc -> loc -> Bool
axiom eq_loc'spec (l1 : loc) (l2 : loc) : (eq_loc l1 l2 = true) = (l1 = l2)
noncomputable def disjoint {α : Type} [Inhabited α] (s1 : List α) (s2 : List α) := ∀(i1 : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < Int.ofNat (List.length s1) → (∀(i2 : ℤ), (0 : ℤ) ≤ i2 ∧ i2 < Int.ofNat (List.length s2) → ¬s1[Int.toNat i1]! = s2[Int.toNat i2]!)
noncomputable def no_repet (s : List loc) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s) → ¬s[Int.toNat i]! ∈ List.drop (Int.toNat (i + (1 : ℤ))) s
theorem non_empty_seq'vc {α : Type} [Inhabited α] (s : List α) (fact0 : (0 : ℤ) < Int.ofNat (List.length s)) : s = List.cons (s[(0 : ℕ)]!) (List.drop (1 : ℕ) s)
  := sorry
end linked_list_rev_InPlaceRevSeq_non_empty_seqqtvc
