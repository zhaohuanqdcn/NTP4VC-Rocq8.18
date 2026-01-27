import Why3.Base
import Why3.exn.Exn
open Classical
open Lean4Why3
namespace verifythis_2019_ghc_sort_Top_Trans
theorem Trans (x : ℤ) (y : ℤ) (z : ℤ) (fact0 : x < y) (fact1 : y < z) : x < z
  := sorry
end verifythis_2019_ghc_sort_Top_Trans
