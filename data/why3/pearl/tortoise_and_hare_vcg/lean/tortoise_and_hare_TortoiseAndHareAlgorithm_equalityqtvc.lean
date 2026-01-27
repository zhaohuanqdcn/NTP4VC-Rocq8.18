import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Iter
import Why3.pigeon.Pigeonhole
open Classical
open Lean4Why3
namespace tortoise_and_hare_TortoiseAndHareAlgorithm_equalityqtvc
axiom f : ℤ -> ℤ
axiom m : ℤ
axiom m_positive : (0 : ℤ) < m
axiom f_range (x : ℤ) (fact0 : (0 : ℤ) ≤ x) (fact1 : x < m) : (0 : ℤ) ≤ f x ∧ f x < m
axiom x0 : ℤ
axiom x0'def : (0 : ℤ) ≤ x0 ∧ x0 < m
axiom f_closure : ℤ -> ℤ
axiom f_closure_def (y : ℤ) : f_closure y = f y
noncomputable def x (i : ℤ) := Iter.iter f_closure i x0
theorem equality'vc (mu : ℤ) (lambda : ℤ) (n : ℤ) (r : ℤ) (fact0 : (0 : ℤ) ≤ mu) (fact1 : mu < m) (fact2 : (1 : ℤ) ≤ lambda) (fact3 : lambda ≤ m) (fact4 : mu + lambda ≤ m) (fact5 : x (mu + lambda) = x mu) (fact6 : ∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < j ∧ j < mu + lambda → ¬x i = x j) (fact7 : n < r) (fact8 : (0 : ℤ) ≤ n) : (x r = x n) = (mu ≤ n ∧ (∃(k : ℤ), (1 : ℤ) ≤ k ∧ r - n = k * lambda))
  := sorry
end tortoise_and_hare_TortoiseAndHareAlgorithm_equalityqtvc
