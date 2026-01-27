import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace schorr_waite_SchorrWaite_tl_stackNodesqtvc
axiom loc : Type
axiom inhabited_axiom_loc : Inhabited loc
attribute [instance] inhabited_axiom_loc
axiom null : loc
axiom stacknodes : Type
axiom inhabited_axiom_stacknodes : Inhabited stacknodes
attribute [instance] inhabited_axiom_stacknodes
noncomputable def not_in_stack (n : loc) (s : List loc) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s) → ¬n = s[Int.toNat i]!
theorem tl_stackNodes'vc (stack : List loc) (fact0 : (0 : ℤ) < Int.ofNat (List.length stack)) : (0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) ≤ Int.ofNat (List.length stack) ∧ (let result : List loc := List.drop (1 : ℕ) stack; result = List.drop (1 : ℕ) stack ∧ (∀(n : loc), not_in_stack n stack → not_in_stack n result))
  := sorry
end schorr_waite_SchorrWaite_tl_stackNodesqtvc
