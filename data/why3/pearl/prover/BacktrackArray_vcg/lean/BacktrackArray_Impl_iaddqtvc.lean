import Why3.Base
import pearl.prover.lib.lean.BacktrackArray.Types
import pearl.prover.lib.lean.Functions.Config
import pearl.prover.lib.lean.Functions.Func
import pearl.prover.lib.lean.Predicates.Pred
import pearl.prover.lib.lean.BacktrackArray.Logic
import pearl.prover.lib.lean.Choice.Choice
open Classical
open Lean4Why3
namespace BacktrackArray_Impl_iaddqtvc
theorem iadd'vc {α : Type} [Inhabited α] (x : ℤ) (tb : Types.t α) (b : α) (fact0 : (0 : ℤ) ≤ x) (fact1 : x < Int.ofNat (List.length (Types.t.buffer tb))) (fact2 : Logic.correct tb) (fact3 : Types.t.inv tb b = true) : let buf : List (List α) := Types.t.buffer tb; ((0 : ℤ) ≤ x ∧ x < Int.ofNat (List.length buf)) ∧ (let o1 : List α := List.cons b (buf[Int.toNat x]!); ((0 : ℤ) ≤ x ∧ x < Int.ofNat (List.length buf)) ∧ (List.length (List.set buf (Int.toNat x) o1) = List.length buf → List.length (List.set buf (Int.toNat x) o1) = List.length (Types.t.buffer tb) → getElem! (List.set buf (Int.toNat x) o1) ∘ Int.toNat = Function.update (getElem! buf ∘ Int.toNat) x o1 → (∀(tb1 : Types.t α), Types.t.buffer tb1 = Types.t.buffer (Types.t.mk (Types.t.history tb) (Types.t.current_time tb) (List.set buf (Int.toNat x) o1) (Types.t.inv tb)) ∧ Types.t.inv tb1 = Types.t.inv (Types.t.mk (Types.t.history tb) (Types.t.current_time tb) (List.set buf (Int.toNat x) o1) (Types.t.inv tb)) → Types.t.history tb1 = List.cons x (Types.t.history (Types.t.mk (Types.t.history tb) (Types.t.current_time tb) (List.set buf (Int.toNat x) o1) (Types.t.inv tb))) ∧ Types.t.current_time tb1 = Types.t.current_time (Types.t.mk (Types.t.history tb) (Types.t.current_time tb) (List.set buf (Int.toNat x) o1) (Types.t.inv tb)) + (1 : ℤ) → Logic.past_time (Logic.current_timestamp tb1) tb1 ∧ Logic.correct tb1 ∧ Logic.precede tb tb1 ∧ (let tb0 : ℤ -> List α := Types.timestamp.table (Logic.current_timestamp tb); Types.timestamp.table (Logic.current_timestamp tb1) = Func.update tb0 x (List.cons b (tb0 x))))))
  := sorry
end BacktrackArray_Impl_iaddqtvc
