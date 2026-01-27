import Mathlib

open Classical

namespace Lean4Why3

instance {n : Nat} : HShiftLeft (BitVec n) Int (BitVec n) where
  hShiftLeft x k := x <<< k.toNat

instance {n : Nat} : HShiftRight (BitVec n) Int (BitVec n) where
  hShiftRight x k := x >>> k.toNat

abbrev sshiftRight'i {n : ℕ} (a : BitVec n) (s : Int) : BitVec n := a.sshiftRight s.toNat

abbrev make_str_i (size : Int) := String.mk (List.replicate (Int.toNat size) 'a')
abbrev _root_.List.create_i {α} (n : ℤ) (f : ℤ -> α) := (List.range n.toNat).map f
abbrev _root_.List.create {α} (n : ℕ) (f : ℕ -> α) := (List.range n).map f

abbrev _root_.Bool.imp (a b : Bool) : Bool := !a || b

abbrev _root_.List.replicate_i {α} (n : ℤ) (x : α) := List.replicate (Int.toNat n) x

abbrev take_i {α : Type} (n : ℤ) (l : List α) := List.take n.toNat l
abbrev drop_i {α : Type} (n : ℤ) (l : List α) := List.drop n.toNat l

abbrev getElem_i! {α : Type} [Inhabited α] (l : List α) (i : Int) := l[i.toNat]!
abbrev getElem_i? {α : Type} (l : List α) (i : Int) := l[i.toNat]?

abbrev length_i {α : Type} (l : List α) := Int.ofNat l.length
abbrev slice {α : Type} (l : List α) (i j : Nat) : List α :=
  (l.drop i).take (j - i)
abbrev slice_i {α : Type} (l : List α) (i j : Int) : List α :=
  (l.drop i.toNat).take (j.toNat - i.toNat)

abbrev Sorted {α : Type} [LE α] (l : List α) := List.Sorted LE.le l
abbrev _root_.List.set_i {α : Type} (l : List α) (n : ℤ) (a : α) :=
  List.set l n.toNat a

abbrev implication (P : Prop) (Q : Prop) := P -> Q

noncomputable def map_occ {α : Type} (v : α) (m : Int -> α) (l u : Int)
  := {n | l ≤ n ∧ n < u ∧ m n = v }.ncard
noncomputable abbrev map_occ_i {α : Type} (v : α) (m : Int -> α) (l u : Int)
  := Int.ofNat (map_occ (v : α) (m : Int -> α) (l : Int) u)

abbrev _root_.BitVec.toUInt {n : Nat} (x : BitVec n) := Int.ofNat x.toNat

abbrev int'16_max : BitVec 16 := 32767
abbrev int'16_min : BitVec 16 := -32768
abbrev int'31_max : BitVec 31 := 1073741823
abbrev int'31_min : BitVec 31 := -1073741824
abbrev int'32_max : BitVec 32 := 2147483647
abbrev int'32_min : BitVec 32 := -2147483648
abbrev int'63_max : BitVec 63 := 4611686018427387903
abbrev int'63_min : BitVec 63 := -4611686018427387904
abbrev int'64_max : BitVec 64 := 9223372036854775807
abbrev int'64_min : BitVec 64 := -9223372036854775808
abbrev uint'16_max : BitVec 16 := 65535
abbrev uint'16_min : BitVec 16 := 0
abbrev uint'31_max : BitVec 31 := 2147483647
abbrev uint'31_min : BitVec 31 := 0
abbrev uint'32_max : BitVec 32 := 4294967295
abbrev uint'32_min : BitVec 32 := 0
abbrev uint'63_max : BitVec 63 := 9223372036854775807
abbrev uint'63_min : BitVec 63 := 0
abbrev uint'64_max : BitVec 64 := 18446744073709551615
abbrev uint'64_min : BitVec 64 := 0

