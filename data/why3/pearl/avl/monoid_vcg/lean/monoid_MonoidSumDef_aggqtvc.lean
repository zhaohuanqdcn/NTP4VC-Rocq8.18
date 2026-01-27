import Why3.Base
open Classical
open Lean4Why3
namespace monoid_MonoidSumDef_aggqtvc
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom zero : t
axiom op : t -> t -> t
axiom assoc (a : t) (b : t) (c : t) : op a (op b c) = op (op a b) c
axiom neutral (x : t) : op x zero = x ∧ x = op zero x
theorem agg'vc {α : Type} [Inhabited α] (s : List α) (fact0 : ¬Int.ofNat (List.length s) = (0 : ℤ)) : (0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) ≤ Int.ofNat (List.length s) ∧ (0 : ℤ) ≤ Int.ofNat (List.length s) ∧ List.length (List.drop (1 : ℕ) s) < List.length s
  := sorry
end monoid_MonoidSumDef_aggqtvc
