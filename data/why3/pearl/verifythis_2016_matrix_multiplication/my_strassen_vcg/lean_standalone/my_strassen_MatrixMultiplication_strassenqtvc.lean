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
namespace MyMatrix
axiom mat : Type -> Type
axiom inhabited_axiom_mat {α : Type} [Inhabited α] : Inhabited (mat α)
attribute [instance] inhabited_axiom_mat
axiom rows :  {α : Type} -> [Inhabited α] -> mat α -> ℤ
axiom cols :  {α : Type} -> [Inhabited α] -> mat α -> ℤ
axiom get :  {α : Type} -> [Inhabited α] -> mat α -> ℤ -> ℤ -> α
axiom create :  {α : Type} -> [Inhabited α] -> ℤ -> ℤ -> (ℤ -> ℤ -> α) -> mat α
axiom create_rows {α : Type} [Inhabited α] (r : ℤ) (c : ℤ) (f : ℤ -> ℤ -> α) (fact0 : (0 : ℤ) ≤ r) : rows (create r c f) = r
axiom create_cols {α : Type} [Inhabited α] (c : ℤ) (r : ℤ) (f : ℤ -> ℤ -> α) (fact0 : (0 : ℤ) ≤ c) : cols (create r c f) = c
axiom create_get {α : Type} [Inhabited α] (i : ℤ) (r : ℤ) (j : ℤ) (c : ℤ) (f : ℤ -> ℤ -> α) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < r) (fact2 : (0 : ℤ) ≤ j) (fact3 : j < c) : get (create r c f) i j = f i j
axiom fc :  {α : Type} -> [Inhabited α] -> mat α -> ℤ -> ℤ -> α -> ℤ -> ℤ -> α
axiom fc'def {α : Type} [Inhabited α] (m : mat α) (x : ℤ) (y : ℤ) (z : α) (x1 : ℤ) (y1 : ℤ) : fc m x y z x1 y1 = (if x1 = x ∧ y1 = y then z else get m x1 y1)
noncomputable def set {α : Type} [Inhabited α] (m : mat α) (x : ℤ) (y : ℤ) (z : α) := create (rows m) (cols m) (fc m x y z)
axiom rows_and_cols_nonnegative {α : Type} [Inhabited α] (m : mat α) : (0 : ℤ) ≤ rows m ∧ (0 : ℤ) ≤ cols m
axiom set_def1 {α : Type} [Inhabited α] (i : ℤ) (m : mat α) (j : ℤ) (v : α) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < rows m) (fact2 : (0 : ℤ) ≤ j) (fact3 : j < cols m) : rows (set m i j v) = rows m
axiom set_def2 {α : Type} [Inhabited α] (i : ℤ) (m : mat α) (j : ℤ) (v : α) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < rows m) (fact2 : (0 : ℤ) ≤ j) (fact3 : j < cols m) : cols (set m i j v) = cols m
axiom set_def3 {α : Type} [Inhabited α] (i : ℤ) (m : mat α) (j : ℤ) (v : α) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < rows m) (fact2 : (0 : ℤ) ≤ j) (fact3 : j < cols m) : get (set m i j v) i j = v
axiom set_def4 {α : Type} [Inhabited α] (i : ℤ) (m : mat α) (j : ℤ) (i' : ℤ) (j' : ℤ) (v : α) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < rows m) (fact2 : (0 : ℤ) ≤ j) (fact3 : j < cols m) (fact4 : (0 : ℤ) ≤ i') (fact5 : i' < rows m) (fact6 : (0 : ℤ) ≤ j') (fact7 : j' < cols m) (fact8 : ¬i = i' ∨ ¬j = j') : get (set m i j v) i' j' = get m i' j'
noncomputable def infix_eqeq {α : Type} [Inhabited α] (m1 : mat α) (m2 : mat α) := rows m1 = rows m2 ∧ cols m1 = cols m2 ∧ (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < rows m1 → (0 : ℤ) ≤ j ∧ j < cols m1 → get m1 i j = get m2 i j)
axiom extensionality {α : Type} [Inhabited α] (m1 : mat α) (m2 : mat α) (fact0 : infix_eqeq m1 m2) : m1 = m2
noncomputable def infix_eqeqeq {α : Type} [Inhabited α] (a : mat α) (b : mat α) := rows a = rows b ∧ cols a = cols b
end MyMatrix
namespace Sum_extended
axiom addf : (ℤ -> ℤ) -> (ℤ -> ℤ) -> ℤ -> ℤ
axiom addf'def (f : ℤ -> ℤ) (g : ℤ -> ℤ) (x : ℤ) : addf f g x = f x + g x
axiom smulf : (ℤ -> ℤ) -> ℤ -> ℤ -> ℤ
axiom smulf'def (f : ℤ -> ℤ) (l : ℤ) (x : ℤ) : smulf f l x = l * f x
axiom sumf : (ℤ -> ℤ -> ℤ) -> ℤ -> ℤ -> ℤ -> ℤ
axiom sumf'def (f : ℤ -> ℤ -> ℤ) (a : ℤ) (b : ℤ) (x : ℤ) : sumf f a b x = int.Sum.sum (f x) a b
end Sum_extended
namespace MatrixArithmetic
axiom zerof : ℤ -> ℤ -> ℤ
axiom zerof'def (x : ℤ) (x_1 : ℤ) : zerof x x_1 = (0 : ℤ)
axiom add2f : MyMatrix.mat ℤ -> MyMatrix.mat ℤ -> ℤ -> ℤ -> ℤ
axiom add2f'def (a : MyMatrix.mat ℤ) (b : MyMatrix.mat ℤ) (x : ℤ) (y : ℤ) : add2f a b x y = MyMatrix.get a x y + MyMatrix.get b x y
noncomputable def add (a : MyMatrix.mat ℤ) (b : MyMatrix.mat ℤ) := MyMatrix.create (MyMatrix.rows a) (MyMatrix.cols a) (add2f a b)
axiom opp2f : MyMatrix.mat ℤ -> ℤ -> ℤ -> ℤ
axiom opp2f'def (a : MyMatrix.mat ℤ) (x : ℤ) (y : ℤ) : opp2f a x y = -MyMatrix.get a x y
noncomputable def opp (a : MyMatrix.mat ℤ) := MyMatrix.create (MyMatrix.rows a) (MyMatrix.cols a) (opp2f a)
noncomputable def sub (a : MyMatrix.mat ℤ) (b : MyMatrix.mat ℤ) := add a (opp b)
axiom mul_atom : MyMatrix.mat ℤ -> MyMatrix.mat ℤ -> ℤ -> ℤ -> ℤ -> ℤ
axiom mul_atom'def (a : MyMatrix.mat ℤ) (b : MyMatrix.mat ℤ) (i : ℤ) (j : ℤ) (k : ℤ) : mul_atom a b i j k = MyMatrix.get a i k * MyMatrix.get b k j
axiom mul_cell : MyMatrix.mat ℤ -> MyMatrix.mat ℤ -> ℤ -> ℤ -> ℤ
axiom mul_cell'def (a : MyMatrix.mat ℤ) (b : MyMatrix.mat ℤ) (i : ℤ) (j : ℤ) : mul_cell a b i j = int.Sum.sum (mul_atom a b i j) (0 : ℤ) (MyMatrix.cols a)
noncomputable def mul (a : MyMatrix.mat ℤ) (b : MyMatrix.mat ℤ) := MyMatrix.create (MyMatrix.rows a) (MyMatrix.cols b) (mul_cell a b)
axiom ft1 : MyMatrix.mat ℤ -> MyMatrix.mat ℤ -> MyMatrix.mat ℤ -> ℤ -> ℤ -> ℤ -> ℤ -> ℤ
axiom ft1'def (a : MyMatrix.mat ℤ) (b : MyMatrix.mat ℤ) (c : MyMatrix.mat ℤ) (i : ℤ) (j : ℤ) (k : ℤ) : ft1 a b c i j k = Sum_extended.smulf (mul_atom a b i k) (MyMatrix.get c k j)
axiom ft2 : MyMatrix.mat ℤ -> MyMatrix.mat ℤ -> MyMatrix.mat ℤ -> ℤ -> ℤ -> ℤ -> ℤ -> ℤ
axiom ft2'def (a : MyMatrix.mat ℤ) (b : MyMatrix.mat ℤ) (c : MyMatrix.mat ℤ) (i : ℤ) (j : ℤ) (k : ℤ) : ft2 a b c i j k = Sum_extended.smulf (mul_atom b c k j) (MyMatrix.get a i k)
end MatrixArithmetic
namespace BlockMul
axiom ofs2 : MyMatrix.mat ℤ -> ℤ -> ℤ -> ℤ -> ℤ -> ℤ
axiom ofs2'def (a : MyMatrix.mat ℤ) (ai : ℤ) (aj : ℤ) (i : ℤ) (j : ℤ) : ofs2 a ai aj i j = MyMatrix.get a (ai + i) (aj + j)
noncomputable def block (a : MyMatrix.mat ℤ) (r : ℤ) (dr : ℤ) (c : ℤ) (dc : ℤ) := MyMatrix.create dr dc (ofs2 a r c)
noncomputable def c_blocks (a : MyMatrix.mat ℤ) (a1 : MyMatrix.mat ℤ) (a2 : MyMatrix.mat ℤ) := ((0 : ℤ) ≤ MyMatrix.cols a1 ∧ MyMatrix.cols a1 ≤ MyMatrix.cols a) ∧ a1 = block a (0 : ℤ) (MyMatrix.rows a) (0 : ℤ) (MyMatrix.cols a1) ∧ a2 = block a (0 : ℤ) (MyMatrix.rows a) (MyMatrix.cols a1) (MyMatrix.cols a - MyMatrix.cols a1)
noncomputable def r_blocks (a : MyMatrix.mat ℤ) (a1 : MyMatrix.mat ℤ) (a2 : MyMatrix.mat ℤ) := ((0 : ℤ) ≤ MyMatrix.rows a1 ∧ MyMatrix.rows a1 ≤ MyMatrix.rows a) ∧ a1 = block a (0 : ℤ) (MyMatrix.rows a1) (0 : ℤ) (MyMatrix.cols a) ∧ a2 = block a (MyMatrix.rows a1) (MyMatrix.rows a - MyMatrix.rows a1) (0 : ℤ) (MyMatrix.cols a)
end BlockMul
namespace Symb
structure mono where
  m_prod : List ℤ
  m_pos : Bool
axiom inhabited_axiom_mono : Inhabited mono
attribute [instance] inhabited_axiom_mono
noncomputable def l_mdl : (ℤ -> MyMatrix.mat ℤ) -> List ℤ -> MyMatrix.mat ℤ
  | f, ([] : List ℤ) => MyMatrix.create (-(1 : ℤ)) (-(1 : ℤ)) MatrixArithmetic.zerof
  | f, (List.cons x ([] : List ℤ)) => f x
  | f, (List.cons x q) => MatrixArithmetic.mul (f x) (l_mdl f q)
