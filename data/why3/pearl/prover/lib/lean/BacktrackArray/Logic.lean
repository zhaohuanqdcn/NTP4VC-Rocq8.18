import Why3.Base
import pearl.prover.lib.lean.BacktrackArray.Types
import pearl.prover.lib.lean.Functions.Config
import pearl.prover.lib.lean.Functions.Func
import pearl.prover.lib.lean.Predicates.Pred
import pearl.prover.lib.lean.Choice.Choice
open Classical
open Lean4Why3
namespace Logic
axiom func_of_array :  {α : Type} -> [Inhabited α] -> List α -> α -> ℤ -> α
axiom func_of_array_def {α : Type} [Inhabited α] (a : List α) (def1 : α) (x : ℤ) : func_of_array a def1 x = (if (0 : ℤ) ≤ x ∧ x < Int.ofNat (List.length a) then (getElem! a ∘ Int.toNat) x else def1)
noncomputable def current_timestamp {α : Type} [Inhabited α] (x : Types.t α) := Types.timestamp.mk (Types.t.current_time x) (Int.ofNat (List.length (Types.t.buffer x))) (func_of_array (Types.t.buffer x) ([] : List α))
noncomputable def correct_table {α : Type} [Inhabited α] (sz : ℤ) (b : ℤ -> List α) := ∀(x : ℤ), sz ≤ x ∨ x < (0 : ℤ) → b x = ([] : List α)
noncomputable def pop {α : Type} [Inhabited α] (l : List α) := match l with | ([] : List α) => (Choice.default : List α) | List.cons x_x q => q
noncomputable def unroll {α : Type} [Inhabited α] : ℤ -> ℤ -> List ℤ -> (ℤ -> List α) -> ℤ -> Types.timestamp α
  | tm, t0, h, b, sz => if tm = (0 : ℤ) then Types.timestamp.mk t0 sz b else match h with | ([] : List ℤ) => Types.timestamp.mk (t0 + tm) sz b | List.cons x q => (if x = -(1 : ℤ) then unroll (tm - (1 : ℤ)) t0 q b (Int.tdiv sz (2 : ℤ)) else unroll (tm - (1 : ℤ)) t0 q (Func.update b x (pop (b x))) sz)
noncomputable def unroll_correct {α : Type} [Inhabited α] : ℤ -> List ℤ -> (ℤ -> List α) -> ℤ -> Prop
  | tm, ([] : List ℤ), b, sz => tm = (0 : ℤ)
  | tm, (List.cons x q), b, sz => if x = -(1 : ℤ) then let s0 : ℤ := Int.tdiv sz (2 : ℤ); s0 * (2 : ℤ) = sz ∧ unroll_correct (tm - (1 : ℤ)) q b s0 ∧ (∀(i : ℤ), s0 ≤ i ∨ i < (0 : ℤ) → b i = ([] : List α)) else ¬b x = ([] : List α) ∧ ((0 : ℤ) ≤ x ∧ x < sz) ∧ unroll_correct (tm - (1 : ℤ)) q (Func.update b x (pop (b x))) sz
noncomputable def past_time {α : Type} [Inhabited α] (t : Types.timestamp α) (tb : Types.t α) := Types.timestamp.time t ≤ Types.t.current_time tb ∧ unroll (Types.t.current_time tb - Types.timestamp.time t) (Types.timestamp.time t) (Types.t.history tb) (func_of_array (Types.t.buffer tb) ([] : List α)) (Int.ofNat (List.length (Types.t.buffer tb))) = t
noncomputable def precede {α : Type} [Inhabited α] (tb1 : Types.t α) (tb2 : Types.t α) := ∀(t : Types.timestamp α), past_time t tb1 → past_time t tb2
noncomputable def before {α : Type} [Inhabited α] (t1 : Types.timestamp α) (t2 : Types.timestamp α) := Types.timestamp.time t1 ≤ Types.timestamp.time t2
noncomputable def list_forall {α : Type} [Inhabited α] : (α -> Bool) -> List α -> Prop
  | p, ([] : List α) => True
  | p, (List.cons x q) => p x = true ∧ list_forall p q
noncomputable def correct {α : Type} [Inhabited α] (tb : Types.t α) := (∀(t : Types.timestamp α), past_time t tb → (0 : ℤ) < Types.timestamp.size t) ∧ (∀(t : Types.timestamp α) (i : ℤ), past_time t tb ∧ (0 : ℤ) ≤ i → list_forall (Types.t.inv tb) (Types.timestamp.table t i)) ∧ (∀(t : Types.timestamp α), past_time t tb → correct_table (Types.timestamp.size t) (Types.timestamp.table t)) ∧ unroll_correct (Types.t.current_time tb) (Types.t.history tb) (func_of_array (Types.t.buffer tb) ([] : List α)) (Int.ofNat (List.length (Types.t.buffer tb)))
noncomputable def backtrack_to {α : Type} [Inhabited α] (tbold : Types.t α) (tbinter : Types.t α) (tbnew : Types.t α) := (∀(tm : Types.timestamp α), past_time tm tbold → past_time tm tbinter ∧ Types.timestamp.time tm ≤ Types.timestamp.time (current_timestamp tbold) ∧ Types.timestamp.time tm ≤ Types.timestamp.time (current_timestamp tbnew) ∧ before tm (current_timestamp tbnew) ∧ past_time tm tbnew) ∧ (∀(tm : Types.timestamp α), past_time tm tbold → past_time tm tbnew) ∧ precede tbold tbnew
end Logic
