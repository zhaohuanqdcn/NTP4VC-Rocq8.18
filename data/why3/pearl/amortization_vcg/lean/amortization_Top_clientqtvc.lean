import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace amortization_Top_clientqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom queue : Type
axiom inhabited_axiom_queue : Inhabited queue
attribute [instance] inhabited_axiom_queue
axiom size : queue -> ℤ
axiom credits : queue -> ℤ
axiom queue'invariant (self : queue) : (0 : ℤ) ≤ size self ∧ (0 : ℤ) ≤ credits self ∧ credits self ≤ size self
theorem client'vc (n : ℤ) (o1 : queue) (clock : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : size o1 = (0 : ℤ)) (fact2 : credits o1 = (0 : ℤ)) : let o2 : ℤ := n - (1 : ℤ); ((0 : ℤ) ≤ o2 + (1 : ℤ) → ((size o1 = credits o1 ∧ credits o1 = (0 : ℤ)) ∧ clock = clock + (0 : ℤ)) ∧ (∀(q : queue) (clock1 : ℤ), (((0 : ℤ) ≤ credits q ∧ credits q ≤ o2) ∧ size q = credits q ∧ clock1 = clock + credits q → (∀(o3 : queue), size o3 = size q + (1 : ℤ) ∧ credits o3 = credits q + (1 : ℤ) → (size o3 = credits o3 ∧ credits o3 = credits q + (1 : ℤ)) ∧ clock1 + (1 : ℤ) = clock + (credits q + (1 : ℤ)))) ∧ ((size q = credits q ∧ credits q = o2 + (1 : ℤ)) ∧ clock1 = clock + (o2 + (1 : ℤ)) → (let o3 : ℤ := n - (1 : ℤ); ((0 : ℤ) ≤ o3 + (1 : ℤ) → (size q = n - (0 : ℤ) ∧ clock1 = clock + credits q + (0 : ℤ)) ∧ (∀(q1 : queue) (clock2 : ℤ), (∀(k : ℤ), ((0 : ℤ) ≤ k ∧ k ≤ o3) ∧ size q1 = n - k ∧ clock2 = clock + credits q1 + k → (0 : ℤ) < size q1 ∧ (∀(clock3 : ℤ) (r : queue), size r = size q1 - (1 : ℤ) ∧ credits r ≤ credits q1 ∧ clock3 = clock2 + (1 : ℤ) + credits r - credits q1 → size r = n - (k + (1 : ℤ)) ∧ clock3 = clock + credits r + (k + (1 : ℤ)))) ∧ (size q1 = n - (o3 + (1 : ℤ)) ∧ clock2 = clock + credits q1 + (o3 + (1 : ℤ)) → clock2 ≤ clock + (2 : ℤ) * n))) ∧ (o3 + (1 : ℤ) < (0 : ℤ) → clock1 ≤ clock + (2 : ℤ) * n))))) ∧ (o2 + (1 : ℤ) < (0 : ℤ) → (let o3 : ℤ := n - (1 : ℤ); ((0 : ℤ) ≤ o3 + (1 : ℤ) → (size o1 = n - (0 : ℤ) ∧ clock = clock + credits o1 + (0 : ℤ)) ∧ (∀(q : queue) (clock1 : ℤ), (∀(k : ℤ), ((0 : ℤ) ≤ k ∧ k ≤ o3) ∧ size q = n - k ∧ clock1 = clock + credits q + k → (0 : ℤ) < size q ∧ (∀(clock2 : ℤ) (r : queue), size r = size q - (1 : ℤ) ∧ credits r ≤ credits q ∧ clock2 = clock1 + (1 : ℤ) + credits r - credits q → size r = n - (k + (1 : ℤ)) ∧ clock2 = clock + credits r + (k + (1 : ℤ)))) ∧ (size q = n - (o3 + (1 : ℤ)) ∧ clock1 = clock + credits q + (o3 + (1 : ℤ)) → clock1 ≤ clock + (2 : ℤ) * n))) ∧ (o3 + (1 : ℤ) < (0 : ℤ) → clock ≤ clock + (2 : ℤ) * n)))
  := sorry
end amortization_Top_clientqtvc