abbrev int'16_in_bounds (x : Int) := int'16_min.toInt ≤ x ∧ x ≤ int'16_max.toInt
abbrev int'31_in_bounds (x : Int) := int'31_min.toInt ≤ x ∧ x ≤ int'31_max.toInt
abbrev int'32_in_bounds (x : Int) := int'32_min.toInt ≤ x ∧ x ≤ int'32_max.toInt
abbrev int'63_in_bounds (x : Int) := int'63_min.toInt ≤ x ∧ x ≤ int'63_max.toInt
abbrev int'64_in_bounds (x : Int) := int'64_min.toInt ≤ x ∧ x ≤ int'64_max.toInt
abbrev uint'8_in_bounds (x : Int) := 0 ≤ x ∧ x ≤ 256
abbrev uint'16_in_bounds (x : Int) := 0 ≤ x ∧ x ≤ int'16_max.toUInt
abbrev uint'31_in_bounds (x : Int) := 0 ≤ x ∧ x ≤ int'31_max.toUInt
abbrev uint'32_in_bounds (x : Int) := 0 ≤ x ∧ x ≤ int'32_max.toUInt
abbrev uint'63_in_bounds (x : Int) := 0 ≤ x ∧ x ≤ int'63_max.toUInt
abbrev uint'64_in_bounds (x : Int) := 0 ≤ x ∧ x ≤ int'64_max.toUInt

axiom array31 : Type -> Type
axiom array32 : Type -> Type
axiom array63 : Type -> Type

axiom array31_elts : {α : Type} -> array31 α -> Int -> α
axiom array32_elts : {α : Type} -> array32 α -> Int -> α
axiom array63_elts : {α : Type} -> array63 α -> List α

noncomputable abbrev array63_nth {α : Type} [Inhabited α] (a : array63 α) (i : Int) := (array63_elts a)[i.toNat]!

axiom array31_length : {α : Type} -> array31 α -> BitVec 31
axiom array32_length : {α : Type} -> array32 α -> BitVec 32
axiom array63_length : {α : Type} -> array63 α -> BitVec 63

abbrev is_none {α : Type} (x : Option α) := x = none
abbrev is_nil {α : Type} (x : List α) := x = []

abbrev _root_.List.rev_append {α : Type} (a : List α) (b : List α) := a.reverse ++ b
abbrev _root_.Finset.is_empty {α : Type} (s : Finset α) := s = ∅
abbrev _root_.Finset.filter' {α : Type} (s : Finset α) (p : α → Prop) [DecidablePred p] : Finset α
  := Finset.filter p s

abbrev _root_.Finset.card_i {α : Type} (s : Finset α) := Int.ofNat s.card

abbrev int_power (x : Int) (n : Int) := x ^ n.toNat
abbrev bv2_power (n : Int) := Int.ofNat (2 ^ n.toNat)

abbrev take_bit_i {n : Nat} (x : BitVec n) (i : Int) := x[i.toNat]!
abbrev take_bit_bv {n m : Nat} (x : BitVec n) (i : BitVec m) := x[i.toNat]!

noncomputable def _root_.Finset.pick! {α} [Inhabited α] (s : Finset α) : α :=
  if h : s.Nonempty then Classical.choose h else default
noncomputable def _root_.Set.pick! {α} [Inhabited α] (s : Finset α) : α :=
  if h : s.Nonempty then Classical.choose h else default

noncomputable abbrev _root_.BitVec.eq_sub {m : Nat} (a b : BitVec m) (i n : Nat) :=
  BitVec.extractLsb (i+n-1) i a = BitVec.extractLsb (i+n-1) i b

noncomputable abbrev _root_.BitVec.eq_sub_i {m : Nat} (a b : BitVec m) (i n : Int) :=
  BitVec.eq_sub a b i.toNat n.toNat

noncomputable abbrev _root_.BitVec.eq_sub_bv {m : Nat} {m1 : Nat} {m2 : Nat} (a b : BitVec m) (i : BitVec m1) (n : BitVec m2) :=
  BitVec.eq_sub a b i.toNat n.toNat

