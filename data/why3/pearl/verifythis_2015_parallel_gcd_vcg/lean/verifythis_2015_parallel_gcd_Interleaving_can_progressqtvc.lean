import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace verifythis_2015_parallel_gcd_Interleaving_can_progressqtvc
inductive state where
  | ReadA : state
  | ReadB : state
  | Compare : state
  | Halt : state
axiom inhabited_axiom_state : Inhabited state
attribute [instance] inhabited_axiom_state
structure thread where
  local_a : ℤ
  local_b : ℤ
  state1 : state
axiom inhabited_axiom_thread : Inhabited thread
attribute [instance] inhabited_axiom_thread
noncomputable def inv (th : thread) (d : ℤ) (a : ℤ) (b : ℤ) := (0 : ℤ) < a ∧ (0 : ℤ) < b ∧ Int.ofNat (Int.gcd a b) = d ∧ (match thread.state1 th with | state.ReadA => True | state.ReadB => thread.local_a th = a | state.Compare => thread.local_a th = a ∧ b ≤ thread.local_b th ∧ (thread.local_b th ≤ thread.local_a th → thread.local_b th = b) | state.Halt => thread.local_a th = a ∧ a = b)
noncomputable def progress_thread (th : thread) (a : ℤ) (b : ℤ) := b < a ∨ a = b ∧ ¬thread.state1 th = state.Halt
noncomputable def state_index (s : state) := match s with | state.ReadA => (7 : ℤ) | state.ReadB => (5 : ℤ) | state.Compare => (3 : ℤ) | state.Halt => (2 : ℤ)
noncomputable def sync (th : thread) (b : ℤ) := match thread.state1 th with | state.Compare => thread.local_b th = b | _ => True
noncomputable def sync_index (th : thread) (b : ℤ) := if sync th b then (0 : ℤ) else (42 : ℤ)
noncomputable def prog_index (th : thread) (b : ℤ) := sync_index th b + state_index (thread.state1 th)
theorem can_progress'vc (s : state) (result : Bool) (fact0 : match s with | state.Halt => result = false | _ => result = true) : (result = true) = (¬s = state.Halt)
  := sorry
end verifythis_2015_parallel_gcd_Interleaving_can_progressqtvc
