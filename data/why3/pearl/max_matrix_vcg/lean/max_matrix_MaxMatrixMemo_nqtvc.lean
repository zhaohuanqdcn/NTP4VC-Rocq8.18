import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.Const
import pearl.max_matrix_vcg.lean.max_matrix.Bitset
open Classical
open Lean4Why3
namespace max_matrix_MaxMatrixMemo_nqtvc
axiom t : Type -> Type
axiom inhabited_axiom_t {α : Type} [Inhabited α] : Inhabited (t α)
attribute [instance] inhabited_axiom_t
axiom contents :  {α : Type} -> [Inhabited α] -> t α -> ℤ -> α
axiom create :  {α : Type} -> [Inhabited α] -> α -> t α
axiom create'spec {α : Type} [Inhabited α] (x : α) : contents (create x) = Const.const x
axiom mixfix_lbrb :  {α : Type} -> [Inhabited α] -> t α -> ℤ -> α
axiom mixfix_lbrb'spec {α : Type} [Inhabited α] (m : t α) (k : ℤ) : mixfix_lbrb m k = contents m k
axiom mixfix_lblsmnrb :  {α : Type} -> [Inhabited α] -> t α -> ℤ -> α -> t α
axiom mixfix_lblsmnrb'spec {α : Type} [Inhabited α] (m : t α) (k : ℤ) (v : α) : contents (mixfix_lblsmnrb m k v) = Function.update (contents m) k v
theorem n'vc : True
  := sorry
end max_matrix_MaxMatrixMemo_nqtvc
