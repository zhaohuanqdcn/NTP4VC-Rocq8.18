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
Theorem blit'vc {α : Type} `{Inhabited α} (src_r : Z) (dr : Z) (src : matrix α) (src_c : Z) (dc : Z) (tar_r : Z) (tar : matrix α) (tar_c : Z) (fact0 : 0%Z ≤ src_r) (fact1 : src_r ≤ src_r + dr) (fact2 : src_r + dr ≤ Matrix.rows src) (fact3 : 0%Z ≤ src_c) (fact4 : src_c ≤ src_c + dc) (fact5 : src_c + dc ≤ columns src) (fact6 : 0%Z ≤ tar_r) (fact7 : tar_r ≤ tar_r + dr) (fact8 : tar_r + dr ≤ Matrix.rows tar) (fact9 : 0%Z ≤ tar_c) (fact10 : tar_c ≤ tar_c + dc) (fact11 : tar_c + dc ≤ columns tar) : let o1 : Z := tar_r + dr - 1%Z in (tar_r ≤ o1 + 1%Z -> (∀(i' : Z) (j' : Z), tar_r ≤ i' ∧ i' < tar_r -> tar_c ≤ j' ∧ j' < tar_c + dc -> elts tar i' j' = elts src (i' + (src_r - tar_r)) (j' + (src_c - tar_c))) ∧ (∀(tar1 : matrix α), Matrix.rows tar1 = Matrix.rows tar ∧ columns tar1 = columns tar -> (∀(i : Z), (tar_r ≤ i ∧ i ≤ o1) ∧ (∀(i1 : Z) (j : Z), 0%Z ≤ i1 ∧ i1 < Matrix.rows tar1 -> 0%Z ≤ j ∧ j < columns tar1 -> ¬ ((tar_r ≤ i1 ∧ i1 < tar_r + dr) ∧ tar_c ≤ j ∧ j < tar_c + dc) -> elts tar1 i1 j = elts tar i1 j) ∧ (∀(i' : Z) (j' : Z), tar_r ≤ i' ∧ i' < i -> tar_c ≤ j' ∧ j' < tar_c + dc -> elts tar1 i' j' = elts src (i' + (src_r - tar_r)) (j' + (src_c - tar_c))) -> (let o2 : Z := tar_c + dc - 1%Z in (tar_c ≤ o2 + 1%Z -> (∀(j' : Z), tar_c ≤ j' ∧ j' < tar_c -> elts tar1 i j' = elts src (i + (src_r - tar_r)) (j' + (src_c - tar_c))) ∧ (∀(tar2 : matrix α), Matrix.rows tar2 = Matrix.rows tar1 ∧ columns tar2 = columns tar1 -> (∀(j : Z), (tar_c ≤ j ∧ j ≤ o2) ∧ (∀(i' : Z) (j' : Z), 0%Z ≤ i' ∧ i' < Matrix.rows tar2 -> 0%Z ≤ j' ∧ j' < columns tar2 -> ¬ i' = i ∨ ¬ (tar_c ≤ j' ∧ j' < tar_c + dc) -> elts tar2 i' j' = elts tar1 i' j') ∧ (∀(j' : Z), tar_c ≤ j' ∧ j' < j -> elts tar2 i j' = elts src (i + (src_r - tar_r)) (j' + (src_c - tar_c))) -> (let o3 : Z := j + (src_c - tar_c) in let o4 : Z := i + (src_r - tar_r) in valid_index src o4 o3 ∧ valid_index tar2 i j ∧ (∀(tar3 : matrix α), Matrix.rows tar3 = Matrix.rows tar2 ∧ columns tar3 = columns tar2 -> elts tar3 = fun_updt (elts tar2) i (fun_updt (elts tar2 i) j (elts src o4 o3)) -> (∀(i' : Z) (j' : Z), 0%Z ≤ i' ∧ i' < Matrix.rows tar3 -> 0%Z ≤ j' ∧ j' < columns tar3 -> ¬ i' = i ∨ ¬ (tar_c ≤ j' ∧ j' < tar_c + dc) -> elts tar3 i' j' = elts tar1 i' j') ∧ (∀(j' : Z), tar_c ≤ j' ∧ j' < j + 1%Z -> elts tar3 i j' = elts src (i + (src_r - tar_r)) (j' + (src_c - tar_c)))))) ∧ ((∀(i' : Z) (j' : Z), 0%Z ≤ i' ∧ i' < Matrix.rows tar2 -> 0%Z ≤ j' ∧ j' < columns tar2 -> ¬ i' = i ∨ ¬ (tar_c ≤ j' ∧ j' < tar_c + dc) -> elts tar2 i' j' = elts tar1 i' j') ∧ (∀(j' : Z), tar_c ≤ j' ∧ j' < o2 + 1%Z -> elts tar2 i j' = elts src (i + (src_r - tar_r)) (j' + (src_c - tar_c))) -> (∀(i1 : Z) (j : Z), 0%Z ≤ i1 ∧ i1 < Matrix.rows tar2 -> 0%Z ≤ j ∧ j < columns tar2 -> ¬ ((tar_r ≤ i1 ∧ i1 < tar_r + dr) ∧ tar_c ≤ j ∧ j < tar_c + dc) -> elts tar2 i1 j = elts tar i1 j) ∧ (∀(i' : Z) (j' : Z), tar_r ≤ i' ∧ i' < i + 1%Z -> tar_c ≤ j' ∧ j' < tar_c + dc -> elts tar2 i' j' = elts src (i' + (src_r - tar_r)) (j' + (src_c - tar_c)))))) ∧ (o2 + 1%Z < tar_c -> (∀(i1 : Z) (j : Z), 0%Z ≤ i1 ∧ i1 < Matrix.rows tar1 -> 0%Z ≤ j ∧ j < columns tar1 -> ¬ ((tar_r ≤ i1 ∧ i1 < tar_r + dr) ∧ tar_c ≤ j ∧ j < tar_c + dc) -> elts tar1 i1 j = elts tar i1 j) ∧ (∀(i' : Z) (j' : Z), tar_r ≤ i' ∧ i' < i + 1%Z -> tar_c ≤ j' ∧ j' < tar_c + dc -> elts tar1 i' j' = elts src (i' + (src_r - tar_r)) (j' + (src_c - tar_c)))))) ∧ ((∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < Matrix.rows tar1 -> 0%Z ≤ j ∧ j < columns tar1 -> ¬ ((tar_r ≤ i ∧ i < tar_r + dr) ∧ tar_c ≤ j ∧ j < tar_c + dc) -> elts tar1 i j = elts tar i j) ∧ (∀(i' : Z) (j' : Z), tar_r ≤ i' ∧ i' < o1 + 1%Z -> tar_c ≤ j' ∧ j' < tar_c + dc -> elts tar1 i' j' = elts src (i' + (src_r - tar_r)) (j' + (src_c - tar_c))) -> (∀(i : Z) (j : Z), tar_r ≤ i ∧ i < tar_r + dr -> tar_c ≤ j ∧ j < tar_c + dc -> elts tar1 i j = elts src (i + (src_r - tar_r)) (j + (src_c - tar_c))) ∧ (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < Matrix.rows tar1 -> 0%Z ≤ j ∧ j < columns tar1 -> ¬ ((tar_r ≤ i ∧ i < tar_r + dr) ∧ tar_c ≤ j ∧ j < tar_c + dc) -> elts tar1 i j = elts tar i j)))) ∧ (o1 + 1%Z < tar_r -> (∀(i : Z) (j : Z), tar_r ≤ i ∧ i < tar_r + dr -> tar_c ≤ j ∧ j < tar_c + dc -> elts tar i j = elts src (i + (src_r - tar_r)) (j + (src_c - tar_c)))).
Admitted.
