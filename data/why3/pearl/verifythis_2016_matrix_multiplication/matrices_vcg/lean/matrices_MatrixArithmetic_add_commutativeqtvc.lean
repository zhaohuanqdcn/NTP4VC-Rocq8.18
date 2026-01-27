import Why3.Base
import Why3.int.Sum
import pearl.verifythis_2016_matrix_multiplication.lib.lean.matrices.MyMatrix
import pearl.verifythis_2016_matrix_multiplication.lib.lean.sum_extended.Sum_extended
open Classical
open Lean4Why3
namespace matrices_MatrixArithmetic_add_commutativeqtvc
axiom zerof : ℤ -> ℤ -> ℤ
axiom zerof'def (x : ℤ) (x_1 : ℤ) : zerof x x_1 = (0 : ℤ)
axiom add2f : MyMatrix.mat ℤ -> MyMatrix.mat ℤ -> ℤ -> ℤ -> ℤ
axiom add2f'def (a : MyMatrix.mat ℤ) (b : MyMatrix.mat ℤ) (x : ℤ) (y : ℤ) : add2f a b x y = MyMatrix.get a x y + MyMatrix.get b x y
noncomputable def add (a : MyMatrix.mat ℤ) (b : MyMatrix.mat ℤ) := MyMatrix.create (MyMatrix.rows a) (MyMatrix.cols a) (add2f a b)
axiom opp2f : MyMatrix.mat ℤ -> ℤ -> ℤ -> ℤ
axiom opp2f'def (a : MyMatrix.mat ℤ) (x : ℤ) (y : ℤ) : opp2f a x y = -MyMatrix.get a x y
noncomputable def opp (a : MyMatrix.mat ℤ) := MyMatrix.create (MyMatrix.rows a) (MyMatrix.cols a) (opp2f a)
noncomputable def sub (a : MyMatrix.mat ℤ) (b : MyMatrix.mat ℤ) := add a (opp b)
axiom mul_atom : MyMatrix.mat ℤ -> MyMatrix.mat ℤ -> ℤ -> ℤ -> ℤ -> ℤ
axiom mul_atom'def (a : MyMatrix.mat ℤ) (b : MyMatrix.mat ℤ) (i : ℤ) (j : ℤ) (k : ℤ) : mul_atom a b i j k = MyMatrix.get a i k * MyMatrix.get b k j
axiom mul_cell : MyMatrix.mat ℤ -> MyMatrix.mat ℤ -> ℤ -> ℤ -> ℤ
axiom mul_cell'def (a : MyMatrix.mat ℤ) (b : MyMatrix.mat ℤ) (i : ℤ) (j : ℤ) : mul_cell a b i j = int.Sum.sum (mul_atom a b i j) (0 : ℤ) (MyMatrix.cols a)
noncomputable def mul (a : MyMatrix.mat ℤ) (b : MyMatrix.mat ℤ) := MyMatrix.create (MyMatrix.rows a) (MyMatrix.cols b) (mul_cell a b)
theorem add_commutative'vc (a : MyMatrix.mat ℤ) (b : MyMatrix.mat ℤ) (fact0 : MyMatrix.infix_eqeqeq a b) : add a b = add b a
  := sorry
end matrices_MatrixArithmetic_add_commutativeqtvc
