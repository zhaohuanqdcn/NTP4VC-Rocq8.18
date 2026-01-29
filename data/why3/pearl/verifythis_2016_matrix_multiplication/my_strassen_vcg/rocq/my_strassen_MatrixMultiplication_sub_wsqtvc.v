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
Theorem sub_ws'vc (a : with_symb) (b : with_symb) (env : Symb.env) (fact0 : infix_eqeqeq (mdl (phy a)) (mdl (phy b))) (fact1 : with_symb_vld env a) (fact2 : with_symb_vld env b) : let o1 : expr := sym b in let o2 : expr := sym a in ((e_vld env o2 ∧ e_vld env o1) ∧ e_rows o2 = e_rows o1 ∧ e_cols o2 = e_cols o1) ∧ (e_vld env (symb_sub o2 o1) ∧ e_mdl env (symb_sub o2 o1) = sub (e_mdl env o2) (e_mdl env o1) -> (let o3 : matrix Z := phy b in let o4 : matrix Z := phy a in infix_eqeqeq (mdl o4) (mdl o3) ∧ (∀(o5 : matrix Z), mdl o5 = sub (mdl o4) (mdl o3) ∧ infix_eqeqeq (mdl o5) (mdl o4) -> mdl o5 = sub (mdl (phy a)) (mdl (phy b)) ∧ symb_sub o2 o1 = symb_sub (sym a) (sym b) ∧ with_symb_vld env (with_symb'mk o5 (symb_sub o2 o1))))).
Proof.
Admitted.
