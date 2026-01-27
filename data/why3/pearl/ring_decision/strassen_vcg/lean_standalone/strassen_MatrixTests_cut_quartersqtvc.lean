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

namespace int.Sum
axiom sum : (ℤ -> ℤ) -> ℤ -> ℤ -> ℤ
axiom sum'def (b : ℤ) (a : ℤ) (f : ℤ -> ℤ) : if b ≤ a then sum f a b = (0 : ℤ) else sum f a b = sum f a (b - (1 : ℤ)) + f (b - (1 : ℤ))
axiom sum_left (a : ℤ) (b : ℤ) (f : ℤ -> ℤ) (fact0 : a < b) : sum f a b = f a + sum f (a + (1 : ℤ)) b
axiom sum_ext (a : ℤ) (b : ℤ) (f : ℤ -> ℤ) (g : ℤ -> ℤ) (fact0 : ∀(i : ℤ), a ≤ i ∧ i < b → f i = g i) : sum f a b = sum g a b
axiom sum_le (a : ℤ) (b : ℤ) (f : ℤ -> ℤ) (g : ℤ -> ℤ) (fact0 : ∀(i : ℤ), a ≤ i ∧ i < b → f i ≤ g i) : sum f a b ≤ sum g a b
axiom sum_zero (a : ℤ) (b : ℤ) (f : ℤ -> ℤ) (fact0 : ∀(i : ℤ), a ≤ i ∧ i < b → f i = (0 : ℤ)) : sum f a b = (0 : ℤ)
axiom sum_nonneg (a : ℤ) (b : ℤ) (f : ℤ -> ℤ) (fact0 : ∀(i : ℤ), a ≤ i ∧ i < b → (0 : ℤ) ≤ f i) : (0 : ℤ) ≤ sum f a b
axiom sum_decomp (a : ℤ) (b : ℤ) (c : ℤ) (f : ℤ -> ℤ) (fact0 : a ≤ b) (fact1 : b ≤ c) : sum f a c = sum f a b + sum f b c
axiom shift_left (b : ℤ) (a : ℤ) (d : ℤ) (c : ℤ) (f : ℤ -> ℤ) (g : ℤ -> ℤ) (fact0 : b - a = d - c) (fact1 : ∀(i : ℤ), a ≤ i ∧ i < b → f i = g (c + i - a)) : sum f a b = sum g c d
end int.Sum
namespace Sum_extended
axiom addf : (ℤ -> ℤ) -> (ℤ -> ℤ) -> ℤ -> ℤ
axiom addf'def (f : ℤ -> ℤ) (g : ℤ -> ℤ) (x : ℤ) : addf f g x = f x + g x
axiom smulf : (ℤ -> ℤ) -> ℤ -> ℤ -> ℤ
axiom smulf'def (f : ℤ -> ℤ) (l : ℤ) (x : ℤ) : smulf f l x = l * f x
axiom sumf : (ℤ -> ℤ -> ℤ) -> ℤ -> ℤ -> ℤ -> ℤ
axiom sumf'def (f : ℤ -> ℤ -> ℤ) (a : ℤ) (b : ℤ) (x : ℤ) : sumf f a b x = int.Sum.sum (f x) a b
end Sum_extended
namespace MaxFun
axiom maxf : (ℤ -> ℤ) -> ℤ -> ℤ -> ℤ
axiom maxf'def (b : ℤ) (a : ℤ) (f : ℤ -> ℤ) : if b ≤ a then maxf f a b = (0 : ℤ) else maxf f a b = max (maxf f a (b - (1 : ℤ))) (f (b - (1 : ℤ)))
end MaxFun
namespace InfIntMatrix
axiom infix_pl : ℤ -> ℤ -> ℤ
axiom prefix_mn : ℤ -> ℤ
axiom infix_as : ℤ -> ℤ -> ℤ
axiom Assoc (x : ℤ) (y : ℤ) (z : ℤ) : infix_pl (infix_pl x y) z = infix_pl x (infix_pl y z)
axiom Unit_def_l (x : ℤ) : infix_pl (0 : ℤ) x = x
axiom Unit_def_r (x : ℤ) : infix_pl x (0 : ℤ) = x
axiom Inv_def_l (x : ℤ) : infix_pl (prefix_mn x) x = (0 : ℤ)
axiom Inv_def_r (x : ℤ) : infix_pl x (prefix_mn x) = (0 : ℤ)
axiom Comm (x : ℤ) (y : ℤ) : infix_pl x y = infix_pl y x
axiom Assoc1 (x : ℤ) (y : ℤ) (z : ℤ) : infix_as (infix_as x y) z = infix_as x (infix_as y z)
axiom Mul_distr_l (x : ℤ) (y : ℤ) (z : ℤ) : infix_as x (infix_pl y z) = infix_pl (infix_as x y) (infix_as x z)
axiom Mul_distr_r (y : ℤ) (z : ℤ) (x : ℤ) : infix_as (infix_pl y z) x = infix_pl (infix_as y x) (infix_as z x)
axiom Comm1 (x : ℤ) (y : ℤ) : infix_as x y = infix_as y x
axiom one : ℤ
axiom Unitary (x : ℤ) : infix_as one x = x
axiom NonTrivialRing : ¬(0 : ℤ) = one
axiom mat : Type
axiom inhabited_axiom_mat : Inhabited mat
attribute [instance] inhabited_axiom_mat
axiom get : mat -> ℤ -> ℤ -> ℤ
axiom row_zeros : mat -> ℤ -> ℤ
axiom col_zeros : mat -> ℤ -> ℤ
axiom create : (ℤ -> ℤ) -> (ℤ -> ℤ) -> (ℤ -> ℤ -> ℤ) -> mat
axiom create_rowz (i : ℤ) (rz : ℤ -> ℤ) (cz : ℤ -> ℤ) (f : ℤ -> ℤ -> ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ rz i) : row_zeros (create rz cz f) i = rz i
axiom create_colz (j : ℤ) (cz : ℤ -> ℤ) (rz : ℤ -> ℤ) (f : ℤ -> ℤ -> ℤ) (fact0 : (0 : ℤ) ≤ j) (fact1 : (0 : ℤ) ≤ cz j) : col_zeros (create rz cz f) j = cz j
axiom create_get_ib (i : ℤ) (cz : ℤ -> ℤ) (j : ℤ) (rz : ℤ -> ℤ) (f : ℤ -> ℤ -> ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < cz j) (fact2 : (0 : ℤ) ≤ j) (fact3 : j < rz i) : get (create rz cz f) i j = f i j
axiom create_get_oob (i : ℤ) (j : ℤ) (cz : ℤ -> ℤ) (rz : ℤ -> ℤ) (f : ℤ -> ℤ -> ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) (fact2 : cz j ≤ i ∨ rz i ≤ j) : get (create rz cz f) i j = (0 : ℤ)
axiom result : mat -> ℤ -> ℤ -> ℤ -> ℤ
axiom result1 : mat -> ℤ -> ℤ -> ℤ -> ℤ
axiom result2 : mat -> ℤ -> ℤ -> ℤ -> ℤ -> ℤ -> ℤ
axiom result'def (m : mat) (i : ℤ) (j : ℤ) (i1 : ℤ) : result m i j i1 = (if i1 = i then max (j + (1 : ℤ)) (row_zeros m i) else row_zeros m i1)
axiom result'def1 (m : mat) (i : ℤ) (j : ℤ) (j1 : ℤ) : result1 m i j j1 = (if j1 = j then max (i + (1 : ℤ)) (col_zeros m j) else col_zeros m j1)
axiom result'def2 (m : mat) (i : ℤ) (j : ℤ) (v : ℤ) (i1 : ℤ) (j1 : ℤ) : result2 m i j v i1 j1 = (if i1 = i ∧ j1 = j then v else get m i1 j1)
noncomputable def set (m : mat) (i : ℤ) (j : ℤ) (v : ℤ) := if (0 : ℤ) ≤ i ∧ (0 : ℤ) ≤ j then create (result m i j) (result1 m i j) (result2 m i j v) else m
axiom zero : ℤ
axiom infix_pl' : ℤ -> ℤ -> ℤ
axiom prefix_mn' : ℤ -> ℤ
axiom infix_as' : ℤ -> ℤ -> ℤ
axiom Assoc2 (x : ℤ) (y : ℤ) (z : ℤ) : infix_pl' (infix_pl' x y) z = infix_pl' x (infix_pl' y z)
axiom Unit_def_l1 (x : ℤ) : infix_pl' zero x = x
axiom Unit_def_r1 (x : ℤ) : infix_pl' x zero = x
axiom Inv_def_l1 (x : ℤ) : infix_pl' (prefix_mn' x) x = zero
axiom Inv_def_r1 (x : ℤ) : infix_pl' x (prefix_mn' x) = zero
axiom Comm2 (x : ℤ) (y : ℤ) : infix_pl' x y = infix_pl' y x
axiom Assoc3 (x : ℤ) (y : ℤ) (z : ℤ) : infix_as' (infix_as' x y) z = infix_as' x (infix_as' y z)
axiom Mul_distr_l1 (x : ℤ) (y : ℤ) (z : ℤ) : infix_as' x (infix_pl' y z) = infix_pl' (infix_as' x y) (infix_as' x z)
axiom Mul_distr_r1 (y : ℤ) (z : ℤ) (x : ℤ) : infix_as' (infix_pl' y z) x = infix_pl' (infix_as' y x) (infix_as' z x)
axiom Comm3 (x : ℤ) (y : ℤ) : infix_as' x y = infix_as' y x
axiom one1 : ℤ
axiom Unitary1 (x : ℤ) : infix_as' one1 x = x
axiom NonTrivialRing1 : ¬zero = one1
axiom row_zeros_def (i : ℤ) (m : mat) (j : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : row_zeros m i ≤ j) : get m i j = zero
axiom col_zeros_def (j : ℤ) (m : mat) (i : ℤ) (fact0 : (0 : ℤ) ≤ j) (fact1 : col_zeros m j ≤ i) : get m i j = zero
axiom row_zeros_nonneg (i : ℤ) (m : mat) (fact0 : (0 : ℤ) ≤ i) : (0 : ℤ) ≤ row_zeros m i
axiom col_zeros_nonneg (j : ℤ) (m : mat) (fact0 : (0 : ℤ) ≤ j) : (0 : ℤ) ≤ col_zeros m j
axiom set_def_changed (i : ℤ) (j : ℤ) (m : mat) (v : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) : get (set m i j v) i j = v
axiom set_def_unchanged (i : ℤ) (j : ℤ) (i' : ℤ) (j' : ℤ) (m : mat) (v : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) (fact2 : (0 : ℤ) ≤ i') (fact3 : (0 : ℤ) ≤ j') (fact4 : ¬i = i' ∨ ¬j = j') : get (set m i j v) i' j' = get m i' j'
axiom set_def_rowz_changed (i : ℤ) (j : ℤ) (m : mat) (v : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) (fact2 : row_zeros m i ≤ j) : row_zeros (set m i j v) i = j + (1 : ℤ)
axiom set_def_colz_changed (i : ℤ) (j : ℤ) (m : mat) (v : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) (fact2 : col_zeros m j ≤ i) : col_zeros (set m i j v) j = i + (1 : ℤ)
axiom set_def_rowz_unchanged (i : ℤ) (j : ℤ) (m : mat) (v : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) (fact2 : j < row_zeros m i) : row_zeros (set m i j v) i = row_zeros m i
axiom set_def_colz_unchanged (i : ℤ) (j : ℤ) (m : mat) (v : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) (fact2 : i < col_zeros m j) : col_zeros (set m i j v) j = col_zeros m j
axiom set_def_other_rowz (i : ℤ) (j : ℤ) (i' : ℤ) (m : mat) (v : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) (fact2 : (0 : ℤ) ≤ i') (fact3 : ¬i = i') : row_zeros (set m i j v) i' = row_zeros m i'
axiom set_def_other_colz (i : ℤ) (j : ℤ) (j' : ℤ) (m : mat) (v : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) (fact2 : (0 : ℤ) ≤ j') (fact3 : ¬j = j') : col_zeros (set m i j v) j' = col_zeros m j'
noncomputable def infix_eqeq (m1 : mat) (m2 : mat) := ∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i → (0 : ℤ) ≤ j → get m1 i j = get m2 i j
axiom extensionality (m1 : mat) (m2 : mat) (fact0 : infix_eqeq m1 m2) : m1 = m2
noncomputable def infix_eqeqeq (m1 : mat) (m2 : mat) := ∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i → (0 : ℤ) ≤ j → row_zeros m1 i = row_zeros m2 i ∧ col_zeros m1 j = col_zeros m2 j
noncomputable def in_bounds (m : mat) (i : ℤ) (j : ℤ) := ((0 : ℤ) ≤ i ∧ i < col_zeros m j) ∧ (0 : ℤ) ≤ j ∧ j < row_zeros m i
noncomputable def size (m : mat) (r : ℤ) (c : ℤ) := (∀(i : ℤ), (0 : ℤ) ≤ i → row_zeros m i = c) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j → col_zeros m j = r)
axiom result3 : ℤ -> ℤ -> ℤ
axiom result4 : ℤ -> ℤ -> ℤ
axiom result'def3 (c : ℤ) (x : ℤ) : result3 c x = max (0 : ℤ) c
axiom result'def4 (r : ℤ) (x : ℤ) : result4 r x = max (0 : ℤ) r
noncomputable def fcreate (r : ℤ) (c : ℤ) (f : ℤ -> ℤ -> ℤ) := create (result3 c) (result4 r) f
axiom fc : ℤ -> ℤ -> ℤ
axiom fc'def (y0 : ℤ) (y1 : ℤ) : fc y0 y1 = (0 : ℤ)
noncomputable def mzero := fcreate (0 : ℤ) (0 : ℤ) fc
axiom fc1 : ℤ -> ℤ -> ℤ
axiom fc'def1 (y0 : ℤ) (y1 : ℤ) : fc1 y0 y1 = (0 : ℤ)
noncomputable def zerorc (r : ℤ) (c : ℤ) := fcreate r c fc1
noncomputable def idf (x : ℤ) (y : ℤ) := if x = y then (1 : ℤ) else (0 : ℤ)
axiom result5 : ℤ -> ℤ
axiom result6 : ℤ -> ℤ
axiom idf_closure : ℤ -> ℤ -> ℤ
axiom result'def5 (i : ℤ) : result5 i = i + (1 : ℤ)
axiom result'def6 (j : ℤ) : result6 j = j + (1 : ℤ)
axiom idf_closure_def (y : ℤ) (y1 : ℤ) : idf_closure y y1 = idf y y1
noncomputable def id1 := create result5 result6 idf_closure
noncomputable def idrc (r : ℤ) (c : ℤ) := fcreate r c idf_closure
axiom add2f : mat -> mat -> ℤ -> ℤ -> ℤ
axiom add2f'def (a : mat) (b : mat) (x : ℤ) (y : ℤ) : add2f a b x y = get a x y + get b x y
axiom fc2 : mat -> mat -> ℤ -> ℤ
axiom fc3 : mat -> mat -> ℤ -> ℤ
axiom fc'def2 (a : mat) (b : mat) (i : ℤ) : fc2 a b i = max (row_zeros a i) (row_zeros b i)
axiom fc'def3 (a : mat) (b : mat) (j : ℤ) : fc3 a b j = max (col_zeros a j) (col_zeros b j)
noncomputable def f_add (a : mat) (b : mat) := create (fc2 a b) (fc3 a b) (add2f a b)
axiom add : mat -> mat -> mat
axiom add'spec (a : mat) (b : mat) : add a b = f_add a b
axiom opp2f : mat -> ℤ -> ℤ -> ℤ
axiom opp2f'def (a : mat) (x : ℤ) (y : ℤ) : opp2f a x y = -get a x y
axiom row_zeros_closure : mat -> ℤ -> ℤ
axiom col_zeros_closure : mat -> ℤ -> ℤ
axiom row_zeros_closure_def (y : mat) (y1 : ℤ) : row_zeros_closure y y1 = row_zeros y y1
axiom col_zeros_closure_def (y : mat) (y1 : ℤ) : col_zeros_closure y y1 = col_zeros y y1
noncomputable def f_opp (a : mat) := create (row_zeros_closure a) (col_zeros_closure a) (opp2f a)
axiom opp : mat -> mat
axiom opp'spec (a : mat) : opp a = f_opp a
noncomputable def sub (a : mat) (b : mat) := add a (opp b)
axiom mul_atom : mat -> mat -> ℤ -> ℤ -> ℤ -> ℤ
axiom mul_atom'def (a : mat) (b : mat) (i : ℤ) (j : ℤ) (k : ℤ) : mul_atom a b i j k = get a i k * get b k j
noncomputable def mul_cell_bound (a : mat) (b : mat) (i : ℤ) (j : ℤ) := min (row_zeros a i) (col_zeros b j)
axiom mul_cell : mat -> mat -> ℤ -> ℤ -> ℤ
axiom mul_cell'def (a : mat) (b : mat) (i : ℤ) (j : ℤ) : mul_cell a b i j = int.Sum.sum (mul_atom a b i j) (0 : ℤ) (mul_cell_bound a b i j)
axiom fc4 : mat -> mat -> ℤ -> ℤ
axiom fc5 : mat -> mat -> ℤ -> ℤ
axiom fc'def4 (a : mat) (b : mat) (i : ℤ) : fc4 a b i = MaxFun.maxf (row_zeros_closure b) (0 : ℤ) (row_zeros a i)
axiom fc'def5 (a : mat) (b : mat) (j : ℤ) : fc5 a b j = MaxFun.maxf (col_zeros_closure a) (0 : ℤ) (col_zeros b j)
noncomputable def f_mul (a : mat) (b : mat) := create (fc4 a b) (fc5 a b) (mul_cell a b)
axiom mul : mat -> mat -> mat
axiom mul'spec (a : mat) (b : mat) : mul a b = f_mul a b
axiom ft1 : mat -> mat -> mat -> ℤ -> ℤ -> ℤ -> ℤ -> ℤ
axiom ft1'def (a : mat) (b : mat) (c : mat) (i : ℤ) (j : ℤ) (k : ℤ) : ft1 a b c i j k = Sum_extended.smulf (mul_atom a b i k) (get c k j)
axiom ft2 : mat -> mat -> mat -> ℤ -> ℤ -> ℤ -> ℤ -> ℤ
axiom ft2'def (a : mat) (b : mat) (c : mat) (i : ℤ) (j : ℤ) (k : ℤ) : ft2 a b c i j k = Sum_extended.smulf (mul_atom b c k j) (get a i k)
axiom extf : ℤ -> mat -> ℤ -> ℤ -> ℤ
axiom extf'def (c : ℤ) (a : mat) (x : ℤ) (y : ℤ) : extf c a x y = c * get a x y
noncomputable def f_extp (c : ℤ) (a : mat) := create (row_zeros_closure a) (col_zeros_closure a) (extf c a)
axiom extp : ℤ -> mat -> mat
axiom extp'spec (c : ℤ) (a : mat) : extp c a = f_extp c a
end InfIntMatrix
namespace InfIntMatrixDecision
axiom Assoc (x : ℤ) (y : ℤ) (z : ℤ) : x + y + z = x + (y + z)
axiom Unit_def_l (x : ℤ) : (0 : ℤ) + x = x
axiom Unit_def_r (x : ℤ) : x + (0 : ℤ) = x
axiom Inv_def_l (x : ℤ) : -x + x = (0 : ℤ)
axiom Inv_def_r (x : ℤ) : x + -x = (0 : ℤ)
axiom Comm (x : ℤ) (y : ℤ) : x + y = y + x
axiom Assoc1 (x : ℤ) (y : ℤ) (z : ℤ) : x * y * z = x * (y * z)
axiom Mul_distr_l (x : ℤ) (y : ℤ) (z : ℤ) : x * (y + z) = x * y + x * z
axiom Mul_distr_r (y : ℤ) (z : ℤ) (x : ℤ) : (y + z) * x = y * x + z * x
axiom Comm1 (x : ℤ) (y : ℤ) : x * y = y * x
axiom Unitary (x : ℤ) : (1 : ℤ) * x = x
axiom NonTrivialRing : ¬(0 : ℤ) = (1 : ℤ)
inductive t where
  | Var : ℤ -> t
  | Add : t -> t -> t
  | Mul : t -> t -> t
  | Ext : ℤ -> t -> t
  | Sub : t -> t -> t
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom vars : Type
axiom inhabited_axiom_vars : Inhabited vars
attribute [instance] inhabited_axiom_vars
noncomputable def interp : t -> (ℤ -> InfIntMatrix.mat) -> InfIntMatrix.mat
  | (t.Var n), y => y n
  | (t.Add x1 x2), y => InfIntMatrix.add (interp x1 y) (interp x2 y)
  | (t.Mul x1 x2), y => InfIntMatrix.mul (interp x1 y) (interp x2 y)
  | (t.Sub x1 x2), y => InfIntMatrix.sub (interp x1 y) (interp x2 y)
  | (t.Ext r x1), y => InfIntMatrix.extp r (interp x1 y)
noncomputable def eq (x1 : t) (x2 : t) := ∀(y : ℤ -> InfIntMatrix.mat), interp x1 y = interp x2 y
inductive m where
  | M : ℤ -> List ℤ -> m
axiom inhabited_axiom_m : Inhabited m
attribute [instance] inhabited_axiom_m
axiom t' : Type
axiom inhabited_axiom_t' : Inhabited t'
attribute [instance] inhabited_axiom_t'
noncomputable def mon : List ℤ -> (ℤ -> InfIntMatrix.mat) -> InfIntMatrix.mat
  | ([] : List ℤ), y => InfIntMatrix.id1
  | (List.cons x1 l), y => InfIntMatrix.mul (y x1) (mon l y)
noncomputable def interp' : List m -> (ℤ -> InfIntMatrix.mat) -> InfIntMatrix.mat
  | ([] : List m), y => InfIntMatrix.mzero
  | (List.cons (m.M r m1) l), y => InfIntMatrix.add (InfIntMatrix.extp r (mon m1 y)) (interp' l y)
noncomputable def eq_mon (m1 : List ℤ) (m2 : List ℤ) := ∀(y : ℤ -> InfIntMatrix.mat), mon m1 y = mon m2 y
noncomputable def eq' (x1 : List m) (x2 : List m) := ∀(y : ℤ -> InfIntMatrix.mat), interp' x1 y = interp' x2 y
noncomputable def append_mon (m1 : m) (m2 : m) := match (m1, m2) with | (m.M r1 l1, m.M r2 l2) => m.M (r1 * r2) (l1 ++ l2)
axiom append_mon'spec (m1 : m) (m2 : m) (y : ℤ -> InfIntMatrix.mat) : interp' (List.cons (append_mon m1 m2) ([] : List m)) y = InfIntMatrix.mul (interp' (List.cons m1 ([] : List m)) y) (interp' (List.cons m2 ([] : List m)) y)
noncomputable def mul_mon : m -> List m -> List m
  | mon1, ([] : List m) => ([] : List m)
  | mon1, (List.cons m1 l) => List.cons (append_mon mon1 m1) (mul_mon mon1 l)
axiom mul_mon'spec (mon1 : m) (x : List m) (y : ℤ -> InfIntMatrix.mat) : interp' (mul_mon mon1 x) y = InfIntMatrix.mul (interp' (List.cons mon1 ([] : List m)) y) (interp' x y)
noncomputable def mul_devel : List m -> List m -> List m
  | ([] : List m), x2 => ([] : List m)
  | (List.cons (m.M r m1) l), x2 => mul_mon (m.M r m1) x2 ++ mul_devel l x2
axiom mul_devel'spec (x1 : List m) (x2 : List m) (y : ℤ -> InfIntMatrix.mat) : interp' (mul_devel x1 x2) y = InfIntMatrix.mul (interp' x1 y) (interp' x2 y)
noncomputable def ext : ℤ -> List m -> List m
  | c, ([] : List m) => ([] : List m)
  | c, (List.cons (m.M r m1) l) => List.cons (m.M (c * r) m1) (ext c l)
axiom ext'spec (c : ℤ) (x : List m) (y : ℤ -> InfIntMatrix.mat) : interp' (ext c x) y = InfIntMatrix.extp c (interp' x y)
noncomputable def conv : t -> List m
  | (t.Var v) => List.cons (m.M (1 : ℤ) (List.cons v ([] : List ℤ))) ([] : List m)
  | (t.Add x1 x2) => conv x1 ++ conv x2
  | (t.Mul x1 x2) => mul_devel (conv x1) (conv x2)
  | (t.Ext r x1) => ext r (conv x1)
  | (t.Sub x1 x2) => conv x1 ++ ext (-(1 : ℤ)) (conv x2)
axiom conv'spec (x : t) (y : ℤ -> InfIntMatrix.mat) : interp x y = interp' (conv x) y
noncomputable def le_mon : List ℤ -> List ℤ -> Bool
  | ([] : List ℤ), x => if List.length ([] : List ℤ) < List.length x then true else if List.length ([] : List ℤ) = List.length x then true else false
  | x, ([] : List ℤ) => if List.length x < List.length ([] : List ℤ) then true else false
  | (List.cons v1 r1), (List.cons v2 r2) => if List.length (List.cons v1 r1) < List.length (List.cons v2 r2) then true else if List.length (List.cons v1 r1) = List.length (List.cons v2 r2) then if v1 < v2 then true else if v1 = v2 then le_mon r1 r2 else false else false
noncomputable def same : List ℤ -> List ℤ -> Bool
  | ([] : List ℤ), ([] : List ℤ) => true
  | ([] : List ℤ), x => false
  | x, ([] : List ℤ) => false
  | (List.cons x1 l11), (List.cons x2 l21) => if x1 = x2 then same l11 l21 else false
axiom same'spec (l1 : List ℤ) (l2 : List ℤ) (fact0 : same l1 l2 = true) : eq_mon l1 l2
noncomputable def insert_mon : m -> List m -> List m
  | x, ([] : List m) => List.cons x ([] : List m)
  | (m.M r1 l1), (List.cons (m.M r2 l2) l) => if same l1 l2 = true then let s : ℤ := r1 + r2; if s = (0 : ℤ) then l else List.cons (m.M s l1) l else if le_mon l1 l2 = true then List.cons (m.M r1 l1) (List.cons (m.M r2 l2) l) else List.cons (m.M r2 l2) (insert_mon (m.M r1 l1) l)
axiom insert_mon'spec (m1 : m) (x : List m) : eq' (insert_mon m1 x) (List.cons m1 x)
noncomputable def insertion_sort_mon : List m -> List m
  | ([] : List m) => ([] : List m)
  | (List.cons m1 l) => insert_mon m1 (insertion_sort_mon l)
axiom insertion_sort_mon'spec (x : List m) : eq' (insertion_sort_mon x) x
axiom normalize''spec (x : List m) : eq' (insertion_sort_mon x) x
noncomputable def normalize (x : t) := insertion_sort_mon (conv x)
axiom normalize'spec (x : t) : eq' (normalize x) (conv x)
end InfIntMatrixDecision
namespace strassen_MatrixTests_cut_quartersqtvc
axiom cols : InfIntMatrix.mat -> ℤ
axiom rows : InfIntMatrix.mat -> ℤ
axiom rows_def (r : ℤ) (c : ℤ) (a : InfIntMatrix.mat) (fact0 : (0 : ℤ) ≤ r) (fact1 : (0 : ℤ) ≤ c) (fact2 : InfIntMatrix.size a r c) : rows a = r
axiom cols_def (r : ℤ) (c : ℤ) (a : InfIntMatrix.mat) (fact0 : (0 : ℤ) ≤ r) (fact1 : (0 : ℤ) ≤ c) (fact2 : InfIntMatrix.size a r c) : cols a = c
noncomputable def is_finite (m : InfIntMatrix.mat) := InfIntMatrix.size m (rows m) (cols m)
axiom ofs2 : InfIntMatrix.mat -> ℤ -> ℤ -> ℤ -> ℤ -> ℤ
axiom ofs2'def (a : InfIntMatrix.mat) (ai : ℤ) (aj : ℤ) (i : ℤ) (j : ℤ) : ofs2 a ai aj i j = InfIntMatrix.get a (ai + i) (aj + j)
noncomputable def block (a : InfIntMatrix.mat) (r : ℤ) (dr : ℤ) (c : ℤ) (dc : ℤ) := InfIntMatrix.fcreate dr dc (ofs2 a r c)
noncomputable def c_blocks (a : InfIntMatrix.mat) (a1 : InfIntMatrix.mat) (a2 : InfIntMatrix.mat) := ((0 : ℤ) ≤ cols a1 ∧ cols a1 ≤ cols a) ∧ a1 = block a (0 : ℤ) (rows a) (0 : ℤ) (cols a1) ∧ a2 = block a (0 : ℤ) (rows a) (cols a1) (cols a - cols a1)
noncomputable def r_blocks (a : InfIntMatrix.mat) (a1 : InfIntMatrix.mat) (a2 : InfIntMatrix.mat) := ((0 : ℤ) ≤ rows a1 ∧ rows a1 ≤ rows a) ∧ a1 = block a (0 : ℤ) (rows a1) (0 : ℤ) (cols a) ∧ a2 = block a (rows a1) (rows a - rows a1) (0 : ℤ) (cols a)
noncomputable def quarters (a : InfIntMatrix.mat) (a11 : InfIntMatrix.mat) (a12 : InfIntMatrix.mat) (a21 : InfIntMatrix.mat) (a22 : InfIntMatrix.mat) := (is_finite a ∧ is_finite a11 ∧ is_finite a12 ∧ is_finite a21 ∧ is_finite a22) ∧ (rows a11 = rows a12 ∧ rows a12 = rows a21 ∧ rows a21 = rows a22 ∧ rows a22 = cols a11 ∧ cols a11 = cols a12 ∧ cols a12 = cols a21 ∧ cols a21 = cols a22) ∧ (rows a = cols a ∧ cols a = (2 : ℤ) * rows a11) ∧ a11 = block a (0 : ℤ) (rows a11) (0 : ℤ) (cols a11) ∧ a12 = block a (0 : ℤ) (rows a11) (cols a11) (cols a11) ∧ a21 = block a (rows a11) (rows a11) (0 : ℤ) (cols a11) ∧ a22 = block a (rows a11) (rows a11) (cols a11) (cols a11)
theorem cut_quarters'vc (a : InfIntMatrix.mat) (fact0 : is_finite a) (fact1 : rows a = cols a) (fact2 : Even (rows a)) : ¬(2 : ℤ) = (0 : ℤ) ∧ (let s : ℤ := Int.tdiv (rows a) (2 : ℤ); quarters a (block a (0 : ℤ) s (0 : ℤ) s) (block a (0 : ℤ) s s s) (block a s s (0 : ℤ) s) (block a s s s s))
  := sorry
end strassen_MatrixTests_cut_quartersqtvc
