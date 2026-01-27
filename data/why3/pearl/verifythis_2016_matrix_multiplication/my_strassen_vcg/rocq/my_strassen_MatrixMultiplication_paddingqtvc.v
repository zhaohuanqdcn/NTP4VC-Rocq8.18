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
Theorem padding'vc (a : matrix Z) (r : Z) (c : Z) (fact0 : MyMatrix.rows (mdl a) ≤ r) (fact1 : cols (mdl a) ≤ c) : 0%Z ≤ r ∧ 0%Z ≤ c ∧ (∀(res : matrix Z), Matrix.rows res = r ∧ columns res = c ∧ (∀(i : Z) (j : Z), (0%Z ≤ i ∧ i < r) ∧ 0%Z ≤ j ∧ j < c -> elts res i j = 0%Z) -> (let nr : Z := Matrix.rows a in let nc : Z := columns a in ((0%Z ≤ 0%Z ∧ 0%Z ≤ 0%Z + nr ∧ 0%Z + nr ≤ Matrix.rows a) ∧ (0%Z ≤ 0%Z ∧ 0%Z ≤ 0%Z + nc ∧ 0%Z + nc ≤ columns a) ∧ (0%Z ≤ 0%Z ∧ 0%Z ≤ 0%Z + nr ∧ 0%Z + nr ≤ Matrix.rows res) ∧ 0%Z ≤ 0%Z ∧ 0%Z ≤ 0%Z + nc ∧ 0%Z + nc ≤ columns res) ∧ (∀(res1 : matrix Z), Matrix.rows res1 = Matrix.rows res ∧ columns res1 = columns res -> (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < 0%Z + nr -> 0%Z ≤ j ∧ j < 0%Z + nc -> elts res1 i j = elts a (i + (0%Z - 0%Z)) (j + (0%Z - 0%Z))) ∧ (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < Matrix.rows res1 -> 0%Z ≤ j ∧ j < columns res1 -> ¬ ((0%Z ≤ i ∧ i < 0%Z + nr) ∧ 0%Z ≤ j ∧ j < 0%Z + nc) -> elts res1 i j = elts res i j) -> MyMatrix.rows (mdl res1) = r ∧ cols (mdl res1) = c ∧ mdl a = block (mdl res1) 0%Z (MyMatrix.rows (mdl a)) 0%Z (cols (mdl a)) ∧ (let dr : Z := r - MyMatrix.rows (mdl a) in create dr (cols (mdl a)) zerof = block (mdl res1) (MyMatrix.rows (mdl a)) dr 0%Z (cols (mdl a))) ∧ (let dc : Z := c - cols (mdl a) in create (MyMatrix.rows (mdl a)) dc zerof = block (mdl res1) 0%Z (MyMatrix.rows (mdl a)) (cols (mdl a)) dc)))).
Admitted.
