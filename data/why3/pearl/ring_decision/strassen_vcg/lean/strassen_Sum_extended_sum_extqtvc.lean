import Why3.Base
import Why3.int.Sum
open Classical
open Lean4Why3
namespace strassen_Sum_extended_sum_extqtvc
axiom addf : (ℤ -> ℤ) -> (ℤ -> ℤ) -> ℤ -> ℤ
axiom addf'def (f : ℤ -> ℤ) (g : ℤ -> ℤ) (x : ℤ) : addf f g x = f x + g x
axiom smulf : (ℤ -> ℤ) -> ℤ -> ℤ -> ℤ
axiom smulf'def (f : ℤ -> ℤ) (l : ℤ) (x : ℤ) : smulf f l x = l * f x
axiom sumf : (ℤ -> ℤ -> ℤ) -> ℤ -> ℤ -> ℤ -> ℤ
axiom sumf'def (f : ℤ -> ℤ -> ℤ) (a : ℤ) (b : ℤ) (x : ℤ) : sumf f a b x = int.Sum.sum (f x) a b
theorem sum_ext'vc (a : ℤ) (b : ℤ) (f : ℤ -> ℤ) (g : ℤ -> ℤ) (fact0 : ∀(i : ℤ), a ≤ i ∧ i < b → f i = g i) : int.Sum.sum f a b = int.Sum.sum g a b
  := sorry
end strassen_Sum_extended_sum_extqtvc
