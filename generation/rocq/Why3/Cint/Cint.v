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
Open Scope Z_scope.
Definition is_bool (x : Z) := x = 0%Z ∨ x = 1%Z.
Definition is_uint8 (x : Z) := 0%Z ≤ x ∧ x < 256%Z.
Definition is_sint8 (x : Z) := - 128%Z ≤ x ∧ x < 128%Z.
Definition is_uint16 (x : Z) := 0%Z ≤ x ∧ x < 65536%Z.
Definition is_sint16 (x : Z) := - 32768%Z ≤ x ∧ x < 32768%Z.
Definition is_uint32 (x : Z) := 0%Z ≤ x ∧ x < 4294967296%Z.
Definition is_sint32 (x : Z) := - 2147483648%Z ≤ x ∧ x < 2147483648%Z.
Definition is_uint64 (x : Z) := 0%Z ≤ x ∧ x < 18446744073709551616%Z.
Definition is_sint64 (x : Z) := - 9223372036854775808%Z ≤ x ∧ x < 9223372036854775808%Z.
Axiom is_bool0 : is_bool 0%Z.
Axiom is_bool1 : is_bool 1%Z.
Definition to_bool (x : Z) : Z := if decide (x = 0%Z) then 0%Z else 1%Z.
Axiom to_uint8 : Z -> Z.
Axiom to_sint8 : Z -> Z.
Axiom to_uint16 : Z -> Z.
Axiom to_sint16 : Z -> Z.
Axiom to_uint32 : Z -> Z.
Axiom to_sint32 : Z -> Z.
Axiom to_uint64 : Z -> Z.
Axiom to_sint64 : Z -> Z.
Axiom two_power_abs : Z -> Z.
Axiom two_power_abs_is_positive : forall  (n : Z), 0%Z < two_power_abs n.
Axiom two_power_abs_plus_pos : forall  (n : Z) (m : Z) (fact0 : 0%Z ≤ n) (fact1 : 0%Z ≤ m), two_power_abs (n + m) = two_power_abs n * two_power_abs m.
Axiom two_power_abs_plus_one : forall  (n : Z) (fact0 : 0%Z ≤ n), two_power_abs (n + 1%Z) = 2%Z * two_power_abs n.
Definition is_uint (n : Z) (x : Z) := 0%Z ≤ x ∧ x < two_power_abs n.
Definition is_sint (n : Z) (x : Z) := - two_power_abs n ≤ x ∧ x < two_power_abs n.
Axiom to_uint : Z -> Z -> Z.
Axiom to_sint : Z -> Z -> Z.
Axiom is_to_uint : forall  (n : Z) (x : Z), is_uint n (to_uint n x).
Axiom is_to_sint : forall  (n : Z) (x : Z), is_sint n (to_sint n x).
Axiom is_to_uint8 : forall  (x : Z), is_uint8 (to_uint8 x).
Axiom is_to_sint8 : forall  (x : Z), is_sint8 (to_sint8 x).
Axiom is_to_uint16 : forall  (x : Z), is_uint16 (to_uint16 x).
Axiom is_to_sint16 : forall  (x : Z), is_sint16 (to_sint16 x).
Axiom is_to_uint32 : forall  (x : Z), is_uint32 (to_uint32 x).
Axiom is_to_sint32 : forall  (x : Z), is_sint32 (to_sint32 x).
Axiom is_to_uint64 : forall  (x : Z), is_uint64 (to_uint64 x).
Axiom is_to_sint64 : forall  (x : Z), is_sint64 (to_sint64 x).
Axiom id_uint : forall  (n : Z) (x : Z), is_uint n x = (to_uint n x = x).
Axiom id_sint : forall  (n : Z) (x : Z), is_sint n x = (to_sint n x = x).
Axiom id_uint8 : forall  (x : Z) (fact0 : is_uint8 x), to_uint8 x = x.
Axiom id_sint8 : forall  (x : Z) (fact0 : is_sint8 x), to_sint8 x = x.
Axiom id_uint16 : forall  (x : Z) (fact0 : is_uint16 x), to_uint16 x = x.
Axiom id_sint16 : forall  (x : Z) (fact0 : is_sint16 x), to_sint16 x = x.
Axiom id_uint32 : forall  (x : Z) (fact0 : is_uint32 x), to_uint32 x = x.
Axiom id_sint32 : forall  (x : Z) (fact0 : is_sint32 x), to_sint32 x = x.
Axiom id_uint64 : forall  (x : Z) (fact0 : is_uint64 x), to_uint64 x = x.
Axiom id_sint64 : forall  (x : Z) (fact0 : is_sint64 x), to_sint64 x = x.
Axiom proj_uint : forall  (n : Z) (x : Z), to_uint n (to_uint n x) = to_uint n x.
Axiom proj_sint : forall  (n : Z) (x : Z), to_sint n (to_sint n x) = to_sint n x.
Axiom proj_uint8 : forall  (x : Z), to_uint8 (to_uint8 x) = to_uint8 x.
Axiom proj_sint8 : forall  (x : Z), to_sint8 (to_sint8 x) = to_sint8 x.
Axiom proj_uint16 : forall  (x : Z), to_uint16 (to_uint16 x) = to_uint16 x.
Axiom proj_sint16 : forall  (x : Z), to_sint16 (to_sint16 x) = to_sint16 x.
Axiom proj_uint32 : forall  (x : Z), to_uint32 (to_uint32 x) = to_uint32 x.
Axiom proj_sint32 : forall  (x : Z), to_sint32 (to_sint32 x) = to_sint32 x.
Axiom proj_uint64 : forall  (x : Z), to_uint64 (to_uint64 x) = to_uint64 x.
Axiom proj_sint64 : forall  (x : Z), to_sint64 (to_sint64 x) = to_sint64 x.
Axiom proj_su : forall  (n : Z) (x : Z), to_sint n (to_uint n x) = to_uint n x.
Axiom incl_su : forall  (n : Z) (x : Z) (fact0 : is_uint n x), is_sint n x.
Axiom proj_su_uint : forall  (n : Z) (m : Z) (x : Z) (fact0 : 0%Z ≤ n) (fact1 : 0%Z ≤ m), to_sint (m + n) (to_uint n x) = to_uint n x.
Axiom proj_su_sint : forall  (n : Z) (m : Z) (x : Z) (fact0 : 0%Z ≤ n) (fact1 : 0%Z ≤ m), to_sint n (to_uint (m + (n + 1%Z)) x) = to_sint n x.
Axiom proj_int8 : forall  (x : Z), to_sint8 (to_uint8 x) = to_sint8 x.
Axiom proj_int16 : forall  (x : Z), to_sint16 (to_uint16 x) = to_sint16 x.
Axiom proj_int32 : forall  (x : Z), to_sint32 (to_uint32 x) = to_sint32 x.
Axiom proj_int64 : forall  (x : Z), to_sint64 (to_uint64 x) = to_sint64 x.
Axiom proj_us_uint : forall  (n : Z) (m : Z) (x : Z) (fact0 : 0%Z ≤ n) (fact1 : 0%Z ≤ m), to_uint (n + 1%Z) (to_sint (m + n) x) = to_uint (n + 1%Z) x.
Axiom incl_uint : forall  (n : Z) (i : Z) (x : Z) (fact0 : 0%Z ≤ n) (fact1 : 0%Z ≤ i) (fact2 : is_uint n x), is_uint (n + i) x.
Axiom incl_sint : forall  (n : Z) (i : Z) (x : Z) (fact0 : 0%Z ≤ n) (fact1 : 0%Z ≤ i) (fact2 : is_sint n x), is_sint (n + i) x.
Axiom incl_int : forall  (n : Z) (i : Z) (x : Z) (fact0 : 0%Z ≤ n) (fact1 : 0%Z ≤ i) (fact2 : is_uint n x), is_sint (n + i) x.