noncomputable def l_vld : (ℤ -> MyMatrix.mat ℤ) -> ℤ -> ℤ -> List ℤ -> Prop
  | f, r, c, ([] : List ℤ) => False
  | f, r, c, (List.cons x ([] : List ℤ)) => MyMatrix.rows (f x) = r ∧ MyMatrix.cols (f x) = c
  | f, r, c, (List.cons x q) => MyMatrix.rows (f x) = r ∧ l_vld f (MyMatrix.cols (f x)) c q
noncomputable def m_mdl (f : ℤ -> MyMatrix.mat ℤ) (m : mono) := let m0 : MyMatrix.mat ℤ := l_mdl f (mono.m_prod m); if mono.m_pos m = true then m0 else MatrixArithmetic.opp m0
noncomputable def lm_mdl : (ℤ -> MyMatrix.mat ℤ) -> ℤ -> ℤ -> List mono -> MyMatrix.mat ℤ
  | f, r, c, ([] : List mono) => MyMatrix.create r c MatrixArithmetic.zerof
  | f, r, c, (List.cons x q) => MatrixArithmetic.add (lm_mdl f r c q) (m_mdl f x)
noncomputable def lm_mdl_simp : (ℤ -> MyMatrix.mat ℤ) -> ℤ -> ℤ -> List mono -> MyMatrix.mat ℤ
  | f, r, c, ([] : List mono) => MyMatrix.create r c MatrixArithmetic.zerof
  | f, r, c, (List.cons x ([] : List mono)) => m_mdl f x
  | f, r, c, (List.cons x q) => MatrixArithmetic.add (lm_mdl_simp f r c q) (m_mdl f x)
noncomputable def lm_vld : (ℤ -> MyMatrix.mat ℤ) -> ℤ -> ℤ -> List mono -> Prop
  | f, r, c, ([] : List mono) => True
  | f, r, c, (List.cons x q) => l_vld f r c (mono.m_prod x) ∧ lm_vld f r c q
noncomputable def l_compare : List ℤ -> List ℤ -> ℤ
  | ([] : List ℤ), ([] : List ℤ) => (0 : ℤ)
  | ([] : List ℤ), x => -(1 : ℤ)
  | x, ([] : List ℤ) => (1 : ℤ)
  | (List.cons x q), (List.cons y r) => if x < y then -(1 : ℤ) else if y < x then (1 : ℤ) else l_compare q r
noncomputable def m_lower (m1 : mono) (m2 : mono) := let cmp : ℤ := l_compare (mono.m_prod m1) (mono.m_prod m2); cmp < (0 : ℤ) ∨ cmp = (0 : ℤ) ∧ (mono.m_pos m1 = true → mono.m_pos m2 = true)
noncomputable def m_collapse (l : List mono) (m : mono) := match l with | ([] : List mono) => List.cons m ([] : List mono) | List.cons x q => (if ¬mono.m_pos x = true ∧ mono.m_pos m = true ∧ l_compare (mono.m_prod m) (mono.m_prod x) = (0 : ℤ) then q else List.cons m l)
noncomputable def lm_collapse : List mono -> List mono -> List mono
  | acc, ([] : List mono) => acc
  | acc, (List.cons x q) => lm_collapse (m_collapse acc x) q
noncomputable def cat_rev {α : Type} [Inhabited α] : List α -> List α -> List α
  | acc, ([] : List α) => acc
  | acc, (List.cons x q) => cat_rev (List.cons x acc) q
noncomputable def lm_dump : mono -> List mono -> List mono -> List mono × List mono
  | x, acc, ([] : List mono) => (acc, ([] : List mono))
  | x, acc, (List.cons y q) => if m_lower x y then (acc, List.cons y q) else lm_dump x (m_collapse acc y) q
noncomputable def lm_merge : List mono -> List mono -> List mono -> List mono
  | acc, ([] : List mono), l2 => cat_rev ([] : List mono) (lm_collapse acc l2)
  | acc, (List.cons x q), l2 => match lm_dump x acc l2 with | (acc1, l21) => lm_merge (m_collapse acc1 x) q l21
noncomputable def cat {α : Type} [Inhabited α] : List α -> List α -> List α
  | ([] : List α), l2 => l2
  | (List.cons x q), l2 => List.cons x (cat q l2)
noncomputable def m_mul (m1 : mono) (m2 : mono) := mono.mk (cat (mono.m_prod m1) (mono.m_prod m2)) (if (mono.m_pos m1 = true) = (mono.m_pos m2 = true) then true else false)
noncomputable def m_distribute : mono -> List mono -> List mono
  | m, ([] : List mono) => ([] : List mono)
  | m, (List.cons x q) => List.cons (m_mul m x) (m_distribute m q)
noncomputable def lm_distribute : List mono -> List mono -> List mono
  | ([] : List mono), l2 => ([] : List mono)
  | (List.cons x q), l2 => lm_merge ([] : List mono) (m_distribute x l2) (lm_distribute q l2)
noncomputable def lm_opp : List mono -> List mono
  | ([] : List mono) => ([] : List mono)
  | (List.cons x q) => lm_merge ([] : List mono) (List.cons (mono.mk (mono.m_prod x) (if ¬mono.m_pos x = true then true else false)) ([] : List mono)) (lm_opp q)
axiom fc : ℤ -> ℤ -> MyMatrix.mat ℤ
axiom fc'def (y0 : ℤ) (y1 : ℤ) : fc y0 y1 = MyMatrix.create y0 y1 MatrixArithmetic.zerof
noncomputable def empty := fc (0 : ℤ)
structure env where
  ev_f : ℤ -> MyMatrix.mat ℤ
  ev_c : ℤ
axiom inhabited_axiom_env : Inhabited env
attribute [instance] inhabited_axiom_env
structure expr where
  e_body : List mono
  e_rows : ℤ
  e_cols : ℤ
axiom inhabited_axiom_expr : Inhabited expr
attribute [instance] inhabited_axiom_expr
noncomputable def e_vld (env1 : env) (e : expr) := (0 : ℤ) ≤ expr.e_rows e ∧ (0 : ℤ) ≤ expr.e_cols e ∧ lm_vld (env.ev_f env1) (expr.e_rows e) (expr.e_cols e) (expr.e_body e)
noncomputable def e_mdl (env1 : env) (e : expr) := lm_mdl_simp (env.ev_f env1) (expr.e_rows e) (expr.e_cols e) (expr.e_body e)
axiom extends1 : (ℤ -> MyMatrix.mat ℤ) -> ℤ -> MyMatrix.mat ℤ -> ℤ -> MyMatrix.mat ℤ
axiom extends'def (f : ℤ -> MyMatrix.mat ℤ) (c : ℤ) (v : MyMatrix.mat ℤ) (n : ℤ) : extends1 f c v n = (if ¬n = c then f n else v)
noncomputable def symb_mat (m : MyMatrix.mat ℤ) (n : ℤ) := expr.mk (List.cons (mono.mk (List.cons n ([] : List ℤ)) true) ([] : List mono)) (MyMatrix.rows m) (MyMatrix.cols m)
noncomputable def symb_opp (e : expr) := expr.mk (lm_opp (expr.e_body e)) (expr.e_rows e) (expr.e_cols e)
noncomputable def symb_add (e1 : expr) (e2 : expr) := expr.mk (lm_merge ([] : List mono) (expr.e_body e1) (expr.e_body e2)) (expr.e_rows e1) (expr.e_cols e1)
noncomputable def symb_sub (e1 : expr) (e2 : expr) := symb_add e1 (symb_opp e2)
noncomputable def symb_mul (e1 : expr) (e2 : expr) := expr.mk (lm_distribute (expr.e_body e1) (expr.e_body e2)) (expr.e_rows e1) (expr.e_cols e2)
end Symb
namespace Matrix
axiom matrix : Type -> Type
axiom inhabited_axiom_matrix {α : Type} [Inhabited α] : Inhabited (matrix α)
attribute [instance] inhabited_axiom_matrix
axiom elts :  {α : Type} -> [Inhabited α] -> matrix α -> ℤ -> ℤ -> α
axiom rows :  {α : Type} -> [Inhabited α] -> matrix α -> ℤ
axiom columns :  {α : Type} -> [Inhabited α] -> matrix α -> ℤ
axiom matrix'invariant {α : Type} [Inhabited α] (self : matrix α) : (0 : ℤ) ≤ rows self ∧ (0 : ℤ) ≤ columns self
noncomputable def valid_index {α : Type} [Inhabited α] (a : matrix α) (r : ℤ) (c : ℤ) := ((0 : ℤ) ≤ r ∧ r < rows a) ∧ (0 : ℤ) ≤ c ∧ c < columns a
noncomputable def get {α : Type} [Inhabited α] (a : matrix α) (r : ℤ) (c : ℤ) := elts a r c
axiom update :  {α : Type} -> [Inhabited α] -> matrix α -> ℤ -> ℤ -> α -> matrix α
axiom update'spec'1 {α : Type} [Inhabited α] (a : matrix α) (r : ℤ) (c : ℤ) (v : α) : rows (update a r c v) = rows a
axiom update'spec'0 {α : Type} [Inhabited α] (a : matrix α) (r : ℤ) (c : ℤ) (v : α) : columns (update a r c v) = columns a
axiom update'spec {α : Type} [Inhabited α] (a : matrix α) (r : ℤ) (c : ℤ) (v : α) : elts (update a r c v) = Function.update (elts a) r (Function.update (elts a r) c v)
end Matrix
namespace my_strassen_MatrixMultiplication_strassenqtvc
noncomputable def mdl {α : Type} [Inhabited α] (m : Matrix.matrix α) := MyMatrix.create (Matrix.rows m) (Matrix.columns m) (Matrix.elts m)
structure with_symb where
  phy : Matrix.matrix ℤ
  sym : Symb.expr
