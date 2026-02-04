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

namespace real.Sum
axiom sum : (ℤ -> ℝ) -> ℤ -> ℤ -> ℝ
axiom sum'def (b : ℤ) (a : ℤ) (f : ℤ -> ℝ) : if b ≤ a then sum f a b = (0 : ℝ) else sum f a b = sum f a (b - (1 : ℤ)) + f (b - (1 : ℤ))
end real.Sum
namespace RoundingMode
inductive mode where
  | RNE : mode
  | RNA : mode
  | RTP : mode
  | RTN : mode
  | RTZ : mode
axiom inhabited_axiom_mode : Inhabited mode
attribute [instance] inhabited_axiom_mode
noncomputable def to_nearest (m : mode) := m = mode.RNE ∨ m = mode.RNA
end RoundingMode
namespace USingle
axiom usingle : Type
axiom inhabited_axiom_usingle : Inhabited usingle
attribute [instance] inhabited_axiom_usingle
noncomputable def eps := (1 : ℝ) / 16777216 / ((1 : ℝ) + (1 : ℝ) / 16777216)
noncomputable def eta := (1 : ℝ) / 1427247692705959881058285969449495136382746624
axiom uround : RoundingMode.mode -> ℝ -> usingle
axiom to_real : usingle -> ℝ
axiom of_int : ℤ -> usingle
axiom to_real_of_int (x : ℤ) : to_real (of_int x) = Int.to_Real x
axiom uzero : usingle
axiom uzero_spec : to_real uzero = (0 : ℝ)
axiom uone : usingle
axiom uone_spec : to_real uone = (1 : ℝ)
axiom utwo : usingle
axiom utwo_spec : to_real utwo = (2 : ℝ)
axiom eps_bounds : (0 : ℝ) < eps ∧ eps < (1 : ℝ)
axiom eta_bounds : (0 : ℝ) < eta ∧ eta < (1 : ℝ)
noncomputable def uadd (x : usingle) (y : usingle) := uround RoundingMode.mode.RNE (to_real x + to_real y)
axiom uadd'spec'1 (x : usingle) (y : usingle) : abs (to_real (uadd x y) - (to_real x + to_real y)) ≤ abs (to_real x)
axiom uadd'spec'0 (x : usingle) (y : usingle) : abs (to_real (uadd x y) - (to_real x + to_real y)) ≤ abs (to_real y)
axiom uadd'spec (x : usingle) (y : usingle) : abs (to_real (uadd x y) - (to_real x + to_real y)) ≤ abs (to_real x + to_real y) * eps
noncomputable def usub (x : usingle) (y : usingle) := uround RoundingMode.mode.RNE (to_real x - to_real y)
axiom usub'spec'1 (x : usingle) (y : usingle) : abs (to_real (usub x y) - (to_real x - to_real y)) ≤ abs (to_real x)
axiom usub'spec'0 (x : usingle) (y : usingle) : abs (to_real (usub x y) - (to_real x - to_real y)) ≤ abs (to_real y)
axiom usub'spec (x : usingle) (y : usingle) : abs (to_real (usub x y) - (to_real x - to_real y)) ≤ abs (to_real x - to_real y) * eps
noncomputable def umul (x : usingle) (y : usingle) := uround RoundingMode.mode.RNE (to_real x * to_real y)
axiom umul'spec (x : usingle) (y : usingle) : abs (to_real (umul x y) - to_real x * to_real y) ≤ abs (to_real x * to_real y) * eps + eta
axiom udiv : usingle -> usingle -> usingle
axiom udiv'def (y : usingle) (x : usingle) (fact0 : ¬to_real y = (0 : ℝ)) : udiv x y = uround RoundingMode.mode.RNE (to_real x / to_real y)
axiom udiv'spec (y : usingle) (x : usingle) (fact0 : ¬to_real y = (0 : ℝ)) : abs (to_real (udiv x y) - to_real x / to_real y) ≤ abs (to_real x / to_real y) * eps + eta
noncomputable def uminus (x : usingle) := uround RoundingMode.mode.RNE (-to_real x)
axiom uminus'spec (x : usingle) : to_real (uminus x) = -to_real x
axiom is_exact : (usingle -> usingle -> usingle) -> usingle -> usingle -> Prop
axiom udiv_exact : usingle -> usingle -> usingle
axiom udiv_closure : usingle -> usingle -> usingle
axiom udiv_closure_def (y : usingle) (y1 : usingle) : udiv_closure y y1 = udiv y y1
axiom udiv_exact'def (y : usingle) (x : usingle) (fact0 : ¬to_real y = (0 : ℝ)) (fact1 : is_exact udiv_closure x y) : udiv_exact x y = uround RoundingMode.mode.RNE (to_real x / to_real y)
axiom udiv_exact'spec (y : usingle) (x : usingle) (fact0 : ¬to_real y = (0 : ℝ)) (fact1 : is_exact udiv_closure x y) : abs (to_real (udiv_exact x y) - to_real x / to_real y) ≤ eta
axiom infix_slsldot : usingle -> usingle -> usingle
axiom infix_slsldot'def (y : usingle) (x : usingle) (fact0 : ¬to_real y = (0 : ℝ)) : infix_slsldot x y = udiv x y
axiom infix_slslsldot : usingle -> usingle -> usingle
axiom infix_slslsldot'def (y : usingle) (x : usingle) (fact0 : ¬to_real y = (0 : ℝ)) (fact1 : is_exact udiv_closure x y) : infix_slslsldot x y = udiv_exact x y
axiom u0 : usingle
axiom to_real_u0 : to_real u0 = (0 : ℝ)
axiom u1 : usingle
axiom to_real_u1 : to_real u1 = (1 : ℝ)
axiom u2 : usingle
axiom to_real_u2 : to_real u2 = (2 : ℝ)
axiom u4 : usingle
axiom to_real_u4 : to_real u4 = (4 : ℝ)
axiom u8 : usingle
axiom to_real_u8 : to_real u8 = (8 : ℝ)
axiom u16 : usingle
axiom to_real_u16 : to_real u16 = (16 : ℝ)
axiom u32 : usingle
axiom to_real_u32 : to_real u32 = (32 : ℝ)
axiom u64 : usingle
axiom to_real_u64 : to_real u64 = (64 : ℝ)
axiom u128 : usingle
axiom to_real_u128 : to_real u128 = (128 : ℝ)
axiom u256 : usingle
axiom to_real_u256 : to_real u256 = (256 : ℝ)
axiom u512 : usingle
axiom to_real_u512 : to_real u512 = (512 : ℝ)
axiom u1024 : usingle
axiom to_real_u1024 : to_real u1024 = (1024 : ℝ)
axiom u2048 : usingle
axiom to_real_u2048 : to_real u2048 = (2048 : ℝ)
axiom u4096 : usingle
axiom to_real_u4096 : to_real u4096 = (4096 : ℝ)
axiom u8192 : usingle
axiom to_real_u8192 : to_real u8192 = (8192 : ℝ)
axiom u16384 : usingle
axiom to_real_u16384 : to_real u16384 = (16384 : ℝ)
axiom u32768 : usingle
axiom to_real_u32768 : to_real u32768 = (32768 : ℝ)
axiom u65536 : usingle
axiom to_real_u65536 : to_real u65536 = (65536 : ℝ)
noncomputable def is_positive_power_of_2 (x : usingle) := x = u1 ∨ x = u2 ∨ x = u4 ∨ x = u8 ∨ x = u16 ∨ x = u32 ∨ x = u64 ∨ x = u128 ∨ x = u256 ∨ x = u4096 ∨ x = u8192 ∨ x = u16384 ∨ x = u32768 ∨ x = u65536
axiom div_by_positive_power_of_2_is_exact (y : usingle) (x : usingle) (fact0 : is_positive_power_of_2 y) : is_exact udiv_closure x y
end USingle
namespace HelperLemmas
axiom log_1_minus_x (x : ℝ) (fact0 : (0 : ℝ) ≤ abs x) (fact1 : abs x < (1 : ℝ)) : Real.log ((1 : ℝ) + x) ≤ -Real.log ((1 : ℝ) - x)
axiom log2_1_minus_x (x : ℝ) (fact0 : (0 : ℝ) ≤ abs x) (fact1 : abs x < (1 : ℝ)) : Real.logb 2 ((1 : ℝ) + x) ≤ -Real.logb 2 ((1 : ℝ) - x)
axiom log10_1_minus_x (x : ℝ) (fact0 : (0 : ℝ) ≤ abs x) (fact1 : abs x < (1 : ℝ)) : Real.logb 10 ((1 : ℝ) + x) ≤ -Real.logb 10 ((1 : ℝ) - x)
axiom sin_of_approx (x : ℝ) (y : ℝ) : abs (Real.sin x - Real.sin y) ≤ abs (x - y)
axiom cos_of_approx (x : ℝ) (y : ℝ) : abs (Real.cos x - Real.cos y) ≤ abs (x - y)
end HelperLemmas
namespace USingleLemmas
axiom uadd_single_error_propagation (x_f : USingle.usingle) (x : ℝ) (x_rel : ℝ) (x_factor : ℝ) (x_abs : ℝ) (y_f : USingle.usingle) (y : ℝ) (y_rel : ℝ) (y_factor : ℝ) (y_abs : ℝ) (r : USingle.usingle) (fact0 : abs (USingle.to_real x_f - x) ≤ x_rel * x_factor + x_abs) (fact1 : abs (USingle.to_real y_f - y) ≤ y_rel * y_factor + y_abs) (fact2 : abs x ≤ x_factor) (fact3 : abs y ≤ y_factor) (fact4 : (0 : ℝ) ≤ x_rel) (fact5 : (0 : ℝ) ≤ y_rel) (fact6 : (0 : ℝ) ≤ x_abs) (fact7 : (0 : ℝ) ≤ y_abs) (fact8 : r = USingle.uadd x_f y_f) : abs (USingle.to_real r - (x + y)) ≤ (x_rel + y_rel + USingle.eps) * (x_factor + y_factor) + (((1 : ℝ) + USingle.eps + y_rel) * x_abs + ((1 : ℝ) + USingle.eps + x_rel) * y_abs)
axiom usub_single_error_propagation (x_f : USingle.usingle) (x : ℝ) (x_rel : ℝ) (x_factor : ℝ) (x_abs : ℝ) (y_f : USingle.usingle) (y : ℝ) (y_rel : ℝ) (y_factor : ℝ) (y_abs : ℝ) (r : USingle.usingle) (fact0 : abs (USingle.to_real x_f - x) ≤ x_rel * x_factor + x_abs) (fact1 : abs (USingle.to_real y_f - y) ≤ y_rel * y_factor + y_abs) (fact2 : abs x ≤ x_factor) (fact3 : abs y ≤ y_factor) (fact4 : (0 : ℝ) ≤ x_abs) (fact5 : (0 : ℝ) ≤ y_abs) (fact6 : (0 : ℝ) ≤ x_rel) (fact7 : (0 : ℝ) ≤ y_rel) (fact8 : r = USingle.usub x_f y_f) : abs (USingle.to_real r - (x - y)) ≤ (x_rel + y_rel + USingle.eps) * (x_factor + y_factor) + (((1 : ℝ) + USingle.eps + y_rel) * x_abs + ((1 : ℝ) + USingle.eps + x_rel) * y_abs)
axiom umul_single_error_propagation (x_f : USingle.usingle) (x : ℝ) (x_rel : ℝ) (x_factor : ℝ) (x_abs : ℝ) (y_f : USingle.usingle) (y : ℝ) (y_rel : ℝ) (y_factor : ℝ) (y_abs : ℝ) (r : USingle.usingle) (fact0 : abs (USingle.to_real x_f - x) ≤ x_rel * x_factor + x_abs) (fact1 : abs (USingle.to_real y_f - y) ≤ y_rel * y_factor + y_abs) (fact2 : abs x ≤ x_factor) (fact3 : abs y ≤ y_factor) (fact4 : (0 : ℝ) ≤ x_rel) (fact5 : (0 : ℝ) ≤ y_rel) (fact6 : (0 : ℝ) ≤ x_abs) (fact7 : (0 : ℝ) ≤ y_abs) (fact8 : r = USingle.umul x_f y_f) : abs (USingle.to_real r - x * y) ≤ (USingle.eps + (x_rel + y_rel + x_rel * y_rel) * ((1 : ℝ) + USingle.eps)) * (x_factor * y_factor) + (((y_abs + y_abs * x_rel) * x_factor + (x_abs + x_abs * y_rel) * y_factor + x_abs * y_abs) * ((1 : ℝ) + USingle.eps) + USingle.eta)
axiom log_single_error_propagation (x_f : USingle.usingle) (x_exact : ℝ) (x_rel : ℝ) (x_factor : ℝ) (x_abs : ℝ) (logx_f : USingle.usingle) (log_rel : ℝ) (log_abs : ℝ) (fact0 : abs (USingle.to_real x_f - x_exact) ≤ x_rel * x_factor + x_abs) (fact1 : abs (USingle.to_real logx_f - Real.log (USingle.to_real x_f)) ≤ log_rel * abs (Real.log (USingle.to_real x_f)) + log_abs) (fact2 : (0 : ℝ) < x_exact) (fact3 : x_exact ≤ x_factor) (fact4 : (0 : ℝ) < x_exact - x_rel * x_factor - x_abs) (fact5 : (0 : ℝ) ≤ log_rel) : abs (USingle.to_real logx_f - Real.log x_exact) ≤ log_rel * abs (Real.log x_exact) + (-Real.log ((1 : ℝ) - (x_rel * x_factor + x_abs) / x_exact) * ((1 : ℝ) + log_rel) + log_abs)
axiom log2_single_error_propagation (x_f : USingle.usingle) (x_exact : ℝ) (x_rel : ℝ) (x_factor : ℝ) (x_abs : ℝ) (log2x_f : USingle.usingle) (log_rel : ℝ) (log_abs : ℝ) (fact0 : abs (USingle.to_real x_f - x_exact) ≤ x_rel * x_factor + x_abs) (fact1 : abs (USingle.to_real log2x_f - Real.logb 2 (USingle.to_real x_f)) ≤ log_rel * abs (Real.logb 2 (USingle.to_real x_f)) + log_abs) (fact2 : (0 : ℝ) < x_exact) (fact3 : x_exact ≤ x_factor) (fact4 : (0 : ℝ) < x_exact - x_rel * x_factor - x_abs) (fact5 : (0 : ℝ) ≤ log_rel) : abs (USingle.to_real log2x_f - Real.logb 2 x_exact) ≤ log_rel * abs (Real.logb 2 x_exact) + (-Real.logb 2 ((1 : ℝ) - (x_rel * x_factor + x_abs) / x_exact) * ((1 : ℝ) + log_rel) + log_abs)
axiom log10_single_error_propagation (x_f : USingle.usingle) (x_exact : ℝ) (x_rel : ℝ) (x_factor : ℝ) (x_abs : ℝ) (log10x_f : USingle.usingle) (log_rel : ℝ) (log_abs : ℝ) (fact0 : abs (USingle.to_real x_f - x_exact) ≤ x_rel * x_factor + x_abs) (fact1 : abs (USingle.to_real log10x_f - Real.logb 10 (USingle.to_real x_f)) ≤ log_rel * abs (Real.logb 10 (USingle.to_real x_f)) + log_abs) (fact2 : (0 : ℝ) < x_exact) (fact3 : x_exact ≤ x_factor) (fact4 : (0 : ℝ) < x_exact - x_rel * x_factor - x_abs) (fact5 : (0 : ℝ) ≤ log_rel) : abs (USingle.to_real log10x_f - Real.logb 10 x_exact) ≤ log_rel * abs (Real.logb 10 x_exact) + (-Real.logb 10 ((1 : ℝ) - (x_rel * x_factor + x_abs) / x_exact) * ((1 : ℝ) + log_rel) + log_abs)
axiom exp_single_error_propagation (x_f : USingle.usingle) (x_exact : ℝ) (x_rel : ℝ) (x_factor : ℝ) (x_abs : ℝ) (expx_f : USingle.usingle) (exp_rel : ℝ) (exp_abs : ℝ) (fact0 : abs (USingle.to_real x_f - x_exact) ≤ x_rel * x_factor + x_abs) (fact1 : abs (USingle.to_real expx_f - Real.exp (USingle.to_real x_f)) ≤ exp_rel * Real.exp (USingle.to_real x_f) + exp_abs) (fact2 : x_exact ≤ x_factor) (fact3 : (0 : ℝ) ≤ exp_rel) (fact4 : exp_rel ≤ (1 : ℝ)) : abs (USingle.to_real expx_f - Real.exp x_exact) ≤ (exp_rel + (Real.exp (x_rel * x_factor + x_abs) - (1 : ℝ)) * ((1 : ℝ) + exp_rel)) * Real.exp x_exact + exp_abs
axiom sin_single_error_propagation (x_f : USingle.usingle) (x_exact : ℝ) (x_rel : ℝ) (x_factor : ℝ) (x_abs : ℝ) (sinx_f : USingle.usingle) (sin_rel : ℝ) (sin_abs : ℝ) (fact0 : abs (USingle.to_real x_f - x_exact) ≤ x_rel * x_factor + x_abs) (fact1 : abs (USingle.to_real sinx_f - Real.sin (USingle.to_real x_f)) ≤ sin_rel * abs (Real.sin (USingle.to_real x_f)) + sin_abs) (fact2 : x_exact ≤ x_factor) (fact3 : (0 : ℝ) ≤ sin_rel) : abs (USingle.to_real sinx_f - Real.sin x_exact) ≤ sin_rel * abs (Real.sin x_exact) + ((x_rel * x_factor + x_abs) * ((1 : ℝ) + sin_rel) + sin_abs)
axiom cos_single_error_propagation (x_f : USingle.usingle) (x_exact : ℝ) (x_rel : ℝ) (x_factor : ℝ) (x_abs : ℝ) (cosx_f : USingle.usingle) (cos_rel : ℝ) (cos_abs : ℝ) (fact0 : abs (USingle.to_real x_f - x_exact) ≤ x_rel * x_factor + x_abs) (fact1 : abs (USingle.to_real cosx_f - Real.cos (USingle.to_real x_f)) ≤ cos_rel * abs (Real.cos (USingle.to_real x_f)) + cos_abs) (fact2 : x_exact ≤ x_factor) (fact3 : (0 : ℝ) ≤ cos_rel) : abs (USingle.to_real cosx_f - Real.cos x_exact) ≤ cos_rel * abs (Real.cos x_exact) + ((x_rel * x_factor + x_abs) * ((1 : ℝ) + cos_rel) + cos_abs)
axiom real_fun : (ℤ -> USingle.usingle) -> ℤ -> ℝ
axiom real_fun'def (f : ℤ -> USingle.usingle) (i : ℤ) : real_fun f i = USingle.to_real (f i)
axiom sum_single_error_propagation (n : ℤ) (f : ℤ -> USingle.usingle) (f_exact : ℤ -> ℝ) (f_rel : ℝ) (f_factor : ℤ -> ℝ) (f_abs : ℝ) (f_factor' : ℤ -> ℝ) (x : USingle.usingle) (sum_rel : ℝ) (sum_abs : ℝ) (fact0 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → abs (real_fun f i - f_exact i) ≤ f_rel * f_factor i + f_abs) (fact1 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → f_factor i - f_rel * f_factor i - f_abs ≤ f_factor' i ∧ f_factor' i ≤ f_factor i + f_rel * f_factor i + f_abs) (fact2 : abs (USingle.to_real x - real.Sum.sum (real_fun f) (0 : ℤ) n) ≤ sum_rel * real.Sum.sum f_factor' (0 : ℤ) n + sum_abs) (fact3 : (0 : ℝ) ≤ sum_rel) (fact4 : (0 : ℤ) ≤ n) : abs (USingle.to_real x - real.Sum.sum f_exact (0 : ℤ) n) ≤ (f_rel + sum_rel * ((1 : ℝ) + f_rel)) * real.Sum.sum f_factor (0 : ℤ) n + (f_abs * Int.to_Real n * ((1 : ℝ) + sum_rel) + sum_abs)
axiom udiv_closure : USingle.usingle -> USingle.usingle -> USingle.usingle
axiom udiv_exact_single_error_propagation (x_f : USingle.usingle) (x : ℝ) (x_rel : ℝ) (x_factor : ℝ) (x_abs : ℝ) (y_f : USingle.usingle) (r : USingle.usingle) (fact0 : abs (USingle.to_real x_f - x) ≤ x_rel * x_factor + x_abs) (fact1 : abs x ≤ x_factor) (fact2 : (0 : ℝ) ≤ x_rel) (fact3 : (0 : ℝ) ≤ x_abs) (fact4 : ¬(0 : ℝ) = USingle.to_real y_f) (fact5 : USingle.is_exact udiv_closure x_f y_f) (fact6 : r = USingle.infix_slslsldot x_f y_f) : abs (USingle.to_real r - x / USingle.to_real y_f) ≤ x_rel * (x_factor / abs (USingle.to_real y_f)) + (x_abs / abs (USingle.to_real y_f) + USingle.eta)
end USingleLemmas
namespace SinCosSingle
axiom sin_rel_err : ℝ
axiom sin_rel_err_range : (0 : ℝ) ≤ sin_rel_err
axiom sin_abs_err : ℝ
axiom sin_abs_err_range : (0 : ℝ) ≤ sin_abs_err
axiom sin_max : ℝ
axiom sin_max_range : (0 : ℝ) ≤ sin_max
axiom cos_rel_err : ℝ
axiom cos_rel_err_range : (0 : ℝ) ≤ cos_rel_err
axiom cos_abs_err : ℝ
axiom cos_abs_err_range : (0 : ℝ) ≤ cos_abs_err
axiom cos_max : ℝ
axiom cos_max_range : (0 : ℝ) ≤ cos_max
end SinCosSingle
