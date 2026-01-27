import Why3.Base
import Why3.map.Const
open Classical
open Lean4Why3
namespace ResizableArraySpec
axiom rarray : Type -> Type
axiom inhabited_axiom_rarray {α : Type} [Inhabited α] : Inhabited (rarray α)
attribute [instance] inhabited_axiom_rarray
axiom length :  {α : Type} -> [Inhabited α] -> rarray α -> ℤ
axiom data :  {α : Type} -> [Inhabited α] -> rarray α -> ℤ -> α
noncomputable def mixfix_lbrb {α : Type} [Inhabited α] (r : rarray α) (i : ℤ) := data r i
axiom mixfix_lblsmnrb :  {α : Type} -> [Inhabited α] -> rarray α -> ℤ -> α -> rarray α
axiom mixfix_lblsmnrb'spec'0 {α : Type} [Inhabited α] (r : rarray α) (i : ℤ) (v : α) : length (mixfix_lblsmnrb r i v) = length r
axiom mixfix_lblsmnrb'spec {α : Type} [Inhabited α] (r : rarray α) (i : ℤ) (v : α) : data (mixfix_lblsmnrb r i v) = Function.update (data r) i v
end ResizableArraySpec
