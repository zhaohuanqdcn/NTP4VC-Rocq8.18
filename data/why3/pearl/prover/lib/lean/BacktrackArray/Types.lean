import Why3.Base
import pearl.prover.lib.lean.Functions.Config
import pearl.prover.lib.lean.Functions.Func
import pearl.prover.lib.lean.Predicates.Pred
open Classical
open Lean4Why3
namespace Types
structure timestamp (α : Type) where
  time : ℤ
  size : ℤ
  table : ℤ -> List α
axiom inhabited_axiom_timestamp {α : Type} [Inhabited α] : Inhabited (timestamp α)
attribute [instance] inhabited_axiom_timestamp
structure t (α : Type) where
  history : List ℤ
  current_time : ℤ
  buffer : List (List α)
  inv : α -> Bool
axiom inhabited_axiom_t {α : Type} [Inhabited α] : Inhabited (t α)
attribute [instance] inhabited_axiom_t
end Types
