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
Require Import Why3.int.Fibonacci.
Require Import ropes_vcg.ropes.MyString.
Require Import ropes_vcg.ropes.Rope.
Open Scope Z_scope.
Axiom max : Z.
Axiom max'def : 2%Z ≤ max.
Axiom string_of_array : list rope -> Z -> Z -> char_string.
Axiom string_of_array_empty : forall  (l : Z) (q : list rope) (fact0 : 0%Z ≤ l) (fact1 : l ≤ Z.of_nat (List.length q)), infix_eqeq (string_of_array q l l) MyString.empty.
Axiom string_of_array_concat_left : forall  (l : Z) (u : Z) (q : list rope) (fact0 : 0%Z ≤ l) (fact1 : l < u) (fact2 : u ≤ Z.of_nat (List.length q)), infix_eqeq (string_of_array q l u) (MyString.app (string_of_array q (l + 1%Z) u) (Rope.string (nth (Z.to_nat l) q inhabitant))).
Theorem string_of_array_frame'vc (l : Z) (u : Z) (q : list rope) (i : Z) (r : rope) (fact0 : 0%Z ≤ l) (fact1 : l ≤ u) (fact2 : u ≤ Z.of_nat (List.length q)) (fact3 : 0%Z ≤ i ∧ i < l ∨ u ≤ i ∧ i < Z.of_nat (List.length q)) : infix_eqeq (string_of_array q l u) (string_of_array (set_list q (Z.to_nat i) r) l u).
Proof.
Admitted.
