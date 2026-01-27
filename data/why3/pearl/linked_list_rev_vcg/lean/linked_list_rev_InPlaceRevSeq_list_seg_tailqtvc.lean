import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace linked_list_rev_InPlaceRevSeq_list_seg_tailqtvc
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
axiom memory : Type -> Type
axiom inhabited_axiom_memory {α : Type} [Inhabited α] : Inhabited (memory α)
attribute [instance] inhabited_axiom_memory
axiom next : Type
axiom inhabited_axiom_next : Inhabited next
attribute [instance] inhabited_axiom_next
noncomputable def list_seg (next1 : loc -> loc) (p : loc) (s : List loc) (q : loc) := let n : ℤ := Int.ofNat (List.length s); (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → ¬s[Int.toNat i]! = null) ∧ (p = q ∧ n = (0 : ℤ) ∨ (1 : ℤ) ≤ n ∧ s[(0 : ℕ)]! = p ∧ next1 (s[Int.toNat (n - (1 : ℤ))]!) = q ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n - (1 : ℤ) → next1 (s[Int.toNat i]!) = s[Int.toNat (i + (1 : ℤ))]!))
theorem list_seg_tail'vc (next1 : loc -> loc) (p : loc) (l1 : List loc) (q : loc) (fact0 : list_seg next1 p l1 q) (fact1 : (0 : ℤ) < Int.ofNat (List.length l1)) : list_seg next1 (next1 p) (List.drop (1 : ℕ) l1) q
  := sorry
end linked_list_rev_InPlaceRevSeq_list_seg_tailqtvc
