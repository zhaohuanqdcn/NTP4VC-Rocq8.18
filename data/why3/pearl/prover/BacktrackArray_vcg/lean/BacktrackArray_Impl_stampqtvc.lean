import Why3.Base
import pearl.prover.lib.lean.BacktrackArray.Types
import pearl.prover.lib.lean.Functions.Config
import pearl.prover.lib.lean.Functions.Func
import pearl.prover.lib.lean.Predicates.Pred
import pearl.prover.lib.lean.BacktrackArray.Logic
import pearl.prover.lib.lean.Choice.Choice
open Classical
open Lean4Why3
namespace BacktrackArray_Impl_stampqtvc
theorem stamp'vc {α : Type} [Inhabited α] (tb : Types.t α) (fact0 : Logic.correct tb) : Types.timestamp.mk (Types.t.current_time tb) (Int.ofNat (List.length (Types.t.buffer tb))) (Logic.func_of_array (Types.t.buffer tb) ([] : List α)) = Logic.current_timestamp tb
  := sorry
end BacktrackArray_Impl_stampqtvc
