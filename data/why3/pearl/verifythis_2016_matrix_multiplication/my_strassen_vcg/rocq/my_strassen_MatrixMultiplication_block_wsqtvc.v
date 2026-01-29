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
Theorem block_ws'vc (r : Z) (dr : Z) (a : matrix Z) (c : Z) (dc : Z) (env1 : Symb.env) (fact0 : 0%Z ≤ r) (fact1 : r ≤ r + dr) (fact2 : r + dr ≤ MyMatrix.rows (mdl a)) (fact3 : 0%Z ≤ c) (fact4 : c ≤ c + dc) (fact5 : c + dc ≤ cols (mdl a)) : 0%Z ≤ r ∧ r ≤ r + dr ∧ r + dr ≤ MyMatrix.rows (mdl a) ∧ 0%Z ≤ c ∧ c ≤ c + dc ∧ c + dc ≤ cols (mdl a) ∧ (∀(m : matrix Z), mdl m = block (mdl a) r dr c dc ∧ MyMatrix.rows (mdl m) = dr ∧ cols (mdl m) = dc -> (let o1 : mat Z := mdl m in ∀(env : Symb.env), ev_c env = ev_c env1 + 1%Z ∧ ev_f env = extends1 (ev_f env1) (ev_c env1) o1 ∧ e_vld env (symb_mat o1 (ev_c env1)) -> (let rm : mat Z := mdl m in rm = block (mdl a) r dr c dc ∧ MyMatrix.rows rm = dr ∧ cols rm = dc) ∧ symb_mat o1 (ev_c env1) = symb_mat (mdl m) (ev_c env1) ∧ ev_f env = extends1 (ev_f env1) (ev_c env1) (mdl m) ∧ ev_c env = ev_c env1 + 1%Z ∧ with_symb_vld env (with_symb'mk m (symb_mat o1 (ev_c env1))))).
Proof.
Admitted.
