import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace linked_list_rev_InPlaceRev_list_seg_sublistlqtvc
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
theorem list_seg_sublistl'vc (p : loc) (next : loc -> loc) (l1 : List loc) (q : loc) (l2 : List loc) (fact0 : list_seg p next (l1 ++ List.cons q l2) null) : list_seg q next (List.cons q l2) null
  := sorry
end linked_list_rev_InPlaceRev_list_seg_sublistlqtvc
