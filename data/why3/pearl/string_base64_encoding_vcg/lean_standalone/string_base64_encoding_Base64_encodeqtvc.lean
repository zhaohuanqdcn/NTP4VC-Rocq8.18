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
namespace StringBuffer
axiom buffer : Type
axiom inhabited_axiom_buffer : Inhabited buffer
attribute [instance] inhabited_axiom_buffer
axiom str : buffer -> List (BitVec 8)
end StringBuffer
namespace string_base64_encoding_Base64_encodeqtvc
noncomputable def int2b64 (i : ℤ) := if (0 : ℤ) ≤ i ∧ i ≤ (25 : ℤ) then BitVec.ofNat 8 (Int.toNat (i + (65 : ℤ))) else if (26 : ℤ) ≤ i ∧ i ≤ (51 : ℤ) then BitVec.ofNat 8 (Int.toNat (i - (26 : ℤ) + (97 : ℤ))) else if (52 : ℤ) ≤ i ∧ i ≤ (61 : ℤ) then BitVec.ofNat 8 (Int.toNat (i - (52 : ℤ) + (48 : ℤ))) else if i = (62 : ℤ) then BitVec.ofNat 8 (43 : ℕ) else if i = (63 : ℤ) then BitVec.ofNat 8 (47 : ℕ) else BitVec.ofNat 8 (0 : ℕ)
noncomputable def valid_b64_char (c : BitVec 8) := (65 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ (90 : ℤ) ∨ (97 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ (122 : ℤ) ∨ (48 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ (57 : ℤ) ∨ BitVec.toInt c = (43 : ℤ) ∨ BitVec.toInt c = (47 : ℤ)
noncomputable def b642int (c : BitVec 8) := if (65 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ (90 : ℤ) then BitVec.toInt c - (65 : ℤ) else if (97 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ (122 : ℤ) then BitVec.toInt c - (97 : ℤ) + (26 : ℤ) else if (48 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ (57 : ℤ) then BitVec.toInt c - (48 : ℤ) + (52 : ℤ) else if BitVec.toInt c = (43 : ℤ) then (62 : ℤ) else if BitVec.toInt c = (47 : ℤ) then (63 : ℤ) else if c = BitVec.ofNat 8 (Int.toNat (BitVec.toInt (61 : BitVec 63))) then (0 : ℤ) else (64 : ℤ)
noncomputable def get_pad (s : List (BitVec 8)) := if (1 : ℤ) ≤ Int.ofNat (List.length s) ∧ s[Int.toNat (Int.ofNat (List.length s) - (1 : ℤ))]! = BitVec.ofNat 8 (Int.toNat (BitVec.toInt (61 : BitVec 63))) then if (2 : ℤ) ≤ Int.ofNat (List.length s) ∧ s[Int.toNat (Int.ofNat (List.length s) - (2 : ℤ))]! = BitVec.ofNat 8 (Int.toNat (BitVec.toInt (61 : BitVec 63))) then (2 : ℤ) else (1 : ℤ) else (0 : ℤ)
noncomputable def calc_pad (s : List (BitVec 8)) := if Int.tmod (Int.ofNat (List.length s)) (3 : ℤ) = (1 : ℤ) then (2 : ℤ) else if Int.tmod (Int.ofNat (List.length s)) (3 : ℤ) = (2 : ℤ) then (1 : ℤ) else (0 : ℤ)
noncomputable def encoding (s1 : List (BitVec 8)) (s2 : List (BitVec 8)) := Int.ofNat (List.length s2) = Int.tdiv (Int.ofNat (List.length s1) + calc_pad s1) (3 : ℤ) * (4 : ℤ) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.tdiv (Int.ofNat (List.length s2)) (4 : ℤ) → (match (s2[Int.toNat ((4 : ℤ) * i)]!, s2[Int.toNat ((4 : ℤ) * i + (1 : ℤ))]!, s2[Int.toNat ((4 : ℤ) * i + (2 : ℤ))]!, s2[Int.toNat ((4 : ℤ) * i + (3 : ℤ))]!) with | (b1, b2, b3, b4) => s1[Int.toNat (i * (3 : ℤ))]! = BitVec.ofNat 8 (Int.toNat (b642int b1 * (4 : ℤ) + Int.tdiv (b642int b2) (16 : ℤ))) ∧ (i * (3 : ℤ) + (1 : ℤ) < Int.ofNat (List.length s1) → s1[Int.toNat (i * (3 : ℤ) + (1 : ℤ))]! = BitVec.ofNat 8 (Int.toNat (Int.tmod (b642int b2) (16 : ℤ) * (16 : ℤ) + Int.tdiv (b642int b3) (4 : ℤ)))) ∧ (i * (3 : ℤ) + (2 : ℤ) < Int.ofNat (List.length s1) → s1[Int.toNat (i * (3 : ℤ) + (2 : ℤ))]! = BitVec.ofNat 8 (Int.toNat (Int.tmod (b642int b3) (4 : ℤ) * (64 : ℤ) + b642int b4))))) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s2) - get_pad s2 → valid_b64_char (s2[Int.toNat i]!)) ∧ (get_pad s2 = (1 : ℤ) → Int.tmod (b642int (s2[Int.toNat (Int.ofNat (List.length s2) - (2 : ℤ))]!)) (4 : ℤ) = (0 : ℤ) ∧ s2[Int.toNat (Int.ofNat (List.length s2) - (1 : ℤ))]! = BitVec.ofNat 8 (Int.toNat (BitVec.toInt (61 : BitVec 63)))) ∧ (get_pad s2 = (2 : ℤ) → Int.tmod (b642int (s2[Int.toNat (Int.ofNat (List.length s2) - (3 : ℤ))]!)) (16 : ℤ) = (0 : ℤ) ∧ s2[Int.toNat (Int.ofNat (List.length s2) - (2 : ℤ))]! = s2[Int.toNat (Int.ofNat (List.length s2) - (1 : ℤ))]! ∧ s2[Int.toNat (Int.ofNat (List.length s2) - (1 : ℤ))]! = BitVec.ofNat 8 (Int.toNat (BitVec.toInt (61 : BitVec 63)))) ∧ calc_pad s1 = get_pad s2
noncomputable def valid_b64 (s : List (BitVec 8)) := Int.tmod (Int.ofNat (List.length s)) (4 : ℤ) = (0 : ℤ) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length s) - get_pad s → valid_b64_char (s[Int.toNat i]!)) ∧ (get_pad s = (1 : ℤ) → Int.tmod (b642int (s[Int.toNat (Int.ofNat (List.length s) - (2 : ℤ))]!)) (4 : ℤ) = (0 : ℤ) ∧ s[Int.toNat (Int.ofNat (List.length s) - (1 : ℤ))]! = BitVec.ofNat 8 (Int.toNat (BitVec.toInt (61 : BitVec 63)))) ∧ (get_pad s = (2 : ℤ) → Int.tmod (b642int (s[Int.toNat (Int.ofNat (List.length s) - (3 : ℤ))]!)) (16 : ℤ) = (0 : ℤ) ∧ s[Int.toNat (Int.ofNat (List.length s) - (2 : ℤ))]! = BitVec.ofNat 8 (Int.toNat (BitVec.toInt (61 : BitVec 63))) ∧ s[Int.toNat (Int.ofNat (List.length s) - (1 : ℤ))]! = BitVec.ofNat 8 (Int.toNat (BitVec.toInt (61 : BitVec 63))))
theorem encode'vc (padding : BitVec 63) (s : List (BitVec 8)) (fact0 : BitVec.toInt padding = calc_pad s) : (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < (256 : ℤ) ∧ (0 : ℤ) ≤ BitVec.toInt padding ∧ (let sp : List (BitVec 8) := s ++ List.replicate (Int.toNat (BitVec.toInt padding)) (BitVec.ofNat 8 (0 : ℕ)); ∀(r : StringBuffer.buffer), StringBuffer.str r = ([] : List (BitVec 8)) → ((0 : ℤ) = (0 : ℤ) * (3 : ℤ) ∧ Int.ofNat (List.length (StringBuffer.str r)) = (0 : ℤ) * (4 : ℤ) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ Int.ofNat (List.length sp)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < (0 : ℤ) → (let a1 : BitVec 8 := sp[Int.toNat (j * (3 : ℤ))]!; let a2 : BitVec 8 := sp[Int.toNat (j * (3 : ℤ) + (1 : ℤ))]!; let a3 : BitVec 8 := sp[Int.toNat (j * (3 : ℤ) + (2 : ℤ))]!; (StringBuffer.str r)[Int.toNat (j * (4 : ℤ))]! = int2b64 (Int.tdiv (BitVec.toInt a1) (4 : ℤ)) ∧ (StringBuffer.str r)[Int.toNat (j * (4 : ℤ) + (1 : ℤ))]! = int2b64 (Int.tmod (BitVec.toInt a1) (4 : ℤ) * (16 : ℤ) + Int.tdiv (BitVec.toInt a2) (16 : ℤ)) ∧ (StringBuffer.str r)[Int.toNat (j * (4 : ℤ) + (2 : ℤ))]! = int2b64 (Int.tmod (BitVec.toInt a2) (16 : ℤ) * (4 : ℤ) + Int.tdiv (BitVec.toInt a3) (64 : ℤ)) ∧ (StringBuffer.str r)[Int.toNat (j * (4 : ℤ) + (3 : ℤ))]! = int2b64 (Int.tmod (BitVec.toInt a3) (64 : ℤ))))) ∧ (∀(b : ℤ) (r1 : StringBuffer.buffer) (i : BitVec 63), BitVec.toInt i = b * (3 : ℤ) ∧ Int.ofNat (List.length (StringBuffer.str r1)) = b * (4 : ℤ) ∧ ((0 : ℤ) ≤ BitVec.toInt i ∧ BitVec.toInt i ≤ Int.ofNat (List.length sp)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < b → (let a1 : BitVec 8 := sp[Int.toNat (j * (3 : ℤ))]!; let a2 : BitVec 8 := sp[Int.toNat (j * (3 : ℤ) + (1 : ℤ))]!; let a3 : BitVec 8 := sp[Int.toNat (j * (3 : ℤ) + (2 : ℤ))]!; (StringBuffer.str r1)[Int.toNat (j * (4 : ℤ))]! = int2b64 (Int.tdiv (BitVec.toInt a1) (4 : ℤ)) ∧ (StringBuffer.str r1)[Int.toNat (j * (4 : ℤ) + (1 : ℤ))]! = int2b64 (Int.tmod (BitVec.toInt a1) (4 : ℤ) * (16 : ℤ) + Int.tdiv (BitVec.toInt a2) (16 : ℤ)) ∧ (StringBuffer.str r1)[Int.toNat (j * (4 : ℤ) + (2 : ℤ))]! = int2b64 (Int.tmod (BitVec.toInt a2) (16 : ℤ) * (4 : ℤ) + Int.tdiv (BitVec.toInt a3) (64 : ℤ)) ∧ (StringBuffer.str r1)[Int.toNat (j * (4 : ℤ) + (3 : ℤ))]! = int2b64 (Int.tmod (BitVec.toInt a3) (64 : ℤ)))) → (∀(o1 : BitVec 63), BitVec.toInt o1 = Int.ofNat (List.length sp) ∧ (0 : ℤ) ≤ Int.ofNat (List.length sp) → (if BitVec.toInt i < BitVec.toInt o1 then int'63_in_bounds (BitVec.toInt i + (2 : ℤ)) ∧ (∀(o2 : BitVec 63), BitVec.toInt o2 = BitVec.toInt i + (2 : ℤ) → ((0 : ℤ) ≤ BitVec.toInt o2 ∧ BitVec.toInt o2 < Int.ofNat (List.length sp)) ∧ (let o3 : BitVec 8 := sp[Int.toNat (BitVec.toInt o2)]!; int'63_in_bounds (BitVec.toInt i + (1 : ℤ)) ∧ (∀(o4 : BitVec 63), BitVec.toInt o4 = BitVec.toInt i + (1 : ℤ) → ((0 : ℤ) ≤ BitVec.toInt o4 ∧ BitVec.toInt o4 < Int.ofNat (List.length sp)) ∧ (let o5 : BitVec 8 := sp[Int.toNat (BitVec.toInt o4)]!; ((0 : ℤ) ≤ BitVec.toInt i ∧ BitVec.toInt i < Int.ofNat (List.length sp)) ∧ (let o6 : BitVec 8 := sp[Int.toNat (BitVec.toInt i)]!; ∀(o7 : BitVec 63), BitVec.toInt o7 = BitVec.toInt o6 → (¬(4 : ℤ) = (0 : ℤ) ∧ int'63_in_bounds (Int.tdiv (BitVec.toInt o7) (4 : ℤ))) ∧ (∀(b1 : BitVec 63), BitVec.toInt b1 = Int.tdiv (BitVec.toInt o7) (4 : ℤ) → (∀(o8 : BitVec 63), BitVec.toInt o8 = BitVec.toInt o5 → (¬(16 : ℤ) = (0 : ℤ) ∧ int'63_in_bounds (Int.tdiv (BitVec.toInt o8) (16 : ℤ))) ∧ (∀(o9 : BitVec 63), BitVec.toInt o9 = Int.tdiv (BitVec.toInt o8) (16 : ℤ) → (∀(o10 : BitVec 63), BitVec.toInt o10 = BitVec.toInt o6 → (¬(4 : ℤ) = (0 : ℤ) ∧ int'63_in_bounds (Int.tmod (BitVec.toInt o10) (4 : ℤ))) ∧ (∀(o11 : BitVec 63), BitVec.toInt o11 = Int.tmod (BitVec.toInt o10) (4 : ℤ) → int'63_in_bounds (BitVec.toInt o11 * (16 : ℤ)) ∧ (∀(o12 : BitVec 63), BitVec.toInt o12 = BitVec.toInt o11 * (16 : ℤ) → int'63_in_bounds (BitVec.toInt o12 + BitVec.toInt o9) ∧ (∀(b2 : BitVec 63), BitVec.toInt b2 = BitVec.toInt o12 + BitVec.toInt o9 → (∀(o13 : BitVec 63), BitVec.toInt o13 = BitVec.toInt o3 → (¬(64 : ℤ) = (0 : ℤ) ∧ int'63_in_bounds (Int.tdiv (BitVec.toInt o13) (64 : ℤ))) ∧ (∀(o14 : BitVec 63), BitVec.toInt o14 = Int.tdiv (BitVec.toInt o13) (64 : ℤ) → (∀(o15 : BitVec 63), BitVec.toInt o15 = BitVec.toInt o5 → (¬(16 : ℤ) = (0 : ℤ) ∧ int'63_in_bounds (Int.tmod (BitVec.toInt o15) (16 : ℤ))) ∧ (∀(o16 : BitVec 63), BitVec.toInt o16 = Int.tmod (BitVec.toInt o15) (16 : ℤ) → int'63_in_bounds (BitVec.toInt o16 * (4 : ℤ)) ∧ (∀(o17 : BitVec 63), BitVec.toInt o17 = BitVec.toInt o16 * (4 : ℤ) → int'63_in_bounds (BitVec.toInt o17 + BitVec.toInt o14) ∧ (∀(b3 : BitVec 63), BitVec.toInt b3 = BitVec.toInt o17 + BitVec.toInt o14 → (∀(o18 : BitVec 63), BitVec.toInt o18 = BitVec.toInt o3 → (¬(64 : ℤ) = (0 : ℤ) ∧ int'63_in_bounds (Int.tmod (BitVec.toInt o18) (64 : ℤ))) ∧ (∀(b4 : BitVec 63), BitVec.toInt b4 = Int.tmod (BitVec.toInt o18) (64 : ℤ) → ((0 : ℤ) ≤ BitVec.toInt b1 ∧ BitVec.toInt b1 < (64 : ℤ)) ∧ (∀(r2 : StringBuffer.buffer), StringBuffer.str r2 = StringBuffer.str r1 ++ [int2b64 (BitVec.toInt b1)] → ((0 : ℤ) ≤ BitVec.toInt b2 ∧ BitVec.toInt b2 < (64 : ℤ)) ∧ (∀(r3 : StringBuffer.buffer), StringBuffer.str r3 = StringBuffer.str r2 ++ [int2b64 (BitVec.toInt b2)] → ((0 : ℤ) ≤ BitVec.toInt b3 ∧ BitVec.toInt b3 < (64 : ℤ)) ∧ (∀(r4 : StringBuffer.buffer), StringBuffer.str r4 = StringBuffer.str r3 ++ [int2b64 (BitVec.toInt b3)] → ((0 : ℤ) ≤ BitVec.toInt b4 ∧ BitVec.toInt b4 < (64 : ℤ)) ∧ (∀(r5 : StringBuffer.buffer), StringBuffer.str r5 = StringBuffer.str r4 ++ [int2b64 (BitVec.toInt b4)] → int'63_in_bounds (BitVec.toInt i + (3 : ℤ)) ∧ (∀(o19 : BitVec 63), BitVec.toInt o19 = BitVec.toInt i + (3 : ℤ) → ((0 : ℤ) ≤ Int.ofNat (List.length sp) - BitVec.toInt i ∧ Int.ofNat (List.length sp) - BitVec.toInt o19 < Int.ofNat (List.length sp) - BitVec.toInt i) ∧ BitVec.toInt o19 = (b + (1 : ℤ)) * (3 : ℤ) ∧ Int.ofNat (List.length (StringBuffer.str r5)) = (b + (1 : ℤ)) * (4 : ℤ) ∧ ((0 : ℤ) ≤ BitVec.toInt o19 ∧ BitVec.toInt o19 ≤ Int.ofNat (List.length sp)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < b + (1 : ℤ) → (let a1 : BitVec 8 := sp[Int.toNat (j * (3 : ℤ))]!; let a2 : BitVec 8 := sp[Int.toNat (j * (3 : ℤ) + (1 : ℤ))]!; let a3 : BitVec 8 := sp[Int.toNat (j * (3 : ℤ) + (2 : ℤ))]!; (StringBuffer.str r5)[Int.toNat (j * (4 : ℤ))]! = int2b64 (Int.tdiv (BitVec.toInt a1) (4 : ℤ)) ∧ (StringBuffer.str r5)[Int.toNat (j * (4 : ℤ) + (1 : ℤ))]! = int2b64 (Int.tmod (BitVec.toInt a1) (4 : ℤ) * (16 : ℤ) + Int.tdiv (BitVec.toInt a2) (16 : ℤ)) ∧ (StringBuffer.str r5)[Int.toNat (j * (4 : ℤ) + (2 : ℤ))]! = int2b64 (Int.tmod (BitVec.toInt a2) (16 : ℤ) * (4 : ℤ) + Int.tdiv (BitVec.toInt a3) (64 : ℤ)) ∧ (StringBuffer.str r5)[Int.toNat (j * (4 : ℤ) + (3 : ℤ))]! = int2b64 (Int.tmod (BitVec.toInt a3) (64 : ℤ))))))))))))))))))))))))))))) else ∀(o2 : BitVec 63), BitVec.toInt o2 = Int.ofNat (List.length (StringBuffer.str r1)) → int'63_in_bounds (BitVec.toInt o2 - BitVec.toInt padding) ∧ (∀(o3 : BitVec 63), BitVec.toInt o3 = BitVec.toInt o2 - BitVec.toInt padding → ((0 : ℤ) ≤ BitVec.toInt o3 ∧ BitVec.toInt o3 ≤ Int.ofNat (List.length (StringBuffer.str r1))) ∧ (∀(r2 : StringBuffer.buffer), StringBuffer.str r2 = List.drop (0 : ℕ) (List.take (Int.toNat (BitVec.toInt o3) - (0 : ℕ)) (StringBuffer.str r1)) → (0 : ℤ) ≤ BitVec.toInt padding ∧ (∀(r3 : StringBuffer.buffer), StringBuffer.str r3 = StringBuffer.str r2 ++ List.replicate (Int.toNat (BitVec.toInt padding)) (BitVec.ofNat 8 (Int.toNat (BitVec.toInt (61 : BitVec 63)))) → encoding s (StringBuffer.str r3))))))))
  := sorry
end string_base64_encoding_Base64_encodeqtvc
