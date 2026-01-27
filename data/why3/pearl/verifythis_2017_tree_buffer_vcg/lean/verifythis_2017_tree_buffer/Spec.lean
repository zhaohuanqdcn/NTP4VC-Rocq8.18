import Why3.Base
open Classical
open Lean4Why3
namespace Spec
structure buf (α : Type) where
  h : ℤ
  xs : List α
axiom inhabited_axiom_buf {α : Type} [Inhabited α] : Inhabited (buf α)
attribute [instance] inhabited_axiom_buf
noncomputable def take {α : Type} [Inhabited α] : ℤ -> List α -> List α
  | n, ([] : List α) => ([] : List α)
  | n, (List.cons x xs1) => if n = (0 : ℤ) then ([] : List α) else List.cons x (take (n - (1 : ℤ)) xs1)
noncomputable def add {α : Type} [Inhabited α] (x : α) (b : buf α) := buf.mk (buf.h b) (List.cons x (buf.xs b))
noncomputable def get {α : Type} [Inhabited α] (b : buf α) := take (buf.h b) (buf.xs b)
end Spec
