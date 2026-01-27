import Why3.Base
import pearl.prover.lib.lean.BacktrackArray.Types
import pearl.prover.lib.lean.Functions.Config
import pearl.prover.lib.lean.Functions.Func
import pearl.prover.lib.lean.Predicates.Pred
import pearl.prover.lib.lean.BacktrackArray.Logic
import pearl.prover.lib.lean.Choice.Choice
open Classical
open Lean4Why3
namespace BacktrackArray_Impl_createqtvc
theorem create'vc {α : Type} [Inhabited α] (p : α -> Bool) : (0 : ℤ) ≤ (1 : ℤ) ∧ (∀(o1 : List (List α)), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (1 : ℤ) → o1[Int.toNat i]! = ([] : List α)) ∧ Int.ofNat (List.length o1) = (1 : ℤ) → (let res : Types.t α := Types.t.mk ([] : List ℤ) (0 : ℤ) o1 p; (∀(t : Types.timestamp α), Logic.past_time t res → Types.timestamp.table t = Func.const ([] : List α)) ∧ Logic.past_time (Logic.current_timestamp res) res ∧ Logic.correct res))
  := sorry
end BacktrackArray_Impl_createqtvc
