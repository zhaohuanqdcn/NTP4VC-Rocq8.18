import Why3.Base
open Classical
open Lean4Why3
namespace Functional
axiom key : Type
axiom inhabited_axiom_key : Inhabited key
attribute [instance] inhabited_axiom_key
axiom value : Type
axiom inhabited_axiom_value : Inhabited value
attribute [instance] inhabited_axiom_value
axiom model : Type
axiom inhabited_axiom_model : Inhabited model
attribute [instance] inhabited_axiom_model
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom model1 : t -> key -> Option value
axiom empty : t
axiom empty1 (k : key) : model1 empty k = Option.none
noncomputable def get (d : t) (k : key) := model1 d k
axiom set : t -> key -> value -> t
axiom set'spec'0 (d : t) (k : key) (v : value) : get (set d k v) k = Option.some v
axiom set'spec (k' : key) (k : key) (d : t) (v : value) (fact0 : ¬k' = k) : get (set d k v) k' = get d k'
end Functional
