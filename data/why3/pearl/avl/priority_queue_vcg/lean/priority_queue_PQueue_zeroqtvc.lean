import Why3.Base
import Why3.why3.Ref.Ref
import pearl.avl.lib.lean.avl.SelectionTypes
open Classical
open Lean4Why3
namespace priority_queue_PQueue_zeroqtvc
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
theorem zero'vc : True
  := sorry
end priority_queue_PQueue_zeroqtvc