abbrev w8_size_bv := (8 : BitVec 8)
abbrev w16_size_bv := (16 : BitVec 16)
abbrev w32_size_bv := (32 : BitVec 32)
abbrev w64_size_bv := (64 : BitVec 64)
abbrev w128_size_bv := (128 : BitVec 128)
abbrev w256_size_bv := (256 : BitVec 256)
abbrev w8_size_i := (8 : Int)
abbrev w16_size_i := (16 : Int)
abbrev w32_size_i := (32 : Int)
abbrev w64_size_i := (64 : Int)
abbrev w128_size_i := (128 : Int)
abbrev w256_size_i := (256 : Int)

abbrev _root_.Finset.erase' {α : Type} [DecidableEq α] (a : α) (s : Finset α) : Finset α
  := Finset.erase s a

abbrev _root_.BitVec.sge {n : ℕ} (x y : BitVec n) := BitVec.sle y x
abbrev _root_.BitVec.sgt {n : ℕ} (x y : BitVec n) := BitVec.slt y x

abbrev _root_.BitVec.sshiftRight_i {n : ℕ} (x : BitVec n) (s : ℤ) := BitVec.sshiftRight x s.toNat
abbrev _root_.BitVec.sshiftRight_bv {n m : ℕ} (x : BitVec n) (s : BitVec m)
  := BitVec.sshiftRight x s.toNat

abbrev _root_.BitVec.rotateLeft_i {w : ℕ} (x : BitVec w) (n : ℤ) := BitVec.rotateLeft x n.toNat
abbrev _root_.BitVec.rotateLeft_nv {w w2 : ℕ} (x : BitVec w) (n : BitVec w2)
  := BitVec.rotateLeft x n.toNat

abbrev _root_.BitVec.rotateRight_i {w : ℕ} (x : BitVec w) (n : ℤ) := BitVec.rotateRight x n.toNat
abbrev _root_.BitVec.rotateRight_nv {w w2 : ℕ} (x : BitVec w) (n : BitVec w2)
  := BitVec.rotateRight x n.toNat

abbrev _root_.Multiset.count_i {α : Type} [DecidableEq α] (a : α) (s : Multiset α)
  := Int.ofNat (s.count a)

abbrev _root_.Multiset.card_i {α : Type} (S : Multiset α) := Int.ofNat S.card

abbrev _root_.Int.gcd_i (a : ℤ) (b : ℤ) := Int.ofNat (Int.gcd a b)

abbrev _root_.Int.Prime (p : ℤ) := Nat.Prime p.toNat
abbrev _root_.Int.Coprime (a b : ℤ) := Nat.Coprime a.toNat b.toNat

abbrev _root_.Set.remove {α : Type} (x : α) (A : Set α) := A \ {x}
abbrev _root_.Set.filter {α : Type} (S : Set α) (P : α -> Bool) := {x ∈ S | P x }

abbrev _root_.Option.the {α : Type} [Inhabited α] (opt : Option α) := opt.getD default

noncomputable abbrev _root_.Finmap.lookup! {K : Type} {V : Type} [Inhabited V] (m : Finmap (fun _ : K => V)) (k : K) :=
  (Finmap.lookup k m).getD default

noncomputable abbrev _root_.Finmap.mapsto {K V : Type} (k : K) (v : V) (m : Finmap (fun _ : K => V))
  := Finmap.lookup k m = some v

abbrev _root_.Finmap.is_empty {K V : Type} (m : Finmap (fun _ : K => V)) := m = ∅
abbrev _root_.Finmap.size {K V : Type} (m : Finmap (fun _ : K => V)) := m.keys.card

abbrev _root_.Finset.min'' {α} [Inhabited α] [LinearOrder α] (s : Finset α) : α :=
  match s.min with
  | ⊤        => default
  | .some a  => a

abbrev _root_.Finset.max'' {α} [Inhabited α] [LinearOrder α] (s : Finset α) : α :=
  match s.max with
  | ⊥        => default
  | .some a  => a

abbrev arrayExchange {α} [Inhabited α] (a1 a2 : List α) (i j : Int) : Prop :=
  let i' := i.toNat
  let j' := j.toNat
  a1 = (a2.set i' a1[j']!).set j' (a1[i']!)

