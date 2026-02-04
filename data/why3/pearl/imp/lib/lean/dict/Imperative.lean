import Why3.Base
open Classical
open Lean4Why3
namespace Imperative
axiom model : Type -> Type -> Type
axiom inhabited_axiom_model {ty'key : Type} [Inhabited ty'key] {ty'value : Type} [Inhabited ty'value] : Inhabited (model ty'key ty'value)
attribute [instance] inhabited_axiom_model
axiom t : Type -> Type -> Type
axiom inhabited_axiom_t {ty'key : Type} [Inhabited ty'key] {ty'value : Type} [Inhabited ty'value] : Inhabited (t ty'key ty'value)
attribute [instance] inhabited_axiom_t
axiom model1 :  {ty'value : Type} -> [Inhabited ty'value] ->  {ty'key : Type} -> [Inhabited ty'key] -> t ty'key ty'value -> ty'key -> Option ty'value
noncomputable def get {ty'value : Type} {ty'key : Type} [Inhabited ty'value] [Inhabited ty'key] (d : t ty'key ty'value) (k : ty'key) := model1 d k
end Imperative
