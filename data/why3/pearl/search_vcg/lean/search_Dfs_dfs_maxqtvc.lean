import Why3.Base
import pearl.search_vcg.lean.search.Path
open Classical
open Lean4Why3
namespace search_Dfs_dfs_maxqtvc
theorem dfs_max'vc (m : ℤ) (fact0 : (0 : ℤ) ≤ m) : let o1 : Path.state := Path.start; ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ m + (1 : ℤ)) ∧ (∀(o2 : Path.outcome), (match o2 with | Path.outcome.NoSolution => (∀(t : Path.state) (n : ℤ), (0 : ℤ) ≤ n ∧ n ≤ m - (0 : ℤ) → Path.success t → ¬Path.path o1 t n) | Path.outcome.Solution t n => Path.path o1 t n ∧ Path.success t ∧ (0 : ℤ) ≤ n ∧ n ≤ m - (0 : ℤ)) → (match o2 with | Path.outcome.NoSolution => (∀(t : Path.state) (n : ℤ), (0 : ℤ) ≤ n ∧ n ≤ m → Path.success t → ¬Path.path Path.start t n) | Path.outcome.Solution t n => Path.path Path.start t n ∧ n ≤ m))
  := sorry
end search_Dfs_dfs_maxqtvc