axiom inhabited_axiom_with_symb : Inhabited with_symb
attribute [instance] inhabited_axiom_with_symb
noncomputable def with_symb_vld (env : Symb.env) (ws : with_symb) := Symb.e_mdl env (with_symb.sym ws) = mdl (with_symb.phy ws) ∧ Symb.e_vld env (with_symb.sym ws) ∧ Symb.expr.e_rows (with_symb.sym ws) = MyMatrix.rows (mdl (with_symb.phy ws)) ∧ Symb.expr.e_cols (with_symb.sym ws) = MyMatrix.cols (mdl (with_symb.phy ws))
theorem strassen'vc (a : Matrix.matrix ℤ) (b : Matrix.matrix ℤ) (flag : ℤ) (fact0 : MyMatrix.cols (mdl a) = MyMatrix.rows (mdl b)) (fact1 : (0 : ℤ) ≤ flag) (fact2 : flag = (0 : ℤ) → MyMatrix.rows (mdl a) = (1 : ℤ) ∨ MyMatrix.cols (mdl a) = (1 : ℤ) ∨ MyMatrix.cols (mdl b) = (1 : ℤ) ∨ Even (MyMatrix.rows (mdl a)) ∧ Even (MyMatrix.cols (mdl a)) ∧ Even (MyMatrix.cols (mdl b))) : (1 : ℤ) ≤ (42 : ℤ) ∧ (∀(cut_off : ℤ), (1 : ℤ) ≤ cut_off → (let o1 : ℤ := Matrix.columns b; let o2 : ℤ := Matrix.columns a; let o3 : ℤ := Matrix.rows a; ∀(o4 : Bool), (if o3 ≤ cut_off then o4 = true else if o2 ≤ cut_off then o4 = true else o4 = (if o1 ≤ cut_off then true else false)) → (if o4 = true then MyMatrix.cols (mdl a) = MyMatrix.rows (mdl b) ∧ (∀(result : Matrix.matrix ℤ), MyMatrix.rows (mdl result) = MyMatrix.rows (mdl a) ∧ MyMatrix.cols (mdl result) = MyMatrix.cols (mdl b) ∧ mdl result = MatrixArithmetic.mul (mdl a) (mdl b) → mdl result = MatrixArithmetic.mul (mdl a) (mdl b) ∧ MyMatrix.rows (mdl result) = MyMatrix.rows (mdl a) ∧ MyMatrix.cols (mdl result) = MyMatrix.cols (mdl b)) else (∀(n : ℤ), (0 : ℤ) ≤ n → ¬(2 : ℤ) = (0 : ℤ) ∧ (let o5 : ℤ := n % (2 : ℤ); ¬(2 : ℤ) = (0 : ℤ) ∧ (let o6 : ℤ := n / (2 : ℤ); n = (2 : ℤ) * o6 + o5 ∧ ((0 : ℤ) ≤ o5 ∧ o5 ≤ (1 : ℤ)) ∧ n + o5 = (2 : ℤ) * (o6 + o5)))) ∧ (0 : ℤ) ≤ o3 ∧ (∀(qr : ℤ) (rr : ℤ), o3 = (2 : ℤ) * qr + rr ∧ ((0 : ℤ) ≤ rr ∧ rr ≤ (1 : ℤ)) ∧ o3 + rr = (2 : ℤ) * (qr + rr) → (0 : ℤ) ≤ o2 ∧ (∀(qm : ℤ) (rm : ℤ), o2 = (2 : ℤ) * qm + rm ∧ ((0 : ℤ) ≤ rm ∧ rm ≤ (1 : ℤ)) ∧ o2 + rm = (2 : ℤ) * (qm + rm) → (0 : ℤ) ≤ o1 ∧ (∀(qc : ℤ) (rc : ℤ), o1 = (2 : ℤ) * qc + rc ∧ ((0 : ℤ) ≤ rc ∧ rc ≤ (1 : ℤ)) ∧ o1 + rc = (2 : ℤ) * (qc + rc) → (∀(o5 : Bool), (if ¬rr = (0 : ℤ) then o5 = true else if ¬rm = (0 : ℤ) then o5 = true else o5 = (if rc = (0 : ℤ) then false else true)) → (if o5 = true then let o6 : ℤ := o1 + rc; let o7 : ℤ := o2 + rm; let o8 : ℤ := o3 + rr; ((MyMatrix.rows (mdl a) ≤ o8 ∧ MyMatrix.cols (mdl a) ≤ o7) ∧ (∀(ap : Matrix.matrix ℤ), MyMatrix.rows (mdl ap) = o8 ∧ MyMatrix.cols (mdl ap) = o7 ∧ mdl a = BlockMul.block (mdl ap) (0 : ℤ) (MyMatrix.rows (mdl a)) (0 : ℤ) (MyMatrix.cols (mdl a)) ∧ (let dr : ℤ := o8 - MyMatrix.rows (mdl a); MyMatrix.create dr (MyMatrix.cols (mdl a)) MatrixArithmetic.zerof = BlockMul.block (mdl ap) (MyMatrix.rows (mdl a)) dr (0 : ℤ) (MyMatrix.cols (mdl a))) ∧ (let dc : ℤ := o7 - MyMatrix.cols (mdl a); MyMatrix.create (MyMatrix.rows (mdl a)) dc MatrixArithmetic.zerof = BlockMul.block (mdl ap) (0 : ℤ) (MyMatrix.rows (mdl a)) (MyMatrix.cols (mdl a)) dc) → (MyMatrix.rows (mdl b) ≤ o7 ∧ MyMatrix.cols (mdl b) ≤ o6) ∧ (∀(bp : Matrix.matrix ℤ), MyMatrix.rows (mdl bp) = o7 ∧ MyMatrix.cols (mdl bp) = o6 ∧ mdl b = BlockMul.block (mdl bp) (0 : ℤ) (MyMatrix.rows (mdl b)) (0 : ℤ) (MyMatrix.cols (mdl b)) ∧ (let dr : ℤ := o7 - MyMatrix.rows (mdl b); MyMatrix.create dr (MyMatrix.cols (mdl b)) MatrixArithmetic.zerof = BlockMul.block (mdl bp) (MyMatrix.rows (mdl b)) dr (0 : ℤ) (MyMatrix.cols (mdl b))) ∧ (let dc : ℤ := o6 - MyMatrix.cols (mdl b); MyMatrix.create (MyMatrix.rows (mdl b)) dc MatrixArithmetic.zerof = BlockMul.block (mdl bp) (0 : ℤ) (MyMatrix.rows (mdl b)) (MyMatrix.cols (mdl b)) dc) → (((0 : ℤ) ≤ MyMatrix.rows (mdl a) + MyMatrix.cols (mdl a) + MyMatrix.cols (mdl b) + (3 : ℤ) * flag ∧ MyMatrix.rows (mdl ap) + MyMatrix.cols (mdl ap) + MyMatrix.cols (mdl bp) + (3 : ℤ) * (0 : ℤ) < MyMatrix.rows (mdl a) + MyMatrix.cols (mdl a) + MyMatrix.cols (mdl b) + (3 : ℤ) * flag ∨ MyMatrix.rows (mdl a) + MyMatrix.cols (mdl a) + MyMatrix.cols (mdl b) + (3 : ℤ) * flag = MyMatrix.rows (mdl ap) + MyMatrix.cols (mdl ap) + MyMatrix.cols (mdl bp) + (3 : ℤ) * (0 : ℤ) ∧ (0 : ℤ) ≤ flag ∧ (0 : ℤ) < flag) ∧ MyMatrix.cols (mdl ap) = MyMatrix.rows (mdl bp) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (MyMatrix.rows (mdl ap) = (1 : ℤ) ∨ MyMatrix.cols (mdl ap) = (1 : ℤ) ∨ MyMatrix.cols (mdl bp) = (1 : ℤ) ∨ Even (MyMatrix.rows (mdl ap)) ∧ Even (MyMatrix.cols (mdl ap)) ∧ Even (MyMatrix.cols (mdl bp)))) ∧ (∀(m : Matrix.matrix ℤ), mdl m = MatrixArithmetic.mul (mdl ap) (mdl bp) ∧ MyMatrix.rows (mdl m) = MyMatrix.rows (mdl ap) ∧ MyMatrix.cols (mdl m) = MyMatrix.cols (mdl bp) → (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + o3 ∧ (0 : ℤ) + o3 ≤ MyMatrix.rows (mdl ap)) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + o7 ∧ (0 : ℤ) + o7 ≤ MyMatrix.cols (mdl ap)) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + o3 ∧ (0 : ℤ) + o3 ≤ o3) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + o2 ∧ (0 : ℤ) + o2 ≤ o7) ∧ (BlockMul.block (BlockMul.block (mdl ap) (0 : ℤ) o3 (0 : ℤ) o7) (0 : ℤ) o3 (0 : ℤ) o2 = BlockMul.block (mdl ap) ((0 : ℤ) + (0 : ℤ)) o3 ((0 : ℤ) + (0 : ℤ)) o2 → (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + o3 ∧ (0 : ℤ) + o3 ≤ MyMatrix.rows (mdl ap)) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + o7 ∧ (0 : ℤ) + o7 ≤ MyMatrix.cols (mdl ap)) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + o3 ∧ (0 : ℤ) + o3 ≤ o3) ∧ (0 : ℤ) ≤ o2 ∧ o2 ≤ o2 + rm ∧ o2 + rm ≤ o7) ∧ (BlockMul.block (BlockMul.block (mdl ap) (0 : ℤ) o3 (0 : ℤ) o7) (0 : ℤ) o3 o2 rm = BlockMul.block (mdl ap) ((0 : ℤ) + (0 : ℤ)) o3 ((0 : ℤ) + o2) rm → (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + o7 ∧ (0 : ℤ) + o7 ≤ MyMatrix.rows (mdl bp)) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + o1 ∧ (0 : ℤ) + o1 ≤ MyMatrix.cols (mdl bp)) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + o2 ∧ (0 : ℤ) + o2 ≤ o7) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + o1 ∧ (0 : ℤ) + o1 ≤ o1) ∧ (BlockMul.block (BlockMul.block (mdl bp) (0 : ℤ) o7 (0 : ℤ) o1) (0 : ℤ) o2 (0 : ℤ) o1 = BlockMul.block (mdl bp) ((0 : ℤ) + (0 : ℤ)) o2 ((0 : ℤ) + (0 : ℤ)) o1 → (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + o7 ∧ (0 : ℤ) + o7 ≤ MyMatrix.rows (mdl bp)) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + o1 ∧ (0 : ℤ) + o1 ≤ MyMatrix.cols (mdl bp)) ∧ ((0 : ℤ) ≤ o2 ∧ o2 ≤ o2 + rm ∧ o2 + rm ≤ o7) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + o1 ∧ (0 : ℤ) + o1 ≤ o1) ∧ (BlockMul.block (BlockMul.block (mdl bp) (0 : ℤ) o7 (0 : ℤ) o1) o2 rm (0 : ℤ) o1 = BlockMul.block (mdl bp) ((0 : ℤ) + o2) rm ((0 : ℤ) + (0 : ℤ)) o1 → ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + o3 ∧ (0 : ℤ) + o3 ≤ MyMatrix.rows (mdl m)) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + o1 ∧ (0 : ℤ) + o1 ≤ MyMatrix.cols (mdl m))))))))) ∧ (∀(result : Matrix.matrix ℤ), (∃(ap : Matrix.matrix ℤ), (MyMatrix.rows (mdl ap) = o8 ∧ MyMatrix.cols (mdl ap) = o7 ∧ mdl a = BlockMul.block (mdl ap) (0 : ℤ) (MyMatrix.rows (mdl a)) (0 : ℤ) (MyMatrix.cols (mdl a)) ∧ (let dr : ℤ := o8 - MyMatrix.rows (mdl a); MyMatrix.create dr (MyMatrix.cols (mdl a)) MatrixArithmetic.zerof = BlockMul.block (mdl ap) (MyMatrix.rows (mdl a)) dr (0 : ℤ) (MyMatrix.cols (mdl a))) ∧ (let dc : ℤ := o7 - MyMatrix.cols (mdl a); MyMatrix.create (MyMatrix.rows (mdl a)) dc MatrixArithmetic.zerof = BlockMul.block (mdl ap) (0 : ℤ) (MyMatrix.rows (mdl a)) (MyMatrix.cols (mdl a)) dc)) ∧ (∃(bp : Matrix.matrix ℤ), (MyMatrix.rows (mdl bp) = o7 ∧ MyMatrix.cols (mdl bp) = o6 ∧ mdl b = BlockMul.block (mdl bp) (0 : ℤ) (MyMatrix.rows (mdl b)) (0 : ℤ) (MyMatrix.cols (mdl b)) ∧ (let dr : ℤ := o7 - MyMatrix.rows (mdl b); MyMatrix.create dr (MyMatrix.cols (mdl b)) MatrixArithmetic.zerof = BlockMul.block (mdl bp) (MyMatrix.rows (mdl b)) dr (0 : ℤ) (MyMatrix.cols (mdl b))) ∧ (let dc : ℤ := o6 - MyMatrix.cols (mdl b); MyMatrix.create (MyMatrix.rows (mdl b)) dc MatrixArithmetic.zerof = BlockMul.block (mdl bp) (0 : ℤ) (MyMatrix.rows (mdl b)) (MyMatrix.cols (mdl b)) dc)) ∧ (∃(m : Matrix.matrix ℤ), (mdl m = MatrixArithmetic.mul (mdl ap) (mdl bp) ∧ MyMatrix.rows (mdl m) = MyMatrix.rows (mdl ap) ∧ MyMatrix.cols (mdl m) = MyMatrix.cols (mdl bp)) ∧ BlockMul.block (BlockMul.block (mdl ap) (0 : ℤ) o3 (0 : ℤ) o7) (0 : ℤ) o3 (0 : ℤ) o2 = BlockMul.block (mdl ap) ((0 : ℤ) + (0 : ℤ)) o3 ((0 : ℤ) + (0 : ℤ)) o2 ∧ BlockMul.block (BlockMul.block (mdl ap) (0 : ℤ) o3 (0 : ℤ) o7) (0 : ℤ) o3 o2 rm = BlockMul.block (mdl ap) ((0 : ℤ) + (0 : ℤ)) o3 ((0 : ℤ) + o2) rm ∧ BlockMul.block (BlockMul.block (mdl bp) (0 : ℤ) o7 (0 : ℤ) o1) (0 : ℤ) o2 (0 : ℤ) o1 = BlockMul.block (mdl bp) ((0 : ℤ) + (0 : ℤ)) o2 ((0 : ℤ) + (0 : ℤ)) o1 ∧ BlockMul.block (BlockMul.block (mdl bp) (0 : ℤ) o7 (0 : ℤ) o1) o2 rm (0 : ℤ) o1 = BlockMul.block (mdl bp) ((0 : ℤ) + o2) rm ((0 : ℤ) + (0 : ℤ)) o1 ∧ mdl result = BlockMul.block (mdl m) (0 : ℤ) o3 (0 : ℤ) o1 ∧ MyMatrix.rows (mdl result) = o3 ∧ MyMatrix.cols (mdl result) = o1))) → mdl result = MatrixArithmetic.mul (mdl a) (mdl b) ∧ MyMatrix.rows (mdl result) = MyMatrix.rows (mdl a) ∧ MyMatrix.cols (mdl result) = MyMatrix.cols (mdl b)) else MyMatrix.cols (mdl a) = MyMatrix.rows (mdl b) ∧ (∀(gm : Matrix.matrix ℤ), MyMatrix.rows (mdl gm) = MyMatrix.rows (mdl a) ∧ MyMatrix.cols (mdl gm) = MyMatrix.cols (mdl b) ∧ mdl gm = MatrixArithmetic.mul (mdl a) (mdl b) → (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qr ∧ (0 : ℤ) + qr ≤ MyMatrix.rows (mdl gm)) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qc ∧ (0 : ℤ) + qc ≤ MyMatrix.cols (mdl gm)) ∧ (∀(gm11 : Matrix.matrix ℤ), mdl gm11 = BlockMul.block (mdl gm) (0 : ℤ) qr (0 : ℤ) qc ∧ MyMatrix.rows (mdl gm11) = qr ∧ MyMatrix.cols (mdl gm11) = qc → (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qr ∧ (0 : ℤ) + qr ≤ MyMatrix.rows (mdl gm)) ∧ (0 : ℤ) ≤ qc ∧ qc ≤ qc + qc ∧ qc + qc ≤ MyMatrix.cols (mdl gm)) ∧ (∀(gm12 : Matrix.matrix ℤ), mdl gm12 = BlockMul.block (mdl gm) (0 : ℤ) qr qc qc ∧ MyMatrix.rows (mdl gm12) = qr ∧ MyMatrix.cols (mdl gm12) = qc → (((0 : ℤ) ≤ qr ∧ qr ≤ qr + qr ∧ qr + qr ≤ MyMatrix.rows (mdl gm)) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qc ∧ (0 : ℤ) + qc ≤ MyMatrix.cols (mdl gm)) ∧ (∀(gm21 : Matrix.matrix ℤ), mdl gm21 = BlockMul.block (mdl gm) qr qr (0 : ℤ) qc ∧ MyMatrix.rows (mdl gm21) = qr ∧ MyMatrix.cols (mdl gm21) = qc → (((0 : ℤ) ≤ qr ∧ qr ≤ qr + qr ∧ qr + qr ≤ MyMatrix.rows (mdl gm)) ∧ (0 : ℤ) ≤ qc ∧ qc ≤ qc + qc ∧ qc + qc ≤ MyMatrix.cols (mdl gm)) ∧ (∀(gm22 : Matrix.matrix ℤ), mdl gm22 = BlockMul.block (mdl gm) qr qr qc qc ∧ MyMatrix.rows (mdl gm22) = qr ∧ MyMatrix.cols (mdl gm22) = qc → (∀(e : Symb.env), Symb.env.ev_c e = (0 : ℤ) → (∀(e1 : Symb.env) (a1 : with_symb) (b1 : with_symb), (with_symb_vld e1 a1 ∧ with_symb_vld e1 b1) ∧ (MyMatrix.rows (mdl (with_symb.phy a1)) = qr ∧ MyMatrix.cols (mdl (with_symb.phy a1)) = qm) ∧ MyMatrix.rows (mdl (with_symb.phy b1)) = qm ∧ MyMatrix.cols (mdl (with_symb.phy b1)) = qc → (∀(o6 : Bool), (if qr = (1 : ℤ) then o6 = true else if qm = (1 : ℤ) then o6 = true else o6 = (if qc = (1 : ℤ) then true else false)) → (∀(flag1 : ℤ), (if o6 = true then flag1 = (0 : ℤ) else flag1 = (1 : ℤ)) → (let o7 : Matrix.matrix ℤ := with_symb.phy b1; let o8 : Matrix.matrix ℤ := with_symb.phy a1; (((0 : ℤ) ≤ MyMatrix.rows (mdl a) + MyMatrix.cols (mdl a) + MyMatrix.cols (mdl b) + (3 : ℤ) * flag ∧ MyMatrix.rows (mdl o8) + MyMatrix.cols (mdl o8) + MyMatrix.cols (mdl o7) + (3 : ℤ) * flag1 < MyMatrix.rows (mdl a) + MyMatrix.cols (mdl a) + MyMatrix.cols (mdl b) + (3 : ℤ) * flag ∨ MyMatrix.rows (mdl a) + MyMatrix.cols (mdl a) + MyMatrix.cols (mdl b) + (3 : ℤ) * flag = MyMatrix.rows (mdl o8) + MyMatrix.cols (mdl o8) + MyMatrix.cols (mdl o7) + (3 : ℤ) * flag1 ∧ (0 : ℤ) ≤ flag ∧ flag1 < flag) ∧ MyMatrix.cols (mdl o8) = MyMatrix.rows (mdl o7) ∧ (0 : ℤ) ≤ flag1 ∧ (flag1 = (0 : ℤ) → MyMatrix.rows (mdl o8) = (1 : ℤ) ∨ MyMatrix.cols (mdl o8) = (1 : ℤ) ∨ MyMatrix.cols (mdl o7) = (1 : ℤ) ∨ Even (MyMatrix.rows (mdl o8)) ∧ Even (MyMatrix.cols (mdl o8)) ∧ Even (MyMatrix.cols (mdl o7)))) ∧ (∀(r : Matrix.matrix ℤ), mdl r = MatrixArithmetic.mul (mdl o8) (mdl o7) ∧ MyMatrix.rows (mdl r) = MyMatrix.rows (mdl o8) ∧ MyMatrix.cols (mdl r) = MyMatrix.cols (mdl o7) → (let o9 : Symb.expr := with_symb.sym b1; let o10 : Symb.expr := with_symb.sym a1; ((Symb.e_vld e1 o10 ∧ Symb.e_vld e1 o9) ∧ Symb.expr.e_cols o10 = Symb.expr.e_rows o9) ∧ (Symb.e_vld e1 (Symb.symb_mul o10 o9) ∧ Symb.e_mdl e1 (Symb.symb_mul o10 o9) = MatrixArithmetic.mul (Symb.e_mdl e1 o10) (Symb.e_mdl e1 o9) → with_symb_vld e1 (with_symb.mk r (Symb.symb_mul o10 o9)) ∧ mdl r = MatrixArithmetic.mul (mdl (with_symb.phy a1)) (mdl (with_symb.phy b1)) ∧ Symb.symb_mul o10 o9 = Symb.symb_mul (with_symb.sym a1) (with_symb.sym b1)))))))) ∧ (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qr ∧ (0 : ℤ) + qr ≤ MyMatrix.rows (mdl a)) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qm ∧ (0 : ℤ) + qm ≤ MyMatrix.cols (mdl a)) ∧ (∀(e1 : Symb.env) (a11 : with_symb), (let rm1 : MyMatrix.mat ℤ := mdl (with_symb.phy a11); rm1 = BlockMul.block (mdl a) (0 : ℤ) qr (0 : ℤ) qm ∧ MyMatrix.rows rm1 = qr ∧ MyMatrix.cols rm1 = qm) ∧ with_symb.sym a11 = Symb.symb_mat (mdl (with_symb.phy a11)) (Symb.env.ev_c e) ∧ Symb.env.ev_f e1 = Symb.extends1 (Symb.env.ev_f e) (Symb.env.ev_c e) (mdl (with_symb.phy a11)) ∧ Symb.env.ev_c e1 = Symb.env.ev_c e + (1 : ℤ) ∧ with_symb_vld e1 a11 → (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qr ∧ (0 : ℤ) + qr ≤ MyMatrix.rows (mdl a)) ∧ (0 : ℤ) ≤ qm ∧ qm ≤ qm + qm ∧ qm + qm ≤ MyMatrix.cols (mdl a)) ∧ (∀(e2 : Symb.env) (a12 : with_symb), (let rm1 : MyMatrix.mat ℤ := mdl (with_symb.phy a12); rm1 = BlockMul.block (mdl a) (0 : ℤ) qr qm qm ∧ MyMatrix.rows rm1 = qr ∧ MyMatrix.cols rm1 = qm) ∧ with_symb.sym a12 = Symb.symb_mat (mdl (with_symb.phy a12)) (Symb.env.ev_c e1) ∧ Symb.env.ev_f e2 = Symb.extends1 (Symb.env.ev_f e1) (Symb.env.ev_c e1) (mdl (with_symb.phy a12)) ∧ Symb.env.ev_c e2 = Symb.env.ev_c e1 + (1 : ℤ) ∧ with_symb_vld e2 a12 → (((0 : ℤ) ≤ qr ∧ qr ≤ qr + qr ∧ qr + qr ≤ MyMatrix.rows (mdl a)) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qm ∧ (0 : ℤ) + qm ≤ MyMatrix.cols (mdl a)) ∧ (∀(e3 : Symb.env) (a21 : with_symb), (let rm1 : MyMatrix.mat ℤ := mdl (with_symb.phy a21); rm1 = BlockMul.block (mdl a) qr qr (0 : ℤ) qm ∧ MyMatrix.rows rm1 = qr ∧ MyMatrix.cols rm1 = qm) ∧ with_symb.sym a21 = Symb.symb_mat (mdl (with_symb.phy a21)) (Symb.env.ev_c e2) ∧ Symb.env.ev_f e3 = Symb.extends1 (Symb.env.ev_f e2) (Symb.env.ev_c e2) (mdl (with_symb.phy a21)) ∧ Symb.env.ev_c e3 = Symb.env.ev_c e2 + (1 : ℤ) ∧ with_symb_vld e3 a21 → (((0 : ℤ) ≤ qr ∧ qr ≤ qr + qr ∧ qr + qr ≤ MyMatrix.rows (mdl a)) ∧ (0 : ℤ) ≤ qm ∧ qm ≤ qm + qm ∧ qm + qm ≤ MyMatrix.cols (mdl a)) ∧ (∀(e4 : Symb.env) (a22 : with_symb), (let rm1 : MyMatrix.mat ℤ := mdl (with_symb.phy a22); rm1 = BlockMul.block (mdl a) qr qr qm qm ∧ MyMatrix.rows rm1 = qr ∧ MyMatrix.cols rm1 = qm) ∧ with_symb.sym a22 = Symb.symb_mat (mdl (with_symb.phy a22)) (Symb.env.ev_c e3) ∧ Symb.env.ev_f e4 = Symb.extends1 (Symb.env.ev_f e3) (Symb.env.ev_c e3) (mdl (with_symb.phy a22)) ∧ Symb.env.ev_c e4 = Symb.env.ev_c e3 + (1 : ℤ) ∧ with_symb_vld e4 a22 → (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qr ∧ (0 : ℤ) + qr ≤ MyMatrix.rows (mdl a)) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + o2 ∧ (0 : ℤ) + o2 ≤ MyMatrix.cols (mdl a)) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qr ∧ (0 : ℤ) + qr ≤ qr) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qm ∧ (0 : ℤ) + qm ≤ o2) ∧ (BlockMul.block (BlockMul.block (mdl a) (0 : ℤ) qr (0 : ℤ) o2) (0 : ℤ) qr (0 : ℤ) qm = BlockMul.block (mdl a) ((0 : ℤ) + (0 : ℤ)) qr ((0 : ℤ) + (0 : ℤ)) qm → (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qr ∧ (0 : ℤ) + qr ≤ MyMatrix.rows (mdl a)) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + o2 ∧ (0 : ℤ) + o2 ≤ MyMatrix.cols (mdl a)) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qr ∧ (0 : ℤ) + qr ≤ qr) ∧ (0 : ℤ) ≤ qm ∧ qm ≤ qm + qm ∧ qm + qm ≤ o2) ∧ (BlockMul.block (BlockMul.block (mdl a) (0 : ℤ) qr (0 : ℤ) o2) (0 : ℤ) qr qm qm = BlockMul.block (mdl a) ((0 : ℤ) + (0 : ℤ)) qr ((0 : ℤ) + qm) qm → (((0 : ℤ) ≤ qr ∧ qr ≤ qr + qr ∧ qr + qr ≤ MyMatrix.rows (mdl a)) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + o2 ∧ (0 : ℤ) + o2 ≤ MyMatrix.cols (mdl a)) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qr ∧ (0 : ℤ) + qr ≤ qr) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qm ∧ (0 : ℤ) + qm ≤ o2) ∧ (BlockMul.block (BlockMul.block (mdl a) qr qr (0 : ℤ) o2) (0 : ℤ) qr (0 : ℤ) qm = BlockMul.block (mdl a) (qr + (0 : ℤ)) qr ((0 : ℤ) + (0 : ℤ)) qm → (((0 : ℤ) ≤ qr ∧ qr ≤ qr + qr ∧ qr + qr ≤ MyMatrix.rows (mdl a)) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + o2 ∧ (0 : ℤ) + o2 ≤ MyMatrix.cols (mdl a)) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qr ∧ (0 : ℤ) + qr ≤ qr) ∧ (0 : ℤ) ≤ qm ∧ qm ≤ qm + qm ∧ qm + qm ≤ o2) ∧ (BlockMul.block (BlockMul.block (mdl a) qr qr (0 : ℤ) o2) (0 : ℤ) qr qm qm = BlockMul.block (mdl a) (qr + (0 : ℤ)) qr ((0 : ℤ) + qm) qm → (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qm ∧ (0 : ℤ) + qm ≤ MyMatrix.rows (mdl b)) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qc ∧ (0 : ℤ) + qc ≤ MyMatrix.cols (mdl b)) ∧ (∀(e5 : Symb.env) (b11 : with_symb), (let rm1 : MyMatrix.mat ℤ := mdl (with_symb.phy b11); rm1 = BlockMul.block (mdl b) (0 : ℤ) qm (0 : ℤ) qc ∧ MyMatrix.rows rm1 = qm ∧ MyMatrix.cols rm1 = qc) ∧ with_symb.sym b11 = Symb.symb_mat (mdl (with_symb.phy b11)) (Symb.env.ev_c e4) ∧ Symb.env.ev_f e5 = Symb.extends1 (Symb.env.ev_f e4) (Symb.env.ev_c e4) (mdl (with_symb.phy b11)) ∧ Symb.env.ev_c e5 = Symb.env.ev_c e4 + (1 : ℤ) ∧ with_symb_vld e5 b11 → (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qm ∧ (0 : ℤ) + qm ≤ MyMatrix.rows (mdl b)) ∧ (0 : ℤ) ≤ qc ∧ qc ≤ qc + qc ∧ qc + qc ≤ MyMatrix.cols (mdl b)) ∧ (∀(e6 : Symb.env) (b12 : with_symb), (let rm1 : MyMatrix.mat ℤ := mdl (with_symb.phy b12); rm1 = BlockMul.block (mdl b) (0 : ℤ) qm qc qc ∧ MyMatrix.rows rm1 = qm ∧ MyMatrix.cols rm1 = qc) ∧ with_symb.sym b12 = Symb.symb_mat (mdl (with_symb.phy b12)) (Symb.env.ev_c e5) ∧ Symb.env.ev_f e6 = Symb.extends1 (Symb.env.ev_f e5) (Symb.env.ev_c e5) (mdl (with_symb.phy b12)) ∧ Symb.env.ev_c e6 = Symb.env.ev_c e5 + (1 : ℤ) ∧ with_symb_vld e6 b12 → (((0 : ℤ) ≤ qm ∧ qm ≤ qm + qm ∧ qm + qm ≤ MyMatrix.rows (mdl b)) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qc ∧ (0 : ℤ) + qc ≤ MyMatrix.cols (mdl b)) ∧ (∀(e7 : Symb.env) (b21 : with_symb), (let rm1 : MyMatrix.mat ℤ := mdl (with_symb.phy b21); rm1 = BlockMul.block (mdl b) qm qm (0 : ℤ) qc ∧ MyMatrix.rows rm1 = qm ∧ MyMatrix.cols rm1 = qc) ∧ with_symb.sym b21 = Symb.symb_mat (mdl (with_symb.phy b21)) (Symb.env.ev_c e6) ∧ Symb.env.ev_f e7 = Symb.extends1 (Symb.env.ev_f e6) (Symb.env.ev_c e6) (mdl (with_symb.phy b21)) ∧ Symb.env.ev_c e7 = Symb.env.ev_c e6 + (1 : ℤ) ∧ with_symb_vld e7 b21 → (((0 : ℤ) ≤ qm ∧ qm ≤ qm + qm ∧ qm + qm ≤ MyMatrix.rows (mdl b)) ∧ (0 : ℤ) ≤ qc ∧ qc ≤ qc + qc ∧ qc + qc ≤ MyMatrix.cols (mdl b)) ∧ (∀(e8 : Symb.env) (b22 : with_symb), (let rm1 : MyMatrix.mat ℤ := mdl (with_symb.phy b22); rm1 = BlockMul.block (mdl b) qm qm qc qc ∧ MyMatrix.rows rm1 = qm ∧ MyMatrix.cols rm1 = qc) ∧ with_symb.sym b22 = Symb.symb_mat (mdl (with_symb.phy b22)) (Symb.env.ev_c e7) ∧ Symb.env.ev_f e8 = Symb.extends1 (Symb.env.ev_f e7) (Symb.env.ev_c e7) (mdl (with_symb.phy b22)) ∧ Symb.env.ev_c e8 = Symb.env.ev_c e7 + (1 : ℤ) ∧ with_symb_vld e8 b22 → (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + o2 ∧ (0 : ℤ) + o2 ≤ MyMatrix.rows (mdl b)) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qc ∧ (0 : ℤ) + qc ≤ MyMatrix.cols (mdl b)) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qm ∧ (0 : ℤ) + qm ≤ o2) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qc ∧ (0 : ℤ) + qc ≤ qc) ∧ (BlockMul.block (BlockMul.block (mdl b) (0 : ℤ) o2 (0 : ℤ) qc) (0 : ℤ) qm (0 : ℤ) qc = BlockMul.block (mdl b) ((0 : ℤ) + (0 : ℤ)) qm ((0 : ℤ) + (0 : ℤ)) qc → (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + o2 ∧ (0 : ℤ) + o2 ≤ MyMatrix.rows (mdl b)) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qc ∧ (0 : ℤ) + qc ≤ MyMatrix.cols (mdl b)) ∧ ((0 : ℤ) ≤ qm ∧ qm ≤ qm + qm ∧ qm + qm ≤ o2) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qc ∧ (0 : ℤ) + qc ≤ qc) ∧ (BlockMul.block (BlockMul.block (mdl b) (0 : ℤ) o2 (0 : ℤ) qc) qm qm (0 : ℤ) qc = BlockMul.block (mdl b) ((0 : ℤ) + qm) qm ((0 : ℤ) + (0 : ℤ)) qc → (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + o2 ∧ (0 : ℤ) + o2 ≤ MyMatrix.rows (mdl b)) ∧ ((0 : ℤ) ≤ qc ∧ qc ≤ qc + qc ∧ qc + qc ≤ MyMatrix.cols (mdl b)) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qm ∧ (0 : ℤ) + qm ≤ o2) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qc ∧ (0 : ℤ) + qc ≤ qc) ∧ (BlockMul.block (BlockMul.block (mdl b) (0 : ℤ) o2 qc qc) (0 : ℤ) qm (0 : ℤ) qc = BlockMul.block (mdl b) ((0 : ℤ) + (0 : ℤ)) qm (qc + (0 : ℤ)) qc → (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + o2 ∧ (0 : ℤ) + o2 ≤ MyMatrix.rows (mdl b)) ∧ ((0 : ℤ) ≤ qc ∧ qc ≤ qc + qc ∧ qc + qc ≤ MyMatrix.cols (mdl b)) ∧ ((0 : ℤ) ≤ qm ∧ qm ≤ qm + qm ∧ qm + qm ≤ o2) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qc ∧ (0 : ℤ) + qc ≤ qc) ∧ (BlockMul.block (BlockMul.block (mdl b) (0 : ℤ) o2 qc qc) qm qm (0 : ℤ) qc = BlockMul.block (mdl b) ((0 : ℤ) + qm) qm (qc + (0 : ℤ)) qc → ((with_symb_vld e8 a12 ∧ with_symb_vld e8 b21) ∧ (MyMatrix.rows (mdl (with_symb.phy a12)) = qr ∧ MyMatrix.cols (mdl (with_symb.phy a12)) = qm) ∧ MyMatrix.rows (mdl (with_symb.phy b21)) = qm ∧ MyMatrix.cols (mdl (with_symb.phy b21)) = qc) ∧ (∀(o6 : with_symb), with_symb_vld e8 o6 ∧ mdl (with_symb.phy o6) = MatrixArithmetic.mul (mdl (with_symb.phy a12)) (mdl (with_symb.phy b21)) ∧ with_symb.sym o6 = Symb.symb_mul (with_symb.sym a12) (with_symb.sym b21) → ((with_symb_vld e8 a11 ∧ with_symb_vld e8 b11) ∧ (MyMatrix.rows (mdl (with_symb.phy a11)) = qr ∧ MyMatrix.cols (mdl (with_symb.phy a11)) = qm) ∧ MyMatrix.rows (mdl (with_symb.phy b11)) = qm ∧ MyMatrix.cols (mdl (with_symb.phy b11)) = qc) ∧ (∀(o7 : with_symb), with_symb_vld e8 o7 ∧ mdl (with_symb.phy o7) = MatrixArithmetic.mul (mdl (with_symb.phy a11)) (mdl (with_symb.phy b11)) ∧ with_symb.sym o7 = Symb.symb_mul (with_symb.sym a11) (with_symb.sym b11) → (MyMatrix.infix_eqeqeq (mdl (with_symb.phy o7)) (mdl (with_symb.phy o6)) ∧ with_symb_vld e8 o7 ∧ with_symb_vld e8 o6) ∧ (∀(o8 : with_symb), mdl (with_symb.phy o8) = MatrixArithmetic.add (mdl (with_symb.phy o7)) (mdl (with_symb.phy o6)) ∧ with_symb.sym o8 = Symb.symb_add (with_symb.sym o7) (with_symb.sym o6) ∧ with_symb_vld e8 o8 → ((with_symb_vld e8 a22 ∧ with_symb_vld e8 b21) ∧ (MyMatrix.rows (mdl (with_symb.phy a22)) = qr ∧ MyMatrix.cols (mdl (with_symb.phy a22)) = qm) ∧ MyMatrix.rows (mdl (with_symb.phy b21)) = qm ∧ MyMatrix.cols (mdl (with_symb.phy b21)) = qc) ∧ (∀(o9 : with_symb), with_symb_vld e8 o9 ∧ mdl (with_symb.phy o9) = MatrixArithmetic.mul (mdl (with_symb.phy a22)) (mdl (with_symb.phy b21)) ∧ with_symb.sym o9 = Symb.symb_mul (with_symb.sym a22) (with_symb.sym b21) → ((with_symb_vld e8 a21 ∧ with_symb_vld e8 b11) ∧ (MyMatrix.rows (mdl (with_symb.phy a21)) = qr ∧ MyMatrix.cols (mdl (with_symb.phy a21)) = qm) ∧ MyMatrix.rows (mdl (with_symb.phy b11)) = qm ∧ MyMatrix.cols (mdl (with_symb.phy b11)) = qc) ∧ (∀(o10 : with_symb), with_symb_vld e8 o10 ∧ mdl (with_symb.phy o10) = MatrixArithmetic.mul (mdl (with_symb.phy a21)) (mdl (with_symb.phy b11)) ∧ with_symb.sym o10 = Symb.symb_mul (with_symb.sym a21) (with_symb.sym b11) → (MyMatrix.infix_eqeqeq (mdl (with_symb.phy o10)) (mdl (with_symb.phy o9)) ∧ with_symb_vld e8 o10 ∧ with_symb_vld e8 o9) ∧ (∀(o11 : with_symb), mdl (with_symb.phy o11) = MatrixArithmetic.add (mdl (with_symb.phy o10)) (mdl (with_symb.phy o9)) ∧ with_symb.sym o11 = Symb.symb_add (with_symb.sym o10) (with_symb.sym o9) ∧ with_symb_vld e8 o11 → ((with_symb_vld e8 a12 ∧ with_symb_vld e8 b22) ∧ (MyMatrix.rows (mdl (with_symb.phy a12)) = qr ∧ MyMatrix.cols (mdl (with_symb.phy a12)) = qm) ∧ MyMatrix.rows (mdl (with_symb.phy b22)) = qm ∧ MyMatrix.cols (mdl (with_symb.phy b22)) = qc) ∧ (∀(o12 : with_symb), with_symb_vld e8 o12 ∧ mdl (with_symb.phy o12) = MatrixArithmetic.mul (mdl (with_symb.phy a12)) (mdl (with_symb.phy b22)) ∧ with_symb.sym o12 = Symb.symb_mul (with_symb.sym a12) (with_symb.sym b22) → ((with_symb_vld e8 a11 ∧ with_symb_vld e8 b12) ∧ (MyMatrix.rows (mdl (with_symb.phy a11)) = qr ∧ MyMatrix.cols (mdl (with_symb.phy a11)) = qm) ∧ MyMatrix.rows (mdl (with_symb.phy b12)) = qm ∧ MyMatrix.cols (mdl (with_symb.phy b12)) = qc) ∧ (∀(o13 : with_symb), with_symb_vld e8 o13 ∧ mdl (with_symb.phy o13) = MatrixArithmetic.mul (mdl (with_symb.phy a11)) (mdl (with_symb.phy b12)) ∧ with_symb.sym o13 = Symb.symb_mul (with_symb.sym a11) (with_symb.sym b12) → (MyMatrix.infix_eqeqeq (mdl (with_symb.phy o13)) (mdl (with_symb.phy o12)) ∧ with_symb_vld e8 o13 ∧ with_symb_vld e8 o12) ∧ (∀(o14 : with_symb), mdl (with_symb.phy o14) = MatrixArithmetic.add (mdl (with_symb.phy o13)) (mdl (with_symb.phy o12)) ∧ with_symb.sym o14 = Symb.symb_add (with_symb.sym o13) (with_symb.sym o12) ∧ with_symb_vld e8 o14 → ((with_symb_vld e8 a22 ∧ with_symb_vld e8 b22) ∧ (MyMatrix.rows (mdl (with_symb.phy a22)) = qr ∧ MyMatrix.cols (mdl (with_symb.phy a22)) = qm) ∧ MyMatrix.rows (mdl (with_symb.phy b22)) = qm ∧ MyMatrix.cols (mdl (with_symb.phy b22)) = qc) ∧ (∀(o15 : with_symb), with_symb_vld e8 o15 ∧ mdl (with_symb.phy o15) = MatrixArithmetic.mul (mdl (with_symb.phy a22)) (mdl (with_symb.phy b22)) ∧ with_symb.sym o15 = Symb.symb_mul (with_symb.sym a22) (with_symb.sym b22) → ((with_symb_vld e8 a21 ∧ with_symb_vld e8 b12) ∧ (MyMatrix.rows (mdl (with_symb.phy a21)) = qr ∧ MyMatrix.cols (mdl (with_symb.phy a21)) = qm) ∧ MyMatrix.rows (mdl (with_symb.phy b12)) = qm ∧ MyMatrix.cols (mdl (with_symb.phy b12)) = qc) ∧ (∀(o16 : with_symb), with_symb_vld e8 o16 ∧ mdl (with_symb.phy o16) = MatrixArithmetic.mul (mdl (with_symb.phy a21)) (mdl (with_symb.phy b12)) ∧ with_symb.sym o16 = Symb.symb_mul (with_symb.sym a21) (with_symb.sym b12) → (MyMatrix.infix_eqeqeq (mdl (with_symb.phy o16)) (mdl (with_symb.phy o15)) ∧ with_symb_vld e8 o16 ∧ with_symb_vld e8 o15) ∧ (∀(o17 : with_symb), mdl (with_symb.phy o17) = MatrixArithmetic.add (mdl (with_symb.phy o16)) (mdl (with_symb.phy o15)) ∧ with_symb.sym o17 = Symb.symb_add (with_symb.sym o16) (with_symb.sym o15) ∧ with_symb_vld e8 o17 → (MyMatrix.infix_eqeqeq (mdl (with_symb.phy b11)) (mdl (with_symb.phy b22)) ∧ with_symb_vld e8 b11 ∧ with_symb_vld e8 b22) ∧ (∀(o18 : with_symb), mdl (with_symb.phy o18) = MatrixArithmetic.add (mdl (with_symb.phy b11)) (mdl (with_symb.phy b22)) ∧ with_symb.sym o18 = Symb.symb_add (with_symb.sym b11) (with_symb.sym b22) ∧ with_symb_vld e8 o18 → (MyMatrix.infix_eqeqeq (mdl (with_symb.phy a11)) (mdl (with_symb.phy a22)) ∧ with_symb_vld e8 a11 ∧ with_symb_vld e8 a22) ∧ (∀(o19 : with_symb), mdl (with_symb.phy o19) = MatrixArithmetic.add (mdl (with_symb.phy a11)) (mdl (with_symb.phy a22)) ∧ with_symb.sym o19 = Symb.symb_add (with_symb.sym a11) (with_symb.sym a22) ∧ with_symb_vld e8 o19 → ((with_symb_vld e8 o19 ∧ with_symb_vld e8 o18) ∧ (MyMatrix.rows (mdl (with_symb.phy o19)) = qr ∧ MyMatrix.cols (mdl (with_symb.phy o19)) = qm) ∧ MyMatrix.rows (mdl (with_symb.phy o18)) = qm ∧ MyMatrix.cols (mdl (with_symb.phy o18)) = qc) ∧ (∀(x1 : with_symb), with_symb_vld e8 x1 ∧ mdl (with_symb.phy x1) = MatrixArithmetic.mul (mdl (with_symb.phy o19)) (mdl (with_symb.phy o18)) ∧ with_symb.sym x1 = Symb.symb_mul (with_symb.sym o19) (with_symb.sym o18) → (MyMatrix.infix_eqeqeq (mdl (with_symb.phy a21)) (mdl (with_symb.phy a22)) ∧ with_symb_vld e8 a21 ∧ with_symb_vld e8 a22) ∧ (∀(o20 : with_symb), mdl (with_symb.phy o20) = MatrixArithmetic.add (mdl (with_symb.phy a21)) (mdl (with_symb.phy a22)) ∧ with_symb.sym o20 = Symb.symb_add (with_symb.sym a21) (with_symb.sym a22) ∧ with_symb_vld e8 o20 → ((with_symb_vld e8 o20 ∧ with_symb_vld e8 b11) ∧ (MyMatrix.rows (mdl (with_symb.phy o20)) = qr ∧ MyMatrix.cols (mdl (with_symb.phy o20)) = qm) ∧ MyMatrix.rows (mdl (with_symb.phy b11)) = qm ∧ MyMatrix.cols (mdl (with_symb.phy b11)) = qc) ∧ (∀(x2 : with_symb), with_symb_vld e8 x2 ∧ mdl (with_symb.phy x2) = MatrixArithmetic.mul (mdl (with_symb.phy o20)) (mdl (with_symb.phy b11)) ∧ with_symb.sym x2 = Symb.symb_mul (with_symb.sym o20) (with_symb.sym b11) → (MyMatrix.infix_eqeqeq (mdl (with_symb.phy b12)) (mdl (with_symb.phy b22)) ∧ with_symb_vld e8 b12 ∧ with_symb_vld e8 b22) ∧ (∀(o21 : with_symb), mdl (with_symb.phy o21) = MatrixArithmetic.sub (mdl (with_symb.phy b12)) (mdl (with_symb.phy b22)) ∧ with_symb.sym o21 = Symb.symb_sub (with_symb.sym b12) (with_symb.sym b22) ∧ with_symb_vld e8 o21 → ((with_symb_vld e8 a11 ∧ with_symb_vld e8 o21) ∧ (MyMatrix.rows (mdl (with_symb.phy a11)) = qr ∧ MyMatrix.cols (mdl (with_symb.phy a11)) = qm) ∧ MyMatrix.rows (mdl (with_symb.phy o21)) = qm ∧ MyMatrix.cols (mdl (with_symb.phy o21)) = qc) ∧ (∀(x3 : with_symb), with_symb_vld e8 x3 ∧ mdl (with_symb.phy x3) = MatrixArithmetic.mul (mdl (with_symb.phy a11)) (mdl (with_symb.phy o21)) ∧ with_symb.sym x3 = Symb.symb_mul (with_symb.sym a11) (with_symb.sym o21) → (MyMatrix.infix_eqeqeq (mdl (with_symb.phy b21)) (mdl (with_symb.phy b11)) ∧ with_symb_vld e8 b21 ∧ with_symb_vld e8 b11) ∧ (∀(o22 : with_symb), mdl (with_symb.phy o22) = MatrixArithmetic.sub (mdl (with_symb.phy b21)) (mdl (with_symb.phy b11)) ∧ with_symb.sym o22 = Symb.symb_sub (with_symb.sym b21) (with_symb.sym b11) ∧ with_symb_vld e8 o22 → ((with_symb_vld e8 a22 ∧ with_symb_vld e8 o22) ∧ (MyMatrix.rows (mdl (with_symb.phy a22)) = qr ∧ MyMatrix.cols (mdl (with_symb.phy a22)) = qm) ∧ MyMatrix.rows (mdl (with_symb.phy o22)) = qm ∧ MyMatrix.cols (mdl (with_symb.phy o22)) = qc) ∧ (∀(x4 : with_symb), with_symb_vld e8 x4 ∧ mdl (with_symb.phy x4) = MatrixArithmetic.mul (mdl (with_symb.phy a22)) (mdl (with_symb.phy o22)) ∧ with_symb.sym x4 = Symb.symb_mul (with_symb.sym a22) (with_symb.sym o22) → (MyMatrix.infix_eqeqeq (mdl (with_symb.phy a11)) (mdl (with_symb.phy a12)) ∧ with_symb_vld e8 a11 ∧ with_symb_vld e8 a12) ∧ (∀(o23 : with_symb), mdl (with_symb.phy o23) = MatrixArithmetic.add (mdl (with_symb.phy a11)) (mdl (with_symb.phy a12)) ∧ with_symb.sym o23 = Symb.symb_add (with_symb.sym a11) (with_symb.sym a12) ∧ with_symb_vld e8 o23 → ((with_symb_vld e8 o23 ∧ with_symb_vld e8 b22) ∧ (MyMatrix.rows (mdl (with_symb.phy o23)) = qr ∧ MyMatrix.cols (mdl (with_symb.phy o23)) = qm) ∧ MyMatrix.rows (mdl (with_symb.phy b22)) = qm ∧ MyMatrix.cols (mdl (with_symb.phy b22)) = qc) ∧ (∀(x5 : with_symb), with_symb_vld e8 x5 ∧ mdl (with_symb.phy x5) = MatrixArithmetic.mul (mdl (with_symb.phy o23)) (mdl (with_symb.phy b22)) ∧ with_symb.sym x5 = Symb.symb_mul (with_symb.sym o23) (with_symb.sym b22) → (MyMatrix.infix_eqeqeq (mdl (with_symb.phy b11)) (mdl (with_symb.phy b12)) ∧ with_symb_vld e8 b11 ∧ with_symb_vld e8 b12) ∧ (∀(o24 : with_symb), mdl (with_symb.phy o24) = MatrixArithmetic.add (mdl (with_symb.phy b11)) (mdl (with_symb.phy b12)) ∧ with_symb.sym o24 = Symb.symb_add (with_symb.sym b11) (with_symb.sym b12) ∧ with_symb_vld e8 o24 → (MyMatrix.infix_eqeqeq (mdl (with_symb.phy a21)) (mdl (with_symb.phy a11)) ∧ with_symb_vld e8 a21 ∧ with_symb_vld e8 a11) ∧ (∀(o25 : with_symb), mdl (with_symb.phy o25) = MatrixArithmetic.sub (mdl (with_symb.phy a21)) (mdl (with_symb.phy a11)) ∧ with_symb.sym o25 = Symb.symb_sub (with_symb.sym a21) (with_symb.sym a11) ∧ with_symb_vld e8 o25 → ((with_symb_vld e8 o25 ∧ with_symb_vld e8 o24) ∧ (MyMatrix.rows (mdl (with_symb.phy o25)) = qr ∧ MyMatrix.cols (mdl (with_symb.phy o25)) = qm) ∧ MyMatrix.rows (mdl (with_symb.phy o24)) = qm ∧ MyMatrix.cols (mdl (with_symb.phy o24)) = qc) ∧ (∀(x6 : with_symb), with_symb_vld e8 x6 ∧ mdl (with_symb.phy x6) = MatrixArithmetic.mul (mdl (with_symb.phy o25)) (mdl (with_symb.phy o24)) ∧ with_symb.sym x6 = Symb.symb_mul (with_symb.sym o25) (with_symb.sym o24) → (MyMatrix.infix_eqeqeq (mdl (with_symb.phy b21)) (mdl (with_symb.phy b22)) ∧ with_symb_vld e8 b21 ∧ with_symb_vld e8 b22) ∧ (∀(o26 : with_symb), mdl (with_symb.phy o26) = MatrixArithmetic.add (mdl (with_symb.phy b21)) (mdl (with_symb.phy b22)) ∧ with_symb.sym o26 = Symb.symb_add (with_symb.sym b21) (with_symb.sym b22) ∧ with_symb_vld e8 o26 → (MyMatrix.infix_eqeqeq (mdl (with_symb.phy a12)) (mdl (with_symb.phy a22)) ∧ with_symb_vld e8 a12 ∧ with_symb_vld e8 a22) ∧ (∀(o27 : with_symb), mdl (with_symb.phy o27) = MatrixArithmetic.sub (mdl (with_symb.phy a12)) (mdl (with_symb.phy a22)) ∧ with_symb.sym o27 = Symb.symb_sub (with_symb.sym a12) (with_symb.sym a22) ∧ with_symb_vld e8 o27 → ((with_symb_vld e8 o27 ∧ with_symb_vld e8 o26) ∧ (MyMatrix.rows (mdl (with_symb.phy o27)) = qr ∧ MyMatrix.cols (mdl (with_symb.phy o27)) = qm) ∧ MyMatrix.rows (mdl (with_symb.phy o26)) = qm ∧ MyMatrix.cols (mdl (with_symb.phy o26)) = qc) ∧ (∀(x7 : with_symb), with_symb_vld e8 x7 ∧ mdl (with_symb.phy x7) = MatrixArithmetic.mul (mdl (with_symb.phy o27)) (mdl (with_symb.phy o26)) ∧ with_symb.sym x7 = Symb.symb_mul (with_symb.sym o27) (with_symb.sym o26) → (MyMatrix.infix_eqeqeq (mdl (with_symb.phy x1)) (mdl (with_symb.phy x4)) ∧ with_symb_vld e8 x1 ∧ with_symb_vld e8 x4) ∧ (∀(o28 : with_symb), mdl (with_symb.phy o28) = MatrixArithmetic.add (mdl (with_symb.phy x1)) (mdl (with_symb.phy x4)) ∧ with_symb.sym o28 = Symb.symb_add (with_symb.sym x1) (with_symb.sym x4) ∧ with_symb_vld e8 o28 → (MyMatrix.infix_eqeqeq (mdl (with_symb.phy o28)) (mdl (with_symb.phy x5)) ∧ with_symb_vld e8 o28 ∧ with_symb_vld e8 x5) ∧ (∀(o29 : with_symb), mdl (with_symb.phy o29) = MatrixArithmetic.sub (mdl (with_symb.phy o28)) (mdl (with_symb.phy x5)) ∧ with_symb.sym o29 = Symb.symb_sub (with_symb.sym o28) (with_symb.sym x5) ∧ with_symb_vld e8 o29 → (MyMatrix.infix_eqeqeq (mdl (with_symb.phy o29)) (mdl (with_symb.phy x7)) ∧ with_symb_vld e8 o29 ∧ with_symb_vld e8 x7) ∧ (∀(m11 : with_symb), mdl (with_symb.phy m11) = MatrixArithmetic.add (mdl (with_symb.phy o29)) (mdl (with_symb.phy x7)) ∧ with_symb.sym m11 = Symb.symb_add (with_symb.sym o29) (with_symb.sym x7) ∧ with_symb_vld e8 m11 → (MyMatrix.infix_eqeqeq (mdl (with_symb.phy x3)) (mdl (with_symb.phy x5)) ∧ with_symb_vld e8 x3 ∧ with_symb_vld e8 x5) ∧ (∀(m12 : with_symb), mdl (with_symb.phy m12) = MatrixArithmetic.add (mdl (with_symb.phy x3)) (mdl (with_symb.phy x5)) ∧ with_symb.sym m12 = Symb.symb_add (with_symb.sym x3) (with_symb.sym x5) ∧ with_symb_vld e8 m12 → (MyMatrix.infix_eqeqeq (mdl (with_symb.phy x2)) (mdl (with_symb.phy x4)) ∧ with_symb_vld e8 x2 ∧ with_symb_vld e8 x4) ∧ (∀(m21 : with_symb), mdl (with_symb.phy m21) = MatrixArithmetic.add (mdl (with_symb.phy x2)) (mdl (with_symb.phy x4)) ∧ with_symb.sym m21 = Symb.symb_add (with_symb.sym x2) (with_symb.sym x4) ∧ with_symb_vld e8 m21 → (MyMatrix.infix_eqeqeq (mdl (with_symb.phy x1)) (mdl (with_symb.phy x2)) ∧ with_symb_vld e8 x1 ∧ with_symb_vld e8 x2) ∧ (∀(o30 : with_symb), mdl (with_symb.phy o30) = MatrixArithmetic.sub (mdl (with_symb.phy x1)) (mdl (with_symb.phy x2)) ∧ with_symb.sym o30 = Symb.symb_sub (with_symb.sym x1) (with_symb.sym x2) ∧ with_symb_vld e8 o30 → (MyMatrix.infix_eqeqeq (mdl (with_symb.phy o30)) (mdl (with_symb.phy x3)) ∧ with_symb_vld e8 o30 ∧ with_symb_vld e8 x3) ∧ (∀(o31 : with_symb), mdl (with_symb.phy o31) = MatrixArithmetic.add (mdl (with_symb.phy o30)) (mdl (with_symb.phy x3)) ∧ with_symb.sym o31 = Symb.symb_add (with_symb.sym o30) (with_symb.sym x3) ∧ with_symb_vld e8 o31 → (MyMatrix.infix_eqeqeq (mdl (with_symb.phy o31)) (mdl (with_symb.phy x6)) ∧ with_symb_vld e8 o31 ∧ with_symb_vld e8 x6) ∧ (∀(m22 : with_symb), mdl (with_symb.phy m22) = MatrixArithmetic.add (mdl (with_symb.phy o31)) (mdl (with_symb.phy x6)) ∧ with_symb.sym m22 = Symb.symb_add (with_symb.sym o31) (with_symb.sym x6) ∧ with_symb_vld e8 m22 → mdl (with_symb.phy m11) = mdl gm11 ∧ mdl (with_symb.phy m12) = mdl gm12 ∧ mdl (with_symb.phy m21) = mdl gm21 ∧ mdl (with_symb.phy m22) = mdl gm22)))))))))))))))))))))))))))))))))))))))))))))))))))))) ∧ (∀(m11 : Matrix.matrix ℤ) (m12 : Matrix.matrix ℤ) (m21 : Matrix.matrix ℤ) (m22 : Matrix.matrix ℤ), mdl m11 = mdl gm11 ∧ mdl m12 = mdl gm12 ∧ mdl m21 = mdl gm21 ∧ mdl m22 = mdl gm22 → (let o6 : ℤ := Matrix.columns b; let o7 : ℤ := Matrix.rows a; ((0 : ℤ) ≤ o7 ∧ (0 : ℤ) ≤ o6) ∧ (∀(res : Matrix.matrix ℤ), Matrix.rows res = o7 ∧ Matrix.columns res = o6 ∧ (∀(i : ℤ) (j : ℤ), ((0 : ℤ) ≤ i ∧ i < o7) ∧ (0 : ℤ) ≤ j ∧ j < o6 → Matrix.elts res i j = (0 : ℤ)) → (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qr ∧ (0 : ℤ) + qr ≤ Matrix.rows m11) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qc ∧ (0 : ℤ) + qc ≤ Matrix.columns m11) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qr ∧ (0 : ℤ) + qr ≤ Matrix.rows res) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qc ∧ (0 : ℤ) + qc ≤ Matrix.columns res) ∧ (∀(res1 : Matrix.matrix ℤ), Matrix.rows res1 = Matrix.rows res ∧ Matrix.columns res1 = Matrix.columns res → (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) + qr → (0 : ℤ) ≤ j ∧ j < (0 : ℤ) + qc → Matrix.elts res1 i j = Matrix.elts m11 (i + ((0 : ℤ) - (0 : ℤ))) (j + ((0 : ℤ) - (0 : ℤ)))) ∧ (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < Matrix.rows res1 → (0 : ℤ) ≤ j ∧ j < Matrix.columns res1 → ¬(((0 : ℤ) ≤ i ∧ i < (0 : ℤ) + qr) ∧ (0 : ℤ) ≤ j ∧ j < (0 : ℤ) + qc) → Matrix.elts res1 i j = Matrix.elts res i j) → (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qr ∧ (0 : ℤ) + qr ≤ Matrix.rows m12) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qc ∧ (0 : ℤ) + qc ≤ Matrix.columns m12) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qr ∧ (0 : ℤ) + qr ≤ Matrix.rows res1) ∧ (0 : ℤ) ≤ qc ∧ qc ≤ qc + qc ∧ qc + qc ≤ Matrix.columns res1) ∧ (∀(res2 : Matrix.matrix ℤ), Matrix.rows res2 = Matrix.rows res1 ∧ Matrix.columns res2 = Matrix.columns res1 → (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) + qr → qc ≤ j ∧ j < qc + qc → Matrix.elts res2 i j = Matrix.elts m12 (i + ((0 : ℤ) - (0 : ℤ))) (j + ((0 : ℤ) - qc))) ∧ (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < Matrix.rows res2 → (0 : ℤ) ≤ j ∧ j < Matrix.columns res2 → ¬(((0 : ℤ) ≤ i ∧ i < (0 : ℤ) + qr) ∧ qc ≤ j ∧ j < qc + qc) → Matrix.elts res2 i j = Matrix.elts res1 i j) → (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qr ∧ (0 : ℤ) + qr ≤ Matrix.rows m21) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qc ∧ (0 : ℤ) + qc ≤ Matrix.columns m21) ∧ ((0 : ℤ) ≤ qr ∧ qr ≤ qr + qr ∧ qr + qr ≤ Matrix.rows res2) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qc ∧ (0 : ℤ) + qc ≤ Matrix.columns res2) ∧ (∀(res3 : Matrix.matrix ℤ), Matrix.rows res3 = Matrix.rows res2 ∧ Matrix.columns res3 = Matrix.columns res2 → (∀(i : ℤ) (j : ℤ), qr ≤ i ∧ i < qr + qr → (0 : ℤ) ≤ j ∧ j < (0 : ℤ) + qc → Matrix.elts res3 i j = Matrix.elts m21 (i + ((0 : ℤ) - qr)) (j + ((0 : ℤ) - (0 : ℤ)))) ∧ (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < Matrix.rows res3 → (0 : ℤ) ≤ j ∧ j < Matrix.columns res3 → ¬((qr ≤ i ∧ i < qr + qr) ∧ (0 : ℤ) ≤ j ∧ j < (0 : ℤ) + qc) → Matrix.elts res3 i j = Matrix.elts res2 i j) → (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qr ∧ (0 : ℤ) + qr ≤ Matrix.rows m22) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + qc ∧ (0 : ℤ) + qc ≤ Matrix.columns m22) ∧ ((0 : ℤ) ≤ qr ∧ qr ≤ qr + qr ∧ qr + qr ≤ Matrix.rows res3) ∧ (0 : ℤ) ≤ qc ∧ qc ≤ qc + qc ∧ qc + qc ≤ Matrix.columns res3) ∧ (∀(res4 : Matrix.matrix ℤ), Matrix.rows res4 = Matrix.rows res3 ∧ Matrix.columns res4 = Matrix.columns res3 → (∀(i : ℤ) (j : ℤ), qr ≤ i ∧ i < qr + qr → qc ≤ j ∧ j < qc + qc → Matrix.elts res4 i j = Matrix.elts m22 (i + ((0 : ℤ) - qr)) (j + ((0 : ℤ) - qc))) ∧ (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < Matrix.rows res4 → (0 : ℤ) ≤ j ∧ j < Matrix.columns res4 → ¬((qr ≤ i ∧ i < qr + qr) ∧ qc ≤ j ∧ j < qc + qc) → Matrix.elts res4 i j = Matrix.elts res3 i j) → mdl res4 = MatrixArithmetic.mul (mdl a) (mdl b) ∧ MyMatrix.rows (mdl res4) = MyMatrix.rows (mdl a) ∧ MyMatrix.cols (mdl res4) = MyMatrix.cols (mdl b)))))))))))))))))))))
  := sorry
end my_strassen_MatrixMultiplication_strassenqtvc
