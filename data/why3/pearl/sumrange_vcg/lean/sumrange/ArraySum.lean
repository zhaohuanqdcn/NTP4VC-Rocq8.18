import Why3.Base
open Classical
open Lean4Why3
namespace ArraySum
axiom sum : List ℤ -> ℤ -> ℤ -> ℤ
axiom sum'def (i : ℤ) (j : ℤ) (a : List ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i ≤ j) (fact2 : j ≤ Int.ofNat (List.length a)) : if j ≤ i then sum a i j = (0 : ℤ) else sum a i j = a[Int.toNat i]! + sum a (i + (1 : ℤ)) j
end ArraySum
