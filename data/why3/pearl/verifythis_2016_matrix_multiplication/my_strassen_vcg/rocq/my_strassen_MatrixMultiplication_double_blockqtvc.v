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
Theorem double_block'vc (r1 : Z) (dr1 : Z) (a : matrix Z) (c1 : Z) (dc1 : Z) (r2 : Z) (dr2 : Z) (c2 : Z) (dc2 : Z) (fact0 : 0%Z ≤ r1) (fact1 : r1 ≤ r1 + dr1) (fact2 : r1 + dr1 ≤ MyMatrix.rows (mdl a)) (fact3 : 0%Z ≤ c1) (fact4 : c1 ≤ c1 + dc1) (fact5 : c1 + dc1 ≤ cols (mdl a)) (fact6 : 0%Z ≤ r2) (fact7 : r2 ≤ r2 + dr2) (fact8 : r2 + dr2 ≤ dr1) (fact9 : 0%Z ≤ c2) (fact10 : c2 ≤ c2 + dc2) (fact11 : c2 + dc2 ≤ dc1) : block (block (mdl a) r1 dr1 c1 dc1) r2 dr2 c2 dc2 = block (mdl a) (r1 + r2) dr2 (c1 + c2) dc2.
Proof.
Admitted.
