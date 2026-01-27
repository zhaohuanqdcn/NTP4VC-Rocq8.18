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
namespace NumOf
axiom numof : (ℤ -> Bool) -> ℤ -> ℤ -> ℤ
axiom numof'def (b : ℤ) (a : ℤ) (p : ℤ -> Bool) : if b ≤ a then numof p a b = (0 : ℤ) else if p (b - (1 : ℤ)) = true then numof p a b = (1 : ℤ) + numof p a (b - (1 : ℤ)) else numof p a b = numof p a (b - (1 : ℤ))
axiom Numof_bounds (a : ℤ) (b : ℤ) (p : ℤ -> Bool) (fact0 : a < b) : (0 : ℤ) ≤ numof p a b ∧ numof p a b ≤ b - a
axiom Numof_append (a : ℤ) (b : ℤ) (c : ℤ) (p : ℤ -> Bool) (fact0 : a ≤ b) (fact1 : b ≤ c) : numof p a c = numof p a b + numof p b c
axiom Numof_left_no_add (a : ℤ) (b : ℤ) (p : ℤ -> Bool) (fact0 : a < b) (fact1 : ¬p a = true) : numof p a b = numof p (a + (1 : ℤ)) b
axiom Numof_left_add (a : ℤ) (b : ℤ) (p : ℤ -> Bool) (fact0 : a < b) (fact1 : p a = true) : numof p a b = (1 : ℤ) + numof p (a + (1 : ℤ)) b
axiom Empty (a : ℤ) (b : ℤ) (p : ℤ -> Bool) (fact0 : ∀(n : ℤ), a ≤ n ∧ n < b → ¬p n = true) : numof p a b = (0 : ℤ)
axiom Full (a : ℤ) (b : ℤ) (p : ℤ -> Bool) (fact0 : a ≤ b) (fact1 : ∀(n : ℤ), a ≤ n ∧ n < b → p n = true) : numof p a b = b - a
axiom numof_increasing (i : ℤ) (j : ℤ) (k : ℤ) (p : ℤ -> Bool) (fact0 : i ≤ j) (fact1 : j ≤ k) : numof p i j ≤ numof p i k
axiom numof_strictly_increasing (i : ℤ) (j : ℤ) (k : ℤ) (l : ℤ) (p : ℤ -> Bool) (fact0 : i ≤ j) (fact1 : j ≤ k) (fact2 : k < l) (fact3 : p k = true) : numof p i j < numof p i l
axiom numof_change_any (a : ℤ) (b : ℤ) (p1 : ℤ -> Bool) (p2 : ℤ -> Bool) (fact0 : ∀(j : ℤ), a ≤ j ∧ j < b → p1 j = true → p2 j = true) : numof p1 a b ≤ numof p2 a b
axiom numof_change_some (a : ℤ) (i : ℤ) (b : ℤ) (p1 : ℤ -> Bool) (p2 : ℤ -> Bool) (fact0 : a ≤ i) (fact1 : i < b) (fact2 : ∀(j : ℤ), a ≤ j ∧ j < b → p1 j = true → p2 j = true) (fact3 : ¬p1 i = true) (fact4 : p2 i = true) : numof p1 a b < numof p2 a b
axiom numof_change_equiv (a : ℤ) (b : ℤ) (p1 : ℤ -> Bool) (p2 : ℤ -> Bool) (fact0 : ∀(j : ℤ), a ≤ j ∧ j < b → (p1 j = true) = (p2 j = true)) : numof p2 a b = numof p1 a b
end NumOf
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
namespace RationalCoeffs
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom rvars : Type
axiom inhabited_axiom_rvars : Inhabited rvars
attribute [instance] inhabited_axiom_rvars
noncomputable def rinterp (t1 : ℤ × ℤ) (x_v : ℤ -> ℝ) := match t1 with | (n, d) => Int.to_Real n / Int.to_Real d
noncomputable def req (a : ℤ × ℤ) (b : ℤ × ℤ) := match (a, b) with | ((n1, d1), (n2, d2)) => n1 = n2 ∧ d1 = d2 ∨ ¬d1 = (0 : ℤ) ∧ ¬d2 = (0 : ℤ) ∧ n1 * d2 = n2 * d1
axiom req'spec (a : ℤ × ℤ) (b : ℤ × ℤ) (y : ℤ -> ℝ) (fact0 : req a b) : rinterp a y = rinterp b y
end RationalCoeffs
namespace MP64Coeffs
axiom evars : Type
axiom inhabited_axiom_evars : Inhabited evars
attribute [instance] inhabited_axiom_evars
inductive exp where
  | Lit : ℤ -> exp
  | Var : ℤ -> exp
  | Plus : exp -> exp -> exp
  | Minus : exp -> exp
  | Sub : exp -> exp -> exp
