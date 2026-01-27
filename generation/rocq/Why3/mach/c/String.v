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
Require Import Why3.mach.c.C.
Require Import Why3.mach.int.Unsigned.
Open Scope Z_scope.
Axiom zero_char : ascii.
Axiom zero_char'def : Z.of_nat (Ascii.nat_of_ascii zero_char) = 0%Z.
Axiom numcodes : forall  (i : Z) (fact0 : 0%Z ≤ i) (fact1 : i < 10%Z), Z.of_nat (Ascii.nat_of_ascii (get_str_i "0123456789"%string i)) = Z.of_nat (Ascii.nat_of_ascii (get_str_i "0"%string 0%Z)) + i.
Axiom lowcodes : forall  (i : Z) (fact0 : 0%Z ≤ i) (fact1 : i < 26%Z), Z.of_nat (Ascii.nat_of_ascii (get_str_i "abcdefghijklmnopqrstuvwxyz"%string i)) = Z.of_nat (Ascii.nat_of_ascii (get_str_i "a"%string 0%Z)) + i.
Axiom upcodes : forall  (i : Z) (fact0 : 0%Z ≤ i) (fact1 : i < 26%Z), Z.of_nat (Ascii.nat_of_ascii (get_str_i "ABCDEFGHIJKLMNOPQRSTUVWXYZ"%string i)) = Z.of_nat (Ascii.nat_of_ascii (get_str_i "A"%string 0%Z)) + i.
Axiom code_0 : Z.of_nat (Ascii.nat_of_ascii (get_str_i "0"%string 0%Z)) = 48%Z.
Axiom code_a : Z.of_nat (Ascii.nat_of_ascii (get_str_i "a"%string 0%Z)) = 97%Z.
Axiom code_A : Z.of_nat (Ascii.nat_of_ascii (get_str_i "A"%string 0%Z)) = 65%Z.
Axiom code_minus : Z.of_nat (Ascii.nat_of_ascii (get_str_i "-"%string 0%Z)) = 45%Z.
Axiom strlen : (Z -> ascii) -> Z -> Z.
Axiom strlen_def : forall  (i : Z) (s : Z -> ascii) (ofs : Z) (fact0 : 0%Z ≤ i) (fact1 : ∀(j : Z), 0%Z ≤ j ∧ j < i -> ¬ Z.of_nat (Ascii.nat_of_ascii (s (ofs + j))) = 0%Z) (fact2 : Z.of_nat (Ascii.nat_of_ascii (s (ofs + i))) = 0%Z), strlen s ofs = i.
Axiom strlen_invalid : forall  (s : Z -> ascii) (ofs : Z) (fact0 : ∀(i : Z), 0%Z ≤ i -> ¬ Z.of_nat (Ascii.nat_of_ascii (s (ofs + i))) = 0%Z), strlen s ofs < 0%Z.
Definition valid_string (p : ptr ascii) := 0%Z ≤ strlen (pelts p) (offset p) ∧ valid p (1%Z + strlen (pelts p) (offset p)).
