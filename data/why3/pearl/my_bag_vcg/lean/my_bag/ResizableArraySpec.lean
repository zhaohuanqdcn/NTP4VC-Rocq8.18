import Why3.Base
import Why3.map.Const
open Classical
open Lean4Why3
namespace ResizableArraySpec
axiom rarray : Type -> Type
axiom inhabited_axiom_rarray {α : Type} [Inhabited α] : Inhabited (rarray α)
attribute [instance] inhabited_axiom_rarray
axiom len :  {α : Type} -> [Inhabited α] -> rarray α -> ℤ
axiom data :  {α : Type} -> [Inhabited α] -> rarray α -> ℤ -> α
axiom rarray'invariant {α : Type} [Inhabited α] (self : rarray α) : (0 : ℤ) ≤ len self
noncomputable def mixfix_lbrb {α : Type} [Inhabited α] (r : rarray α) (i : ℤ) := data r i
axiom mixfix_lblsmnrb :  {α : Type} -> [Inhabited α] -> rarray α -> ℤ -> α -> rarray α
axiom mixfix_lblsmnrb'spec'0 {α : Type} [Inhabited α] (r : rarray α) (i : ℤ) (v : α) : len (mixfix_lblsmnrb r i v) = len r
axiom mixfix_lblsmnrb'spec {α : Type} [Inhabited α] (r : rarray α) (i : ℤ) (v : α) : data (mixfix_lblsmnrb r i v) = Function.update (data r) i v
end ResizableArraySpec
