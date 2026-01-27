import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace linked_list_rev_InPlaceRev_in_place_reverseqtvc
axiom loc : Type
axiom inhabited_axiom_loc : Inhabited loc
attribute [instance] inhabited_axiom_loc
axiom eq_loc : loc -> loc -> Bool
axiom eq_loc'spec (l1 : loc) (l2 : loc) : (eq_loc l1 l2 = true) = (l1 = l2)
axiom null : loc
noncomputable def disjoint (l1 : List loc) (l2 : List loc) := ∀(x : loc), ¬(x ∈ l1 ∧ x ∈ l2)
noncomputable def no_repet : List loc -> Prop
  | ([] : List loc) => True
  | (List.cons x r) => ¬x ∈ r ∧ no_repet r
inductive list_seg : loc -> (loc -> loc) -> List loc -> loc -> Prop where
 | list_seg_nil (p : loc) (next : loc -> loc) : list_seg p next ([] : List loc) p
 | list_seg_cons (p : loc) (next : loc -> loc) (l : List loc) (q : loc) : ¬p = null → list_seg (next p) next l q → list_seg p next (List.cons p l) q
theorem in_place_reverse'vc (l : loc) (next : loc -> loc) (lM : List loc) (fact0 : list_seg l next lM null) : list_seg l next lM null ∧ list_seg null next ([] : List loc) null ∧ disjoint lM ([] : List loc) ∧ List.reverse lM ++ ([] : List loc) = List.reverse lM ∧ (∀(rM : List loc) (r : loc) (pM : List loc) (p : loc) (next1 : loc -> loc), list_seg p next1 pM null ∧ list_seg r next1 rM null ∧ disjoint pM rM ∧ List.reverse pM ++ rM = List.reverse lM → (let o1 : loc := null; let o2 : Bool := eq_loc p o1; (o2 = true) = (p = o1) → (if ¬o2 = true then ¬p = null ∧ (match pM with | ([] : List loc) => False | List.cons h t => (match pM with | ([] : List loc) => False | List.cons _ f => f = t) ∧ list_seg (next1 p) (Function.update next1 p r) t null ∧ list_seg p (Function.update next1 p r) (List.cons h rM) null ∧ disjoint t (List.cons h rM) ∧ List.reverse t ++ List.cons h rM = List.reverse lM) else list_seg r next1 (List.reverse lM) null)))
  := sorry
end linked_list_rev_InPlaceRev_in_place_reverseqtvc
