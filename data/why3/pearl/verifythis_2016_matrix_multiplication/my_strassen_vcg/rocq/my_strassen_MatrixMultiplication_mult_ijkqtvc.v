From Stdlib Require Import Strings.String.
From Stdlib Require Import String Ascii.
From Stdlib Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Stdlib Require Classical.
From Stdlib Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Stdlib Require Import Sorting.Sorted.
From Stdlib Require Import Reals.Rbasic_fun.
From Stdlib Require Import Reals.Abstract.ConstructiveAbs.
From Stdlib Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Stdlib Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Stdlib Require Import ZArith.Zeuclid.
From Stdlib Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Stdlib Require Import Reals.
Require Import Why3.Base.
Require Import Why3.why3.Ref.Ref.
Require Import Why3.int.Sum.
Require Import verifythis_2016_matrix_multiplication.matrices.MyMatrix.
Require Import verifythis_2016_matrix_multiplication.matrices.MatrixArithmetic.
Require Import verifythis_2016_matrix_multiplication.sum_extended.Sum_extended.
Require Import verifythis_2016_matrix_multiplication.matrices.BlockMul.
Require Import verifythis_2016_matrix_multiplication.matrices_ring_simp.Symb.
Require Import Why3.matrix.Matrix.
Open Scope Z_scope.
Definition mdl {α : Type} `{Inhabited α} (m : matrix α) : mat α := create (Matrix.rows m) (columns m) (elts m).
Inductive with_symb :=
  | with_symb'mk : matrix Z -> expr -> with_symb.
Axiom with_symb_inhabited : Inhabited with_symb.
Global Existing Instance with_symb_inhabited.
Axiom with_symb_countable : Countable with_symb.
Global Existing Instance with_symb_countable.
Definition phy (x : with_symb) := match x with |  with_symb'mk a _ => a end.
Definition sym (x : with_symb) := match x with |  with_symb'mk _ a => a end.
Definition with_symb_vld (env : Symb.env) (ws : with_symb) := e_mdl env (sym ws) = mdl (phy ws) ∧ e_vld env (sym ws) ∧ e_rows (sym ws) = MyMatrix.rows (mdl (phy ws)) ∧ e_cols (sym ws) = cols (mdl (phy ws)).
Theorem mult_ijk'vc (a : matrix Z) (b : matrix Z) (fact0 : cols (mdl a) = MyMatrix.rows (mdl b)) : let r : Z := Matrix.rows a in let c : Z := columns b in (0%Z ≤ r ∧ 0%Z ≤ c) ∧ (∀(rs : matrix Z), Matrix.rows rs = r ∧ columns rs = c ∧ (∀(i : Z) (j : Z), (0%Z ≤ i ∧ i < r) ∧ 0%Z ≤ j ∧ j < c -> elts rs i j = 0%Z) -> (let o1 : Z := r - 1%Z in (0%Z ≤ o1 + 1%Z -> ((∀(i0 : Z) (j0 : Z), (0%Z ≤ i0 ∧ i0 < 0%Z) ∧ 0%Z ≤ j0 ∧ j0 < c -> elts rs i0 j0 = mul_cell (mdl a) (mdl b) i0 j0) ∧ (∀(i0 : Z) (j0 : Z), (0%Z ≤ i0 ∧ i0 < r) ∧ 0%Z ≤ j0 ∧ j0 < c -> elts rs i0 j0 = 0%Z)) ∧ (∀(rs1 : matrix Z), Matrix.rows rs1 = Matrix.rows rs ∧ columns rs1 = columns rs -> (∀(i : Z), (0%Z ≤ i ∧ i ≤ o1) ∧ (∀(i0 : Z) (j0 : Z), (0%Z ≤ i0 ∧ i0 < i) ∧ 0%Z ≤ j0 ∧ j0 < c -> elts rs1 i0 j0 = mul_cell (mdl a) (mdl b) i0 j0) ∧ (∀(i0 : Z) (j0 : Z), (i ≤ i0 ∧ i0 < r) ∧ 0%Z ≤ j0 ∧ j0 < c -> elts rs1 i0 j0 = 0%Z) -> (let o2 : Z := c - 1%Z in (0%Z ≤ o2 + 1%Z -> (∀(j0 : Z), 0%Z ≤ j0 ∧ j0 < 0%Z -> elts rs1 i j0 = mul_cell (mdl a) (mdl b) i j0) ∧ (∀(rs2 : matrix Z), Matrix.rows rs2 = Matrix.rows rs1 ∧ columns rs2 = columns rs1 -> (∀(j : Z), (0%Z ≤ j ∧ j ≤ o2) ∧ (∀(i0 : Z) (j0 : Z), (0%Z ≤ i0 ∧ i0 < r) ∧ (0%Z ≤ j0 ∧ j0 < c) ∧ (¬ i0 = i ∨ j ≤ j0) -> elts rs2 i0 j0 = elts rs1 i0 j0) ∧ (∀(j0 : Z), 0%Z ≤ j0 ∧ j0 < j -> elts rs2 i j0 = mul_cell (mdl a) (mdl b) i j0) -> (let o3 : Z := Matrix.rows b - 1%Z in (0%Z ≤ o3 + 1%Z -> elts rs2 i j = sum (mul_atom (mdl a) (mdl b) i j) 0%Z 0%Z ∧ (∀(rs3 : matrix Z), Matrix.rows rs3 = Matrix.rows rs2 ∧ columns rs3 = columns rs2 -> (∀(k : Z), (0%Z ≤ k ∧ k ≤ o3) ∧ (∀(i0 : Z) (j0 : Z), (0%Z ≤ i0 ∧ i0 < r) ∧ (0%Z ≤ j0 ∧ j0 < c) ∧ (¬ i0 = i ∨ ¬ j0 = j) -> elts rs3 i0 j0 = elts rs2 i0 j0) ∧ elts rs3 i j = sum (mul_atom (mdl a) (mdl b) i j) 0%Z k -> valid_index b k j ∧ valid_index a i k ∧ valid_index rs3 i j ∧ valid_index rs3 i j ∧ (∀(rs4 : matrix Z), Matrix.rows rs4 = Matrix.rows rs3 ∧ columns rs4 = columns rs3 -> elts rs4 = fun_updt (elts rs3) i (fun_updt (elts rs3 i) j (elts rs3 i j + elts a i k * elts b k j)) -> (∀(i0 : Z) (j0 : Z), (0%Z ≤ i0 ∧ i0 < r) ∧ (0%Z ≤ j0 ∧ j0 < c) ∧ (¬ i0 = i ∨ ¬ j0 = j) -> elts rs4 i0 j0 = elts rs2 i0 j0) ∧ elts rs4 i j = sum (mul_atom (mdl a) (mdl b) i j) 0%Z (k + 1%Z))) ∧ ((∀(i0 : Z) (j0 : Z), (0%Z ≤ i0 ∧ i0 < r) ∧ (0%Z ≤ j0 ∧ j0 < c) ∧ (¬ i0 = i ∨ ¬ j0 = j) -> elts rs3 i0 j0 = elts rs2 i0 j0) ∧ elts rs3 i j = sum (mul_atom (mdl a) (mdl b) i j) 0%Z (o3 + 1%Z) -> (∀(i0 : Z) (j0 : Z), (0%Z ≤ i0 ∧ i0 < r) ∧ (0%Z ≤ j0 ∧ j0 < c) ∧ (¬ i0 = i ∨ j + 1%Z ≤ j0) -> elts rs3 i0 j0 = elts rs1 i0 j0) ∧ (∀(j0 : Z), 0%Z ≤ j0 ∧ j0 < j + 1%Z -> elts rs3 i j0 = mul_cell (mdl a) (mdl b) i j0)))) ∧ (o3 + 1%Z < 0%Z -> (∀(i0 : Z) (j0 : Z), (0%Z ≤ i0 ∧ i0 < r) ∧ (0%Z ≤ j0 ∧ j0 < c) ∧ (¬ i0 = i ∨ j + 1%Z ≤ j0) -> elts rs2 i0 j0 = elts rs1 i0 j0) ∧ (∀(j0 : Z), 0%Z ≤ j0 ∧ j0 < j + 1%Z -> elts rs2 i j0 = mul_cell (mdl a) (mdl b) i j0)))) ∧ ((∀(i0 : Z) (j0 : Z), (0%Z ≤ i0 ∧ i0 < r) ∧ (0%Z ≤ j0 ∧ j0 < c) ∧ (¬ i0 = i ∨ o2 + 1%Z ≤ j0) -> elts rs2 i0 j0 = elts rs1 i0 j0) ∧ (∀(j0 : Z), 0%Z ≤ j0 ∧ j0 < o2 + 1%Z -> elts rs2 i j0 = mul_cell (mdl a) (mdl b) i j0) -> (∀(i0 : Z) (j0 : Z), (0%Z ≤ i0 ∧ i0 < i + 1%Z) ∧ 0%Z ≤ j0 ∧ j0 < c -> elts rs2 i0 j0 = mul_cell (mdl a) (mdl b) i0 j0) ∧ (∀(i0 : Z) (j0 : Z), (i + 1%Z ≤ i0 ∧ i0 < r) ∧ 0%Z ≤ j0 ∧ j0 < c -> elts rs2 i0 j0 = 0%Z)))) ∧ (o2 + 1%Z < 0%Z -> (∀(i0 : Z) (j0 : Z), (0%Z ≤ i0 ∧ i0 < i + 1%Z) ∧ 0%Z ≤ j0 ∧ j0 < c -> elts rs1 i0 j0 = mul_cell (mdl a) (mdl b) i0 j0) ∧ (∀(i0 : Z) (j0 : Z), (i + 1%Z ≤ i0 ∧ i0 < r) ∧ 0%Z ≤ j0 ∧ j0 < c -> elts rs1 i0 j0 = 0%Z)))) ∧ ((∀(i0 : Z) (j0 : Z), (0%Z ≤ i0 ∧ i0 < o1 + 1%Z) ∧ 0%Z ≤ j0 ∧ j0 < c -> elts rs1 i0 j0 = mul_cell (mdl a) (mdl b) i0 j0) ∧ (∀(i0 : Z) (j0 : Z), (o1 + 1%Z ≤ i0 ∧ i0 < r) ∧ 0%Z ≤ j0 ∧ j0 < c -> elts rs1 i0 j0 = 0%Z) -> MyMatrix.rows (mdl rs1) = MyMatrix.rows (mdl a) ∧ cols (mdl rs1) = cols (mdl b) ∧ mdl rs1 = mul (mdl a) (mdl b)))) ∧ (o1 + 1%Z < 0%Z -> MyMatrix.rows (mdl rs) = MyMatrix.rows (mdl a) ∧ cols (mdl rs) = cols (mdl b) ∧ mdl rs = mul (mdl a) (mdl b)))).
Admitted.
