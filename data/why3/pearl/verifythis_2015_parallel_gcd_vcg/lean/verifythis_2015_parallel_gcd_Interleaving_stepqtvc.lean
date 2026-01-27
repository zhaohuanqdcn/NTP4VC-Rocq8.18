import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace verifythis_2015_parallel_gcd_Interleaving_stepqtvc
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
theorem step'vc (th : thread) (d : ℤ) (a : ℤ) (b : ℤ) (fact0 : inv th d a b) : match thread.state1 th with | state.ReadA => (∀(th1 : thread), thread.local_a th1 = a ∧ thread.local_b th1 = thread.local_b th ∧ thread.state1 th1 = thread.state1 th → (∀(th2 : thread), thread.local_a th2 = thread.local_a th1 ∧ thread.local_b th2 = thread.local_b th1 ∧ thread.state1 th2 = state.ReadB → inv th2 d a b ∧ ((0 : ℤ) < a ∧ a ≤ a) ∧ (a < a → a + b ≤ a) ∧ (progress_thread th2 a b → prog_index th2 b < prog_index th b ∨ a < a))) | state.ReadB => (∀(th1 : thread), thread.local_a th1 = thread.local_a th ∧ thread.local_b th1 = b ∧ thread.state1 th1 = thread.state1 th → (∀(th2 : thread), thread.local_a th2 = thread.local_a th1 ∧ thread.local_b th2 = thread.local_b th1 ∧ thread.state1 th2 = state.Compare → inv th2 d a b ∧ ((0 : ℤ) < a ∧ a ≤ a) ∧ (a < a → a + b ≤ a) ∧ (progress_thread th2 a b → prog_index th2 b < prog_index th b ∨ a < a))) | state.Compare => (if thread.local_a th = thread.local_b th then ∀(th1 : thread), thread.local_a th1 = thread.local_a th ∧ thread.local_b th1 = thread.local_b th ∧ thread.state1 th1 = state.Halt → inv th1 d a b ∧ ((0 : ℤ) < a ∧ a ≤ a) ∧ (a < a → a + b ≤ a) ∧ (progress_thread th1 a b → prog_index th1 b < prog_index th b ∨ a < a) else if thread.local_b th < thread.local_a th then ∀(th1 : thread), thread.local_a th1 = thread.local_a th ∧ thread.local_b th1 = thread.local_b th ∧ thread.state1 th1 = state.ReadA → inv th1 d (thread.local_a th - thread.local_b th) b ∧ ((0 : ℤ) < thread.local_a th - thread.local_b th ∧ thread.local_a th - thread.local_b th ≤ a) ∧ (thread.local_a th - thread.local_b th < a → thread.local_a th - thread.local_b th + b ≤ a) ∧ (progress_thread th1 (thread.local_a th - thread.local_b th) b → prog_index th1 b < prog_index th b ∨ thread.local_a th - thread.local_b th < a) else ∀(th1 : thread), thread.local_a th1 = thread.local_a th ∧ thread.local_b th1 = thread.local_b th ∧ thread.state1 th1 = state.ReadA → inv th1 d a b ∧ ((0 : ℤ) < a ∧ a ≤ a) ∧ (a < a → a + b ≤ a) ∧ (progress_thread th1 a b → prog_index th1 b < prog_index th b ∨ a < a)) | state.Halt => inv th d a b ∧ ((0 : ℤ) < a ∧ a ≤ a) ∧ (a < a → a + b ≤ a) ∧ (progress_thread th a b → prog_index th b < prog_index th b ∨ a < a)
  := sorry
end verifythis_2015_parallel_gcd_Interleaving_stepqtvc
