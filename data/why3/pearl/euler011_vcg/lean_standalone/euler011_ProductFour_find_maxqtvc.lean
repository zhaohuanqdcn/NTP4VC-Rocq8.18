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
namespace euler011_ProductFour_find_maxqtvc
inductive direction where
  | Left_bottom : direction
  | Right_bottom : direction
  | Bottom : direction
  | Right : direction
axiom inhabited_axiom_direction : Inhabited direction
attribute [instance] inhabited_axiom_direction
noncomputable def left_diag (m : Matrix.matrix ℤ) (i : ℤ) (j : ℤ) := if i < Matrix.rows m ∧ (0 : ℤ) ≤ j ∧ (3 : ℤ) ≤ i ∧ j < Matrix.columns m - (3 : ℤ) then Option.some (Matrix.elts m i j * Matrix.elts m (i - (1 : ℤ)) (j + (1 : ℤ)) * Matrix.elts m (i - (2 : ℤ)) (j + (2 : ℤ)) * Matrix.elts m (i - (3 : ℤ)) (j + (3 : ℤ))) else Option.none
noncomputable def right_diag (m : Matrix.matrix ℤ) (i : ℤ) (j : ℤ) := if i < Matrix.rows m - (3 : ℤ) ∧ (0 : ℤ) ≤ i ∧ j < Matrix.columns m - (3 : ℤ) ∧ (0 : ℤ) ≤ j then Option.some (Matrix.elts m i j * Matrix.elts m (i + (1 : ℤ)) (j + (1 : ℤ)) * Matrix.elts m (i + (2 : ℤ)) (j + (2 : ℤ)) * Matrix.elts m (i + (3 : ℤ)) (j + (3 : ℤ))) else Option.none
noncomputable def line (m : Matrix.matrix ℤ) (i : ℤ) (j : ℤ) := if ((0 : ℤ) ≤ j ∧ j < Matrix.columns m) ∧ (0 : ℤ) ≤ i ∧ i < Matrix.rows m - (3 : ℤ) then Option.some (Matrix.elts m i j * Matrix.elts m (i + (1 : ℤ)) j * Matrix.elts m (i + (2 : ℤ)) j * Matrix.elts m (i + (3 : ℤ)) j) else Option.none
noncomputable def column (m : Matrix.matrix ℤ) (i : ℤ) (j : ℤ) := if ((0 : ℤ) ≤ i ∧ i < Matrix.rows m) ∧ (0 : ℤ) ≤ j ∧ j < Matrix.columns m - (3 : ℤ) then Option.some (Matrix.elts m i j * Matrix.elts m i (j + (1 : ℤ)) * Matrix.elts m i (j + (2 : ℤ)) * Matrix.elts m i (j + (3 : ℤ))) else Option.none
noncomputable def compute4 (m : Matrix.matrix ℤ) (i : ℤ) (j : ℤ) (d : direction) := if d = direction.Left_bottom then left_diag m i j else if d = direction.Right_bottom then right_diag m i j else if d = direction.Bottom then column m i j else if d = direction.Right then line m i j else Option.none
theorem find_max'vc (m : Matrix.matrix ℤ) (o1 : ℤ) (fact0 : (4 : ℤ) < Matrix.rows m) (fact1 : (4 : ℤ) < Matrix.columns m) (fact2 : match line m (0 : ℤ) (0 : ℤ) with | Option.none => o1 = (0 : ℤ) | Option.some v => o1 = v) : let o2 : ℤ := Matrix.rows m - (1 : ℤ); ((0 : ℤ) ≤ o2 + (1 : ℤ) → ((∀(i' : ℤ) (j' : ℤ) (d : direction), ((0 : ℤ) ≤ i' ∧ i' < (0 : ℤ)) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v => v ≤ o1)) ∧ Option.some o1 = compute4 m (0 : ℤ) (0 : ℤ) direction.Right) ∧ (∀(cur_d : direction) (cur_j : ℤ) (cur_i : ℤ) (cur_max : ℤ), (∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ o2) ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v => v ≤ cur_max)) ∧ Option.some cur_max = compute4 m cur_i cur_j cur_d → (let o3 : ℤ := Matrix.columns m - (1 : ℤ); ((0 : ℤ) ≤ o3 + (1 : ℤ) → (Option.some cur_max = compute4 m cur_i cur_j cur_d ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < (0 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v => v ≤ cur_max))) ∧ (∀(cur_d1 : direction) (cur_j1 : ℤ) (cur_i1 : ℤ) (cur_max1 : ℤ), (∀(j : ℤ), ((0 : ℤ) ≤ j ∧ j ≤ o3) ∧ Option.some cur_max1 = compute4 m cur_i1 cur_j1 cur_d1 ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v => v ≤ cur_max1)) → (match left_diag m i j with | Option.none => (match right_diag m i j with | Option.none => (match line m i j with | Option.none => (match column m i j with | Option.none => Option.some cur_max1 = compute4 m cur_i1 cur_j1 cur_d1 ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v => v ≤ cur_max1)) | Option.some v => (if cur_max1 < v then Option.some v = compute4 m i j direction.Bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v1 => v1 ≤ v)) else Option.some cur_max1 = compute4 m cur_i1 cur_j1 cur_d1 ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v1 => v1 ≤ cur_max1)))) | Option.some v => (if cur_max1 < v then match column m i j with | Option.none => Option.some v = compute4 m i j direction.Right ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v1 => v1 ≤ v)) | Option.some v1 => (if v < v1 then Option.some v1 = compute4 m i j direction.Bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v2 => v2 ≤ v1)) else Option.some v = compute4 m i j direction.Right ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v2 => v2 ≤ v))) else match column m i j with | Option.none => Option.some cur_max1 = compute4 m cur_i1 cur_j1 cur_d1 ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v1 => v1 ≤ cur_max1)) | Option.some v1 => (if cur_max1 < v1 then Option.some v1 = compute4 m i j direction.Bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v2 => v2 ≤ v1)) else Option.some cur_max1 = compute4 m cur_i1 cur_j1 cur_d1 ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v2 => v2 ≤ cur_max1))))) | Option.some v => (if cur_max1 < v then match line m i j with | Option.none => (match column m i j with | Option.none => Option.some v = compute4 m i j direction.Right_bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v1 => v1 ≤ v)) | Option.some v1 => (if v < v1 then Option.some v1 = compute4 m i j direction.Bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v2 => v2 ≤ v1)) else Option.some v = compute4 m i j direction.Right_bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v2 => v2 ≤ v)))) | Option.some v1 => (if v < v1 then match column m i j with | Option.none => Option.some v1 = compute4 m i j direction.Right ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v2 => v2 ≤ v1)) | Option.some v2 => (if v1 < v2 then Option.some v2 = compute4 m i j direction.Bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v2)) else Option.some v1 = compute4 m i j direction.Right ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v1))) else match column m i j with | Option.none => Option.some v = compute4 m i j direction.Right_bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v2 => v2 ≤ v)) | Option.some v2 => (if v < v2 then Option.some v2 = compute4 m i j direction.Bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v2)) else Option.some v = compute4 m i j direction.Right_bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v)))) else match line m i j with | Option.none => (match column m i j with | Option.none => Option.some cur_max1 = compute4 m cur_i1 cur_j1 cur_d1 ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v1 => v1 ≤ cur_max1)) | Option.some v1 => (if cur_max1 < v1 then Option.some v1 = compute4 m i j direction.Bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v2 => v2 ≤ v1)) else Option.some cur_max1 = compute4 m cur_i1 cur_j1 cur_d1 ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v2 => v2 ≤ cur_max1)))) | Option.some v1 => (if cur_max1 < v1 then match column m i j with | Option.none => Option.some v1 = compute4 m i j direction.Right ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v2 => v2 ≤ v1)) | Option.some v2 => (if v1 < v2 then Option.some v2 = compute4 m i j direction.Bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v2)) else Option.some v1 = compute4 m i j direction.Right ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v1))) else match column m i j with | Option.none => Option.some cur_max1 = compute4 m cur_i1 cur_j1 cur_d1 ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v2 => v2 ≤ cur_max1)) | Option.some v2 => (if cur_max1 < v2 then Option.some v2 = compute4 m i j direction.Bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v2)) else Option.some cur_max1 = compute4 m cur_i1 cur_j1 cur_d1 ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ cur_max1)))))) | Option.some v => (if cur_max1 < v then match right_diag m i j with | Option.none => (match line m i j with | Option.none => (match column m i j with | Option.none => Option.some v = compute4 m i j direction.Left_bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v1 => v1 ≤ v)) | Option.some v1 => (if v < v1 then Option.some v1 = compute4 m i j direction.Bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v2 => v2 ≤ v1)) else Option.some v = compute4 m i j direction.Left_bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v2 => v2 ≤ v)))) | Option.some v1 => (if v < v1 then match column m i j with | Option.none => Option.some v1 = compute4 m i j direction.Right ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v2 => v2 ≤ v1)) | Option.some v2 => (if v1 < v2 then Option.some v2 = compute4 m i j direction.Bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v2)) else Option.some v1 = compute4 m i j direction.Right ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v1))) else match column m i j with | Option.none => Option.some v = compute4 m i j direction.Left_bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v2 => v2 ≤ v)) | Option.some v2 => (if v < v2 then Option.some v2 = compute4 m i j direction.Bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v2)) else Option.some v = compute4 m i j direction.Left_bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v))))) | Option.some v1 => (if v < v1 then match line m i j with | Option.none => (match column m i j with | Option.none => Option.some v1 = compute4 m i j direction.Right_bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v2 => v2 ≤ v1)) | Option.some v2 => (if v1 < v2 then Option.some v2 = compute4 m i j direction.Bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v2)) else Option.some v1 = compute4 m i j direction.Right_bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v1)))) | Option.some v2 => (if v1 < v2 then match column m i j with | Option.none => Option.some v2 = compute4 m i j direction.Right ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v2)) | Option.some v3 => (if v2 < v3 then Option.some v3 = compute4 m i j direction.Bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v4 => v4 ≤ v3)) else Option.some v2 = compute4 m i j direction.Right ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v4 => v4 ≤ v2))) else match column m i j with | Option.none => Option.some v1 = compute4 m i j direction.Right_bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v1)) | Option.some v3 => (if v1 < v3 then Option.some v3 = compute4 m i j direction.Bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v4 => v4 ≤ v3)) else Option.some v1 = compute4 m i j direction.Right_bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v4 => v4 ≤ v1)))) else match line m i j with | Option.none => (match column m i j with | Option.none => Option.some v = compute4 m i j direction.Left_bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v2 => v2 ≤ v)) | Option.some v2 => (if v < v2 then Option.some v2 = compute4 m i j direction.Bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v2)) else Option.some v = compute4 m i j direction.Left_bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v)))) | Option.some v2 => (if v < v2 then match column m i j with | Option.none => Option.some v2 = compute4 m i j direction.Right ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v2)) | Option.some v3 => (if v2 < v3 then Option.some v3 = compute4 m i j direction.Bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v4 => v4 ≤ v3)) else Option.some v2 = compute4 m i j direction.Right ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v4 => v4 ≤ v2))) else match column m i j with | Option.none => Option.some v = compute4 m i j direction.Left_bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v)) | Option.some v3 => (if v < v3 then Option.some v3 = compute4 m i j direction.Bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v4 => v4 ≤ v3)) else Option.some v = compute4 m i j direction.Left_bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v4 => v4 ≤ v))))) else match right_diag m i j with | Option.none => (match line m i j with | Option.none => (match column m i j with | Option.none => Option.some cur_max1 = compute4 m cur_i1 cur_j1 cur_d1 ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v1 => v1 ≤ cur_max1)) | Option.some v1 => (if cur_max1 < v1 then Option.some v1 = compute4 m i j direction.Bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v2 => v2 ≤ v1)) else Option.some cur_max1 = compute4 m cur_i1 cur_j1 cur_d1 ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v2 => v2 ≤ cur_max1)))) | Option.some v1 => (if cur_max1 < v1 then match column m i j with | Option.none => Option.some v1 = compute4 m i j direction.Right ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v2 => v2 ≤ v1)) | Option.some v2 => (if v1 < v2 then Option.some v2 = compute4 m i j direction.Bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v2)) else Option.some v1 = compute4 m i j direction.Right ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v1))) else match column m i j with | Option.none => Option.some cur_max1 = compute4 m cur_i1 cur_j1 cur_d1 ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v2 => v2 ≤ cur_max1)) | Option.some v2 => (if cur_max1 < v2 then Option.some v2 = compute4 m i j direction.Bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v2)) else Option.some cur_max1 = compute4 m cur_i1 cur_j1 cur_d1 ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ cur_max1))))) | Option.some v1 => (if cur_max1 < v1 then match line m i j with | Option.none => (match column m i j with | Option.none => Option.some v1 = compute4 m i j direction.Right_bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v2 => v2 ≤ v1)) | Option.some v2 => (if v1 < v2 then Option.some v2 = compute4 m i j direction.Bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v2)) else Option.some v1 = compute4 m i j direction.Right_bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v1)))) | Option.some v2 => (if v1 < v2 then match column m i j with | Option.none => Option.some v2 = compute4 m i j direction.Right ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v2)) | Option.some v3 => (if v2 < v3 then Option.some v3 = compute4 m i j direction.Bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v4 => v4 ≤ v3)) else Option.some v2 = compute4 m i j direction.Right ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v4 => v4 ≤ v2))) else match column m i j with | Option.none => Option.some v1 = compute4 m i j direction.Right_bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v1)) | Option.some v3 => (if v1 < v3 then Option.some v3 = compute4 m i j direction.Bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v4 => v4 ≤ v3)) else Option.some v1 = compute4 m i j direction.Right_bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v4 => v4 ≤ v1)))) else match line m i j with | Option.none => (match column m i j with | Option.none => Option.some cur_max1 = compute4 m cur_i1 cur_j1 cur_d1 ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v2 => v2 ≤ cur_max1)) | Option.some v2 => (if cur_max1 < v2 then Option.some v2 = compute4 m i j direction.Bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v2)) else Option.some cur_max1 = compute4 m cur_i1 cur_j1 cur_d1 ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ cur_max1)))) | Option.some v2 => (if cur_max1 < v2 then match column m i j with | Option.none => Option.some v2 = compute4 m i j direction.Right ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ v2)) | Option.some v3 => (if v2 < v3 then Option.some v3 = compute4 m i j direction.Bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v4 => v4 ≤ v3)) else Option.some v2 = compute4 m i j direction.Right ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v4 => v4 ≤ v2))) else match column m i j with | Option.none => Option.some cur_max1 = compute4 m cur_i1 cur_j1 cur_d1 ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v3 => v3 ≤ cur_max1)) | Option.some v3 => (if cur_max1 < v3 then Option.some v3 = compute4 m i j direction.Bottom ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v4 => v4 ≤ v3)) else Option.some cur_max1 = compute4 m cur_i1 cur_j1 cur_d1 ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v4 => v4 ≤ cur_max1)))))))) ∧ (Option.some cur_max1 = compute4 m cur_i1 cur_j1 cur_d1 ∧ (∀(i' : ℤ) (j' : ℤ) (d : direction), i' = i ∧ (0 : ℤ) ≤ j' ∧ j' < o3 + (1 : ℤ) ∨ ((0 : ℤ) ≤ i' ∧ i' < i) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v => v ≤ cur_max1)) → (∀(i' : ℤ) (j' : ℤ) (d : direction), ((0 : ℤ) ≤ i' ∧ i' < i + (1 : ℤ)) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v => v ≤ cur_max1)) ∧ Option.some cur_max1 = compute4 m cur_i1 cur_j1 cur_d1))) ∧ (o3 + (1 : ℤ) < (0 : ℤ) → (∀(i' : ℤ) (j' : ℤ) (d : direction), ((0 : ℤ) ≤ i' ∧ i' < i + (1 : ℤ)) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v => v ≤ cur_max)) ∧ Option.some cur_max = compute4 m cur_i cur_j cur_d))) ∧ ((∀(i' : ℤ) (j' : ℤ) (d : direction), ((0 : ℤ) ≤ i' ∧ i' < o2 + (1 : ℤ)) ∧ (0 : ℤ) ≤ j' ∧ j' < Matrix.columns m → (match compute4 m i' j' d with | Option.none => True | Option.some v => v ≤ cur_max)) ∧ Option.some cur_max = compute4 m cur_i cur_j cur_d → (∀(i : ℤ) (j : ℤ) (d : direction), match compute4 m i j d with | Option.none => True | Option.some v => v ≤ cur_max) ∧ (∃(i : ℤ) (j : ℤ) (d : direction), Option.some cur_max = compute4 m i j d)))) ∧ (o2 + (1 : ℤ) < (0 : ℤ) → (∀(i : ℤ) (j : ℤ) (d : direction), match compute4 m i j d with | Option.none => True | Option.some v => v ≤ o1) ∧ (∃(i : ℤ) (j : ℤ) (d : direction), Option.some o1 = compute4 m i j d))
  := sorry
end euler011_ProductFour_find_maxqtvc
