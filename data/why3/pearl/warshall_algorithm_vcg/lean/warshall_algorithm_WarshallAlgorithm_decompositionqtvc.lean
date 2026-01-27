import Why3.Base
import Why3.matrix.Matrix
open Classical
open Lean4Why3
namespace warshall_algorithm_WarshallAlgorithm_decompositionqtvc
inductive path : Matrix.matrix Bool -> ℤ -> ℤ -> ℤ -> Prop where
 | Path_empty (m : Matrix.matrix Bool) (i : ℤ) (j : ℤ) (k : ℤ) : Matrix.elts m i j = true → path m i j k
 | Path_cons (x : ℤ) (k : ℤ) (m : Matrix.matrix Bool) (i : ℤ) (j : ℤ) : (0 : ℤ) ≤ x → x < k → path m i x k → path m x j k → path m i j k
theorem decomposition'vc (k : ℤ) (m : Matrix.matrix Bool) (i : ℤ) (j : ℤ) (fact0 : (0 : ℤ) ≤ k) (fact1 : path m i j (k + (1 : ℤ))) : path m i j k ∨ path m i k k ∧ path m k j k
  := sorry
end warshall_algorithm_WarshallAlgorithm_decompositionqtvc
