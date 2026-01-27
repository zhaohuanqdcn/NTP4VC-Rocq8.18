import Why3.Base
import Why3.int.Sum
import pearl.ring_decision.lib.lean.strassen.Sum_extended
import pearl.ring_decision.lib.lean.strassen.MaxFun
import pearl.ring_decision.lib.lean.strassen.InfIntMatrix
import pearl.ring_decision.lib.lean.strassen.InfIntMatrixDecision
open Classical
open Lean4Why3
namespace strassen_MatrixTests_cut_quartersqtvc
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
theorem cut_quarters'vc (a : InfIntMatrix.mat) (fact0 : is_finite a) (fact1 : rows a = cols a) (fact2 : Even (rows a)) : ¬(2 : ℤ) = (0 : ℤ) ∧ (let s : ℤ := Int.tdiv (rows a) (2 : ℤ); quarters a (block a (0 : ℤ) s (0 : ℤ) s) (block a (0 : ℤ) s s s) (block a s s (0 : ℤ) s) (block a s s s s))
  := sorry
end strassen_MatrixTests_cut_quartersqtvc
