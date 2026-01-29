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
Require Import Why3.mach.matrix.Matrix63.
Open Scope Z_scope.
Axiom coeff : Type.
Axiom coeff_inhabited : Inhabited coeff.
Global Existing Instance coeff_inhabited.
Axiom coeff_countable : Countable coeff.
Global Existing Instance coeff_countable.
Axiom a : Type.
Axiom a_inhabited : Inhabited a.
Global Existing Instance a_inhabited.
Axiom a_countable : Countable a.
Global Existing Instance a_countable.
Axiom infix_pl : a -> a -> a.
Axiom infix_as : a -> a -> a.
Axiom prefix_mn : a -> a.
Axiom azero : a.
Axiom aone : a.
Axiom ale : a -> a -> Prop.
Axiom Assoc : forall  (x : a) (y : a) (z : a), infix_pl (infix_pl x y) z = infix_pl x (infix_pl y z).
Axiom Unit_def_l : forall  (x : a), infix_pl azero x = x.
Axiom Unit_def_r : forall  (x : a), infix_pl x azero = x.
Axiom Inv_def_l : forall  (x : a), infix_pl (prefix_mn x) x = azero.
Axiom Inv_def_r : forall  (x : a), infix_pl x (prefix_mn x) = azero.
Axiom Comm : forall  (x : a) (y : a), infix_pl x y = infix_pl y x.
Axiom Assoc1 : forall  (x : a) (y : a) (z : a), infix_as (infix_as x y) z = infix_as x (infix_as y z).
Axiom Mul_distr_l : forall  (x : a) (y : a) (z : a), infix_as x (infix_pl y z) = infix_pl (infix_as x y) (infix_as x z).
Axiom Mul_distr_r : forall  (y : a) (z : a) (x : a), infix_as (infix_pl y z) x = infix_pl (infix_as y x) (infix_as z x).
Axiom Comm1 : forall  (x : a) (y : a), infix_as x y = infix_as y x.
Axiom Unitary : forall  (x : a), infix_as aone x = x.
Axiom NonTrivialRing : ¬ azero = aone.
Axiom Refl : forall  (x : a), ale x x.
Axiom Trans : forall  (x : a) (y : a) (z : a) (fact0 : ale x y) (fact1 : ale y z), ale x z.
Axiom Antisymm : forall  (x : a) (y : a) (fact0 : ale x y) (fact1 : ale y x), x = y.
Axiom Total : forall  (x : a) (y : a), ale x y ∨ ale y x.
Axiom ZeroLessOne : ale azero aone.
Axiom CompatOrderAdd : forall  (x : a) (y : a) (z : a) (fact0 : ale x y), ale (infix_pl x z) (infix_pl y z).
Axiom CompatOrderMult : forall  (x : a) (y : a) (z : a) (fact0 : ale x y) (fact1 : ale azero z), ale (infix_as x z) (infix_as y z).
Axiom infix_mn : a -> a -> a.
Axiom sub_def : forall  (a1 : a) (a2 : a), infix_mn a1 a2 = infix_pl a1 (prefix_mn a2).
Axiom vars : Type.
Axiom vars_inhabited : Inhabited vars.
Global Existing Instance vars_inhabited.
Axiom vars_countable : Countable vars.
Global Existing Instance vars_countable.
Axiom cvars : Type.
Axiom cvars_inhabited : Inhabited cvars.
Global Existing Instance cvars_inhabited.
Axiom cvars_countable : Countable cvars.
Global Existing Instance cvars_countable.
Axiom interp : coeff -> cvars -> a.
Axiom czero : coeff.
Axiom cone : coeff.
Axiom zero_def : forall  (y : cvars), interp czero y = azero.
Axiom one_def : forall  (y : cvars), interp cone y = aone.
Axiom eq : coeff -> coeff -> Prop.
Axiom eq'spec : forall  (a1 : coeff) (b : coeff) (y : cvars) (fact0 : eq a1 b), interp a1 y = interp b y.
Axiom vars1 : Type.
Axiom vars1_inhabited : Inhabited vars1.
Global Existing Instance vars1_inhabited.
Axiom vars1_countable : Countable vars1.
Global Existing Instance vars1_countable.
Inductive expr :=
  | Term : coeff -> Z -> expr
  | Add : expr -> expr -> expr
  | Cst : coeff -> expr.
