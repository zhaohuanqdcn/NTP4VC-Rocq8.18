From Coq Require Import Strings.String.
From Coq Require Import String Ascii.
From Coq Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Coq Require Classical.
From Coq Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Coq Require Import Sorting.Sorted.
From Coq Require Import Reals.Rbasic_fun.
From Coq Require Import Reals.Abstract.ConstructiveAbs.
From Coq Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Coq Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Coq Require Import ZArith.Zeuclid.
From Coq Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Coq Require Import Reals.
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
Theorem assoc_proof'vc (a : matrix Z) (b : matrix Z) (c : matrix Z) (fact0 : cols (mdl a) = MyMatrix.rows (mdl b)) (fact1 : cols (mdl b) = MyMatrix.rows (mdl c)) : cols (mdl a) = MyMatrix.rows (mdl b) ∧ (∀(ab : matrix Z), MyMatrix.rows (mdl ab) = MyMatrix.rows (mdl a) ∧ cols (mdl ab) = cols (mdl b) ∧ mdl ab = mul (mdl a) (mdl b) -> cols (mdl b) = MyMatrix.rows (mdl c) ∧ (∀(bc : matrix Z), MyMatrix.rows (mdl bc) = MyMatrix.rows (mdl b) ∧ cols (mdl bc) = cols (mdl c) ∧ mdl bc = mul (mdl b) (mdl c) -> cols (mdl ab) = MyMatrix.rows (mdl c) ∧ (∀(ab_c : matrix Z), MyMatrix.rows (mdl ab_c) = MyMatrix.rows (mdl ab) ∧ cols (mdl ab_c) = cols (mdl c) ∧ mdl ab_c = mul (mdl ab) (mdl c) -> cols (mdl a) = MyMatrix.rows (mdl bc)))).
Proof.
Admitted.
