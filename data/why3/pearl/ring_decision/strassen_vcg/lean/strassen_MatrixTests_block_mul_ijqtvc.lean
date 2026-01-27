import Why3.Base
import Why3.int.Sum
import pearl.ring_decision.lib.lean.strassen.Sum_extended
import pearl.ring_decision.lib.lean.strassen.MaxFun
import pearl.ring_decision.lib.lean.strassen.InfIntMatrix
import pearl.ring_decision.lib.lean.strassen.InfIntMatrixDecision
open Classical
open Lean4Why3
namespace strassen_MatrixTests_block_mul_ijqtvc
axiom cols : InfIntMatrix.mat -> ℤ
axiom rows : InfIntMatrix.mat -> ℤ
axiom rows_def (r : ℤ) (c : ℤ) (a : InfIntMatrix.mat) (fact0 : (0 : ℤ) ≤ r) (fact1 : (0 : ℤ) ≤ c) (fact2 : InfIntMatrix.size a r c) : rows a = r
axiom cols_def (r : ℤ) (c : ℤ) (a : InfIntMatrix.mat) (fact0 : (0 : ℤ) ≤ r) (fact1 : (0 : ℤ) ≤ c) (fact2 : InfIntMatrix.size a r c) : cols a = c
noncomputable def is_finite (m : InfIntMatrix.mat) := InfIntMatrix.size m (rows m) (cols m)
axiom ofs2 : InfIntMatrix.mat -> ℤ -> ℤ -> ℤ -> ℤ -> ℤ
axiom ofs2'def (a : InfIntMatrix.mat) (ai : ℤ) (aj : ℤ) (i : ℤ) (j : ℤ) : ofs2 a ai aj i j = InfIntMatrix.get a (ai + i) (aj + j)
noncomputable def block (a : InfIntMatrix.mat) (r : ℤ) (dr : ℤ) (c : ℤ) (dc : ℤ) := InfIntMatrix.fcreate dr dc (ofs2 a r c)
noncomputable def c_blocks (a : InfIntMatrix.mat) (a1 : InfIntMatrix.mat) (a2 : InfIntMatrix.mat) := ((0 : ℤ) ≤ cols a1 ∧ cols a1 ≤ cols a) ∧ a1 = block a (0 : ℤ) (rows a) (0 : ℤ) (cols a1) ∧ a2 = block a (0 : ℤ) (rows a) (cols a1) (cols a - cols a1)
noncomputable def r_blocks (a : InfIntMatrix.mat) (a1 : InfIntMatrix.mat) (a2 : InfIntMatrix.mat) := ((0 : ℤ) ≤ rows a1 ∧ rows a1 ≤ rows a) ∧ a1 = block a (0 : ℤ) (rows a1) (0 : ℤ) (cols a) ∧ a2 = block a (rows a1) (rows a - rows a1) (0 : ℤ) (cols a)
theorem block_mul_ij'vc (a : InfIntMatrix.mat) (b : InfIntMatrix.mat) (a1 : InfIntMatrix.mat) (b1 : InfIntMatrix.mat) (k : ℤ) (a2 : InfIntMatrix.mat) (b2 : InfIntMatrix.mat) (fact0 : cols a = rows b) (fact1 : cols a1 = rows b1) (fact2 : (0 : ℤ) ≤ k) (fact3 : k ≤ cols a) (fact4 : c_blocks a a1 a2) (fact5 : r_blocks b b1 b2) : (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < rows a → (0 : ℤ) ≤ j ∧ j < cols b → (0 : ℤ) ≤ k ∧ k ≤ cols a1 → int.Sum.sum (InfIntMatrix.mul_atom a b i j) (0 : ℤ) k = int.Sum.sum (InfIntMatrix.mul_atom a1 b1 i j) (0 : ℤ) k) ∧ (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < rows a → (0 : ℤ) ≤ j ∧ j < cols b → cols a1 ≤ k ∧ k ≤ cols a → int.Sum.sum (InfIntMatrix.mul_atom a b i j) (0 : ℤ) k = int.Sum.sum (InfIntMatrix.mul_atom a1 b1 i j) (0 : ℤ) (cols a1) + int.Sum.sum (InfIntMatrix.mul_atom a2 b2 i j) (0 : ℤ) (k - cols a1))
  := sorry
end strassen_MatrixTests_block_mul_ijqtvc
