import Why3.Base
open Classical
open Lean4Why3
namespace Choice
axiom default :  {α : Type} -> [Inhabited α] -> α
axiom choice :  {α : Type} -> [Inhabited α] -> (α -> Bool) -> α
axiom choice_behaviour {α : Type} [Inhabited α] (p : α -> Bool) (x : α) (fact0 : p x = true) : p (choice p) = true
end Choice