abbrev _root_.List.permut_sub {α} (a1 a2 : List α) (l u : ℕ) : Prop :=
  a1.length = a2.length ∧ (0 ≤ l ∧ l ≤ a1.length) ∧ (0 ≤ u ∧ u ≤ a1.length) ∧
  List.Perm (slice a1 l u) (slice a2 l u)

abbrev _root_.List.permut_sub' {α} (a1 a2 : List α) (l u : ℕ) : Prop :=
  a1.length = a2.length ∧ slice a1 0 l = slice a2 0 l ∧
  slice a1 u a1.length = slice a2 u a1.length ∧
  List.Perm (slice a1 l u) (slice a2 l u)

abbrev _root_.List.foldr' {α β} (f : α -> β -> β) (l : List α) (x : β) := List.foldr f x l

abbrev _root_.Int.to_Real (z : ℤ) : ℝ := z

abbrev _root_.List.mem' {α} (eq : α -> α -> Bool) (x : α) (l : List α) := List.all l (eq x)

noncomputable abbrev _root_.Real.truncate (x : ℝ) : ℤ := if 0 ≤ x then Int.floor x  else Int.ceil x

alias _root_.Math.abs := abs

end Lean4Why3

open Classical
open Lean4Why3

namespace Ref
structure ref (α : Type) where
  contents : α
