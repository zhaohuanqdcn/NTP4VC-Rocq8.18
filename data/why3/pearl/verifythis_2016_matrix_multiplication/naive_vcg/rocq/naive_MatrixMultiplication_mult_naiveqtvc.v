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
Require Import Why3.int.Sum.
Require Import Why3.matrix.Matrix.
Open Scope Z_scope.
Axiom mul_atom : matrix Z -> matrix Z -> Z -> Z -> Z -> Z.
Axiom mul_atom'def : forall  (a : matrix Z) (b : matrix Z) (i : Z) (j : Z) (k : Z), mul_atom a b i j k = elts a i k * elts b k j.
Definition matrix_product (m : matrix Z) (a : matrix Z) (b : matrix Z) := ∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < rows m -> 0%Z ≤ j ∧ j < columns m -> elts m i j = sum (mul_atom a b i j) 0%Z (columns a).
Theorem mult_naive'vc (a : matrix Z) (b : matrix Z) (fact0 : columns a = rows b) : let o1 : Z := columns b in let o2 : Z := rows a in (0%Z ≤ o2 ∧ 0%Z ≤ o1) ∧ (∀(rs : matrix Z), rows rs = o2 ∧ columns rs = o1 ∧ (∀(i : Z) (j : Z), (0%Z ≤ i ∧ i < o2) ∧ 0%Z ≤ j ∧ j < o1 -> elts rs i j = 0%Z) -> (let o3 : Z := rows a - 1%Z in (0%Z ≤ o3 + 1%Z -> ((∀(i0 : Z) (j0 : Z), (0%Z ≤ i0 ∧ i0 < rows a) ∧ 0%Z ≤ j0 ∧ j0 < columns b -> elts rs i0 j0 = 0%Z) ∧ (∀(i0 : Z) (j0 : Z), (0%Z ≤ i0 ∧ i0 < 0%Z) ∧ 0%Z ≤ j0 ∧ j0 < columns b -> elts rs i0 j0 = sum (mul_atom a b i0 j0) 0%Z (columns a))) ∧ (∀(rs1 : matrix Z), rows rs1 = rows rs ∧ columns rs1 = columns rs -> (∀(i : Z), (0%Z ≤ i ∧ i ≤ o3) ∧ (∀(i0 : Z) (j0 : Z), (i ≤ i0 ∧ i0 < rows a) ∧ 0%Z ≤ j0 ∧ j0 < columns b -> elts rs1 i0 j0 = 0%Z) ∧ (∀(i0 : Z) (j0 : Z), (0%Z ≤ i0 ∧ i0 < i) ∧ 0%Z ≤ j0 ∧ j0 < columns b -> elts rs1 i0 j0 = sum (mul_atom a b i0 j0) 0%Z (columns a)) -> (let o4 : Z := rows b - 1%Z in (0%Z ≤ o4 + 1%Z -> (∀(j0 : Z), 0%Z ≤ j0 ∧ j0 < columns b -> elts rs1 i j0 = sum (mul_atom a b i j0) 0%Z 0%Z) ∧ (∀(rs2 : matrix Z), rows rs2 = rows rs1 ∧ columns rs2 = columns rs1 -> (∀(k : Z), (0%Z ≤ k ∧ k ≤ o4) ∧ (∀(i0 : Z) (j0 : Z), (0%Z ≤ i0 ∧ i0 < rows a) ∧ 0%Z ≤ j0 ∧ j0 < columns b -> ¬ i0 = i -> elts rs2 i0 j0 = elts rs1 i0 j0) ∧ (∀(j0 : Z), 0%Z ≤ j0 ∧ j0 < columns b -> elts rs2 i j0 = sum (mul_atom a b i j0) 0%Z k) -> (let o5 : Z := columns b - 1%Z in (0%Z ≤ o5 + 1%Z -> (∀(j0 : Z), 0%Z ≤ j0 ∧ j0 < 0%Z -> elts rs2 i j0 = sum (mul_atom a b i j0) 0%Z (k + 1%Z)) ∧ (∀(rs3 : matrix Z), rows rs3 = rows rs2 ∧ columns rs3 = columns rs2 -> (∀(j : Z), (0%Z ≤ j ∧ j ≤ o5) ∧ (∀(i0 : Z) (j0 : Z), (0%Z ≤ i0 ∧ i0 < rows a) ∧ 0%Z ≤ j0 ∧ j0 < columns b -> ¬ i0 = i ∨ j ≤ j0 -> elts rs3 i0 j0 = elts rs2 i0 j0) ∧ (∀(j0 : Z), 0%Z ≤ j0 ∧ j0 < j -> elts rs3 i j0 = sum (mul_atom a b i j0) 0%Z (k + 1%Z)) -> valid_index b k j ∧ valid_index a i k ∧ valid_index rs3 i j ∧ valid_index rs3 i j ∧ (∀(rs4 : matrix Z), rows rs4 = rows rs3 ∧ columns rs4 = columns rs3 -> elts rs4 = fun_updt (elts rs3) i (fun_updt (elts rs3 i) j (elts rs3 i j + elts a i k * elts b k j)) -> (∀(i0 : Z) (j0 : Z), (0%Z ≤ i0 ∧ i0 < rows a) ∧ 0%Z ≤ j0 ∧ j0 < columns b -> ¬ i0 = i ∨ j + 1%Z ≤ j0 -> elts rs4 i0 j0 = elts rs2 i0 j0) ∧ (∀(j0 : Z), 0%Z ≤ j0 ∧ j0 < j + 1%Z -> elts rs4 i j0 = sum (mul_atom a b i j0) 0%Z (k + 1%Z)))) ∧ ((∀(i0 : Z) (j0 : Z), (0%Z ≤ i0 ∧ i0 < rows a) ∧ 0%Z ≤ j0 ∧ j0 < columns b -> ¬ i0 = i ∨ o5 + 1%Z ≤ j0 -> elts rs3 i0 j0 = elts rs2 i0 j0) ∧ (∀(j0 : Z), 0%Z ≤ j0 ∧ j0 < o5 + 1%Z -> elts rs3 i j0 = sum (mul_atom a b i j0) 0%Z (k + 1%Z)) -> (∀(i0 : Z) (j0 : Z), (0%Z ≤ i0 ∧ i0 < rows a) ∧ 0%Z ≤ j0 ∧ j0 < columns b -> ¬ i0 = i -> elts rs3 i0 j0 = elts rs1 i0 j0) ∧ (∀(j0 : Z), 0%Z ≤ j0 ∧ j0 < columns b -> elts rs3 i j0 = sum (mul_atom a b i j0) 0%Z (k + 1%Z))))) ∧ (o5 + 1%Z < 0%Z -> (∀(i0 : Z) (j0 : Z), (0%Z ≤ i0 ∧ i0 < rows a) ∧ 0%Z ≤ j0 ∧ j0 < columns b -> ¬ i0 = i -> elts rs2 i0 j0 = elts rs1 i0 j0) ∧ (∀(j0 : Z), 0%Z ≤ j0 ∧ j0 < columns b -> elts rs2 i j0 = sum (mul_atom a b i j0) 0%Z (k + 1%Z))))) ∧ ((∀(i0 : Z) (j0 : Z), (0%Z ≤ i0 ∧ i0 < rows a) ∧ 0%Z ≤ j0 ∧ j0 < columns b -> ¬ i0 = i -> elts rs2 i0 j0 = elts rs1 i0 j0) ∧ (∀(j0 : Z), 0%Z ≤ j0 ∧ j0 < columns b -> elts rs2 i j0 = sum (mul_atom a b i j0) 0%Z (o4 + 1%Z)) -> (∀(i0 : Z) (j0 : Z), (i + 1%Z ≤ i0 ∧ i0 < rows a) ∧ 0%Z ≤ j0 ∧ j0 < columns b -> elts rs2 i0 j0 = 0%Z) ∧ (∀(i0 : Z) (j0 : Z), (0%Z ≤ i0 ∧ i0 < i + 1%Z) ∧ 0%Z ≤ j0 ∧ j0 < columns b -> elts rs2 i0 j0 = sum (mul_atom a b i0 j0) 0%Z (columns a))))) ∧ (o4 + 1%Z < 0%Z -> (∀(i0 : Z) (j0 : Z), (i + 1%Z ≤ i0 ∧ i0 < rows a) ∧ 0%Z ≤ j0 ∧ j0 < columns b -> elts rs1 i0 j0 = 0%Z) ∧ (∀(i0 : Z) (j0 : Z), (0%Z ≤ i0 ∧ i0 < i + 1%Z) ∧ 0%Z ≤ j0 ∧ j0 < columns b -> elts rs1 i0 j0 = sum (mul_atom a b i0 j0) 0%Z (columns a))))) ∧ ((∀(i0 : Z) (j0 : Z), (o3 + 1%Z ≤ i0 ∧ i0 < rows a) ∧ 0%Z ≤ j0 ∧ j0 < columns b -> elts rs1 i0 j0 = 0%Z) ∧ (∀(i0 : Z) (j0 : Z), (0%Z ≤ i0 ∧ i0 < o3 + 1%Z) ∧ 0%Z ≤ j0 ∧ j0 < columns b -> elts rs1 i0 j0 = sum (mul_atom a b i0 j0) 0%Z (columns a)) -> (rows rs1 = rows a ∧ columns rs1 = columns b) ∧ matrix_product rs1 a b))) ∧ (o3 + 1%Z < 0%Z -> (rows rs = rows a ∧ columns rs = columns b) ∧ matrix_product rs a b))).
Admitted.
