import Why3.Base
import Why3.matrix.Matrix
open Classical
open Lean4Why3
namespace warshall_algorithm_WarshallAlgorithm_weakeningqtvc
inductive path : Matrix.matrix Bool -> ℤ -> ℤ -> ℤ -> Prop where
 | Path_empty (m : Matrix.matrix Bool) (i : ℤ) (j : ℤ) (k : ℤ) : Matrix.elts m i j = true → path m i j k
 | Path_cons (x : ℤ) (k : ℤ) (m : Matrix.matrix Bool) (i : ℤ) (j : ℤ) : (0 : ℤ) ≤ x → x < k → path m i x k → path m x j k → path m i j k
theorem weakening'vc (k1 : ℤ) (k2 : ℤ) (m : Matrix.matrix Bool) (i : ℤ) (j : ℤ) (fact0 : (0 : ℤ) ≤ k1) (fact1 : k1 ≤ k2) (fact2 : path m i j k1) : path m i j k2
  := sorry
end warshall_algorithm_WarshallAlgorithm_weakeningqtvc
