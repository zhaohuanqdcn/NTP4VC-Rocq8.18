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
Theorem sub'vc (a : matrix Z) (b : matrix Z) (fact0 : infix_eqeqeq (mdl a) (mdl b)) : let o1 : Z := columns a in let o2 : Z := Matrix.rows a in (0%Z ≤ o2 ∧ 0%Z ≤ o1) ∧ (∀(res : matrix Z), Matrix.rows res = o2 ∧ columns res = o1 ∧ (∀(i : Z) (j : Z), (0%Z ≤ i ∧ i < o2) ∧ 0%Z ≤ j ∧ j < o1 -> elts res i j = 0%Z) -> (let o3 : Z := Matrix.rows a - 1%Z in (0%Z ≤ o3 + 1%Z -> (∀(i' : Z) (j' : Z), 0%Z ≤ i' ∧ i' < 0%Z -> 0%Z ≤ j' ∧ j' < columns a -> elts res i' j' = elts a i' j' - elts b i' j') ∧ (∀(res1 : matrix Z), Matrix.rows res1 = Matrix.rows res ∧ columns res1 = columns res -> (∀(i : Z), (0%Z ≤ i ∧ i ≤ o3) ∧ (∀(i' : Z) (j' : Z), 0%Z ≤ i' ∧ i' < i -> 0%Z ≤ j' ∧ j' < columns a -> elts res1 i' j' = elts a i' j' - elts b i' j') -> (let o4 : Z := columns a - 1%Z in (0%Z ≤ o4 + 1%Z -> (∀(j' : Z), 0%Z ≤ j' ∧ j' < 0%Z -> elts res1 i j' = elts a i j' - elts b i j') ∧ (∀(res2 : matrix Z), Matrix.rows res2 = Matrix.rows res1 ∧ columns res2 = columns res1 -> (∀(j : Z), (0%Z ≤ j ∧ j ≤ o4) ∧ (∀(i' : Z) (j' : Z), 0%Z ≤ i' ∧ i' < i -> 0%Z ≤ j' ∧ j' < columns a -> elts res2 i' j' = elts res1 i' j') ∧ (∀(j' : Z), 0%Z ≤ j' ∧ j' < j -> elts res2 i j' = elts a i j' - elts b i j') -> valid_index b i j ∧ valid_index a i j ∧ valid_index res2 i j ∧ (∀(res3 : matrix Z), Matrix.rows res3 = Matrix.rows res2 ∧ columns res3 = columns res2 -> elts res3 = fun_updt (elts res2) i (fun_updt (elts res2 i) j (elts a i j - elts b i j)) -> (∀(i' : Z) (j' : Z), 0%Z ≤ i' ∧ i' < i -> 0%Z ≤ j' ∧ j' < columns a -> elts res3 i' j' = elts res1 i' j') ∧ (∀(j' : Z), 0%Z ≤ j' ∧ j' < j + 1%Z -> elts res3 i j' = elts a i j' - elts b i j'))) ∧ ((∀(i' : Z) (j' : Z), 0%Z ≤ i' ∧ i' < i -> 0%Z ≤ j' ∧ j' < columns a -> elts res2 i' j' = elts res1 i' j') ∧ (∀(j' : Z), 0%Z ≤ j' ∧ j' < o4 + 1%Z -> elts res2 i j' = elts a i j' - elts b i j') -> (∀(i' : Z) (j' : Z), 0%Z ≤ i' ∧ i' < i + 1%Z -> 0%Z ≤ j' ∧ j' < columns a -> elts res2 i' j' = elts a i' j' - elts b i' j')))) ∧ (o4 + 1%Z < 0%Z -> (∀(i' : Z) (j' : Z), 0%Z ≤ i' ∧ i' < i + 1%Z -> 0%Z ≤ j' ∧ j' < columns a -> elts res1 i' j' = elts a i' j' - elts b i' j')))) ∧ ((∀(i' : Z) (j' : Z), 0%Z ≤ i' ∧ i' < o3 + 1%Z -> 0%Z ≤ j' ∧ j' < columns a -> elts res1 i' j' = elts a i' j' - elts b i' j') -> mdl res1 = sub (mdl a) (mdl b) ∧ infix_eqeqeq (mdl res1) (mdl a)))) ∧ (o3 + 1%Z < 0%Z -> mdl res = sub (mdl a) (mdl b) ∧ infix_eqeqeq (mdl res) (mdl a)))).
Proof.
Admitted.