axiom inhabited_axiom_exp : Inhabited exp
attribute [instance] inhabited_axiom_exp
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
noncomputable def qinterp (q : ℤ × ℤ) := match q with | (n, d) => Int.to_Real n / Int.to_Real d
noncomputable def interp_exp : exp -> (ℤ -> ℤ) -> ℤ
  | (exp.Lit n), y => n
  | (exp.Var v), y => y v
  | (exp.Plus e1 e2), y => interp_exp e1 y + interp_exp e2 y
  | (exp.Sub e1 e2), y => interp_exp e1 y - interp_exp e2 y
  | (exp.Minus e'), y => -interp_exp e' y
noncomputable def minterp (t1 : (ℤ × ℤ) × exp) (y : ℤ -> ℤ) := match t1 with | (q, e) => qinterp q * HPow.hPow (Int.to_Real ((18446744073709551615 : ℤ) + (1 : ℤ))) (Int.to_Real (interp_exp e y))
noncomputable def pure_same_exp : exp -> exp -> Prop
  | (exp.Lit n1), (exp.Lit n2) => n1 = n2
  | (exp.Var v1), (exp.Var v2) => v1 = v2
  | (exp.Minus e1'), (exp.Minus e2') => pure_same_exp e1' e2'
  | (exp.Plus a1 a2), (exp.Plus b1 b2) => pure_same_exp a1 b1 ∧ pure_same_exp a2 b2 ∨ pure_same_exp a1 b2 ∧ pure_same_exp a2 b1
  | x, x0 => False
axiom pure_same_exp'spec (e1 : exp) (e2 : exp) (y : ℤ -> ℤ) (fact0 : pure_same_exp e1 e2) : interp_exp e1 y = interp_exp e2 y
noncomputable def meq (a : (ℤ × ℤ) × exp) (b : (ℤ × ℤ) × exp) := match (a, b) with | ((q1, e1), (q2, e2)) => RationalCoeffs.req q1 q2 ∧ pure_same_exp e1 e2 ∨ RationalCoeffs.req q1 ((0 : ℤ), (1 : ℤ)) ∧ RationalCoeffs.req q2 ((0 : ℤ), (1 : ℤ))
axiom meq'spec (a : (ℤ × ℤ) × exp) (b : (ℤ × ℤ) × exp) (y : ℤ -> ℤ) (fact0 : meq a b) : minterp a y = minterp b y
end MP64Coeffs
namespace LinearDecisionRationalMP
axiom coeff : Type
axiom inhabited_axiom_coeff : Inhabited coeff
attribute [instance] inhabited_axiom_coeff
axiom sub_def (a1 : ℝ) (a2 : ℝ) : a1 - a2 = a1 + -a2
axiom vars : Type
axiom inhabited_axiom_vars : Inhabited vars
attribute [instance] inhabited_axiom_vars
axiom zero_def (y : ℤ -> ℤ) : MP64Coeffs.minterp (((0 : ℤ), (1 : ℤ)), MP64Coeffs.exp.Lit (0 : ℤ)) y = (0 : ℝ)
axiom one_def (y : ℤ -> ℤ) : MP64Coeffs.minterp (((1 : ℤ), (1 : ℤ)), MP64Coeffs.exp.Lit (0 : ℤ)) y = (1 : ℝ)
axiom vars1 : Type
axiom inhabited_axiom_vars1 : Inhabited vars1
attribute [instance] inhabited_axiom_vars1
inductive expr where
  | Term : (ℤ × ℤ) × MP64Coeffs.exp -> ℤ -> expr
  | Add : expr -> expr -> expr
  | Cst : (ℤ × ℤ) × MP64Coeffs.exp -> expr
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
noncomputable def interp : expr -> (ℤ -> ℝ) -> (ℤ -> ℤ) -> ℝ
  | (expr.Term c v), y, z => MP64Coeffs.minterp c z * y v
  | (expr.Add e1 e2), y, z => interp e1 y z + interp e2 y z
  | (expr.Cst c), y, z => MP64Coeffs.minterp c z
axiom equality : Type
axiom inhabited_axiom_equality : Inhabited equality
attribute [instance] inhabited_axiom_equality
axiom context : Type
axiom inhabited_axiom_context : Inhabited context
attribute [instance] inhabited_axiom_context
noncomputable def valid_eq (eq : expr × expr) := match eq with | (e1, e2) => valid_expr e1 ∧ valid_expr e2
noncomputable def eq_bound (eq : expr × expr) (b : ℤ) := match eq with | (e1, e2) => expr_bound e1 b ∧ expr_bound e2 b
noncomputable def valid_ctx : List (expr × expr) -> Prop
  | ([] : List (expr × expr)) => True
  | (List.cons eq t) => valid_eq eq ∧ valid_ctx t
noncomputable def ctx_bound : List (expr × expr) -> ℤ -> Prop
  | ([] : List (expr × expr)), b => True
  | (List.cons eq t), b => eq_bound eq b ∧ ctx_bound t b
noncomputable def interp_eq (g : expr × expr) (y : ℤ -> ℝ) (z : ℤ -> ℤ) := if match g with | (g1, g2) => interp g1 y z = interp g2 y z then true else false
noncomputable def interp_ctx : List (expr × expr) -> expr × expr -> (ℤ -> ℝ) -> (ℤ -> ℤ) -> Bool
  | l, g, y, z => if match l with | ([] : List (expr × expr)) => interp_eq g y z = true | List.cons h t => interp_eq h y z = true → interp_ctx t g y z = true then true else false
axiom infix_eqeq : array63 ((ℤ × ℤ) × MP64Coeffs.exp) -> array63 ((ℤ × ℤ) × MP64Coeffs.exp) -> Prop
axiom infix_eqeq'spec (a : array63 ((ℤ × ℤ) × MP64Coeffs.exp)) (b : array63 ((ℤ × ℤ) × MP64Coeffs.exp)) (fact0 : infix_eqeq a b) : array63_length a = array63_length b ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < BitVec.toInt (array63_length a) → MP64Coeffs.meq ((array63_elts a)[Int.toNat i]!) ((array63_elts b)[Int.toNat i]!))
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
axiom to_list :  {α : Type} -> [Inhabited α] -> array63 α -> BitVec 63 -> BitVec 63 -> List α
mutual
inductive expr' where
  | Sum : expr' -> expr' -> expr'
  | ProdL : expr' -> cprod -> expr'
  | ProdR : cprod -> expr' -> expr'
  | Diff : expr' -> expr' -> expr'
  | Var : ℤ -> expr'
  | Coeff : (ℤ × ℤ) × MP64Coeffs.exp -> expr'
inductive cprod where
  | C : (ℤ × ℤ) × MP64Coeffs.exp -> cprod
  | Times : cprod -> cprod -> cprod
end
axiom inhabited_axiom_expr' : Inhabited expr'
attribute [instance] inhabited_axiom_expr'
axiom inhabited_axiom_cprod : Inhabited cprod
attribute [instance] inhabited_axiom_cprod
noncomputable def interp_c : cprod -> (ℤ -> ℝ) -> (ℤ -> ℤ) -> ℝ
  | (cprod.C c), y, z => MP64Coeffs.minterp c z
  | (cprod.Times e1 e2), y, z => interp_c e1 y z * interp_c e2 y z
noncomputable def interp' : expr' -> (ℤ -> ℝ) -> (ℤ -> ℤ) -> ℝ
  | (expr'.Sum e1 e2), y, z => interp' e1 y z + interp' e2 y z
  | (expr'.ProdL e1 c), y, z => interp' e1 y z * interp_c c y z
  | (expr'.ProdR c e1), y, z => interp_c c y z * interp' e1 y z
  | (expr'.Diff e1 e2), y, z => interp' e1 y z - interp' e2 y z
  | (expr'.Var n), y, z => y n
  | (expr'.Coeff c), y, z => MP64Coeffs.minterp c z
axiom equality' : Type
axiom inhabited_axiom_equality' : Inhabited equality'
attribute [instance] inhabited_axiom_equality'
axiom context' : Type
axiom inhabited_axiom_context' : Inhabited context'
attribute [instance] inhabited_axiom_context'
noncomputable def interp_eq' (g : expr' × expr') (y : ℤ -> ℝ) (z : ℤ -> ℤ) := if match g with | (g1, g2) => interp' g1 y z = interp' g2 y z then true else false
noncomputable def interp_ctx' : List (expr' × expr') -> expr' × expr' -> (ℤ -> ℝ) -> (ℤ -> ℤ) -> Bool
  | l, g, y, z => if match l with | ([] : List (expr' × expr')) => interp_eq' g y z = true | List.cons h t => interp_eq' h y z = true → interp_ctx' t g y z = true then true else false
noncomputable def valid_expr' : expr' -> Prop
  | (expr'.Var i) => (0 : ℤ) ≤ i
  | (expr'.Sum e1 e2) => valid_expr' e1 ∧ valid_expr' e2
  | (expr'.Diff e1 e2) => valid_expr' e1 ∧ valid_expr' e2
  | (expr'.Coeff x) => True
  | (expr'.ProdL e1 x) => valid_expr' e1
  | (expr'.ProdR x e1) => valid_expr' e1
noncomputable def valid_eq' (eq : expr' × expr') := match eq with | (e1, e2) => valid_expr' e1 ∧ valid_expr' e2
noncomputable def valid_ctx' : List (expr' × expr') -> Prop
  | ([] : List (expr' × expr')) => True
  | (List.cons eq t) => valid_eq' eq ∧ valid_ctx' t
end LinearDecisionRationalMP
namespace LinearDecisionIntMP
inductive t where
  | I : ℤ -> t
  | E : MP64Coeffs.exp -> t
  | R : t
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
noncomputable def mpinterp (t1 : t) (y : ℤ -> ℤ) := match t1 with | t.I n => n | t.E e => HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (MP64Coeffs.interp_exp e y)) | t.R => (18446744073709551615 : ℤ) + (1 : ℤ)
axiom mpeq'spec : True
axiom sub_def (a1 : ℤ) (a2 : ℤ) : a1 - a2 = a1 + -a2
axiom vars : Type
axiom inhabited_axiom_vars : Inhabited vars
attribute [instance] inhabited_axiom_vars
axiom zero_def (y : ℤ -> ℤ) : mpinterp (t.I (0 : ℤ)) y = (0 : ℤ)
axiom one_def (y : ℤ -> ℤ) : mpinterp (t.I (1 : ℤ)) y = (1 : ℤ)
axiom vars1 : Type
axiom inhabited_axiom_vars1 : Inhabited vars1
attribute [instance] inhabited_axiom_vars1
inductive expr where
  | Term : t -> ℤ -> expr
  | Add : expr -> expr -> expr
  | Cst : t -> expr
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
noncomputable def interp : expr -> (ℤ -> ℤ) -> (ℤ -> ℤ) -> ℤ
  | (expr.Term c v), y, z => mpinterp c z * y v
  | (expr.Add e1 e2), y, z => interp e1 y z + interp e2 y z
  | (expr.Cst c), y, z => mpinterp c z
axiom equality : Type
axiom inhabited_axiom_equality : Inhabited equality
attribute [instance] inhabited_axiom_equality
axiom context : Type
axiom inhabited_axiom_context : Inhabited context
attribute [instance] inhabited_axiom_context
noncomputable def valid_eq (eq : expr × expr) := match eq with | (e1, e2) => valid_expr e1 ∧ valid_expr e2
noncomputable def eq_bound (eq : expr × expr) (b : ℤ) := match eq with | (e1, e2) => expr_bound e1 b ∧ expr_bound e2 b
noncomputable def valid_ctx : List (expr × expr) -> Prop
  | ([] : List (expr × expr)) => True
  | (List.cons eq t1) => valid_eq eq ∧ valid_ctx t1
noncomputable def ctx_bound : List (expr × expr) -> ℤ -> Prop
  | ([] : List (expr × expr)), b => True
  | (List.cons eq t1), b => eq_bound eq b ∧ ctx_bound t1 b
noncomputable def interp_eq (g : expr × expr) (y : ℤ -> ℤ) (z : ℤ -> ℤ) := if match g with | (g1, g2) => interp g1 y z = interp g2 y z then true else false
noncomputable def interp_ctx : List (expr × expr) -> expr × expr -> (ℤ -> ℤ) -> (ℤ -> ℤ) -> Bool
  | l, g, y, z => if match l with | ([] : List (expr × expr)) => interp_eq g y z = true | List.cons h t1 => interp_eq h y z = true → interp_ctx t1 g y z = true then true else false
axiom infix_eqeq : array63 t -> array63 t -> Prop
axiom infix_eqeq'spec (a : array63 t) (b : array63 t) (fact0 : infix_eqeq a b) : array63_length a = array63_length b ∧ (∀(i : ℤ), ¬((0 : ℤ) ≤ i ∧ i < BitVec.toInt (array63_length a)))
axiom max_var : expr -> ℤ
axiom max_var'def (e : expr) (fact0 : valid_expr e) : match e with | expr.Term _ i => max_var e = i | expr.Cst _ => max_var e = (0 : ℤ) | expr.Add e1 e2 => max_var e = max (max_var e1) (max_var e2)
axiom max_var'spec'0 (e : expr) (fact0 : valid_expr e) : (0 : ℤ) ≤ max_var e
axiom max_var'spec (e : expr) (fact0 : valid_expr e) : expr_bound e (max_var e)
axiom max_var_e : expr × expr -> ℤ
axiom max_var_e'def (e : expr × expr) (fact0 : valid_eq e) : match e with | (e1, e2) => max_var_e e = max (max_var e1) (max_var e2)
axiom max_var_e'spec'0 (e : expr × expr) (fact0 : valid_eq e) : (0 : ℤ) ≤ max_var_e e
axiom max_var_e'spec (e : expr × expr) (fact0 : valid_eq e) : eq_bound e (max_var_e e)
axiom max_var_ctx : List (expr × expr) -> ℤ
axiom max_var_ctx'def (l : List (expr × expr)) (fact0 : valid_ctx l) : match l with | ([] : List (expr × expr)) => max_var_ctx l = (0 : ℤ) | List.cons e t1 => max_var_ctx l = max (max_var_e e) (max_var_ctx t1)
axiom max_var_ctx'spec'0 (l : List (expr × expr)) (fact0 : valid_ctx l) : (0 : ℤ) ≤ max_var_ctx l
axiom max_var_ctx'spec (l : List (expr × expr)) (fact0 : valid_ctx l) : ctx_bound l (max_var_ctx l)
noncomputable def atom (e : expr) := match e with | expr.Add _ _ => False | _ => True
axiom to_list :  {α : Type} -> [Inhabited α] -> array63 α -> BitVec 63 -> BitVec 63 -> List α
mutual
inductive expr' where
  | Sum : expr' -> expr' -> expr'
  | ProdL : expr' -> cprod -> expr'
  | ProdR : cprod -> expr' -> expr'
  | Diff : expr' -> expr' -> expr'
  | Var : ℤ -> expr'
  | Coeff : t -> expr'
inductive cprod where
  | C : t -> cprod
  | Times : cprod -> cprod -> cprod
end
axiom inhabited_axiom_expr' : Inhabited expr'
attribute [instance] inhabited_axiom_expr'
axiom inhabited_axiom_cprod : Inhabited cprod
attribute [instance] inhabited_axiom_cprod
noncomputable def interp_c : cprod -> (ℤ -> ℤ) -> (ℤ -> ℤ) -> ℤ
  | (cprod.C c), y, z => mpinterp c z
  | (cprod.Times e1 e2), y, z => interp_c e1 y z * interp_c e2 y z
noncomputable def interp' : expr' -> (ℤ -> ℤ) -> (ℤ -> ℤ) -> ℤ
  | (expr'.Sum e1 e2), y, z => interp' e1 y z + interp' e2 y z
  | (expr'.ProdL e1 c), y, z => interp' e1 y z * interp_c c y z
  | (expr'.ProdR c e1), y, z => interp_c c y z * interp' e1 y z
  | (expr'.Diff e1 e2), y, z => interp' e1 y z - interp' e2 y z
  | (expr'.Var n), y, z => y n
  | (expr'.Coeff c), y, z => mpinterp c z
axiom equality' : Type
axiom inhabited_axiom_equality' : Inhabited equality'
attribute [instance] inhabited_axiom_equality'
axiom context' : Type
axiom inhabited_axiom_context' : Inhabited context'
attribute [instance] inhabited_axiom_context'
noncomputable def interp_eq' (g : expr' × expr') (y : ℤ -> ℤ) (z : ℤ -> ℤ) := if match g with | (g1, g2) => interp' g1 y z = interp' g2 y z then true else false
noncomputable def interp_ctx' : List (expr' × expr') -> expr' × expr' -> (ℤ -> ℤ) -> (ℤ -> ℤ) -> Bool
  | l, g, y, z => if match l with | ([] : List (expr' × expr')) => interp_eq' g y z = true | List.cons h t1 => interp_eq' h y z = true → interp_ctx' t1 g y z = true then true else false
noncomputable def valid_expr' : expr' -> Prop
  | (expr'.Var i) => (0 : ℤ) ≤ i
  | (expr'.Sum e1 e2) => valid_expr' e1 ∧ valid_expr' e2
  | (expr'.Diff e1 e2) => valid_expr' e1 ∧ valid_expr' e2
  | (expr'.Coeff x) => True
  | (expr'.ProdL e1 x) => valid_expr' e1
  | (expr'.ProdR x e1) => valid_expr' e1
noncomputable def valid_eq' (eq : expr' × expr') := match eq with | (e1, e2) => valid_expr' e1 ∧ valid_expr' e2
noncomputable def valid_ctx' : List (expr' × expr') -> Prop
  | ([] : List (expr' × expr')) => True
  | (List.cons eq t1) => valid_eq' eq ∧ valid_ctx' t1
noncomputable def pos_exp (t1 : t) (y : ℤ -> ℤ) := match t1 with | t.E e => (0 : ℤ) ≤ MP64Coeffs.interp_exp e y | t.I _ => True | t.R => True
noncomputable def pos_cprod : cprod -> (ℤ -> ℤ) -> Prop
  | (cprod.C c), y => pos_exp c y
  | (cprod.Times c1 c2), y => pos_cprod c1 y ∧ pos_cprod c2 y
noncomputable def pos_expr' : expr' -> (ℤ -> ℤ) -> Prop
  | (expr'.Coeff c), y => pos_exp c y
  | (expr'.Var x), y => True
  | (expr'.Sum e1 e2), y => pos_expr' e1 y ∧ pos_expr' e2 y
  | (expr'.Diff e1 e2), y => pos_expr' e1 y ∧ pos_expr' e2 y
  | (expr'.ProdL e1 c), y => pos_expr' e1 y ∧ pos_cprod c y
  | (expr'.ProdR c e1), y => pos_expr' e1 y ∧ pos_cprod c y
noncomputable def pos_eq' (eq : expr' × expr') (y : ℤ -> ℤ) := match eq with | (e1, e2) => pos_expr' e1 y ∧ pos_expr' e2 y
noncomputable def pos_ctx' : List (expr' × expr') -> (ℤ -> ℤ) -> Prop
  | ([] : List (expr' × expr')), y => True
  | (List.cons h t1), y => pos_eq' h y ∧ pos_ctx' t1 y
noncomputable def m (t1 : t) := match t1 with | t.I n => ((n, (1 : ℤ)), MP64Coeffs.exp.Lit (0 : ℤ)) | t.E e => (((1 : ℤ), (1 : ℤ)), e) | t.R => (((1 : ℤ), (1 : ℤ)), MP64Coeffs.exp.Lit (1 : ℤ))
axiom m'spec (t1 : t) (y : ℤ -> ℤ) (fact0 : pos_exp t1 y) : MP64Coeffs.minterp (m t1) y = Int.to_Real (mpinterp t1 y)
axiom m_y : (ℤ -> ℤ) -> ℤ -> ℝ
axiom m_y'def (y : ℤ -> ℤ) (i : ℤ) : m_y y i = Int.to_Real (y i)
axiom m_y'spec (y : ℤ -> ℤ) (i : ℤ) : m_y y i = Int.to_Real (y i)
noncomputable def m_cprod : cprod -> LinearDecisionRationalMP.cprod
  | (cprod.C c) => LinearDecisionRationalMP.cprod.C (m c)
  | (cprod.Times c1 c2) => LinearDecisionRationalMP.cprod.Times (m_cprod c1) (m_cprod c2)
axiom m_cprod'spec (e : cprod) (z : ℤ -> ℤ) (y : ℤ -> ℤ) (fact0 : pos_cprod e z) : LinearDecisionRationalMP.interp_c (m_cprod e) (m_y y) z = Int.to_Real (interp_c e y z)
noncomputable def m_expr : expr' -> LinearDecisionRationalMP.expr'
  | (expr'.Var i) => LinearDecisionRationalMP.expr'.Var i
  | (expr'.Coeff c) => LinearDecisionRationalMP.expr'.Coeff (m c)
  | (expr'.Sum e1 e2) => LinearDecisionRationalMP.expr'.Sum (m_expr e1) (m_expr e2)
  | (expr'.Diff e1 e2) => LinearDecisionRationalMP.expr'.Diff (m_expr e1) (m_expr e2)
  | (expr'.ProdL e1 c) => LinearDecisionRationalMP.expr'.ProdL (m_expr e1) (m_cprod c)
  | (expr'.ProdR c e1) => LinearDecisionRationalMP.expr'.ProdR (m_cprod c) (m_expr e1)
axiom m_expr'spec'0 (e : expr') (z : ℤ -> ℤ) (y : ℤ -> ℤ) (fact0 : pos_expr' e z) : LinearDecisionRationalMP.interp' (m_expr e) (m_y y) z = Int.to_Real (interp' e y z)
axiom m_expr'spec (e : expr') (fact0 : valid_expr' e) : LinearDecisionRationalMP.valid_expr' (m_expr e)
noncomputable def m_eq (eq : expr' × expr') := match eq with | (e1, e2) => (m_expr e1, m_expr e2)
axiom m_eq'spec'0 (eq : expr' × expr') (z : ℤ -> ℤ) (y : ℤ -> ℤ) (fact0 : pos_eq' eq z) : (LinearDecisionRationalMP.interp_eq' (m_eq eq) (m_y y) z = true) = (interp_eq' eq y z = true)
axiom m_eq'spec (eq : expr' × expr') (fact0 : valid_eq' eq) : LinearDecisionRationalMP.valid_eq' (m_eq eq)
noncomputable def m_ctx : List (expr' × expr') -> List (LinearDecisionRationalMP.expr' × LinearDecisionRationalMP.expr')
  | ([] : List (expr' × expr')) => ([] : List (LinearDecisionRationalMP.expr' × LinearDecisionRationalMP.expr'))
  | (List.cons h t1) => List.cons (m_eq h) (m_ctx t1)
axiom m_ctx'spec'1 (ctx : List (expr' × expr')) (z : ℤ -> ℤ) (g : expr' × expr') (y : ℤ -> ℤ) (fact0 : pos_ctx' ctx z) (fact1 : pos_eq' g z) : (LinearDecisionRationalMP.interp_ctx' (m_ctx ctx) (m_eq g) (m_y y) z = true) = (interp_ctx' ctx g y z = true)
axiom m_ctx'spec'0 (ctx : List (expr' × expr')) : List.length (m_ctx ctx) = List.length ctx
axiom m_ctx'spec (ctx : List (expr' × expr')) (fact0 : valid_ctx' ctx) : LinearDecisionRationalMP.valid_ctx' (m_ctx ctx)
end LinearDecisionIntMP
namespace lineardecision_EqPropMP_prop_ctxqtvc
noncomputable def expr_bound' : LinearDecisionIntMP.expr' -> ℤ -> Prop
  | (LinearDecisionIntMP.expr'.Sum e1 e2), b => expr_bound' e1 b ∧ expr_bound' e2 b
  | (LinearDecisionIntMP.expr'.Diff e1 e2), b => expr_bound' e1 b ∧ expr_bound' e2 b
  | (LinearDecisionIntMP.expr'.ProdL e1 x), b => expr_bound' e1 b
  | (LinearDecisionIntMP.expr'.ProdR x e1), b => expr_bound' e1 b
  | (LinearDecisionIntMP.expr'.Var n), b => (0 : ℤ) ≤ n ∧ n ≤ b
  | (LinearDecisionIntMP.expr'.Coeff x), b => True
noncomputable def eq_bound' (eq : LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr') (b : ℤ) := match eq with | (e1, e2) => expr_bound' e1 b ∧ expr_bound' e2 b
noncomputable def ctx_bound' : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr') -> ℤ -> Prop
  | ([] : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')), b => True
  | (List.cons eq t), b => eq_bound' eq b ∧ ctx_bound' t b
axiom max_var' : LinearDecisionIntMP.expr' -> ℤ
axiom max_var''def (e : LinearDecisionIntMP.expr') (fact0 : LinearDecisionIntMP.valid_expr' e) : match e with | LinearDecisionIntMP.expr'.Var i => max_var' e = i | LinearDecisionIntMP.expr'.Coeff _ => max_var' e = (0 : ℤ) | LinearDecisionIntMP.expr'.Sum e1 e2 => max_var' e = max (max_var' e1) (max_var' e2) | LinearDecisionIntMP.expr'.Diff e1 e2 => max_var' e = max (max_var' e1) (max_var' e2) | LinearDecisionIntMP.expr'.ProdL e1 _ => max_var' e = max_var' e1 | LinearDecisionIntMP.expr'.ProdR _ e1 => max_var' e = max_var' e1
axiom max_var''spec'0 (e : LinearDecisionIntMP.expr') (fact0 : LinearDecisionIntMP.valid_expr' e) : (0 : ℤ) ≤ max_var' e
axiom max_var''spec (e : LinearDecisionIntMP.expr') (fact0 : LinearDecisionIntMP.valid_expr' e) : expr_bound' e (max_var' e)
axiom max_var_e' : LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr' -> ℤ
axiom max_var_e''def (e : LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr') (fact0 : LinearDecisionIntMP.valid_eq' e) : match e with | (e1, e2) => max_var_e' e = max (max_var' e1) (max_var' e2)
axiom max_var_e''spec'0 (e : LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr') (fact0 : LinearDecisionIntMP.valid_eq' e) : (0 : ℤ) ≤ max_var_e' e
axiom max_var_e''spec (e : LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr') (fact0 : LinearDecisionIntMP.valid_eq' e) : eq_bound' e (max_var_e' e)
axiom max_var_ctx' : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr') -> ℤ
axiom max_var_ctx''def (l : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')) (fact0 : LinearDecisionIntMP.valid_ctx' l) : match l with | ([] : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')) => max_var_ctx' l = (0 : ℤ) | List.cons e t => max_var_ctx' l = max (max_var_e' e) (max_var_ctx' t)
axiom max_var_ctx''spec'0 (l : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')) (fact0 : LinearDecisionIntMP.valid_ctx' l) : (0 : ℤ) ≤ max_var_ctx' l
axiom max_var_ctx''spec (l : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')) (fact0 : LinearDecisionIntMP.valid_ctx' l) : ctx_bound' l (max_var_ctx' l)
noncomputable def ctx_impl_ctx' : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr') -> List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr') -> Prop
  | c1, ([] : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')) => True
  | c1, (List.cons eq t) => ctx_impl_ctx' c1 t ∧ (∀(y : ℤ -> ℤ) (z : ℤ -> ℤ), y = z → LinearDecisionIntMP.interp_ctx' c1 eq y z = true)
noncomputable def ctx_holds' : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr') -> (ℤ -> ℤ) -> (ℤ -> ℤ) -> Prop
  | ([] : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')), y, z => True
  | (List.cons h t), y, z => LinearDecisionIntMP.interp_eq' h y z = true ∧ ctx_holds' t y z
noncomputable def is_eq_tbl (a : List (Option MP64Coeffs.exp)) (l : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) → (match a[Int.toNat i]! with | Option.none => True | Option.some e => (∀(y : ℤ -> ℤ) (z : ℤ -> ℤ), y = z → ctx_holds' l y z → MP64Coeffs.interp_exp (MP64Coeffs.exp.Var i) z = MP64Coeffs.interp_exp e z))
axiom fc :  {α : Type} -> [Inhabited α] -> List α -> α -> ℤ -> Bool
axiom fc'def {α : Type} [Inhabited α] (a : List α) (v : α) (i : ℤ) : (fc a v i = true) = (a[Int.toNat i]! = v)
theorem prop_ctx'vc (g : LinearDecisionIntMP.expr') (g1 : LinearDecisionIntMP.expr') (l : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')) : let g2 : LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr' := (g, g1); LinearDecisionIntMP.valid_ctx' l ∧ LinearDecisionIntMP.valid_eq' g2 → LinearDecisionIntMP.valid_eq' g2 ∧ (let o1 : ℤ := max_var_e' g2; (0 : ℤ) ≤ o1 ∧ eq_bound' g2 o1 → LinearDecisionIntMP.valid_ctx' l ∧ (let o2 : ℤ := max_var_ctx' l; (0 : ℤ) ≤ o2 ∧ ctx_bound' l o2 → (let m : ℤ := max o2 o1; let o3 : ℤ := m + (1 : ℤ); (0 : ℤ) ≤ o3 ∧ (∀(a : List (Option MP64Coeffs.exp)), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < o3 → a[Int.toNat i]! = Option.none) ∧ Int.ofNat (List.length a) = o3 → (∀(e : LinearDecisionIntMP.expr'), (match e with | LinearDecisionIntMP.expr'.Var i => True | LinearDecisionIntMP.expr'.Sum e1 e2 => (match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.expr'.ProdL f _ => f = e2 | LinearDecisionIntMP.expr'.ProdR _ f => f = e2 | LinearDecisionIntMP.expr'.Diff f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) ∧ (∀(o4 : Option MP64Coeffs.exp), (match o4 with | Option.none => True | Option.some ex => (∀(y : ℤ -> ℤ), LinearDecisionIntMP.interp' e2 y y = MP64Coeffs.interp_exp ex y)) → (match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.ProdL f _ => f = e1 | LinearDecisionIntMP.expr'.ProdR _ f => f = e1 | LinearDecisionIntMP.expr'.Diff f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) ∧ (∀(o5 : Option MP64Coeffs.exp), (match o5 with | Option.none => True | Option.some ex => (∀(y : ℤ -> ℤ), LinearDecisionIntMP.interp' e1 y y = MP64Coeffs.interp_exp ex y)) → (match o4 with | Option.some x => (match o5 with | Option.some x1 => True | _ => True) | _ => True))) | LinearDecisionIntMP.expr'.Diff e1 e2 => (match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.expr'.ProdL f _ => f = e2 | LinearDecisionIntMP.expr'.ProdR _ f => f = e2 | LinearDecisionIntMP.expr'.Diff f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) ∧ (∀(o4 : Option MP64Coeffs.exp), (match o4 with | Option.none => True | Option.some ex => (∀(y : ℤ -> ℤ), LinearDecisionIntMP.interp' e2 y y = MP64Coeffs.interp_exp ex y)) → (match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.ProdL f _ => f = e1 | LinearDecisionIntMP.expr'.ProdR _ f => f = e1 | LinearDecisionIntMP.expr'.Diff f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) ∧ (∀(o5 : Option MP64Coeffs.exp), (match o5 with | Option.none => True | Option.some ex => (∀(y : ℤ -> ℤ), LinearDecisionIntMP.interp' e1 y y = MP64Coeffs.interp_exp ex y)) → (match o4 with | Option.some x => (match o5 with | Option.some x1 => True | _ => True) | _ => True))) | LinearDecisionIntMP.expr'.Coeff (LinearDecisionIntMP.t.I n) => True | _ => True) ∧ (∀(result : Option MP64Coeffs.exp), (match e with | LinearDecisionIntMP.expr'.Var i => result = Option.some (MP64Coeffs.exp.Var i) | LinearDecisionIntMP.expr'.Sum e1 e2 => (∃(o4 : Option MP64Coeffs.exp), (match o4 with | Option.none => True | Option.some ex => (∀(y : ℤ -> ℤ), LinearDecisionIntMP.interp' e2 y y = MP64Coeffs.interp_exp ex y)) ∧ (∃(o5 : Option MP64Coeffs.exp), (match o5 with | Option.none => True | Option.some ex => (∀(y : ℤ -> ℤ), LinearDecisionIntMP.interp' e1 y y = MP64Coeffs.interp_exp ex y)) ∧ (match o4 with | Option.some x => (match o5 with | Option.some x1 => result = Option.some (MP64Coeffs.exp.Plus x1 x) | _ => result = Option.none) | _ => result = Option.none))) | LinearDecisionIntMP.expr'.Diff e1 e2 => (∃(o4 : Option MP64Coeffs.exp), (match o4 with | Option.none => True | Option.some ex => (∀(y : ℤ -> ℤ), LinearDecisionIntMP.interp' e2 y y = MP64Coeffs.interp_exp ex y)) ∧ (∃(o5 : Option MP64Coeffs.exp), (match o5 with | Option.none => True | Option.some ex => (∀(y : ℤ -> ℤ), LinearDecisionIntMP.interp' e1 y y = MP64Coeffs.interp_exp ex y)) ∧ (match o4 with | Option.some x => (match o5 with | Option.some x1 => result = Option.some (MP64Coeffs.exp.Sub x1 x) | _ => result = Option.none) | _ => result = Option.none))) | LinearDecisionIntMP.expr'.Coeff (LinearDecisionIntMP.t.I n) => result = Option.some (MP64Coeffs.exp.Lit n) | _ => result = Option.none) → (match result with | Option.none => True | Option.some ex => (∀(y : ℤ -> ℤ), LinearDecisionIntMP.interp' e y y = MP64Coeffs.interp_exp ex y)))) ∧ (∀(a1 : List (Option MP64Coeffs.exp)), List.length a1 = List.length a → (∀(eq : LinearDecisionIntMP.expr') (eq1 : LinearDecisionIntMP.expr'), let eq2 : LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr' := (eq, eq1); eq_bound' eq2 m → (match eq1 with | LinearDecisionIntMP.expr'.Var x => (match eq with | LinearDecisionIntMP.expr'.Var x1 => (∀(r : Option MP64Coeffs.exp), (match r with | Option.none => True | Option.some ex => (∀(y : ℤ -> ℤ), LinearDecisionIntMP.interp' eq1 y y = MP64Coeffs.interp_exp ex y)) → (match r with | Option.none => (∀(l1 : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')), is_eq_tbl a1 l1 → is_eq_tbl a1 (List.cons eq2 l1)) | Option.some ex => (let o4 : Option MP64Coeffs.exp := Option.some ex; ((0 : ℤ) ≤ x1 ∧ x1 < Int.ofNat (List.length a1)) ∧ (List.length (List.set a1 (Int.toNat x1) o4) = List.length a1 → getElem! (List.set a1 (Int.toNat x1) o4) ∘ Int.toNat = Function.update (getElem! a1 ∘ Int.toNat) x1 o4 → (∀(l1 : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')), is_eq_tbl a1 l1 → is_eq_tbl (List.set a1 (Int.toNat x1) o4) (List.cons eq2 l1)))))) | _ => (∀(r : Option MP64Coeffs.exp), (match r with | Option.none => True | Option.some ex => (∀(y : ℤ -> ℤ), LinearDecisionIntMP.interp' eq y y = MP64Coeffs.interp_exp ex y)) → (match r with | Option.none => (∀(l1 : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')), is_eq_tbl a1 l1 → is_eq_tbl a1 (List.cons eq2 l1)) | Option.some ex => (let o4 : Option MP64Coeffs.exp := Option.some ex; ((0 : ℤ) ≤ x ∧ x < Int.ofNat (List.length a1)) ∧ (List.length (List.set a1 (Int.toNat x) o4) = List.length a1 → getElem! (List.set a1 (Int.toNat x) o4) ∘ Int.toNat = Function.update (getElem! a1 ∘ Int.toNat) x o4 → (∀(l1 : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')), is_eq_tbl a1 l1 → is_eq_tbl (List.set a1 (Int.toNat x) o4) (List.cons eq2 l1))))))) | _ => (match eq with | LinearDecisionIntMP.expr'.Var x => (∀(r : Option MP64Coeffs.exp), (match r with | Option.none => True | Option.some ex => (∀(y : ℤ -> ℤ), LinearDecisionIntMP.interp' eq1 y y = MP64Coeffs.interp_exp ex y)) → (match r with | Option.none => (∀(l1 : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')), is_eq_tbl a1 l1 → is_eq_tbl a1 (List.cons eq2 l1)) | Option.some ex => (let o4 : Option MP64Coeffs.exp := Option.some ex; ((0 : ℤ) ≤ x ∧ x < Int.ofNat (List.length a1)) ∧ (List.length (List.set a1 (Int.toNat x) o4) = List.length a1 → getElem! (List.set a1 (Int.toNat x) o4) ∘ Int.toNat = Function.update (getElem! a1 ∘ Int.toNat) x o4 → (∀(l1 : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')), is_eq_tbl a1 l1 → is_eq_tbl (List.set a1 (Int.toNat x) o4) (List.cons eq2 l1)))))) | _ => (∀(l1 : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')), is_eq_tbl a1 l1 → is_eq_tbl a1 (List.cons eq2 l1)))))) ∧ (∀(a1 : List (Option MP64Coeffs.exp)), List.length a1 = List.length a → (∀(l1 : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')), is_eq_tbl a1 ([] : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')) ∧ ctx_bound' l1 m → (match l1 with | ([] : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')) => is_eq_tbl a1 l1 | List.cons eq l2 => ((match l1 with | ([] : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')) => False | List.cons _ f => f = l2) ∧ is_eq_tbl a1 ([] : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')) ∧ ctx_bound' l2 m) ∧ (∀(a2 : List (Option MP64Coeffs.exp)), List.length a2 = List.length a1 → is_eq_tbl a2 l2 → eq_bound' eq m ∧ (∀(a3 : List (Option MP64Coeffs.exp)), List.length a3 = List.length a2 → (∀(l3 : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')), is_eq_tbl a2 l3 → is_eq_tbl a3 (List.cons eq l3)) → is_eq_tbl a3 l1))))) ∧ (is_eq_tbl a ([] : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')) ∧ ctx_bound' l m) ∧ (∀(a1 : List (Option MP64Coeffs.exp)), List.length a1 = List.length a → is_eq_tbl a1 l → (let o4 : ℤ := m + (1 : ℤ); (0 : ℤ) ≤ o4 ∧ (∀(seen : List Bool), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < o4 → seen[Int.toNat i]! = false) ∧ Int.ofNat (List.length seen) = o4 → (∀(seen1 : List Bool) (a2 : List (Option MP64Coeffs.exp)), List.length seen1 = List.length seen → List.length a2 = List.length a1 → (∀(i : ℤ), is_eq_tbl a2 l ∧ seen1[Int.toNat i]! = false → (∀(seen2 : List Bool) (a3 : List (Option MP64Coeffs.exp)), List.length seen2 = List.length seen1 → List.length a3 = List.length a2 → (∀(e : MP64Coeffs.exp), is_eq_tbl a3 l ∧ List.count false (List.drop (0 : ℕ) (List.take (Int.toNat (m + (1 : ℤ)) - (0 : ℕ)) seen2)) < List.count false (List.drop (0 : ℕ) (List.take (Int.toNat (m + (1 : ℤ)) - (0 : ℕ)) seen1)) → (match e with | MP64Coeffs.exp.Lit _ => is_eq_tbl a3 l | MP64Coeffs.exp.Var j => (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length seen2) → (if ¬seen2[Int.toNat j]! = true then (((0 : ℤ) ≤ Int.ofNat (List.count false (List.drop (0 : ℕ) (List.take (Int.toNat (m + (1 : ℤ)) - (0 : ℕ)) seen1))) ∧ List.count false (List.drop (0 : ℕ) (List.take (Int.toNat (m + (1 : ℤ)) - (0 : ℕ)) seen2)) < List.count false (List.drop (0 : ℕ) (List.take (Int.toNat (m + (1 : ℤ)) - (0 : ℕ)) seen1))) ∧ is_eq_tbl a3 l ∧ seen2[Int.toNat j]! = false) ∧ (∀(seen3 : List Bool) (a4 : List (Option MP64Coeffs.exp)), List.length seen3 = List.length seen2 → List.length a4 = List.length a3 → is_eq_tbl a4 l ∧ seen3[Int.toNat j]! = true ∧ (∀(j1 : ℤ), seen2[Int.toNat j1]! = true → seen3[Int.toNat j1]! = true) → (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a4) → (∀(result : MP64Coeffs.exp), (match a4[Int.toNat j]! with | Option.none => result = e | Option.some e' => result = e') → is_eq_tbl a4 l ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e y = MP64Coeffs.interp_exp result y) ∧ (∀(j1 : ℤ), seen2[Int.toNat j1]! = true → seen3[Int.toNat j1]! = true))) else (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length a3) → (∀(result : MP64Coeffs.exp), (match a3[Int.toNat j]! with | Option.none => result = e | Option.some e' => result = e') → is_eq_tbl a3 l ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e y = MP64Coeffs.interp_exp result y))) | MP64Coeffs.exp.Plus e1 e2 => ((match e with | MP64Coeffs.exp.Lit _ => False | MP64Coeffs.exp.Var _ => False | MP64Coeffs.exp.Plus f f1 => f = e2 ∨ f1 = e2 | MP64Coeffs.exp.Minus f => f = e2 | MP64Coeffs.exp.Sub f f1 => f = e2 ∨ f1 = e2) ∧ is_eq_tbl a3 l ∧ List.count false (List.drop (0 : ℕ) (List.take (Int.toNat (m + (1 : ℤ)) - (0 : ℕ)) seen2)) < List.count false (List.drop (0 : ℕ) (List.take (Int.toNat (m + (1 : ℤ)) - (0 : ℕ)) seen1))) ∧ (∀(seen3 : List Bool) (a4 : List (Option MP64Coeffs.exp)), List.length seen3 = List.length seen2 → List.length a4 = List.length a3 → (∀(o5 : MP64Coeffs.exp), is_eq_tbl a4 l ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e2 y = MP64Coeffs.interp_exp o5 y) ∧ (∀(j : ℤ), seen2[Int.toNat j]! = true → seen3[Int.toNat j]! = true) → ((match e with | MP64Coeffs.exp.Lit _ => False | MP64Coeffs.exp.Var _ => False | MP64Coeffs.exp.Plus f f1 => f = e1 ∨ f1 = e1 | MP64Coeffs.exp.Minus f => f = e1 | MP64Coeffs.exp.Sub f f1 => f = e1 ∨ f1 = e1) ∧ is_eq_tbl a4 l ∧ List.count false (List.drop (0 : ℕ) (List.take (Int.toNat (m + (1 : ℤ)) - (0 : ℕ)) seen3)) < List.count false (List.drop (0 : ℕ) (List.take (Int.toNat (m + (1 : ℤ)) - (0 : ℕ)) seen1))) ∧ (∀(seen4 : List Bool) (a5 : List (Option MP64Coeffs.exp)), List.length seen4 = List.length seen3 → List.length a5 = List.length a4 → (∀(o6 : MP64Coeffs.exp), is_eq_tbl a5 l ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e1 y = MP64Coeffs.interp_exp o6 y) ∧ (∀(j : ℤ), seen3[Int.toNat j]! = true → seen4[Int.toNat j]! = true) → is_eq_tbl a5 l ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e y = MP64Coeffs.interp_exp (MP64Coeffs.exp.Plus o6 o5) y) ∧ (∀(j : ℤ), seen2[Int.toNat j]! = true → seen4[Int.toNat j]! = true))))) | MP64Coeffs.exp.Sub e1 e2 => ((match e with | MP64Coeffs.exp.Lit _ => False | MP64Coeffs.exp.Var _ => False | MP64Coeffs.exp.Plus f f1 => f = e2 ∨ f1 = e2 | MP64Coeffs.exp.Minus f => f = e2 | MP64Coeffs.exp.Sub f f1 => f = e2 ∨ f1 = e2) ∧ is_eq_tbl a3 l ∧ List.count false (List.drop (0 : ℕ) (List.take (Int.toNat (m + (1 : ℤ)) - (0 : ℕ)) seen2)) < List.count false (List.drop (0 : ℕ) (List.take (Int.toNat (m + (1 : ℤ)) - (0 : ℕ)) seen1))) ∧ (∀(seen3 : List Bool) (a4 : List (Option MP64Coeffs.exp)), List.length seen3 = List.length seen2 → List.length a4 = List.length a3 → (∀(o5 : MP64Coeffs.exp), is_eq_tbl a4 l ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e2 y = MP64Coeffs.interp_exp o5 y) ∧ (∀(j : ℤ), seen2[Int.toNat j]! = true → seen3[Int.toNat j]! = true) → ((match e with | MP64Coeffs.exp.Lit _ => False | MP64Coeffs.exp.Var _ => False | MP64Coeffs.exp.Plus f f1 => f = e1 ∨ f1 = e1 | MP64Coeffs.exp.Minus f => f = e1 | MP64Coeffs.exp.Sub f f1 => f = e1 ∨ f1 = e1) ∧ is_eq_tbl a4 l ∧ List.count false (List.drop (0 : ℕ) (List.take (Int.toNat (m + (1 : ℤ)) - (0 : ℕ)) seen3)) < List.count false (List.drop (0 : ℕ) (List.take (Int.toNat (m + (1 : ℤ)) - (0 : ℕ)) seen1))) ∧ (∀(seen4 : List Bool) (a5 : List (Option MP64Coeffs.exp)), List.length seen4 = List.length seen3 → List.length a5 = List.length a4 → (∀(o6 : MP64Coeffs.exp), is_eq_tbl a5 l ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e1 y = MP64Coeffs.interp_exp o6 y) ∧ (∀(j : ℤ), seen3[Int.toNat j]! = true → seen4[Int.toNat j]! = true) → is_eq_tbl a5 l ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e y = MP64Coeffs.interp_exp (MP64Coeffs.exp.Sub o6 o5) y) ∧ (∀(j : ℤ), seen2[Int.toNat j]! = true → seen4[Int.toNat j]! = true))))) | MP64Coeffs.exp.Minus e1 => ((match e with | MP64Coeffs.exp.Lit _ => False | MP64Coeffs.exp.Var _ => False | MP64Coeffs.exp.Plus f f1 => f = e1 ∨ f1 = e1 | MP64Coeffs.exp.Minus f => f = e1 | MP64Coeffs.exp.Sub f f1 => f = e1 ∨ f1 = e1) ∧ is_eq_tbl a3 l ∧ List.count false (List.drop (0 : ℕ) (List.take (Int.toNat (m + (1 : ℤ)) - (0 : ℕ)) seen2)) < List.count false (List.drop (0 : ℕ) (List.take (Int.toNat (m + (1 : ℤ)) - (0 : ℕ)) seen1))) ∧ (∀(seen3 : List Bool) (a4 : List (Option MP64Coeffs.exp)), List.length seen3 = List.length seen2 → List.length a4 = List.length a3 → (∀(o5 : MP64Coeffs.exp), is_eq_tbl a4 l ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e1 y = MP64Coeffs.interp_exp o5 y) ∧ (∀(j : ℤ), seen2[Int.toNat j]! = true → seen3[Int.toNat j]! = true) → is_eq_tbl a4 l ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e y = MP64Coeffs.interp_exp (MP64Coeffs.exp.Minus o5) y) ∧ (∀(j : ℤ), seen2[Int.toNat j]! = true → seen3[Int.toNat j]! = true)))))) ∧ (List.length (List.set seen1 (Int.toNat i) true) = List.length seen1 → (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length (List.set seen1 (Int.toNat i) true)) → ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a2)) ∧ (match a2[Int.toNat i]! with | Option.none => is_eq_tbl a2 l ∧ (List.set seen1 (Int.toNat i) true)[Int.toNat i]! = true ∧ (∀(j : ℤ), seen1[Int.toNat j]! = true → (List.set seen1 (Int.toNat i) true)[Int.toNat j]! = true) | Option.some e => (is_eq_tbl a2 l ∧ List.count false (List.drop (0 : ℕ) (List.take (Int.toNat (m + (1 : ℤ)) - (0 : ℕ)) (List.set seen1 (Int.toNat i) true))) < List.count false (List.drop (0 : ℕ) (List.take (Int.toNat (m + (1 : ℤ)) - (0 : ℕ)) seen1))) ∧ (∀(seen2 : List Bool) (a3 : List (Option MP64Coeffs.exp)), List.length seen2 = List.length (List.set seen1 (Int.toNat i) true) → List.length a3 = List.length a2 → (∀(o5 : MP64Coeffs.exp), is_eq_tbl a3 l ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e y = MP64Coeffs.interp_exp o5 y) ∧ (∀(j : ℤ), (List.set seen1 (Int.toNat i) true)[Int.toNat j]! = true → seen2[Int.toNat j]! = true) → (let o6 : Option MP64Coeffs.exp := Option.some o5; ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a3)) ∧ (List.length (List.set a3 (Int.toNat i) o6) = List.length a3 → getElem! (List.set a3 (Int.toNat i) o6) ∘ Int.toNat = Function.update (getElem! a3 ∘ Int.toNat) i o6 → is_eq_tbl (List.set a3 (Int.toNat i) o6) l ∧ seen2[Int.toNat i]! = true ∧ (∀(j : ℤ), seen1[Int.toNat j]! = true → seen2[Int.toNat j]! = true))))))))) ∧ ((0 : ℤ) ≤ m + (1 : ℤ) → is_eq_tbl a1 l ∧ (∀(seen1 : List Bool) (a2 : List (Option MP64Coeffs.exp)), List.length seen1 = List.length seen → List.length a2 = List.length a1 → (∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ m) ∧ is_eq_tbl a2 l → ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length seen1)) ∧ (if ¬seen1[Int.toNat i]! = true then (is_eq_tbl a2 l ∧ seen1[Int.toNat i]! = false) ∧ (∀(seen2 : List Bool) (a3 : List (Option MP64Coeffs.exp)), List.length seen2 = List.length seen1 → List.length a3 = List.length a2 → is_eq_tbl a3 l ∧ seen2[Int.toNat i]! = true ∧ (∀(j : ℤ), seen1[Int.toNat j]! = true → seen2[Int.toNat j]! = true) → is_eq_tbl a3 l) else is_eq_tbl a2 l)) ∧ (is_eq_tbl a2 l → (∀(e : MP64Coeffs.exp), match e with | MP64Coeffs.exp.Lit _ => True | MP64Coeffs.exp.Var i => (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a2) → (∀(result : MP64Coeffs.exp), (match a2[Int.toNat i]! with | Option.some e' => result = e' | Option.none => result = e) → (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e y = MP64Coeffs.interp_exp result y)) | MP64Coeffs.exp.Plus e1 e2 => (match e with | MP64Coeffs.exp.Lit _ => False | MP64Coeffs.exp.Var _ => False | MP64Coeffs.exp.Plus f f1 => f = e2 ∨ f1 = e2 | MP64Coeffs.exp.Minus f => f = e2 | MP64Coeffs.exp.Sub f f1 => f = e2 ∨ f1 = e2) ∧ (∀(o5 : MP64Coeffs.exp), (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e2 y = MP64Coeffs.interp_exp o5 y) → (match e with | MP64Coeffs.exp.Lit _ => False | MP64Coeffs.exp.Var _ => False | MP64Coeffs.exp.Plus f f1 => f = e1 ∨ f1 = e1 | MP64Coeffs.exp.Minus f => f = e1 | MP64Coeffs.exp.Sub f f1 => f = e1 ∨ f1 = e1) ∧ (∀(o6 : MP64Coeffs.exp), (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e1 y = MP64Coeffs.interp_exp o6 y) → (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e y = MP64Coeffs.interp_exp (MP64Coeffs.exp.Plus o6 o5) y))) | MP64Coeffs.exp.Sub e1 e2 => (match e with | MP64Coeffs.exp.Lit _ => False | MP64Coeffs.exp.Var _ => False | MP64Coeffs.exp.Plus f f1 => f = e2 ∨ f1 = e2 | MP64Coeffs.exp.Minus f => f = e2 | MP64Coeffs.exp.Sub f f1 => f = e2 ∨ f1 = e2) ∧ (∀(o5 : MP64Coeffs.exp), (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e2 y = MP64Coeffs.interp_exp o5 y) → (match e with | MP64Coeffs.exp.Lit _ => False | MP64Coeffs.exp.Var _ => False | MP64Coeffs.exp.Plus f f1 => f = e1 ∨ f1 = e1 | MP64Coeffs.exp.Minus f => f = e1 | MP64Coeffs.exp.Sub f f1 => f = e1 ∨ f1 = e1) ∧ (∀(o6 : MP64Coeffs.exp), (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e1 y = MP64Coeffs.interp_exp o6 y) → (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e y = MP64Coeffs.interp_exp (MP64Coeffs.exp.Sub o6 o5) y))) | MP64Coeffs.exp.Minus e1 => (match e with | MP64Coeffs.exp.Lit _ => False | MP64Coeffs.exp.Var _ => False | MP64Coeffs.exp.Plus f f1 => f = e1 ∨ f1 = e1 | MP64Coeffs.exp.Minus f => f = e1 | MP64Coeffs.exp.Sub f f1 => f = e1 ∨ f1 = e1) ∧ (∀(o5 : MP64Coeffs.exp), (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e1 y = MP64Coeffs.interp_exp o5 y) → (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e y = MP64Coeffs.interp_exp (MP64Coeffs.exp.Minus o5) y))) ∧ (∀(c : LinearDecisionIntMP.t), match c with | LinearDecisionIntMP.t.I _ => (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (LinearDecisionIntMP.expr'.Coeff c, LinearDecisionIntMP.expr'.Coeff c) y y = true) | LinearDecisionIntMP.t.E e => (∀(o5 : MP64Coeffs.exp), (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e y = MP64Coeffs.interp_exp o5 y) → (let result : LinearDecisionIntMP.t := LinearDecisionIntMP.t.E o5; (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (LinearDecisionIntMP.expr'.Coeff c, LinearDecisionIntMP.expr'.Coeff result) y y = true) ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_exp c y → LinearDecisionIntMP.pos_exp result y))) | LinearDecisionIntMP.t.R => (let result : LinearDecisionIntMP.t := LinearDecisionIntMP.t.R; (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (LinearDecisionIntMP.expr'.Coeff c, LinearDecisionIntMP.expr'.Coeff result) y y = true) ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_exp c y → LinearDecisionIntMP.pos_exp result y))) ∧ (∀(c : LinearDecisionIntMP.cprod), match c with | LinearDecisionIntMP.cprod.C c1 => (∀(o5 : LinearDecisionIntMP.t), (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (LinearDecisionIntMP.expr'.Coeff c1, LinearDecisionIntMP.expr'.Coeff o5) y y = true) ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_exp c1 y → LinearDecisionIntMP.pos_exp o5 y) → (let result : LinearDecisionIntMP.cprod := LinearDecisionIntMP.cprod.C o5; (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_c c y y = LinearDecisionIntMP.interp_c result y y) ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_cprod c y → LinearDecisionIntMP.pos_cprod result y))) | LinearDecisionIntMP.cprod.Times c1 c2 => (match c with | LinearDecisionIntMP.cprod.C _ => False | LinearDecisionIntMP.cprod.Times f f1 => f = c2 ∨ f1 = c2) ∧ (∀(o5 : LinearDecisionIntMP.cprod), (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_c c2 y y = LinearDecisionIntMP.interp_c o5 y y) ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_cprod c2 y → LinearDecisionIntMP.pos_cprod o5 y) → (match c with | LinearDecisionIntMP.cprod.C _ => False | LinearDecisionIntMP.cprod.Times f f1 => f = c1 ∨ f1 = c1) ∧ (∀(o6 : LinearDecisionIntMP.cprod), (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_c c1 y y = LinearDecisionIntMP.interp_c o6 y y) ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_cprod c1 y → LinearDecisionIntMP.pos_cprod o6 y) → (let result : LinearDecisionIntMP.cprod := LinearDecisionIntMP.cprod.Times o6 o5; (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_c c y y = LinearDecisionIntMP.interp_c result y y) ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_cprod c y → LinearDecisionIntMP.pos_cprod result y))))) ∧ (∀(e : LinearDecisionIntMP.expr'), expr_bound' e m ∧ LinearDecisionIntMP.valid_expr' e → (match e with | LinearDecisionIntMP.expr'.Var _ => expr_bound' e m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (e, e) y y = true) ∧ LinearDecisionIntMP.valid_expr' e | LinearDecisionIntMP.expr'.ProdL e1 c => (∀(o5 : LinearDecisionIntMP.cprod), (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_c c y y = LinearDecisionIntMP.interp_c o5 y y) ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_cprod c y → LinearDecisionIntMP.pos_cprod o5 y) → ((match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.ProdL f _ => f = e1 | LinearDecisionIntMP.expr'.ProdR _ f => f = e1 | LinearDecisionIntMP.expr'.Diff f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) ∧ expr_bound' e1 m ∧ LinearDecisionIntMP.valid_expr' e1) ∧ (∀(o6 : LinearDecisionIntMP.expr'), expr_bound' o6 m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (e1, o6) y y = true) ∧ LinearDecisionIntMP.valid_expr' o6 ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_expr' e1 y → LinearDecisionIntMP.pos_expr' o6 y) → (let result : LinearDecisionIntMP.expr' := LinearDecisionIntMP.expr'.ProdL o6 o5; expr_bound' result m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (e, result) y y = true) ∧ LinearDecisionIntMP.valid_expr' result ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_expr' e y → LinearDecisionIntMP.pos_expr' result y)))) | LinearDecisionIntMP.expr'.ProdR c e1 => ((match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.ProdL f _ => f = e1 | LinearDecisionIntMP.expr'.ProdR _ f => f = e1 | LinearDecisionIntMP.expr'.Diff f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) ∧ expr_bound' e1 m ∧ LinearDecisionIntMP.valid_expr' e1) ∧ (∀(o5 : LinearDecisionIntMP.expr'), expr_bound' o5 m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (e1, o5) y y = true) ∧ LinearDecisionIntMP.valid_expr' o5 ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_expr' e1 y → LinearDecisionIntMP.pos_expr' o5 y) → (∀(o6 : LinearDecisionIntMP.cprod), (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_c c y y = LinearDecisionIntMP.interp_c o6 y y) ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_cprod c y → LinearDecisionIntMP.pos_cprod o6 y) → (let result : LinearDecisionIntMP.expr' := LinearDecisionIntMP.expr'.ProdR o6 o5; expr_bound' result m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (e, result) y y = true) ∧ LinearDecisionIntMP.valid_expr' result ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_expr' e y → LinearDecisionIntMP.pos_expr' result y)))) | LinearDecisionIntMP.expr'.Sum e1 e2 => ((match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.expr'.ProdL f _ => f = e2 | LinearDecisionIntMP.expr'.ProdR _ f => f = e2 | LinearDecisionIntMP.expr'.Diff f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) ∧ expr_bound' e2 m ∧ LinearDecisionIntMP.valid_expr' e2) ∧ (∀(o5 : LinearDecisionIntMP.expr'), expr_bound' o5 m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (e2, o5) y y = true) ∧ LinearDecisionIntMP.valid_expr' o5 ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_expr' e2 y → LinearDecisionIntMP.pos_expr' o5 y) → ((match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.ProdL f _ => f = e1 | LinearDecisionIntMP.expr'.ProdR _ f => f = e1 | LinearDecisionIntMP.expr'.Diff f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) ∧ expr_bound' e1 m ∧ LinearDecisionIntMP.valid_expr' e1) ∧ (∀(o6 : LinearDecisionIntMP.expr'), expr_bound' o6 m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (e1, o6) y y = true) ∧ LinearDecisionIntMP.valid_expr' o6 ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_expr' e1 y → LinearDecisionIntMP.pos_expr' o6 y) → (let result : LinearDecisionIntMP.expr' := LinearDecisionIntMP.expr'.Sum o6 o5; expr_bound' result m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (e, result) y y = true) ∧ LinearDecisionIntMP.valid_expr' result ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_expr' e y → LinearDecisionIntMP.pos_expr' result y)))) | LinearDecisionIntMP.expr'.Diff e1 e2 => ((match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.expr'.ProdL f _ => f = e2 | LinearDecisionIntMP.expr'.ProdR _ f => f = e2 | LinearDecisionIntMP.expr'.Diff f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) ∧ expr_bound' e2 m ∧ LinearDecisionIntMP.valid_expr' e2) ∧ (∀(o5 : LinearDecisionIntMP.expr'), expr_bound' o5 m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (e2, o5) y y = true) ∧ LinearDecisionIntMP.valid_expr' o5 ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_expr' e2 y → LinearDecisionIntMP.pos_expr' o5 y) → ((match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.ProdL f _ => f = e1 | LinearDecisionIntMP.expr'.ProdR _ f => f = e1 | LinearDecisionIntMP.expr'.Diff f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) ∧ expr_bound' e1 m ∧ LinearDecisionIntMP.valid_expr' e1) ∧ (∀(o6 : LinearDecisionIntMP.expr'), expr_bound' o6 m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (e1, o6) y y = true) ∧ LinearDecisionIntMP.valid_expr' o6 ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_expr' e1 y → LinearDecisionIntMP.pos_expr' o6 y) → (let result : LinearDecisionIntMP.expr' := LinearDecisionIntMP.expr'.Diff o6 o5; expr_bound' result m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (e, result) y y = true) ∧ LinearDecisionIntMP.valid_expr' result ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_expr' e y → LinearDecisionIntMP.pos_expr' result y)))) | LinearDecisionIntMP.expr'.Coeff c => (∀(o5 : LinearDecisionIntMP.t), (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (LinearDecisionIntMP.expr'.Coeff c, LinearDecisionIntMP.expr'.Coeff o5) y y = true) ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_exp c y → LinearDecisionIntMP.pos_exp o5 y) → (let result : LinearDecisionIntMP.expr' := LinearDecisionIntMP.expr'.Coeff o5; expr_bound' result m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (e, result) y y = true) ∧ LinearDecisionIntMP.valid_expr' result ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_expr' e y → LinearDecisionIntMP.pos_expr' result y))))) ∧ (∀(a3 : LinearDecisionIntMP.expr') (b : LinearDecisionIntMP.expr'), let eq : LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr' := (a3, b); eq_bound' eq m ∧ LinearDecisionIntMP.valid_eq' eq → (expr_bound' b m ∧ LinearDecisionIntMP.valid_expr' b) ∧ (∀(o5 : LinearDecisionIntMP.expr'), expr_bound' o5 m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (b, o5) y y = true) ∧ LinearDecisionIntMP.valid_expr' o5 ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_expr' b y → LinearDecisionIntMP.pos_expr' o5 y) → (expr_bound' a3 m ∧ LinearDecisionIntMP.valid_expr' a3) ∧ (∀(o6 : LinearDecisionIntMP.expr'), expr_bound' o6 m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (a3, o6) y y = true) ∧ LinearDecisionIntMP.valid_expr' o6 ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_expr' a3 y → LinearDecisionIntMP.pos_expr' o6 y) → (let result : LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr' := (o6, o5); eq_bound' result m ∧ (∀(y : ℤ -> ℤ), (LinearDecisionIntMP.interp_ctx' l eq y y = true) = (LinearDecisionIntMP.interp_ctx' l result y y = true)) ∧ LinearDecisionIntMP.valid_eq' result ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_eq' eq y → LinearDecisionIntMP.pos_eq' result y))))) ∧ (∀(acc : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')), ctx_bound' acc m ∧ ctx_impl_ctx' l acc ∧ LinearDecisionIntMP.valid_ctx' acc → (match acc with | ([] : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')) => (let result : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr') := ([] : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')); ctx_bound' result m ∧ ctx_impl_ctx' l result ∧ List.length result = List.length acc ∧ LinearDecisionIntMP.valid_ctx' result ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_ctx' acc y → LinearDecisionIntMP.pos_ctx' result y)) | List.cons h t => (eq_bound' h m ∧ LinearDecisionIntMP.valid_eq' h) ∧ (∀(h' : LinearDecisionIntMP.expr') (h'1 : LinearDecisionIntMP.expr'), let h'2 : LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr' := (h', h'1); eq_bound' h'2 m ∧ (∀(y : ℤ -> ℤ), (LinearDecisionIntMP.interp_ctx' l h y y = true) = (LinearDecisionIntMP.interp_ctx' l h'2 y y = true)) ∧ LinearDecisionIntMP.valid_eq' h'2 ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_eq' h y → LinearDecisionIntMP.pos_eq' h'2 y) → ((match acc with | ([] : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')) => False | List.cons _ f => f = t) ∧ ctx_bound' t m ∧ ctx_impl_ctx' l t ∧ LinearDecisionIntMP.valid_ctx' t) ∧ (∀(t' : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')), ctx_bound' t' m ∧ ctx_impl_ctx' l t' ∧ List.length t' = List.length t ∧ LinearDecisionIntMP.valid_ctx' t' ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_ctx' t y → LinearDecisionIntMP.pos_ctx' t' y) → (let result : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr') := List.cons h'2 t'; ctx_bound' result m ∧ ctx_impl_ctx' l result ∧ List.length result = List.length acc ∧ LinearDecisionIntMP.valid_ctx' result ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_ctx' acc y → LinearDecisionIntMP.pos_ctx' result y)))))) ∧ (eq_bound' g2 m ∧ LinearDecisionIntMP.valid_eq' g2) ∧ (∀(o5 : LinearDecisionIntMP.expr') (o6 : LinearDecisionIntMP.expr'), let o7 : LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr' := (o5, o6); eq_bound' o7 m ∧ (∀(y : ℤ -> ℤ), (LinearDecisionIntMP.interp_ctx' l g2 y y = true) = (LinearDecisionIntMP.interp_ctx' l o7 y y = true)) ∧ LinearDecisionIntMP.valid_eq' o7 ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_eq' g2 y → LinearDecisionIntMP.pos_eq' o7 y) → (ctx_bound' l m ∧ ctx_impl_ctx' l l ∧ LinearDecisionIntMP.valid_ctx' l) ∧ (∀(o8 : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')), ctx_bound' o8 m ∧ ctx_impl_ctx' l o8 ∧ List.length o8 = List.length l ∧ LinearDecisionIntMP.valid_ctx' o8 ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_ctx' l y → LinearDecisionIntMP.pos_ctx' o8 y) → List.length o8 = List.length l ∧ (LinearDecisionIntMP.valid_ctx' o8 ∧ LinearDecisionIntMP.valid_eq' o7 ∧ (∀(y : ℤ -> ℤ), LinearDecisionIntMP.interp_ctx' o8 o7 y y = true → LinearDecisionIntMP.interp_ctx' l g2 y y = true)) ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_ctx' l y → LinearDecisionIntMP.pos_eq' g2 y → LinearDecisionIntMP.pos_ctx' o8 y ∧ LinearDecisionIntMP.pos_eq' o7 y)))))) ∧ (m + (1 : ℤ) < (0 : ℤ) → (∀(e : MP64Coeffs.exp), match e with | MP64Coeffs.exp.Lit _ => True | MP64Coeffs.exp.Var i => (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a1) → (∀(result : MP64Coeffs.exp), (match a1[Int.toNat i]! with | Option.some e' => result = e' | Option.none => result = e) → (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e y = MP64Coeffs.interp_exp result y)) | MP64Coeffs.exp.Plus e1 e2 => (match e with | MP64Coeffs.exp.Lit _ => False | MP64Coeffs.exp.Var _ => False | MP64Coeffs.exp.Plus f f1 => f = e2 ∨ f1 = e2 | MP64Coeffs.exp.Minus f => f = e2 | MP64Coeffs.exp.Sub f f1 => f = e2 ∨ f1 = e2) ∧ (∀(o5 : MP64Coeffs.exp), (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e2 y = MP64Coeffs.interp_exp o5 y) → (match e with | MP64Coeffs.exp.Lit _ => False | MP64Coeffs.exp.Var _ => False | MP64Coeffs.exp.Plus f f1 => f = e1 ∨ f1 = e1 | MP64Coeffs.exp.Minus f => f = e1 | MP64Coeffs.exp.Sub f f1 => f = e1 ∨ f1 = e1) ∧ (∀(o6 : MP64Coeffs.exp), (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e1 y = MP64Coeffs.interp_exp o6 y) → (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e y = MP64Coeffs.interp_exp (MP64Coeffs.exp.Plus o6 o5) y))) | MP64Coeffs.exp.Sub e1 e2 => (match e with | MP64Coeffs.exp.Lit _ => False | MP64Coeffs.exp.Var _ => False | MP64Coeffs.exp.Plus f f1 => f = e2 ∨ f1 = e2 | MP64Coeffs.exp.Minus f => f = e2 | MP64Coeffs.exp.Sub f f1 => f = e2 ∨ f1 = e2) ∧ (∀(o5 : MP64Coeffs.exp), (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e2 y = MP64Coeffs.interp_exp o5 y) → (match e with | MP64Coeffs.exp.Lit _ => False | MP64Coeffs.exp.Var _ => False | MP64Coeffs.exp.Plus f f1 => f = e1 ∨ f1 = e1 | MP64Coeffs.exp.Minus f => f = e1 | MP64Coeffs.exp.Sub f f1 => f = e1 ∨ f1 = e1) ∧ (∀(o6 : MP64Coeffs.exp), (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e1 y = MP64Coeffs.interp_exp o6 y) → (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e y = MP64Coeffs.interp_exp (MP64Coeffs.exp.Sub o6 o5) y))) | MP64Coeffs.exp.Minus e1 => (match e with | MP64Coeffs.exp.Lit _ => False | MP64Coeffs.exp.Var _ => False | MP64Coeffs.exp.Plus f f1 => f = e1 ∨ f1 = e1 | MP64Coeffs.exp.Minus f => f = e1 | MP64Coeffs.exp.Sub f f1 => f = e1 ∨ f1 = e1) ∧ (∀(o5 : MP64Coeffs.exp), (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e1 y = MP64Coeffs.interp_exp o5 y) → (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e y = MP64Coeffs.interp_exp (MP64Coeffs.exp.Minus o5) y))) ∧ (∀(c : LinearDecisionIntMP.t), match c with | LinearDecisionIntMP.t.I _ => (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (LinearDecisionIntMP.expr'.Coeff c, LinearDecisionIntMP.expr'.Coeff c) y y = true) | LinearDecisionIntMP.t.E e => (∀(o5 : MP64Coeffs.exp), (∀(y : ℤ -> ℤ), ctx_holds' l y y → MP64Coeffs.interp_exp e y = MP64Coeffs.interp_exp o5 y) → (let result : LinearDecisionIntMP.t := LinearDecisionIntMP.t.E o5; (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (LinearDecisionIntMP.expr'.Coeff c, LinearDecisionIntMP.expr'.Coeff result) y y = true) ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_exp c y → LinearDecisionIntMP.pos_exp result y))) | LinearDecisionIntMP.t.R => (let result : LinearDecisionIntMP.t := LinearDecisionIntMP.t.R; (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (LinearDecisionIntMP.expr'.Coeff c, LinearDecisionIntMP.expr'.Coeff result) y y = true) ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_exp c y → LinearDecisionIntMP.pos_exp result y))) ∧ (∀(c : LinearDecisionIntMP.cprod), match c with | LinearDecisionIntMP.cprod.C c1 => (∀(o5 : LinearDecisionIntMP.t), (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (LinearDecisionIntMP.expr'.Coeff c1, LinearDecisionIntMP.expr'.Coeff o5) y y = true) ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_exp c1 y → LinearDecisionIntMP.pos_exp o5 y) → (let result : LinearDecisionIntMP.cprod := LinearDecisionIntMP.cprod.C o5; (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_c c y y = LinearDecisionIntMP.interp_c result y y) ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_cprod c y → LinearDecisionIntMP.pos_cprod result y))) | LinearDecisionIntMP.cprod.Times c1 c2 => (match c with | LinearDecisionIntMP.cprod.C _ => False | LinearDecisionIntMP.cprod.Times f f1 => f = c2 ∨ f1 = c2) ∧ (∀(o5 : LinearDecisionIntMP.cprod), (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_c c2 y y = LinearDecisionIntMP.interp_c o5 y y) ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_cprod c2 y → LinearDecisionIntMP.pos_cprod o5 y) → (match c with | LinearDecisionIntMP.cprod.C _ => False | LinearDecisionIntMP.cprod.Times f f1 => f = c1 ∨ f1 = c1) ∧ (∀(o6 : LinearDecisionIntMP.cprod), (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_c c1 y y = LinearDecisionIntMP.interp_c o6 y y) ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_cprod c1 y → LinearDecisionIntMP.pos_cprod o6 y) → (let result : LinearDecisionIntMP.cprod := LinearDecisionIntMP.cprod.Times o6 o5; (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_c c y y = LinearDecisionIntMP.interp_c result y y) ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_cprod c y → LinearDecisionIntMP.pos_cprod result y))))) ∧ (∀(e : LinearDecisionIntMP.expr'), expr_bound' e m ∧ LinearDecisionIntMP.valid_expr' e → (match e with | LinearDecisionIntMP.expr'.Var _ => expr_bound' e m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (e, e) y y = true) ∧ LinearDecisionIntMP.valid_expr' e | LinearDecisionIntMP.expr'.ProdL e1 c => (∀(o5 : LinearDecisionIntMP.cprod), (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_c c y y = LinearDecisionIntMP.interp_c o5 y y) ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_cprod c y → LinearDecisionIntMP.pos_cprod o5 y) → ((match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.ProdL f _ => f = e1 | LinearDecisionIntMP.expr'.ProdR _ f => f = e1 | LinearDecisionIntMP.expr'.Diff f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) ∧ expr_bound' e1 m ∧ LinearDecisionIntMP.valid_expr' e1) ∧ (∀(o6 : LinearDecisionIntMP.expr'), expr_bound' o6 m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (e1, o6) y y = true) ∧ LinearDecisionIntMP.valid_expr' o6 ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_expr' e1 y → LinearDecisionIntMP.pos_expr' o6 y) → (let result : LinearDecisionIntMP.expr' := LinearDecisionIntMP.expr'.ProdL o6 o5; expr_bound' result m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (e, result) y y = true) ∧ LinearDecisionIntMP.valid_expr' result ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_expr' e y → LinearDecisionIntMP.pos_expr' result y)))) | LinearDecisionIntMP.expr'.ProdR c e1 => ((match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.ProdL f _ => f = e1 | LinearDecisionIntMP.expr'.ProdR _ f => f = e1 | LinearDecisionIntMP.expr'.Diff f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) ∧ expr_bound' e1 m ∧ LinearDecisionIntMP.valid_expr' e1) ∧ (∀(o5 : LinearDecisionIntMP.expr'), expr_bound' o5 m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (e1, o5) y y = true) ∧ LinearDecisionIntMP.valid_expr' o5 ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_expr' e1 y → LinearDecisionIntMP.pos_expr' o5 y) → (∀(o6 : LinearDecisionIntMP.cprod), (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_c c y y = LinearDecisionIntMP.interp_c o6 y y) ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_cprod c y → LinearDecisionIntMP.pos_cprod o6 y) → (let result : LinearDecisionIntMP.expr' := LinearDecisionIntMP.expr'.ProdR o6 o5; expr_bound' result m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (e, result) y y = true) ∧ LinearDecisionIntMP.valid_expr' result ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_expr' e y → LinearDecisionIntMP.pos_expr' result y)))) | LinearDecisionIntMP.expr'.Sum e1 e2 => ((match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.expr'.ProdL f _ => f = e2 | LinearDecisionIntMP.expr'.ProdR _ f => f = e2 | LinearDecisionIntMP.expr'.Diff f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) ∧ expr_bound' e2 m ∧ LinearDecisionIntMP.valid_expr' e2) ∧ (∀(o5 : LinearDecisionIntMP.expr'), expr_bound' o5 m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (e2, o5) y y = true) ∧ LinearDecisionIntMP.valid_expr' o5 ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_expr' e2 y → LinearDecisionIntMP.pos_expr' o5 y) → ((match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.ProdL f _ => f = e1 | LinearDecisionIntMP.expr'.ProdR _ f => f = e1 | LinearDecisionIntMP.expr'.Diff f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) ∧ expr_bound' e1 m ∧ LinearDecisionIntMP.valid_expr' e1) ∧ (∀(o6 : LinearDecisionIntMP.expr'), expr_bound' o6 m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (e1, o6) y y = true) ∧ LinearDecisionIntMP.valid_expr' o6 ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_expr' e1 y → LinearDecisionIntMP.pos_expr' o6 y) → (let result : LinearDecisionIntMP.expr' := LinearDecisionIntMP.expr'.Sum o6 o5; expr_bound' result m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (e, result) y y = true) ∧ LinearDecisionIntMP.valid_expr' result ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_expr' e y → LinearDecisionIntMP.pos_expr' result y)))) | LinearDecisionIntMP.expr'.Diff e1 e2 => ((match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.expr'.ProdL f _ => f = e2 | LinearDecisionIntMP.expr'.ProdR _ f => f = e2 | LinearDecisionIntMP.expr'.Diff f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) ∧ expr_bound' e2 m ∧ LinearDecisionIntMP.valid_expr' e2) ∧ (∀(o5 : LinearDecisionIntMP.expr'), expr_bound' o5 m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (e2, o5) y y = true) ∧ LinearDecisionIntMP.valid_expr' o5 ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_expr' e2 y → LinearDecisionIntMP.pos_expr' o5 y) → ((match e with | LinearDecisionIntMP.expr'.Sum f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.ProdL f _ => f = e1 | LinearDecisionIntMP.expr'.ProdR _ f => f = e1 | LinearDecisionIntMP.expr'.Diff f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.expr'.Var _ => False | LinearDecisionIntMP.expr'.Coeff _ => False) ∧ expr_bound' e1 m ∧ LinearDecisionIntMP.valid_expr' e1) ∧ (∀(o6 : LinearDecisionIntMP.expr'), expr_bound' o6 m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (e1, o6) y y = true) ∧ LinearDecisionIntMP.valid_expr' o6 ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_expr' e1 y → LinearDecisionIntMP.pos_expr' o6 y) → (let result : LinearDecisionIntMP.expr' := LinearDecisionIntMP.expr'.Diff o6 o5; expr_bound' result m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (e, result) y y = true) ∧ LinearDecisionIntMP.valid_expr' result ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_expr' e y → LinearDecisionIntMP.pos_expr' result y)))) | LinearDecisionIntMP.expr'.Coeff c => (∀(o5 : LinearDecisionIntMP.t), (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (LinearDecisionIntMP.expr'.Coeff c, LinearDecisionIntMP.expr'.Coeff o5) y y = true) ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_exp c y → LinearDecisionIntMP.pos_exp o5 y) → (let result : LinearDecisionIntMP.expr' := LinearDecisionIntMP.expr'.Coeff o5; expr_bound' result m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (e, result) y y = true) ∧ LinearDecisionIntMP.valid_expr' result ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_expr' e y → LinearDecisionIntMP.pos_expr' result y))))) ∧ (∀(a2 : LinearDecisionIntMP.expr') (b : LinearDecisionIntMP.expr'), let eq : LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr' := (a2, b); eq_bound' eq m ∧ LinearDecisionIntMP.valid_eq' eq → (expr_bound' b m ∧ LinearDecisionIntMP.valid_expr' b) ∧ (∀(o5 : LinearDecisionIntMP.expr'), expr_bound' o5 m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (b, o5) y y = true) ∧ LinearDecisionIntMP.valid_expr' o5 ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_expr' b y → LinearDecisionIntMP.pos_expr' o5 y) → (expr_bound' a2 m ∧ LinearDecisionIntMP.valid_expr' a2) ∧ (∀(o6 : LinearDecisionIntMP.expr'), expr_bound' o6 m ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.interp_eq' (a2, o6) y y = true) ∧ LinearDecisionIntMP.valid_expr' o6 ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_expr' a2 y → LinearDecisionIntMP.pos_expr' o6 y) → (let result : LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr' := (o6, o5); eq_bound' result m ∧ (∀(y : ℤ -> ℤ), (LinearDecisionIntMP.interp_ctx' l eq y y = true) = (LinearDecisionIntMP.interp_ctx' l result y y = true)) ∧ LinearDecisionIntMP.valid_eq' result ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_eq' eq y → LinearDecisionIntMP.pos_eq' result y))))) ∧ (∀(acc : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')), ctx_bound' acc m ∧ ctx_impl_ctx' l acc ∧ LinearDecisionIntMP.valid_ctx' acc → (match acc with | ([] : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')) => (let result : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr') := ([] : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')); ctx_bound' result m ∧ ctx_impl_ctx' l result ∧ List.length result = List.length acc ∧ LinearDecisionIntMP.valid_ctx' result ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_ctx' acc y → LinearDecisionIntMP.pos_ctx' result y)) | List.cons h t => (eq_bound' h m ∧ LinearDecisionIntMP.valid_eq' h) ∧ (∀(h' : LinearDecisionIntMP.expr') (h'1 : LinearDecisionIntMP.expr'), let h'2 : LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr' := (h', h'1); eq_bound' h'2 m ∧ (∀(y : ℤ -> ℤ), (LinearDecisionIntMP.interp_ctx' l h y y = true) = (LinearDecisionIntMP.interp_ctx' l h'2 y y = true)) ∧ LinearDecisionIntMP.valid_eq' h'2 ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_eq' h y → LinearDecisionIntMP.pos_eq' h'2 y) → ((match acc with | ([] : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')) => False | List.cons _ f => f = t) ∧ ctx_bound' t m ∧ ctx_impl_ctx' l t ∧ LinearDecisionIntMP.valid_ctx' t) ∧ (∀(t' : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')), ctx_bound' t' m ∧ ctx_impl_ctx' l t' ∧ List.length t' = List.length t ∧ LinearDecisionIntMP.valid_ctx' t' ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_ctx' t y → LinearDecisionIntMP.pos_ctx' t' y) → (let result : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr') := List.cons h'2 t'; ctx_bound' result m ∧ ctx_impl_ctx' l result ∧ List.length result = List.length acc ∧ LinearDecisionIntMP.valid_ctx' result ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_ctx' acc y → LinearDecisionIntMP.pos_ctx' result y)))))) ∧ (eq_bound' g2 m ∧ LinearDecisionIntMP.valid_eq' g2) ∧ (∀(o5 : LinearDecisionIntMP.expr') (o6 : LinearDecisionIntMP.expr'), let o7 : LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr' := (o5, o6); eq_bound' o7 m ∧ (∀(y : ℤ -> ℤ), (LinearDecisionIntMP.interp_ctx' l g2 y y = true) = (LinearDecisionIntMP.interp_ctx' l o7 y y = true)) ∧ LinearDecisionIntMP.valid_eq' o7 ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_eq' g2 y → LinearDecisionIntMP.pos_eq' o7 y) → (ctx_bound' l m ∧ ctx_impl_ctx' l l ∧ LinearDecisionIntMP.valid_ctx' l) ∧ (∀(o8 : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')), ctx_bound' o8 m ∧ ctx_impl_ctx' l o8 ∧ List.length o8 = List.length l ∧ LinearDecisionIntMP.valid_ctx' o8 ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_ctx' l y → LinearDecisionIntMP.pos_ctx' o8 y) → List.length o8 = List.length l ∧ (LinearDecisionIntMP.valid_ctx' o8 ∧ LinearDecisionIntMP.valid_eq' o7 ∧ (∀(y : ℤ -> ℤ), LinearDecisionIntMP.interp_ctx' o8 o7 y y = true → LinearDecisionIntMP.interp_ctx' l g2 y y = true)) ∧ (∀(y : ℤ -> ℤ), ctx_holds' l y y → LinearDecisionIntMP.pos_ctx' l y → LinearDecisionIntMP.pos_eq' g2 y → LinearDecisionIntMP.pos_ctx' o8 y ∧ LinearDecisionIntMP.pos_eq' o7 y)))))))))))
  := sorry
end lineardecision_EqPropMP_prop_ctxqtvc
