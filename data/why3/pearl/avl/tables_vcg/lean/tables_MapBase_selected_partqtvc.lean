import Why3.Base
import Why3.why3.Ref.Ref
import pearl.avl.lib.lean.avl.SelectionTypes
open Classical
open Lean4Why3
namespace tables_MapBase_selected_partqtvc
axiom balancing : ℕ
axiom balancing'def : (0 : ℤ) < Int.ofNat balancing
axiom t : Type -> Type
axiom inhabited_axiom_t {α : Type} [Inhabited α] : Inhabited (t α)
attribute [instance] inhabited_axiom_t
axiom t1 : Type
axiom inhabited_axiom_t1 : Inhabited t1
attribute [instance] inhabited_axiom_t1
axiom key :  {α : Type} -> [Inhabited α] -> t α -> t1
axiom le : t1 -> t1 -> Prop
axiom Refl (x : t1) : le x x
axiom Trans (x : t1) (y : t1) (z : t1) (fact0 : le x y) (fact1 : le y z) : le x z
axiom eq : t1 -> t1 -> Prop
axiom eq_def (x : t1) (y : t1) : eq x y = (le x y ∧ le y x)
axiom lt : t1 -> t1 -> Prop
axiom lt_def (x : t1) (y : t1) : lt x y = (le x y ∧ ¬le y x)
axiom Total (x : t1) (y : t1) : le x y ∨ le y x
axiom t2 : Type
axiom inhabited_axiom_t2 : Inhabited t2
attribute [instance] inhabited_axiom_t2
axiom assoc : True
axiom neutral (x : Unit) : () = x ∧ x = ()
axiom selector : Type
axiom inhabited_axiom_selector : Inhabited selector
attribute [instance] inhabited_axiom_selector
noncomputable def selection_possible {β : Type} {α : Type} [Inhabited β] [Inhabited α] (x : β) (s : List (t α)) := ∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < j ∧ j < Int.ofNat (List.length s) → lt (key (s[Int.toNat i]!)) (key (s[Int.toNat j]!))
noncomputable def upper_bound_s {α : Type} [Inhabited α] (k : t1) (s : List (t α)) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s) → lt (key (s[Int.toNat i]!)) k
noncomputable def lower_bound_s {α : Type} [Inhabited α] (k : t1) (s : List (t α)) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s) → lt k (key (s[Int.toNat i]!))
noncomputable def selected {α : Type} [Inhabited α] (k : t1) (e : SelectionTypes.split (t α)) := upper_bound_s k (SelectionTypes.split.left1 e) ∧ lower_bound_s k (SelectionTypes.split.right1 e) ∧ (match SelectionTypes.split.middle e with | (Option.none : Option (t α)) => True | Option.some d => eq k (key d))
theorem selected_part'vc {α : Type} [Inhabited α] (k : t1) (lseq : List (t α)) (d : t α) (rseq : List (t α)) (fact0 : selection_possible k (lseq ++ List.cons d rseq)) : let kd : t1 := key d; let o1 : List (t α) := List.cons d rseq; Int.ofNat (List.length o1) = (1 : ℤ) + Int.ofNat (List.length rseq) ∧ o1[(0 : ℕ)]! = d ∧ (∀(i : ℤ), (0 : ℤ) < i ∧ i ≤ Int.ofNat (List.length rseq) → o1[Int.toNat i]! = rseq[Int.toNat (i - (1 : ℤ))]!) → (let s : List (t α) := lseq ++ o1; Int.ofNat (List.length s) = Int.ofNat (List.length lseq) + Int.ofNat (List.length o1) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length lseq) → s[Int.toNat i]! = lseq[Int.toNat i]!) ∧ (∀(i : ℤ), Int.ofNat (List.length lseq) ≤ i ∧ i < Int.ofNat (List.length s) → s[Int.toNat i]! = o1[Int.toNat (i - Int.ofNat (List.length lseq))]!) → (∀(cmp : ℤ), ((0 : ℤ) < cmp) = lt kd k ∧ (cmp < (0 : ℤ)) = lt k kd ∧ (cmp = (0 : ℤ)) = eq k kd → (∀(result : SelectionTypes.part_base t1), (if cmp < (0 : ℤ) then result = SelectionTypes.part_base.Left k else if (0 : ℤ) < cmp then result = SelectionTypes.part_base.Right k else result = SelectionTypes.part_base.Here) → (match result with | SelectionTypes.part_base.Here => selected k (SelectionTypes.split.mk lseq (Option.some d) rseq) | SelectionTypes.part_base.Left sl => selection_possible sl lseq ∧ (∀(e : SelectionTypes.split (t α)), selected sl e ∧ SelectionTypes.rebuild e = lseq → selected k (SelectionTypes.right_extend e d rseq)) | SelectionTypes.part_base.Right sr => selection_possible sr rseq ∧ (∀(e : SelectionTypes.split (t α)), selected sr e ∧ SelectionTypes.rebuild e = rseq → selected k (SelectionTypes.left_extend lseq d e))))))
  := sorry
end tables_MapBase_selected_partqtvc
