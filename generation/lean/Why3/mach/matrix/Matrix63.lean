import Why3.Base
open Classical
open Lean4Why3
namespace Matrix63
axiom matrix : Type -> Type
axiom inhabited_axiom_matrix {α : Type} [Inhabited α] : Inhabited (matrix α)
attribute [instance] inhabited_axiom_matrix
axiom elts :  {α : Type} -> [Inhabited α] -> matrix α -> ℤ -> ℤ -> α
axiom rows :  {α : Type} -> [Inhabited α] -> matrix α -> BitVec 63
axiom columns :  {α : Type} -> [Inhabited α] -> matrix α -> BitVec 63
axiom matrix'invariant {α : Type} [Inhabited α] (self : matrix α) : (0 : ℤ) ≤ BitVec.toInt (rows self) ∧ (0 : ℤ) ≤ BitVec.toInt (columns self)
axiom get_unsafe :  {α : Type} -> [Inhabited α] -> matrix α -> ℤ -> ℤ -> α
axiom get_unsafe'spec {α : Type} [Inhabited α] (a : matrix α) (r : ℤ) (c : ℤ) : get_unsafe a r c = elts a r c
axiom set_unsafe :  {α : Type} -> [Inhabited α] -> matrix α -> ℤ -> ℤ -> α -> matrix α
axiom set_unsafe'spec {α : Type} [Inhabited α] (a : matrix α) (r : ℤ) (c : ℤ) (v : α) : rows (set_unsafe a r c v) = rows a ∧ columns (set_unsafe a r c v) = columns a ∧ elts (set_unsafe a r c v) = Function.update (elts a) r (Function.update (elts a r) c v)
noncomputable def valid_index {α : Type} [Inhabited α] (a : matrix α) (r : BitVec 63) (c : BitVec 63) := ((0 : ℤ) ≤ BitVec.toInt r ∧ BitVec.toInt r < BitVec.toInt (rows a)) ∧ (0 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c < BitVec.toInt (columns a)
end Matrix63
