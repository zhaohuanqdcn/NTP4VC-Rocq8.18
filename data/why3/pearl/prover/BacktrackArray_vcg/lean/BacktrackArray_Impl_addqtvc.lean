import Why3.Base
import pearl.prover.lib.lean.BacktrackArray.Types
import pearl.prover.lib.lean.Functions.Config
import pearl.prover.lib.lean.Functions.Func
import pearl.prover.lib.lean.Predicates.Pred
import pearl.prover.lib.lean.BacktrackArray.Logic
import pearl.prover.lib.lean.Choice.Choice
open Classical
open Lean4Why3
namespace BacktrackArray_Impl_addqtvc
theorem add'vc {α : Type} [Inhabited α] (tb : Types.t α) (x : ℤ) (b : α) (fact0 : Logic.correct tb) (fact1 : (0 : ℤ) ≤ x) (fact2 : Types.t.inv tb b = true) : if Int.ofNat (List.length (Types.t.buffer tb)) ≤ x then (Logic.correct tb ∧ Int.ofNat (List.length (Types.t.buffer tb)) ≤ x) ∧ (∀(tb1 : Types.t α), Types.t.inv tb1 = Types.t.inv tb → x < Int.ofNat (List.length (Types.t.buffer tb1)) ∧ Logic.precede tb tb1 ∧ Logic.correct tb1 ∧ Types.timestamp.table (Logic.current_timestamp tb1) = Types.timestamp.table (Logic.current_timestamp tb) → (((0 : ℤ) ≤ x ∧ x < Int.ofNat (List.length (Types.t.buffer tb1))) ∧ Logic.correct tb1 ∧ Types.t.inv tb1 b = true) ∧ (∀(tb2 : Types.t α), List.length (Types.t.buffer tb2) = List.length (Types.t.buffer tb1) ∧ Types.t.inv tb2 = Types.t.inv tb1 → Logic.past_time (Logic.current_timestamp tb2) tb2 ∧ Logic.correct tb2 ∧ Logic.precede tb1 tb2 ∧ (let tb0 : ℤ -> List α := Types.timestamp.table (Logic.current_timestamp tb1); Types.timestamp.table (Logic.current_timestamp tb2) = Func.update tb0 x (List.cons b (tb0 x))) → Logic.past_time (Logic.current_timestamp tb2) tb2 ∧ Logic.correct tb2 ∧ Logic.precede tb tb2 ∧ (let tb0 : ℤ -> List α := Types.timestamp.table (Logic.current_timestamp tb); Types.timestamp.table (Logic.current_timestamp tb2) = Func.update tb0 x (List.cons b (tb0 x))))) else ((0 : ℤ) ≤ x ∧ x < Int.ofNat (List.length (Types.t.buffer tb))) ∧ Logic.correct tb ∧ Types.t.inv tb b = true
  := sorry
end BacktrackArray_Impl_addqtvc
