import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace linked_list_rev_InPlaceRevSeq_in_place_reverseqtvc
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
theorem in_place_reverse'vc (next1 : loc -> loc) (l : loc) (lM : List loc) (fact0 : list_seg next1 l lM null) : list_seg next1 l lM null ∧ list_seg next1 null ([] : List loc) null ∧ disjoint lM ([] : List loc) ∧ List.reverse lM ++ ([] : List loc) = List.reverse lM ∧ (∀(rM : List loc) (r : loc) (pM : List loc) (p : loc) (next2 : loc -> loc), list_seg next2 p pM null ∧ list_seg next2 r rM null ∧ disjoint pM rM ∧ List.reverse pM ++ rM = List.reverse lM → (let o1 : loc := null; let o2 : Bool := eq_loc p o1; (o2 = true) = (p = o1) → (if ¬o2 = true then ¬p = null ∧ ¬p = null ∧ (let o3 : loc := pM[(0 : ℕ)]!; let o4 : List loc := List.cons o3 rM; Int.ofNat (List.length o4) = (1 : ℤ) + Int.ofNat (List.length rM) ∧ o4[(0 : ℕ)]! = o3 ∧ (∀(i : ℤ), (0 : ℤ) < i ∧ i ≤ Int.ofNat (List.length rM) → o4[Int.toNat i]! = rM[Int.toNat (i - (1 : ℤ))]!) → ((0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) ≤ Int.ofNat (List.length pM)) ∧ ((0 : ℤ) ≤ Int.ofNat (List.length pM) ∧ List.length (List.drop (1 : ℕ) pM) < List.length pM) ∧ list_seg (Function.update next2 p r) (next2 p) (List.drop (1 : ℕ) pM) null ∧ list_seg (Function.update next2 p r) p o4 null ∧ disjoint (List.drop (1 : ℕ) pM) o4 ∧ List.reverse (List.drop (1 : ℕ) pM) ++ o4 = List.reverse lM) else list_seg next2 r (List.reverse lM) null)))
  := sorry
end linked_list_rev_InPlaceRevSeq_in_place_reverseqtvc
