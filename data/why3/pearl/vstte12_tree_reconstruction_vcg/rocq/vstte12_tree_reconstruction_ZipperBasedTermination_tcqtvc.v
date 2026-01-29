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
Require Import vstte12_tree_reconstruction_vcg.vstte12_tree_reconstruction.Tree.
Open Scope Z_scope.
Theorem tc'vc (right1 : list (Z * tree)) (left1 : list (Z * tree)) : match right1 with | [] => True | cons x x1 => (match x1 with | [] => (match x with | (x2, x3) => (match left1 with | [] => True | cons x4 x5 => (match x4 with | (x6, x7) => (if decide (x6 = x2) then let o1 : list (Z * tree) := cons (x6 - 1%Z, Node x7 x3) x1 in 0%Z ≤ Z.of_nat (length left1) + Z.of_nat (length right1) ∧ Z.of_nat (length x5) + Z.of_nat (length o1) < Z.of_nat (length left1) + Z.of_nat (length right1) ∨ Z.of_nat (length left1) + Z.of_nat (length right1) = Z.of_nat (length x5) + Z.of_nat (length o1) ∧ 0%Z ≤ Z.of_nat (length right1) ∧ Z.of_nat (length o1) < Z.of_nat (length right1) else let o1 : list (Z * tree) := cons (x2, x3) left1 in 0%Z ≤ Z.of_nat (length left1) + Z.of_nat (length right1) ∧ Z.of_nat (length o1) + Z.of_nat (length x1) < Z.of_nat (length left1) + Z.of_nat (length right1) ∨ Z.of_nat (length left1) + Z.of_nat (length right1) = Z.of_nat (length o1) + Z.of_nat (length x1) ∧ 0%Z ≤ Z.of_nat (length right1) ∧ Z.of_nat (length x1) < Z.of_nat (length right1)) end) end) end) | _ => (match x with | (x2, x3) => (match left1 with | [] => (let o1 : list (Z * tree) := cons (x2, x3) ([] : list (Z * tree)) in 0%Z ≤ Z.of_nat (length left1) + Z.of_nat (length right1) ∧ Z.of_nat (length o1) + Z.of_nat (length x1) < Z.of_nat (length left1) + Z.of_nat (length right1) ∨ Z.of_nat (length left1) + Z.of_nat (length right1) = Z.of_nat (length o1) + Z.of_nat (length x1) ∧ 0%Z ≤ Z.of_nat (length right1) ∧ Z.of_nat (length x1) < Z.of_nat (length right1)) | cons x4 x5 => (match x4 with | (x6, x7) => (if decide (x6 = x2) then let o1 : list (Z * tree) := cons (x6 - 1%Z, Node x7 x3) x1 in 0%Z ≤ Z.of_nat (length left1) + Z.of_nat (length right1) ∧ Z.of_nat (length x5) + Z.of_nat (length o1) < Z.of_nat (length left1) + Z.of_nat (length right1) ∨ Z.of_nat (length left1) + Z.of_nat (length right1) = Z.of_nat (length x5) + Z.of_nat (length o1) ∧ 0%Z ≤ Z.of_nat (length right1) ∧ Z.of_nat (length o1) < Z.of_nat (length right1) else let o1 : list (Z * tree) := cons (x2, x3) left1 in 0%Z ≤ Z.of_nat (length left1) + Z.of_nat (length right1) ∧ Z.of_nat (length o1) + Z.of_nat (length x1) < Z.of_nat (length left1) + Z.of_nat (length right1) ∨ Z.of_nat (length left1) + Z.of_nat (length right1) = Z.of_nat (length o1) + Z.of_nat (length x1) ∧ 0%Z ≤ Z.of_nat (length right1) ∧ Z.of_nat (length x1) < Z.of_nat (length right1)) end) end) end) end) end.
Proof.
Admitted.
