import Why3.Base
open Classical
open Lean4Why3
namespace euler001_DivModHints_div2_addqtvc
theorem div2_add'vc (x : ℤ) (y : ℤ) (fact0 : Int.tmod x (2 : ℤ) = (0 : ℤ)) (fact1 : Int.tmod y (2 : ℤ) = (0 : ℤ)) : Int.tdiv (x + y) (2 : ℤ) = Int.tdiv x (2 : ℤ) + Int.tdiv y (2 : ℤ)
  := sorry
end euler001_DivModHints_div2_addqtvc
