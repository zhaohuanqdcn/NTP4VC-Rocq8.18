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
namespace matrices_ring_simp_Symb_lm_dump_okqtvc
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
theorem lm_dump_ok'vc (r : ℤ) (c : ℤ) (f : ℤ -> MyMatrix.mat ℤ) (acc : List mono) (l : List mono) (x : mono) (fact0 : (0 : ℤ) ≤ r) (fact1 : (0 : ℤ) ≤ c) (fact2 : lm_vld f r c acc) (fact3 : lm_vld f r c l) : (match l with | ([] : List mono) => True | List.cons y q => ¬m_lower x y → ((lm_vld f r c acc ∧ l_vld f r c (mono.m_prod y)) ∧ (0 : ℤ) ≤ r ∧ (0 : ℤ) ≤ c) ∧ (let o1 : List mono := m_collapse acc y; lm_vld f r c o1 ∧ lm_mdl f r c o1 = MatrixArithmetic.add (lm_mdl f r c acc) (m_mdl f y) → (match l with | ([] : List mono) => False | List.cons _ f1 => f1 = q) ∧ ((0 : ℤ) ≤ r ∧ (0 : ℤ) ≤ c) ∧ lm_vld f r c o1 ∧ lm_vld f r c q)) ∧ (∀(acc2 : List mono) (l2 : List mono), let result : List mono × List mono := (acc2, l2); (match l with | ([] : List mono) => acc2 = acc ∧ l2 = ([] : List mono) | List.cons y q => (if m_lower x y then acc2 = acc ∧ l2 = l else let o1 : List mono := m_collapse acc y; (lm_vld f r c o1 ∧ lm_mdl f r c o1 = MatrixArithmetic.add (lm_mdl f r c acc) (m_mdl f y)) ∧ result = lm_dump x o1 q ∧ lm_vld f r c acc2 ∧ lm_vld f r c l2 ∧ MatrixArithmetic.add (lm_mdl f r c acc2) (lm_mdl f r c l2) = MatrixArithmetic.add (lm_mdl f r c o1) (lm_mdl f r c q))) → result = lm_dump x acc l ∧ lm_vld f r c acc2 ∧ lm_vld f r c l2 ∧ MatrixArithmetic.add (lm_mdl f r c acc2) (lm_mdl f r c l2) = MatrixArithmetic.add (lm_mdl f r c acc) (lm_mdl f r c l))
  := sorry
end matrices_ring_simp_Symb_lm_dump_okqtvc
