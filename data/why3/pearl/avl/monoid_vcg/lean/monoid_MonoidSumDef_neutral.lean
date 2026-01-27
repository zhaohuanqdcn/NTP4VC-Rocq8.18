import Why3.Base
open Classical
open Lean4Why3
namespace monoid_MonoidSumDef_neutral
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom zero : t
axiom op : t -> t -> t
axiom assoc (a : t) (b : t) (c : t) : op a (op b c) = op (op a b) c
axiom neutral (x : t) : op x zero = x ∧ x = op zero x
axiom agg :  {α : Type} -> [Inhabited α] -> (α -> t) -> List α -> t
axiom agg'def {α : Type} [Inhabited α] (s : List α) (f : α -> t) : if Int.ofNat (List.length s) = (0 : ℤ) then agg f s = zero else agg f s = op (f (s[(0 : ℕ)]!)) (agg f (List.drop (1 : ℕ) s))
theorem neutral1 (x : t) : op x zero = x ∧ x = op zero x
  := sorry
end monoid_MonoidSumDef_neutral
