import Why3.Base
import Why3.int.Sum
open Classical
open Lean4Why3
namespace sum_extended_Sum_extended_fubiniqtvc
axiom addf : (ℤ -> ℤ) -> (ℤ -> ℤ) -> ℤ -> ℤ
axiom addf'def (f : ℤ -> ℤ) (g : ℤ -> ℤ) (x : ℤ) : addf f g x = f x + g x
axiom smulf : (ℤ -> ℤ) -> ℤ -> ℤ -> ℤ
axiom smulf'def (f : ℤ -> ℤ) (l : ℤ) (x : ℤ) : smulf f l x = l * f x
axiom sumf : (ℤ -> ℤ -> ℤ) -> ℤ -> ℤ -> ℤ -> ℤ
axiom sumf'def (f : ℤ -> ℤ -> ℤ) (a : ℤ) (b : ℤ) (x : ℤ) : sumf f a b x = int.Sum.sum (f x) a b
theorem fubini'vc (a : ℤ) (b : ℤ) (c : ℤ) (d : ℤ) (f1 : ℤ -> ℤ -> ℤ) (f2 : ℤ -> ℤ -> ℤ) (fact0 : ∀(x : ℤ) (y : ℤ), (a ≤ x ∧ x < b) ∧ c ≤ y ∧ y < d → f1 x y = f2 y x) : int.Sum.sum (sumf f1 c d) a b = int.Sum.sum (sumf f2 a b) c d
  := sorry
end sum_extended_Sum_extended_fubiniqtvc
