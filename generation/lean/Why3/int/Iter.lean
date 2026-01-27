import Why3.Base
open Classical
open Lean4Why3
namespace Iter
axiom iter :  {α : Type} -> [Inhabited α] -> (α -> α) -> ℤ -> α -> α
axiom iter'def {α : Type} [Inhabited α] (k : ℤ) (f : α -> α) (x : α) (fact0 : (0 : ℤ) ≤ k) : if k = (0 : ℤ) then iter f k x = x else iter f k x = iter f (k - (1 : ℤ)) (f x)
axiom iter_1 {α : Type} [Inhabited α] (f : α -> α) (x : α) : iter f (1 : ℤ) x = f x
axiom iter_s {α : Type} [Inhabited α] (k : ℤ) (f : α -> α) (x : α) (fact0 : (0 : ℤ) < k) : iter f k x = f (iter f (k - (1 : ℤ)) x)
end Iter
