import Why3.Base
import Why3.int.Sum
import pearl.ring_decision.lib.lean.strassen.Sum_extended
import pearl.ring_decision.lib.lean.strassen.MaxFun
import pearl.ring_decision.lib.lean.strassen.InfIntMatrix
import pearl.ring_decision.lib.lean.strassen.InfIntMatrixDecision
open Classical
open Lean4Why3
namespace strassen_MatrixTests_naive_blocksqtvc
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
noncomputable def quarters (a : InfIntMatrix.mat) (a11 : InfIntMatrix.mat) (a12 : InfIntMatrix.mat) (a21 : InfIntMatrix.mat) (a22 : InfIntMatrix.mat) := (is_finite a ∧ is_finite a11 ∧ is_finite a12 ∧ is_finite a21 ∧ is_finite a22) ∧ (rows a11 = rows a12 ∧ rows a12 = rows a21 ∧ rows a21 = rows a22 ∧ rows a22 = cols a11 ∧ cols a11 = cols a12 ∧ cols a12 = cols a21 ∧ cols a21 = cols a22) ∧ (rows a = cols a ∧ cols a = (2 : ℤ) * rows a11) ∧ a11 = block a (0 : ℤ) (rows a11) (0 : ℤ) (cols a11) ∧ a12 = block a (0 : ℤ) (rows a11) (cols a11) (cols a11) ∧ a21 = block a (rows a11) (rows a11) (0 : ℤ) (cols a11) ∧ a22 = block a (rows a11) (rows a11) (cols a11) (cols a11)
theorem naive_blocks'vc (a : InfIntMatrix.mat) (b : InfIntMatrix.mat) (c : InfIntMatrix.mat) (a11 : InfIntMatrix.mat) (a12 : InfIntMatrix.mat) (a21 : InfIntMatrix.mat) (a22 : InfIntMatrix.mat) (b11 : InfIntMatrix.mat) (b12 : InfIntMatrix.mat) (b21 : InfIntMatrix.mat) (b22 : InfIntMatrix.mat) (fact0 : is_finite a) (fact1 : is_finite b) (fact2 : is_finite c) (fact3 : quarters a a11 a12 a21 a22) (fact4 : quarters b b11 b12 b21 b22) (fact5 : quarters c (InfIntMatrix.add (InfIntMatrix.mul a11 b11) (InfIntMatrix.mul a12 b21)) (InfIntMatrix.add (InfIntMatrix.mul a11 b12) (InfIntMatrix.mul a12 b22)) (InfIntMatrix.add (InfIntMatrix.mul a21 b11) (InfIntMatrix.mul a22 b21)) (InfIntMatrix.add (InfIntMatrix.mul a21 b12) (InfIntMatrix.mul a22 b22))) : c = InfIntMatrix.mul a b
  := sorry
end strassen_MatrixTests_naive_blocksqtvc
