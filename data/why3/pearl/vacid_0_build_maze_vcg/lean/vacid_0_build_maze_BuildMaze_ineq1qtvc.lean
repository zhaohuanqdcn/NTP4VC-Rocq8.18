import Why3.Base
import Why3.why3.Ref.Ref
import pearl.vacid_0_build_maze_vcg.lean.vacid_0_build_maze.UnionFind_pure
import pearl.vacid_0_build_maze_vcg.lean.vacid_0_build_maze.UnionFind_sig
import pearl.vacid_0_build_maze_vcg.lean.vacid_0_build_maze.Graph_sig
open Classical
open Lean4Why3
namespace vacid_0_build_maze_BuildMaze_ineq1qtvc
theorem ineq1'vc (n : ℤ) (x : ℤ) (y : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : (0 : ℤ) ≤ x) (fact2 : x < n) (fact3 : (0 : ℤ) ≤ y) (fact4 : y < n) : (0 : ℤ) ≤ x * n + y ∧ x * n + y < n * n
  := sorry
end vacid_0_build_maze_BuildMaze_ineq1qtvc
