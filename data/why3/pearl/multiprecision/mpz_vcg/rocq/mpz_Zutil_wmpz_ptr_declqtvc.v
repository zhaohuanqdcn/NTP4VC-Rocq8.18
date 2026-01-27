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
Require Import Why3.map.Const.
Require Import Why3.map.MapEq.
Require Import multiprecision.mpz.Z.
Require Import Why3.mach.int.Unsigned.
Require Import Why3.mach.c.C.
Require Import multiprecision.types.Config.
Require Import multiprecision.types.Types.
Require Import multiprecision.types.Int32Eq.
Require Import multiprecision.types.UInt64Eq.
Require Import multiprecision.lemmas.Lemmas.
Open Scope Z_scope.
Axiom mpz_mem : Type.
Axiom mpz_mem_inhabited : Inhabited mpz_mem.
Global Existing Instance mpz_mem_inhabited.
Axiom mpz_mem_countable : Countable mpz_mem.
Global Existing Instance mpz_mem_countable.
Axiom ptr : mpz_mem -> mpz_ptr.
Axiom ok : mpz_mem -> bool.
Theorem wmpz_ptr_decl'vc (mpz : mpz_memo) (t : mpz_ptr) (mpz1 : mpz_memo) (memo : mpz_mem) (fact0 : readers mpz t = - 2%Z) (fact1 : ∀(x : mpz_ptr), ¬ x = t -> mpz_unchanged x mpz1 mpz) (fact2 : readers mpz1 t = 0%Z) (fact3 : alloc mpz1 t = 0%Z) (fact4 : abs_size mpz1 t = 0%Z) (fact5 : ptr memo = t) (fact6 : ok memo = true) : t = ptr memo ∧ ok memo = true ∧ readers mpz1 t = 0%Z ∧ alloc mpz1 t = 0%Z ∧ abs_size mpz1 t = 0%Z ∧ readers mpz t = - 2%Z ∧ (∀(x : mpz_ptr), ¬ x = t -> mpz_unchanged x mpz1 mpz).
Admitted.
