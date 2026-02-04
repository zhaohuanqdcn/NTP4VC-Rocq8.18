namespace Sum_extended
axiom addf : (ℤ -> ℤ) -> (ℤ -> ℤ) -> ℤ -> ℤ
axiom addf'def (f : ℤ -> ℤ) (g : ℤ -> ℤ) (x : ℤ) : addf f g x = f x + g x
axiom smulf : (ℤ -> ℤ) -> ℤ -> ℤ -> ℤ
axiom smulf'def (f : ℤ -> ℤ) (l : ℤ) (x : ℤ) : smulf f l x = l * f x
axiom sumf : (ℤ -> ℤ -> ℤ) -> ℤ -> ℤ -> ℤ -> ℤ
axiom sumf'def (f : ℤ -> ℤ -> ℤ) (a : ℤ) (b : ℤ) (x : ℤ) : sumf f a b x = int.Sum.sum (f x) a b
end Sum_extended
namespace MatrixArithmetic
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
axiom ft1 : MyMatrix.mat ℤ -> MyMatrix.mat ℤ -> MyMatrix.mat ℤ -> ℤ -> ℤ -> ℤ -> ℤ -> ℤ
axiom ft1'def (a : MyMatrix.mat ℤ) (b : MyMatrix.mat ℤ) (c : MyMatrix.mat ℤ) (i : ℤ) (j : ℤ) (k : ℤ) : ft1 a b c i j k = Sum_extended.smulf (mul_atom a b i k) (MyMatrix.get c k j)
axiom ft2 : MyMatrix.mat ℤ -> MyMatrix.mat ℤ -> MyMatrix.mat ℤ -> ℤ -> ℤ -> ℤ -> ℤ -> ℤ
axiom ft2'def (a : MyMatrix.mat ℤ) (b : MyMatrix.mat ℤ) (c : MyMatrix.mat ℤ) (i : ℤ) (j : ℤ) (k : ℤ) : ft2 a b c i j k = Sum_extended.smulf (mul_atom b c k j) (MyMatrix.get a i k)
end MatrixArithmetic
