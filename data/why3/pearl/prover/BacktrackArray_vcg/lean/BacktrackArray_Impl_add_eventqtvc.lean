import Why3.Base
import pearl.prover.lib.lean.BacktrackArray.Types
import pearl.prover.lib.lean.Functions.Config
import pearl.prover.lib.lean.Functions.Func
import pearl.prover.lib.lean.Predicates.Pred
import pearl.prover.lib.lean.BacktrackArray.Logic
import pearl.prover.lib.lean.Choice.Choice
open Classical
open Lean4Why3
namespace BacktrackArray_Impl_add_eventqtvc
theorem add_event'vc {α : Type} [Inhabited α] (tb : Types.t α) (x : ℤ) (tb1 : Types.t α) (tb2 : Types.t α) (fact0 : Types.t.history tb = List.cons x (Types.t.history tb1)) (fact1 : Types.t.current_time tb = Types.t.current_time tb1) (fact2 : Types.t.buffer tb = Types.t.buffer tb1) (fact3 : Types.t.inv tb = Types.t.inv tb1) (fact4 : Types.t.history tb2 = Types.t.history tb) (fact5 : Types.t.current_time tb2 = Types.t.current_time tb + (1 : ℤ)) (fact6 : Types.t.buffer tb2 = Types.t.buffer tb) (fact7 : Types.t.inv tb2 = Types.t.inv tb) : Types.t.history tb2 = List.cons x (Types.t.history tb1) ∧ Types.t.current_time tb2 = Types.t.current_time tb1 + (1 : ℤ)
  := sorry
end BacktrackArray_Impl_add_eventqtvc
