import Why3.Base
import Why3.why3.Ref.Ref
import pearl.avl.lib.lean.avl.SelectionTypes
open Classical
open Lean4Why3
namespace priority_queue_PQueue_balancingqtrefnqtvc
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
noncomputable def op (x : Option t1) (y : Option t1) := match x with | Option.none => y | Option.some a => (match y with | Option.none => x | Option.some b => (if lt b a then y else x))
axiom assoc (a : Option t1) (b : Option t1) (c : Option t1) : op a (op b c) = op (op a b) c
axiom neutral (x : Option t1) : op x Option.none = x ∧ x = op Option.none x
axiom agg :  {α : Type} -> [Inhabited α] -> (α -> Option t1) -> List α -> Option t1
axiom agg'def {α : Type} [Inhabited α] (s : List α) (f : α -> Option t1) : if Int.ofNat (List.length s) = (0 : ℤ) then agg f s = Option.none else agg f s = op (f (s[(0 : ℕ)]!)) (agg f (List.drop (1 : ℕ) s))
noncomputable def measure {α : Type} [Inhabited α] (d : t α) := Option.some (key d)
axiom selector : Type
axiom inhabited_axiom_selector : Inhabited selector
attribute [instance] inhabited_axiom_selector
noncomputable def selection_possible {ε : Type} {η : Type} [Inhabited ε] [Inhabited η] (x : ε) (s : List η) := ¬Int.ofNat (List.length s) = (0 : ℤ)
noncomputable def lower_bound {α : Type} [Inhabited α] (x : t1) (s : List (t α)) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s) → le x (key (s[Int.toNat i]!))
noncomputable def lower_bound_strict {α : Type} [Inhabited α] (x : t1) (s : List (t α)) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s) → lt x (key (s[Int.toNat i]!))
noncomputable def selected {ε : Type} {α : Type} [Inhabited ε] [Inhabited α] (x : ε) (e : SelectionTypes.split (t α)) := match SelectionTypes.split.middle e with | (Option.none : Option (t α)) => False | Option.some d => lower_bound (key d) (SelectionTypes.split.right1 e) ∧ lower_bound_strict (key d) (SelectionTypes.split.left1 e)
theorem balancing'refn'vc : (0 : ℤ) < Int.ofNat balancing
  := sorry
end priority_queue_PQueue_balancingqtrefnqtvc
