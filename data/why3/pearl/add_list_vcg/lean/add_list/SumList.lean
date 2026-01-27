import Why3.Base
open Classical
open Lean4Why3
namespace SumList
inductive or_integer_float where
  | Integer : ℤ -> or_integer_float
  | Real : ℝ -> or_integer_float
axiom inhabited_axiom_or_integer_float : Inhabited or_integer_float
attribute [instance] inhabited_axiom_or_integer_float
noncomputable def add_int : List or_integer_float -> ℤ
  | ([] : List or_integer_float) => (0 : ℤ)
  | (List.cons (or_integer_float.Integer n) t) => n + add_int t
  | (List.cons x t) => add_int t
noncomputable def add_real : List or_integer_float -> ℝ
  | ([] : List or_integer_float) => (0 : ℝ)
  | (List.cons (or_integer_float.Real x) t) => x + add_real t
  | (List.cons x t) => add_real t
end SumList
