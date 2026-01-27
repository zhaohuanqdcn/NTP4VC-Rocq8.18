import Why3.Base
import Why3.int.Sum
open Classical
open Lean4Why3
namespace strassen_Sum_extended_sum_addqtvc
axiom addf : (ℤ -> ℤ) -> (ℤ -> ℤ) -> ℤ -> ℤ
axiom addf'def (f : ℤ -> ℤ) (g : ℤ -> ℤ) (x : ℤ) : addf f g x = f x + g x
axiom smulf : (ℤ -> ℤ) -> ℤ -> ℤ -> ℤ
axiom smulf'def (f : ℤ -> ℤ) (l : ℤ) (x : ℤ) : smulf f l x = l * f x
theorem sum_add'vc (f : ℤ -> ℤ) (g : ℤ -> ℤ) (a : ℤ) (b : ℤ) : int.Sum.sum (addf f g) a b = int.Sum.sum f a b + int.Sum.sum g a b
  := sorry
end strassen_Sum_extended_sum_addqtvc