axiom inhabited_axiom_ref {α : Type} [Inhabited α] : Inhabited (ref α)
attribute [instance] inhabited_axiom_ref
end Ref
namespace Matrix63
axiom matrix : Type -> Type
axiom inhabited_axiom_matrix {α : Type} [Inhabited α] : Inhabited (matrix α)
attribute [instance] inhabited_axiom_matrix
axiom elts :  {α : Type} -> [Inhabited α] -> matrix α -> ℤ -> ℤ -> α
axiom rows :  {α : Type} -> [Inhabited α] -> matrix α -> BitVec 63
axiom columns :  {α : Type} -> [Inhabited α] -> matrix α -> BitVec 63
axiom matrix'invariant {α : Type} [Inhabited α] (self : matrix α) : (0 : ℤ) ≤ BitVec.toInt (rows self) ∧ (0 : ℤ) ≤ BitVec.toInt (columns self)
axiom get_unsafe :  {α : Type} -> [Inhabited α] -> matrix α -> ℤ -> ℤ -> α
axiom get_unsafe'spec {α : Type} [Inhabited α] (a : matrix α) (r : ℤ) (c : ℤ) : get_unsafe a r c = elts a r c
axiom set_unsafe :  {α : Type} -> [Inhabited α] -> matrix α -> ℤ -> ℤ -> α -> matrix α
axiom set_unsafe'spec {α : Type} [Inhabited α] (a : matrix α) (r : ℤ) (c : ℤ) (v : α) : rows (set_unsafe a r c v) = rows a ∧ columns (set_unsafe a r c v) = columns a ∧ elts (set_unsafe a r c v) = Function.update (elts a) r (Function.update (elts a r) c v)
noncomputable def valid_index {α : Type} [Inhabited α] (a : matrix α) (r : BitVec 63) (c : BitVec 63) := ((0 : ℤ) ≤ BitVec.toInt r ∧ BitVec.toInt r < BitVec.toInt (rows a)) ∧ (0 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c < BitVec.toInt (columns a)
end Matrix63
namespace Debug
structure t where
  foo : Unit
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
end Debug
namespace lineardecision_LinearEquationsDecision_sub_exprqtvc
axiom coeff : Type
axiom inhabited_axiom_coeff : Inhabited coeff
attribute [instance] inhabited_axiom_coeff
axiom a : Type
axiom inhabited_axiom_a : Inhabited a
attribute [instance] inhabited_axiom_a
axiom infix_pl : a -> a -> a
axiom infix_as : a -> a -> a
axiom prefix_mn : a -> a
axiom azero : a
axiom aone : a
axiom ale : a -> a -> Prop
axiom Assoc (x : a) (y : a) (z : a) : infix_pl (infix_pl x y) z = infix_pl x (infix_pl y z)
axiom Unit_def_l (x : a) : infix_pl azero x = x
axiom Unit_def_r (x : a) : infix_pl x azero = x
axiom Inv_def_l (x : a) : infix_pl (prefix_mn x) x = azero
axiom Inv_def_r (x : a) : infix_pl x (prefix_mn x) = azero
axiom Comm (x : a) (y : a) : infix_pl x y = infix_pl y x
axiom Assoc1 (x : a) (y : a) (z : a) : infix_as (infix_as x y) z = infix_as x (infix_as y z)
axiom Mul_distr_l (x : a) (y : a) (z : a) : infix_as x (infix_pl y z) = infix_pl (infix_as x y) (infix_as x z)
axiom Mul_distr_r (y : a) (z : a) (x : a) : infix_as (infix_pl y z) x = infix_pl (infix_as y x) (infix_as z x)
axiom Comm1 (x : a) (y : a) : infix_as x y = infix_as y x
axiom Unitary (x : a) : infix_as aone x = x
axiom NonTrivialRing : ¬azero = aone
axiom Refl (x : a) : ale x x
axiom Trans (x : a) (y : a) (z : a) (fact0 : ale x y) (fact1 : ale y z) : ale x z
axiom Antisymm (x : a) (y : a) (fact0 : ale x y) (fact1 : ale y x) : x = y
axiom Total (x : a) (y : a) : ale x y ∨ ale y x
axiom ZeroLessOne : ale azero aone
axiom CompatOrderAdd (x : a) (y : a) (z : a) (fact0 : ale x y) : ale (infix_pl x z) (infix_pl y z)
axiom CompatOrderMult (x : a) (y : a) (z : a) (fact0 : ale x y) (fact1 : ale azero z) : ale (infix_as x z) (infix_as y z)
axiom infix_mn : a -> a -> a
axiom sub_def (a1 : a) (a2 : a) : infix_mn a1 a2 = infix_pl a1 (prefix_mn a2)
axiom vars : Type
axiom inhabited_axiom_vars : Inhabited vars
attribute [instance] inhabited_axiom_vars
axiom cvars : Type
axiom inhabited_axiom_cvars : Inhabited cvars
attribute [instance] inhabited_axiom_cvars
axiom interp : coeff -> cvars -> a
axiom czero : coeff
axiom cone : coeff
axiom zero_def (y : cvars) : interp czero y = azero
axiom one_def (y : cvars) : interp cone y = aone
axiom eq : coeff -> coeff -> Prop
axiom eq'spec (a1 : coeff) (b : coeff) (y : cvars) (fact0 : eq a1 b) : interp a1 y = interp b y
axiom vars1 : Type
axiom inhabited_axiom_vars1 : Inhabited vars1
attribute [instance] inhabited_axiom_vars1
inductive expr where
  | Term : coeff -> ℤ -> expr
  | Add : expr -> expr -> expr
  | Cst : coeff -> expr
axiom inhabited_axiom_expr : Inhabited expr
attribute [instance] inhabited_axiom_expr
noncomputable def valid_expr : expr -> Prop
  | (expr.Term x i) => (0 : ℤ) ≤ i
  | (expr.Cst x) => True
  | (expr.Add e1 e2) => valid_expr e1 ∧ valid_expr e2
noncomputable def expr_bound : expr -> ℤ -> Prop
  | (expr.Term x i), b => (0 : ℤ) ≤ i ∧ i ≤ b
  | (expr.Cst x), b => True
  | (expr.Add e1 e2), b => expr_bound e1 b ∧ expr_bound e2 b
noncomputable def interp1 : expr -> (ℤ -> a) -> cvars -> a
  | (expr.Term c v), y, z => infix_as (interp c z) (y v)
  | (expr.Add e1 e2), y, z => infix_pl (interp1 e1 y z) (interp1 e2 y z)
  | (expr.Cst c), y, z => interp c z
axiom equality : Type
axiom inhabited_axiom_equality : Inhabited equality
attribute [instance] inhabited_axiom_equality
axiom context : Type
axiom inhabited_axiom_context : Inhabited context
attribute [instance] inhabited_axiom_context
noncomputable def valid_eq (eq1 : expr × expr) := match eq1 with | (e1, e2) => valid_expr e1 ∧ valid_expr e2
noncomputable def eq_bound (eq1 : expr × expr) (b : ℤ) := match eq1 with | (e1, e2) => expr_bound e1 b ∧ expr_bound e2 b
noncomputable def valid_ctx : List (expr × expr) -> Prop
  | ([] : List (expr × expr)) => True
  | (List.cons eq1 t) => valid_eq eq1 ∧ valid_ctx t
noncomputable def ctx_bound : List (expr × expr) -> ℤ -> Prop
  | ([] : List (expr × expr)), b => True
  | (List.cons eq1 t), b => eq_bound eq1 b ∧ ctx_bound t b
noncomputable def interp_eq (g : expr × expr) (y : ℤ -> a) (z : cvars) := if match g with | (g1, g2) => interp1 g1 y z = interp1 g2 y z then true else false
noncomputable def interp_ctx : List (expr × expr) -> expr × expr -> (ℤ -> a) -> cvars -> Bool
  | l, g, y, z => if match l with | ([] : List (expr × expr)) => interp_eq g y z = true | List.cons h t => interp_eq h y z = true → interp_ctx t g y z = true then true else false
axiom infix_eqeq : array63 coeff -> array63 coeff -> Prop
axiom infix_eqeq'spec (a1 : array63 coeff) (b : array63 coeff) (fact0 : infix_eqeq a1 b) : array63_length a1 = array63_length b ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < BitVec.toInt (array63_length a1) → eq ((array63_elts a1)[Int.toNat i]!) ((array63_elts b)[Int.toNat i]!))
axiom max_var : expr -> ℤ
axiom max_var'def (e : expr) (fact0 : valid_expr e) : match e with | expr.Term _ i => max_var e = i | expr.Cst _ => max_var e = (0 : ℤ) | expr.Add e1 e2 => max_var e = max (max_var e1) (max_var e2)
axiom max_var'spec'0 (e : expr) (fact0 : valid_expr e) : (0 : ℤ) ≤ max_var e
axiom max_var'spec (e : expr) (fact0 : valid_expr e) : expr_bound e (max_var e)
axiom max_var_e : expr × expr -> ℤ
axiom max_var_e'def (e : expr × expr) (fact0 : valid_eq e) : match e with | (e1, e2) => max_var_e e = max (max_var e1) (max_var e2)
axiom max_var_e'spec'0 (e : expr × expr) (fact0 : valid_eq e) : (0 : ℤ) ≤ max_var_e e
axiom max_var_e'spec (e : expr × expr) (fact0 : valid_eq e) : eq_bound e (max_var_e e)
axiom max_var_ctx : List (expr × expr) -> ℤ
axiom max_var_ctx'def (l : List (expr × expr)) (fact0 : valid_ctx l) : match l with | ([] : List (expr × expr)) => max_var_ctx l = (0 : ℤ) | List.cons e t => max_var_ctx l = max (max_var_e e) (max_var_ctx t)
axiom max_var_ctx'spec'0 (l : List (expr × expr)) (fact0 : valid_ctx l) : (0 : ℤ) ≤ max_var_ctx l
axiom max_var_ctx'spec (l : List (expr × expr)) (fact0 : valid_ctx l) : ctx_bound l (max_var_ctx l)
noncomputable def atom (e : expr) := match e with | expr.Add _ _ => False | _ => True
theorem sub_expr'vc (o1 : coeff) (o2 : expr) (e2 : expr) (r : expr) (e1 : expr) (y : ℤ -> a) (z : cvars) (fact0 : ∀(v : cvars), interp o1 v = prefix_mn (interp cone v)) (fact1 : ∀(y : ℤ -> a) (z : cvars), interp1 o2 y z = infix_as (interp o1 z) (interp1 e2 y z)) (fact2 : valid_expr e2 → valid_expr o2) (fact3 : ∀(y : ℤ -> a) (z : cvars), interp1 r y z = infix_pl (interp1 e1 y z) (interp1 o2 y z)) : infix_pl (interp1 r y z) (interp1 e2 y z) = interp1 e1 y z
  := sorry
end lineardecision_LinearEquationsDecision_sub_exprqtvc
