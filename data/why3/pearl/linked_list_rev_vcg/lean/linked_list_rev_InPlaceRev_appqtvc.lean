import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace linked_list_rev_InPlaceRev_appqtvc
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
theorem app'vc (l1 : loc) (next : loc -> loc) (l1M : List loc) (l2 : loc) (l2M : List loc) (fact0 : list_seg l1 next l1M null) (fact1 : list_seg l2 next l2M null) (fact2 : disjoint l1M l2M) : let o1 : loc := null; let o2 : Bool := eq_loc l1 o1; (o2 = true) = (l1 = o1) → (if o2 = true then list_seg l2 next (l1M ++ l2M) null else (¬l1 = null ∧ list_seg l1 next ([] : List loc) l1 ∧ list_seg l1 next l1M null ∧ ([] : List loc) ++ l1M = l1M ∧ disjoint ([] : List loc) l1M) ∧ (∀(l1pM : List loc) (pM : List loc) (p : loc), ¬p = null ∧ list_seg l1 next l1pM p ∧ list_seg p next pM null ∧ l1pM ++ pM = l1M ∧ disjoint l1pM pM → (let o3 : loc := null; ¬p = null ∧ (let o4 : loc := next p; let o5 : Bool := eq_loc o4 o3; (o5 = true) = (o4 = o3) → (if ¬o5 = true then match pM with | ([] : List loc) => False | List.cons h t => ¬p = null ∧ (match pM with | ([] : List loc) => False | List.cons _ f => f = t) ∧ ¬next p = null ∧ list_seg l1 next (l1pM ++ List.cons h ([] : List loc)) (next p) ∧ list_seg (next p) next t null ∧ (l1pM ++ List.cons h ([] : List loc)) ++ t = l1M ∧ disjoint (l1pM ++ List.cons h ([] : List loc)) t else ¬p = null ∧ list_seg l1 (Function.update next p l2) (l1M ++ l2M) null)))))
  := sorry
end linked_list_rev_InPlaceRev_appqtvc
