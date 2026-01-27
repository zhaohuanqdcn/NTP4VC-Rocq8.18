import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace linked_list_rev_InPlaceRev_mem_decompqtvc
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
theorem mem_decomp'vc (x : loc) (l : List loc) (fact0 : x ∈ l) : (match l with | ([] : List loc) => False | List.cons h t => (let o1 : Bool := eq_loc h x; (o1 = true) = (h = x) → ¬o1 = true → (match l with | ([] : List loc) => False | List.cons _ f => f = t) ∧ x ∈ t)) ∧ (∀(l1 : List loc) (l2 : List loc), (match l with | ([] : List loc) => False | List.cons h t => (let o1 : Bool := eq_loc h x; (o1 = true) = (h = x) ∧ (if o1 = true then l1 = ([] : List loc) ∧ l2 = t else ∃(l11 : List loc), t = l11 ++ List.cons x l2 ∧ l1 = List.cons h l11))) → l = l1 ++ List.cons x l2)
  := sorry
end linked_list_rev_InPlaceRev_mem_decompqtvc
