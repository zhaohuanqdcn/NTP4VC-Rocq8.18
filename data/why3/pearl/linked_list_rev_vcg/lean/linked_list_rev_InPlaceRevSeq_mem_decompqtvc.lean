import Why3.Base
open Classical
open Lean4Why3
namespace linked_list_rev_InPlaceRevSeq_mem_decompqtvc
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
theorem mem_decomp'vc (x : loc) (s : List loc) (fact0 : x ∈ s) : let o1 : loc := s[(0 : ℕ)]!; let o2 : Bool := eq_loc o1 x; (o2 = true) = (o1 = x) → (if o2 = true then (0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) ≤ Int.ofNat (List.length s) else ((0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) ≤ Int.ofNat (List.length s)) ∧ (let o3 : List loc := List.drop (1 : ℕ) s; ((0 : ℤ) ≤ Int.ofNat (List.length s) ∧ List.length o3 < List.length s) ∧ x ∈ o3)) ∧ (∀(s1 : List loc) (s2 : List loc), (if o2 = true then s1 = ([] : List loc) ∧ s2 = List.drop (1 : ℕ) s else ∃(s11 : List loc), List.drop (1 : ℕ) s = s11 ++ List.cons x s2 ∧ (let o3 : loc := s[(0 : ℕ)]!; let o4 : List loc := List.cons o3 s11; (Int.ofNat (List.length o4) = (1 : ℤ) + Int.ofNat (List.length s11) ∧ o4[(0 : ℕ)]! = o3 ∧ (∀(i : ℤ), (0 : ℤ) < i ∧ i ≤ Int.ofNat (List.length s11) → o4[Int.toNat i]! = s11[Int.toNat (i - (1 : ℤ))]!)) ∧ s1 = o4)) → s = s1 ++ List.cons x s2)
  := sorry
end linked_list_rev_InPlaceRevSeq_mem_decompqtvc