Axiom expr_inhabited : Inhabited expr.
Global Existing Instance expr_inhabited.
Axiom expr_countable : Countable expr.
Global Existing Instance expr_countable.
Program Fixpoint valid_expr (e : expr) : Prop :=
match e with | Term _ i => 0%Z ≤ i | Cst _ => True | Add e1 e2 => valid_expr e1 ∧ valid_expr e2 end.
Admit Obligations.
Program Fixpoint expr_bound (e : expr) (b : Z) : Prop :=
match e with | Term _ i => 0%Z ≤ i ∧ i ≤ b | Cst _ => True | Add e1 e2 => expr_bound e1 b ∧ expr_bound e2 b end.
Admit Obligations.
Program Fixpoint interp1 (e : expr) (y : Z -> a) (z : cvars) : a :=
match e with | Term c v => infix_as (interp c z) (y v) | Add e1 e2 => infix_pl (interp1 e1 y z) (interp1 e2 y z) | Cst c => interp c z end.
Admit Obligations.
Axiom equality : Type.
Axiom equality_inhabited : Inhabited equality.
Global Existing Instance equality_inhabited.
Axiom equality_countable : Countable equality.
Global Existing Instance equality_countable.
Axiom context : Type.
Axiom context_inhabited : Inhabited context.
Global Existing Instance context_inhabited.
Axiom context_countable : Countable context.
Global Existing Instance context_countable.
Definition valid_eq (eq1 : expr * expr) := match eq1 with | (e1, e2) => valid_expr e1 ∧ valid_expr e2 end.
Definition eq_bound (eq1 : expr * expr) (b : Z) := match eq1 with | (e1, e2) => expr_bound e1 b ∧ expr_bound e2 b end.
Program Fixpoint valid_ctx (ctx : list (expr * expr)) : Prop :=
match ctx with | [] => True | cons eq1 t => valid_eq eq1 ∧ valid_ctx t end.
Admit Obligations.
Program Fixpoint ctx_bound (ctx : list (expr * expr)) (b : Z) : Prop :=
match ctx with | [] => True | cons eq1 t => eq_bound eq1 b ∧ ctx_bound t b end.
Admit Obligations.
Definition interp_eq (g : expr * expr) (y : Z -> a) (z : cvars) : bool := if decide (match g with | (g1, g2) => interp1 g1 y z = interp1 g2 y z end) then true else false.
Program Fixpoint interp_ctx (l : list (expr * expr)) (g : expr * expr) (y : Z -> a) (z : cvars) : bool :=
if decide (match l with | [] => interp_eq g y z = true | cons h t => interp_eq h y z = true -> interp_ctx t g y z = true end) then true else false.
Admit Obligations.
Theorem m_append'vc (m : matrix coeff) (v : array63 coeff) (fact0 : rows m = array63_length v) (fact1 : bv_signed (columns m) < 4611686018427387903%Z) : let o1 : bv 63%N := columns m in int'63_in_bounds (bv_signed o1 + 1%Z) ∧ (∀(o2 : bv 63%N), bv_signed o2 = bv_signed o1 + 1%Z -> (let o3 : bv 63%N := rows m in (0%Z ≤ bv_signed o3 ∧ 0%Z ≤ bv_signed o2) ∧ (∀(r : matrix coeff), rows r = o3 ∧ columns r = o2 ∧ (∀(i : Z) (j : Z), (0%Z ≤ i ∧ i < bv_signed o3) ∧ 0%Z ≤ j ∧ j < bv_signed o2 -> get_unsafe r i j = czero) -> (let o4 : bv 63%N := rows m in int'63_in_bounds (bv_signed o4 - 1%Z) ∧ (∀(o5 : bv 63%N), bv_signed o5 = bv_signed o4 - 1%Z -> (0%Z ≤ bv_signed o5 + 1%Z -> ((∀(k : Z) (j : Z), 0%Z ≤ k ∧ k < 0%Z -> 0%Z ≤ j ∧ j < bv_signed (columns m) -> elts r k j = elts m k j) ∧ (∀(k : Z), 0%Z ≤ k ∧ k < 0%Z -> elts r k (bv_signed (columns m)) = nth (Z.to_nat k) (array63_elts v) inhabitant)) ∧ (∀(r1 : matrix coeff), rows r1 = rows r ∧ columns r1 = columns r -> (∀(i : bv 63%N), let i1 : Z := bv_signed i in (0%Z ≤ i1 ∧ i1 ≤ bv_signed o5) ∧ (∀(k : Z) (j : Z), 0%Z ≤ k ∧ k < i1 -> 0%Z ≤ j ∧ j < bv_signed (columns m) -> elts r1 k j = elts m k j) ∧ (∀(k : Z), 0%Z ≤ k ∧ k < i1 -> elts r1 k (bv_signed (columns m)) = nth (Z.to_nat k) (array63_elts v) inhabitant) -> (let o6 : bv 63%N := columns m in int'63_in_bounds (bv_signed o6 - 1%Z) ∧ (∀(o7 : bv 63%N), bv_signed o7 = bv_signed o6 - 1%Z -> (0%Z ≤ bv_signed o7 + 1%Z -> ((∀(k : Z) (j : Z), 0%Z ≤ k ∧ k < i1 -> 0%Z ≤ j ∧ j < bv_signed (columns m) -> elts r1 k j = elts m k j) ∧ (∀(k : Z), 0%Z ≤ k ∧ k < i1 -> elts r1 k (bv_signed (columns m)) = nth (Z.to_nat k) (array63_elts v) inhabitant) ∧ (∀(l : Z), 0%Z ≤ l ∧ l < 0%Z -> elts r1 i1 l = elts m i1 l)) ∧ (∀(r2 : matrix coeff), rows r2 = rows r1 ∧ columns r2 = columns r1 -> (∀(j : bv 63%N), let j1 : Z := bv_signed j in (0%Z ≤ j1 ∧ j1 ≤ bv_signed o7) ∧ (∀(k : Z) (j2 : Z), 0%Z ≤ k ∧ k < i1 -> 0%Z ≤ j2 ∧ j2 < bv_signed (columns m) -> elts r2 k j2 = elts m k j2) ∧ (∀(k : Z), 0%Z ≤ k ∧ k < i1 -> elts r2 k (bv_signed (columns m)) = nth (Z.to_nat k) (array63_elts v) inhabitant) ∧ (∀(l : Z), 0%Z ≤ l ∧ l < j1 -> elts r2 i1 l = elts m i1 l) -> valid_index m i j ∧ valid_index r2 i j ∧ (∀(r3 : matrix coeff), rows r3 = rows r2 ∧ columns r3 = columns r2 -> elts r3 = fun_updt (elts r2) (bv_signed i) (fun_updt (elts r2 (bv_signed i)) (bv_signed j) (get_unsafe m (bv_signed i) (bv_signed j))) -> (∀(k : Z) (j2 : Z), 0%Z ≤ k ∧ k < i1 -> 0%Z ≤ j2 ∧ j2 < bv_signed (columns m) -> elts r3 k j2 = elts m k j2) ∧ (∀(k : Z), 0%Z ≤ k ∧ k < i1 -> elts r3 k (bv_signed (columns m)) = nth (Z.to_nat k) (array63_elts v) inhabitant) ∧ (∀(l : Z), 0%Z ≤ l ∧ l < j1 + 1%Z -> elts r3 i1 l = elts m i1 l))) ∧ ((∀(k : Z) (j : Z), 0%Z ≤ k ∧ k < i1 -> 0%Z ≤ j ∧ j < bv_signed (columns m) -> elts r2 k j = elts m k j) ∧ (∀(k : Z), 0%Z ≤ k ∧ k < i1 -> elts r2 k (bv_signed (columns m)) = nth (Z.to_nat k) (array63_elts v) inhabitant) ∧ (∀(l : Z), 0%Z ≤ l ∧ l < bv_signed o7 + 1%Z -> elts r2 i1 l = elts m i1 l) -> (0%Z ≤ bv_signed i ∧ bv_signed i < bv_signed (array63_length v)) ∧ (let o8 : bv 63%N := columns m in valid_index r2 i o8 ∧ (∀(r3 : matrix coeff), rows r3 = rows r2 ∧ columns r3 = columns r2 -> elts r3 = fun_updt (elts r2) (bv_signed i) (fun_updt (elts r2 (bv_signed i)) (bv_signed o8) (nth (Z.to_nat (bv_signed i)) (array63_elts v) inhabitant)) -> (∀(k : Z) (j : Z), 0%Z ≤ k ∧ k < i1 + 1%Z -> 0%Z ≤ j ∧ j < bv_signed (columns m) -> elts r3 k j = elts m k j) ∧ (∀(k : Z), 0%Z ≤ k ∧ k < i1 + 1%Z -> elts r3 k (bv_signed (columns m)) = nth (Z.to_nat k) (array63_elts v) inhabitant)))))) ∧ (bv_signed o7 + 1%Z < 0%Z -> (0%Z ≤ bv_signed i ∧ bv_signed i < bv_signed (array63_length v)) ∧ (let o8 : bv 63%N := columns m in valid_index r1 i o8 ∧ (∀(r2 : matrix coeff), rows r2 = rows r1 ∧ columns r2 = columns r1 -> elts r2 = fun_updt (elts r1) (bv_signed i) (fun_updt (elts r1 (bv_signed i)) (bv_signed o8) (nth (Z.to_nat (bv_signed i)) (array63_elts v) inhabitant)) -> (∀(k : Z) (j : Z), 0%Z ≤ k ∧ k < i1 + 1%Z -> 0%Z ≤ j ∧ j < bv_signed (columns m) -> elts r2 k j = elts m k j) ∧ (∀(k : Z), 0%Z ≤ k ∧ k < i1 + 1%Z -> elts r2 k (bv_signed (columns m)) = nth (Z.to_nat k) (array63_elts v) inhabitant))))))) ∧ ((∀(k : Z) (j : Z), 0%Z ≤ k ∧ k < bv_signed o5 + 1%Z -> 0%Z ≤ j ∧ j < bv_signed (columns m) -> elts r1 k j = elts m k j) ∧ (∀(k : Z), 0%Z ≤ k ∧ k < bv_signed o5 + 1%Z -> elts r1 k (bv_signed (columns m)) = nth (Z.to_nat k) (array63_elts v) inhabitant) -> rows r1 = rows m ∧ bv_signed (columns r1) = bv_signed (columns m) + 1%Z ∧ (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < bv_signed (rows m) -> 0%Z ≤ j ∧ j < bv_signed (columns m) -> elts r1 i j = elts m i j) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed (rows m) -> elts r1 i (bv_signed (columns m)) = nth (Z.to_nat i) (array63_elts v) inhabitant)))) ∧ (bv_signed o5 + 1%Z < 0%Z -> rows r = rows m ∧ bv_signed (columns r) = bv_signed (columns m) + 1%Z ∧ (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < bv_signed (rows m) -> 0%Z ≤ j ∧ j < bv_signed (columns m) -> elts r i j = elts m i j) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed (rows m) -> elts r i (bv_signed (columns m)) = nth (Z.to_nat i) (array63_elts v) inhabitant))))))).
Proof.
Admitted.
