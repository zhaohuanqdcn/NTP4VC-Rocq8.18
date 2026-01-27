import Why3.Base
import Why3.int.Sum
open Classical
open Lean4Why3
namespace sum_extended_Sum_extended_sum_multqtvc
axiom addf : (ℤ -> ℤ) -> (ℤ -> ℤ) -> ℤ -> ℤ
axiom addf'def (f : ℤ -> ℤ) (g : ℤ -> ℤ) (x : ℤ) : addf f g x = f x + g x
axiom smulf : (ℤ -> ℤ) -> ℤ -> ℤ -> ℤ
axiom smulf'def (f : ℤ -> ℤ) (l : ℤ) (x : ℤ) : smulf f l x = l * f x
theorem sum_mult'vc (f : ℤ -> ℤ) (l : ℤ) (a : ℤ) (b : ℤ) : int.Sum.sum (smulf f l) a b = l * int.Sum.sum f a b
  := sorry
end sum_extended_Sum_extended_sum_multqtvc
