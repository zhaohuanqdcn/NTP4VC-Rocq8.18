import Why3.Base
import pearl.prover.lib.lean.BacktrackArray.Types
import pearl.prover.lib.lean.Functions.Config
import pearl.prover.lib.lean.Functions.Func
import pearl.prover.lib.lean.Predicates.Pred
import pearl.prover.lib.lean.BacktrackArray.Logic
import pearl.prover.lib.lean.Choice.Choice
open Classical
open Lean4Why3
namespace BacktrackArray_Impl_getqtvc
theorem get'vc {α : Type} [Inhabited α] (tb : Types.t α) (x : ℤ) (fact0 : Logic.correct tb) (fact1 : (0 : ℤ) ≤ x) : let o1 : ℤ := Int.ofNat (List.length (Types.t.buffer tb)); (¬o1 ≤ x → (0 : ℤ) ≤ x ∧ x < Int.ofNat (List.length (Types.t.buffer tb))) ∧ (∀(result : List α), (if o1 ≤ x then result = ([] : List α) else result = (Types.t.buffer tb)[Int.toNat x]!) → result = Types.timestamp.table (Logic.current_timestamp tb) x ∧ Logic.list_forall (Types.t.inv tb) result)
  := sorry
end BacktrackArray_Impl_getqtvc
