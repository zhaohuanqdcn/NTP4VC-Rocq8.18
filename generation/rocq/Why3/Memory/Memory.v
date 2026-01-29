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
Inductive addr :=
  | Mk_addr : Z -> Z -> addr.
Axiom addr_inhabited : Inhabited addr.
Global Existing Instance addr_inhabited.
Axiom addr_countable : Countable addr.
Global Existing Instance addr_countable.
Definition base (x : addr) := match x with |  Mk_addr a _ => a end.
Definition offset (x : addr) := match x with |  Mk_addr _ a => a end.
Axiom addr_le : addr -> addr -> Prop.
Axiom addr_lt : addr -> addr -> Prop.
Axiom addr_le_bool : addr -> addr -> bool.
Axiom addr_lt_bool : addr -> addr -> bool.
Axiom addr_le_def : forall  (p : addr) (q : addr) (fact0 : base p = base q), addr_le p q = (offset p ≤ offset q).
Axiom addr_lt_def : forall  (p : addr) (q : addr) (fact0 : base p = base q), addr_lt p q = (offset p < offset q).
Axiom addr_le_bool_def : forall  (p : addr) (q : addr), addr_le p q = (addr_le_bool p q = true).
Axiom addr_lt_bool_def : forall  (p : addr) (q : addr), addr_lt p q = (addr_lt_bool p q = true).
Definition shift (p : addr) (k : Z) : addr := Mk_addr (base p) (offset p + k).
Definition shift_sint16 (p : addr) (k : Z) : addr := shift p (2%Z * k).
Definition shift_sint32 (p : addr) (k : Z) : addr := shift p (4%Z * k).
Definition shift_sint64 (p : addr) (k : Z) : addr := shift p (8%Z * k).
Definition shift_uint16 (p : addr) (k : Z) : addr := shift p (2%Z * k).
Definition shift_uint32 (p : addr) (k : Z) : addr := shift p (4%Z * k).
Definition shift_uint64 (p : addr) (k : Z) : addr := shift p (8%Z * k).
Definition shift_ptr (p : addr) (k : Z) : addr := shift p (8%Z * k).
Definition included (p : addr) (a : Z) (q : addr) (b : Z) := 0%Z < a -> 0%Z ≤ b ∧ base p = base q ∧ offset q ≤ offset p ∧ offset p + a ≤ offset q + b.
Definition separated (p : addr) (a : Z) (q : addr) (b : Z) := a ≤ 0%Z ∨ b ≤ 0%Z ∨ ¬ base p = base q ∨ offset q + b ≤ offset p ∨ offset p + a ≤ offset q.
Definition eqmem {α : Type} `{Inhabited α} (m1 : addr -> α) (m2 : addr -> α) (p : addr) (a : Z) := ∀(q : addr), included q 1%Z p a -> m1 q = m2 q.
Axiom havoc : forall {α : Type} `{Inhabited α}, (addr -> α) -> (addr -> α) -> addr -> Z -> addr -> α.
Definition valid_rw (m : Z -> Z) (p : addr) (n : Z) := 0%Z < n -> 0%Z < base p ∧ 0%Z ≤ offset p ∧ offset p + n ≤ m (base p).
Definition valid_rd (m : Z -> Z) (p : addr) (n : Z) := 0%Z < n -> ¬ 0%Z = base p ∧ 0%Z ≤ offset p ∧ offset p + n ≤ m (base p).
Definition invalid (m : Z -> Z) (p : addr) (n : Z) := 0%Z < n -> m (base p) ≤ offset p ∨ offset p + n ≤ 0%Z.
Axiom valid_rw_rd : forall  (m : Z -> Z) (p : addr) (n : Z) (fact0 : valid_rw m p n), valid_rd m p n.
Axiom valid_string : forall  (p : addr) (m : Z -> Z) (fact0 : base p < 0%Z) (fact1 : 0%Z ≤ offset p) (fact2 : offset p < m (base p)), valid_rd m p 1%Z ∧ ¬ valid_rw m p 1%Z.
Axiom separated_1 : forall  (p : addr) (a : Z) (q : addr) (b : Z) (i : Z) (j : Z) (fact0 : separated p a q b) (fact1 : offset p ≤ i) (fact2 : i < offset p + a) (fact3 : offset q ≤ j) (fact4 : j < offset q + b), ¬ Mk_addr (base p) i = Mk_addr (base q) j.
Axiom region : Z -> Z.
Axiom linked : (Z -> Z) -> Prop.
Axiom sconst : (addr -> Z) -> Prop.
Definition framed (m : addr -> addr) := ∀(p : addr), region (base (m p)) ≤ 0%Z.
Axiom separated_included : forall  (a : Z) (b : Z) (p : addr) (q : addr) (fact0 : 0%Z < a) (fact1 : 0%Z < b) (fact2 : separated p a q b), ¬ included p a q b.
Axiom included_trans : forall  (p : addr) (a : Z) (q : addr) (b : Z) (r : addr) (c : Z) (fact0 : included p a q b) (fact1 : included q b r c), included p a r c.
Axiom separated_trans : forall  (p : addr) (a : Z) (q : addr) (b : Z) (r : addr) (c : Z) (fact0 : included p a q b) (fact1 : separated q b r c), separated p a r c.
Axiom separated_sym : forall  (p : addr) (a : Z) (q : addr) (b : Z), separated p a q b = separated q b p a.
Axiom eqmem_included : forall  {α : Type} `{Inhabited α} (p : addr) (a : Z) (q : addr) (b : Z) (m1 : addr -> α) (m2 : addr -> α) (fact0 : included p a q b) (fact1 : eqmem m1 m2 q b), eqmem m1 m2 p a.
Axiom eqmem_sym : forall  {α : Type} `{Inhabited α} (m1 : addr -> α) (m2 : addr -> α) (p : addr) (a : Z) (fact0 : eqmem m1 m2 p a), eqmem m2 m1 p a.
Axiom havoc_access : forall  {α : Type} `{Inhabited α} (m0 : addr -> α) (m1 : addr -> α) (p : addr) (a : Z) (q : addr), havoc m0 m1 p a q = (if decide (separated q 1%Z p a) then m1 q else m0 q).
Axiom int_of_addr : addr -> Z.
Axiom addr_of_int : Z -> addr.
Axiom base_offset : Z -> Z.
Axiom base_index : Z -> Z.
Axiom int_of_addr_bijection : forall  (a : Z), int_of_addr (addr_of_int a) = a.
Axiom addr_of_int_bijection : forall  (p : addr), addr_of_int (int_of_addr p) = p.
Axiom addr_of_null : int_of_addr (Mk_addr 0%Z 0%Z) = 0%Z.
Axiom base_offset_zero : base_offset 0%Z = 0%Z.
Axiom base_offset_inj : forall  (i : Z), base_index (base_offset i) = i.
Axiom base_offset_monotonic : forall  (i : Z) (j : Z) (fact0 : i < j), base_offset i < base_offset j.
