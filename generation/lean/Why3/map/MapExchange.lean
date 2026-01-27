import Why3.Base
open Classical
open Lean4Why3
namespace MapExchange
noncomputable def exchange {α : Type} [Inhabited α] (a1 : ℤ -> α) (a2 : ℤ -> α) (l : ℤ) (u : ℤ) (i : ℤ) (j : ℤ) := (l ≤ i ∧ i < u) ∧ (l ≤ j ∧ j < u) ∧ a1 i = a2 j ∧ a1 j = a2 i ∧ (∀(k : ℤ), l ≤ k ∧ k < u → ¬k = i → ¬k = j → a1 k = a2 k)
axiom exchange_set {α : Type} [Inhabited α] (l : ℤ) (i : ℤ) (u : ℤ) (j : ℤ) (a : ℤ -> α) (fact0 : l ≤ i) (fact1 : i < u) (fact2 : l ≤ j) (fact3 : j < u) : exchange a (Function.update (Function.update a i (a j)) j (a i)) l u i j
end MapExchange
