import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Iter
import Why3.pigeon.Pigeonhole
open Classical
open Lean4Why3
namespace tortoise_and_hare_TortoiseAndHareAlgorithm_tortoise_and_hareqtvc
axiom f : ℤ -> ℤ
axiom m : ℤ
axiom m_positive : (0 : ℤ) < m
axiom f_range (x : ℤ) (fact0 : (0 : ℤ) ≤ x) (fact1 : x < m) : (0 : ℤ) ≤ f x ∧ f x < m
axiom x0 : ℤ
axiom x0'def : (0 : ℤ) ≤ x0 ∧ x0 < m
axiom f_closure : ℤ -> ℤ
axiom f_closure_def (y : ℤ) : f_closure y = f y
noncomputable def x (i : ℤ) := Iter.iter f_closure i x0
theorem tortoise_and_hare'vc (mu : ℤ) (lambda : ℤ) (fact0 : (0 : ℤ) ≤ mu) (fact1 : mu < m) (fact2 : (1 : ℤ) ≤ lambda) (fact3 : lambda ≤ m) (fact4 : mu + lambda ≤ m) (fact5 : x (mu + lambda) = x mu) (fact6 : ∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < j ∧ j < mu + lambda → ¬x i = x j) : (1 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) ≤ mu + lambda ∧ f x0 = x (1 : ℤ) ∧ f (f x0) = x ((2 : ℤ) * (1 : ℤ)) ∧ (∀(i : ℤ), (1 : ℤ) ≤ i ∧ i < (1 : ℤ) → ¬x i = x ((2 : ℤ) * i)) ∧ (∀(n : ℤ), ((1 : ℤ) ≤ n ∧ n ≤ mu + lambda) ∧ (∀(i : ℤ), (1 : ℤ) ≤ i ∧ i < n → ¬x i = x ((2 : ℤ) * i)) → (if ¬x n = x ((2 : ℤ) * n) then ¬mu + lambda < n + (1 : ℤ) ∧ (¬mu + lambda < n + (1 : ℤ) → ((0 : ℤ) ≤ mu + lambda - n ∧ mu + lambda - (n + (1 : ℤ)) < mu + lambda - n) ∧ ((1 : ℤ) ≤ n + (1 : ℤ) ∧ n + (1 : ℤ) ≤ mu + lambda) ∧ f (x n) = x (n + (1 : ℤ)) ∧ f (f (x ((2 : ℤ) * n))) = x ((2 : ℤ) * (n + (1 : ℤ))) ∧ (∀(i : ℤ), (1 : ℤ) ≤ i ∧ i < n + (1 : ℤ) → ¬x i = x ((2 : ℤ) * i))) else (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ mu) ∧ (x0 = x (0 : ℤ) ∧ x n = x (n + (0 : ℤ))) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < (0 : ℤ) → ¬x j = x (n + j)) ∧ (∀(j : ℤ), (0 : ℤ) < j ∧ j < (0 : ℤ) → ¬x (n + j) = x n)) ∧ (∀(lam : ℤ) (i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ mu) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → ¬x j = x (n + j)) ∧ (if lam = (0 : ℤ) then ∀(j : ℤ), (0 : ℤ) < j ∧ j < i → ¬x (n + j) = x n else lam = lambda) → (if ¬x i = x (n + i) then ∀(o1 : Bool), (if lam = (0 : ℤ) then o1 = (if (0 : ℤ) < i then if x (n + i) = x n then true else false else false) else o1 = false) → (if o1 = true then ((0 : ℤ) ≤ mu - i ∧ mu - (i + (1 : ℤ)) < mu - i) ∧ ((0 : ℤ) ≤ i + (1 : ℤ) ∧ i + (1 : ℤ) ≤ mu) ∧ (f (x i) = x (i + (1 : ℤ)) ∧ f (x (n + i)) = x (n + (i + (1 : ℤ)))) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i + (1 : ℤ) → ¬x j = x (n + j)) ∧ (if i = (0 : ℤ) then ∀(j : ℤ), (0 : ℤ) < j ∧ j < i + (1 : ℤ) → ¬x (n + j) = x n else i = lambda) else ((0 : ℤ) ≤ mu - i ∧ mu - (i + (1 : ℤ)) < mu - i) ∧ ((0 : ℤ) ≤ i + (1 : ℤ) ∧ i + (1 : ℤ) ≤ mu) ∧ (f (x i) = x (i + (1 : ℤ)) ∧ f (x (n + i)) = x (n + (i + (1 : ℤ)))) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i + (1 : ℤ) → ¬x j = x (n + j)) ∧ (if lam = (0 : ℤ) then ∀(j : ℤ), (0 : ℤ) < j ∧ j < i + (1 : ℤ) → ¬x (n + j) = x n else lam = lambda)) else ∀(l : ℤ), (if lam = (0 : ℤ) then l = n else l = lam) → (((0 : ℤ) ≤ i ∧ i < m) ∧ ((1 : ℤ) ≤ l ∧ l ≤ m) ∧ i + l ≤ m ∧ x (i + l) = x i) ∧ (∀(i1 : ℤ) (j : ℤ), (0 : ℤ) ≤ i1 ∧ i1 < j ∧ j < i + l → ¬x i1 = x j)))))
  := sorry
end tortoise_and_hare_TortoiseAndHareAlgorithm_tortoise_and_hareqtvc
