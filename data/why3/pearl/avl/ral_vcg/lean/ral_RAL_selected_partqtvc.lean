import Why3.Base
import Why3.why3.Ref.Ref
import pearl.avl.lib.lean.avl.SelectionTypes
open Classical
open Lean4Why3
namespace ral_RAL_selected_partqtvc
axiom balancing : ℕ
axiom balancing'def : (0 : ℤ) < Int.ofNat balancing
axiom m : Type
axiom inhabited_axiom_m : Inhabited m
attribute [instance] inhabited_axiom_m
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom assoc (a : ℤ) (b : ℤ) (c : ℤ) : a + (b + c) = a + b + c
axiom neutral (x : ℤ) : x + (0 : ℤ) = x ∧ x = (0 : ℤ) + x
axiom agg :  {α : Type} -> [Inhabited α] -> (α -> ℤ) -> List α -> ℤ
axiom agg'def {α : Type} [Inhabited α] (s : List α) (f : α -> ℤ) : if Int.ofNat (List.length s) = (0 : ℤ) then agg f s = (0 : ℤ) else agg f s = f (s[(0 : ℕ)]!) + agg f (List.drop (1 : ℕ) s)
axiom t1 : Type -> Type
axiom inhabited_axiom_t1 {α : Type} [Inhabited α] : Inhabited (t1 α)
attribute [instance] inhabited_axiom_t1
noncomputable def measure {α : Type} [Inhabited α] (x : α) := (1 : ℤ)
structure selector where
  index : ℤ
  hole : Bool
axiom inhabited_axiom_selector : Inhabited selector
attribute [instance] inhabited_axiom_selector
noncomputable def selection_possible {α : Type} [Inhabited α] (s : selector) (l : List α) := (0 : ℤ) ≤ selector.index s ∧ (if selector.hole s = true then selector.index s ≤ Int.ofNat (List.length l) else selector.index s < Int.ofNat (List.length l))
noncomputable def selected {α : Type} [Inhabited α] (s : selector) (e : SelectionTypes.split α) := selector.index s = Int.ofNat (List.length (SelectionTypes.split.left1 e)) ∧ (selector.hole s = true) = (SelectionTypes.split.middle e = (Option.none : Option α))
theorem selected_part'vc {α : Type} [Inhabited α] (s : selector) (lseq : List α) (d : α) (rseq : List α) (fact0 : selection_possible s (lseq ++ List.cons d rseq)) : let ind : ℤ := selector.index s; ∀(result : SelectionTypes.part_base selector), (if Int.ofNat (List.length lseq) < ind then result = SelectionTypes.part_base.Right (selector.mk (ind - Int.ofNat (List.length lseq) - (1 : ℤ)) (selector.hole s)) else if ind < Int.ofNat (List.length lseq) then result = SelectionTypes.part_base.Left s else if selector.hole s = true then result = SelectionTypes.part_base.Left s else result = SelectionTypes.part_base.Here) → (match result with | SelectionTypes.part_base.Here => selected s (SelectionTypes.split.mk lseq (Option.some d) rseq) | SelectionTypes.part_base.Left rsl => selection_possible rsl lseq ∧ (∀(e : SelectionTypes.split α), selected rsl e ∧ SelectionTypes.rebuild e = lseq → selected s (SelectionTypes.right_extend e d rseq)) | SelectionTypes.part_base.Right rsr => selection_possible rsr rseq ∧ (∀(e : SelectionTypes.split α), selected rsr e ∧ SelectionTypes.rebuild e = rseq → selected s (SelectionTypes.left_extend lseq d e)))
  := sorry
end ral_RAL_selected_partqtvc
