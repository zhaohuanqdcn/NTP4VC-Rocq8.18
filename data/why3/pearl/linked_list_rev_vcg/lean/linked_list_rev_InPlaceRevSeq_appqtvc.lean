import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace linked_list_rev_InPlaceRevSeq_appqtvc
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
theorem app'vc (next1 : loc -> loc) (l1 : loc) (l1M : List loc) (l2 : loc) (l2M : List loc) (fact0 : list_seg next1 l1 l1M null) (fact1 : list_seg next1 l2 l2M null) (fact2 : disjoint l1M l2M) : let o1 : loc := null; let o2 : Bool := eq_loc l1 o1; (o2 = true) = (l1 = o1) → (if o2 = true then list_seg next1 l2 (l1M ++ l2M) null else (¬l1 = null ∧ list_seg next1 l1 ([] : List loc) l1 ∧ list_seg next1 l1 l1M null ∧ ([] : List loc) ++ l1M = l1M ∧ disjoint ([] : List loc) l1M) ∧ (∀(l1pM : List loc) (pM : List loc) (p : loc), ¬p = null ∧ list_seg next1 l1 l1pM p ∧ list_seg next1 p pM null ∧ l1pM ++ pM = l1M ∧ disjoint l1pM pM → (let o3 : loc := null; ¬p = null ∧ (let o4 : loc := next1 p; let o5 : Bool := eq_loc o4 o3; (o5 = true) = (o4 = o3) → (if ¬o5 = true then ((0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) ≤ Int.ofNat (List.length pM)) ∧ (let o6 : List loc := ([] : List loc); let o7 : List loc := List.cons p o6; Int.ofNat (List.length o7) = (1 : ℤ) + Int.ofNat (List.length o6) ∧ o7[(0 : ℕ)]! = p ∧ (∀(i : ℤ), (0 : ℤ) < i ∧ i ≤ Int.ofNat (List.length o6) → o7[Int.toNat i]! = o6[Int.toNat (i - (1 : ℤ))]!) → (let o8 : List loc := l1pM ++ o7; Int.ofNat (List.length o8) = Int.ofNat (List.length l1pM) + Int.ofNat (List.length o7) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length l1pM) → o8[Int.toNat i]! = l1pM[Int.toNat i]!) ∧ (∀(i : ℤ), Int.ofNat (List.length l1pM) ≤ i ∧ i < Int.ofNat (List.length o8) → o8[Int.toNat i]! = o7[Int.toNat (i - Int.ofNat (List.length l1pM))]!) → ¬p = null ∧ ((0 : ℤ) ≤ Int.ofNat (List.length pM) ∧ List.length (List.drop (1 : ℕ) pM) < List.length pM) ∧ ¬next1 p = null ∧ list_seg next1 l1 o8 (next1 p) ∧ list_seg next1 (next1 p) (List.drop (1 : ℕ) pM) null ∧ o8 ++ List.drop (1 : ℕ) pM = l1M ∧ disjoint o8 (List.drop (1 : ℕ) pM))) else ¬p = null ∧ list_seg (Function.update next1 p l2) l1 (l1M ++ l2M) null)))))
  := sorry
end linked_list_rev_InPlaceRevSeq_appqtvc
