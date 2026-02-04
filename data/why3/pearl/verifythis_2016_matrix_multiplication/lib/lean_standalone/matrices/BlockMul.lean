namespace BlockMul
axiom ofs2 : MyMatrix.mat ℤ -> ℤ -> ℤ -> ℤ -> ℤ -> ℤ
axiom ofs2'def (a : MyMatrix.mat ℤ) (ai : ℤ) (aj : ℤ) (i : ℤ) (j : ℤ) : ofs2 a ai aj i j = MyMatrix.get a (ai + i) (aj + j)
noncomputable def block (a : MyMatrix.mat ℤ) (r : ℤ) (dr : ℤ) (c : ℤ) (dc : ℤ) := MyMatrix.create dr dc (ofs2 a r c)
noncomputable def c_blocks (a : MyMatrix.mat ℤ) (a1 : MyMatrix.mat ℤ) (a2 : MyMatrix.mat ℤ) := ((0 : ℤ) ≤ MyMatrix.cols a1 ∧ MyMatrix.cols a1 ≤ MyMatrix.cols a) ∧ a1 = block a (0 : ℤ) (MyMatrix.rows a) (0 : ℤ) (MyMatrix.cols a1) ∧ a2 = block a (0 : ℤ) (MyMatrix.rows a) (MyMatrix.cols a1) (MyMatrix.cols a - MyMatrix.cols a1)
noncomputable def r_blocks (a : MyMatrix.mat ℤ) (a1 : MyMatrix.mat ℤ) (a2 : MyMatrix.mat ℤ) := ((0 : ℤ) ≤ MyMatrix.rows a1 ∧ MyMatrix.rows a1 ≤ MyMatrix.rows a) ∧ a1 = block a (0 : ℤ) (MyMatrix.rows a1) (0 : ℤ) (MyMatrix.cols a) ∧ a2 = block a (MyMatrix.rows a1) (MyMatrix.rows a - MyMatrix.rows a1) (0 : ℤ) (MyMatrix.cols a)
end BlockMul
