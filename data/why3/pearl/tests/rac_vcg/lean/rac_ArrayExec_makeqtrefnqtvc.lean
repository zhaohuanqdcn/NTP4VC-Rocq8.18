import Why3.Base
open Classical
open Lean4Why3
namespace rac_ArrayExec_makeqtrefnqtvc
structure array (α : Type) where
  length : ℤ
  elts : ℤ -> α
axiom inhabited_axiom_array {α : Type} [Inhabited α] : Inhabited (array α)
attribute [instance] inhabited_axiom_array
axiom map_update :  {α : Type} -> [Inhabited α] -> (ℤ -> α) -> ℤ -> α -> ℤ -> α
axiom map_update'def {α : Type} [Inhabited α] (f : ℤ -> α) (i : ℤ) (x : α) (j : ℤ) : map_update f i x j = (if j = i then x else f j)
noncomputable def mixfix_lbrb' {α : Type} [Inhabited α] (a : array α) (i : ℤ) := array.elts a i
noncomputable def mixfix_lbrb {α : Type} [Inhabited α] (a : array α) (i : ℤ) := array.elts a i
axiom mixfix_lblsmnrb :  {α : Type} -> [Inhabited α] -> array α -> ℤ -> α -> array α
axiom mixfix_lblsmnrb'spec'0 {α : Type} [Inhabited α] (a : array α) (i : ℤ) (v : α) : array.length (mixfix_lblsmnrb a i v) = array.length a
axiom mixfix_lblsmnrb'spec {α : Type} [Inhabited α] (a : array α) (i : ℤ) (v : α) : array.elts (mixfix_lblsmnrb a i v) = Function.update (array.elts a) i v
axiom make :  {α : Type} -> [Inhabited α] -> ℤ -> α -> array α
axiom make_spec {α : Type} [Inhabited α] (n : ℤ) (v : α) (fact0 : (0 : ℤ) ≤ n) : (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → mixfix_lbrb (make n v) i = v) ∧ array.length (make n v) = n
theorem make'refn'vc {α : Type} [Inhabited α] (n : ℤ) (result : array α) (v : α) (fact0 : (0 : ℤ) ≤ n) (fact1 : array.length result = n) (fact2 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → array.elts result i = v) : (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → mixfix_lbrb result i = v) ∧ array.length result = n
  := sorry
end rac_ArrayExec_makeqtrefnqtvc
