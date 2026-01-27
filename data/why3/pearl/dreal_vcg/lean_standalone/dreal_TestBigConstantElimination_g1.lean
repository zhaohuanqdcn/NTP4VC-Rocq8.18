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

namespace Truncate
axiom truncate : ℝ -> ℤ
axiom Truncate_int (i : ℤ) : truncate (Int.to_Real i) = i
axiom Truncate_down_pos (x : ℝ) (fact0 : (0 : ℝ) ≤ x) : Int.to_Real (truncate x) ≤ x ∧ x < Int.to_Real (truncate x + (1 : ℤ))
axiom Truncate_up_neg (x : ℝ) (fact0 : x ≤ (0 : ℝ)) : Int.to_Real (truncate x - (1 : ℤ)) < x ∧ x ≤ Int.to_Real (truncate x)
axiom Real_of_truncate (x : ℝ) : x - (1 : ℝ) ≤ Int.to_Real (truncate x) ∧ Int.to_Real (truncate x) ≤ x + (1 : ℝ)
axiom Truncate_monotonic (x : ℝ) (y : ℝ) (fact0 : x ≤ y) : truncate x ≤ truncate y
axiom Truncate_monotonic_int1 (x : ℝ) (i : ℤ) (fact0 : x ≤ Int.to_Real i) : truncate x ≤ i
axiom Truncate_monotonic_int2 (i : ℤ) (x : ℝ) (fact0 : Int.to_Real i ≤ x) : i ≤ truncate x
axiom floor : ℝ -> ℤ
axiom Floor_int (i : ℤ) : floor (Int.to_Real i) = i
axiom ceil : ℝ -> ℤ
axiom Ceil_int (i : ℤ) : ceil (Int.to_Real i) = i
axiom Floor_down (x : ℝ) : Int.to_Real (floor x) ≤ x ∧ x < Int.to_Real (floor x + (1 : ℤ))
axiom Ceil_up (x : ℝ) : Int.to_Real (ceil x - (1 : ℤ)) < x ∧ x ≤ Int.to_Real (ceil x)
axiom Floor_monotonic (x : ℝ) (y : ℝ) (fact0 : x ≤ y) : floor x ≤ floor y
axiom Ceil_monotonic (x : ℝ) (y : ℝ) (fact0 : x ≤ y) : ceil x ≤ ceil y
end Truncate
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
namespace Float64
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom t'real : t -> ℝ
axiom t'isFinite : t -> Prop
axiom eb_gt_1 : (1 : ℤ) < (11 : ℤ)
axiom sb_gt_1 : (1 : ℤ) < (53 : ℤ)
axiom zeroF : t
axiom add : RoundingMode.mode -> t -> t -> t
axiom sub : RoundingMode.mode -> t -> t -> t
axiom mul : RoundingMode.mode -> t -> t -> t
axiom div : RoundingMode.mode -> t -> t -> t
axiom abs : t -> t
axiom neg : t -> t
axiom fma : RoundingMode.mode -> t -> t -> t -> t
axiom sqrt : RoundingMode.mode -> t -> t
axiom roundToIntegral : RoundingMode.mode -> t -> t
axiom min : t -> t -> t
axiom max : t -> t -> t
axiom le : t -> t -> Prop
axiom lt : t -> t -> Prop
axiom eq : t -> t -> Prop
axiom is_normal : t -> Prop
axiom is_subnormal : t -> Prop
axiom is_zero : t -> Prop
axiom is_infinite : t -> Prop
axiom is_nan : t -> Prop
axiom is_positive : t -> Prop
axiom is_negative : t -> Prop
noncomputable def is_plus_infinity (x : t) := is_infinite x ∧ is_positive x
noncomputable def is_minus_infinity (x : t) := is_infinite x ∧ is_negative x
noncomputable def is_plus_zero (x : t) := is_zero x ∧ is_positive x
noncomputable def is_minus_zero (x : t) := is_zero x ∧ is_negative x
noncomputable def is_not_nan (x : t) := t'isFinite x ∨ is_infinite x
axiom is_not_nan1 (x : t) : is_not_nan x = (¬is_nan x)
axiom is_not_finite (x : t) : (¬t'isFinite x) = (is_infinite x ∨ is_nan x)
axiom zeroF_is_positive : is_positive zeroF
axiom zeroF_is_zero : is_zero zeroF
axiom zero_to_real (x : t) : is_zero x = (t'isFinite x ∧ t'real x = (0 : ℝ))
axiom of_int : RoundingMode.mode -> ℤ -> t
axiom to_int : RoundingMode.mode -> t -> ℤ
axiom zero_of_int (m : RoundingMode.mode) : zeroF = of_int m (0 : ℤ)
axiom round : RoundingMode.mode -> ℝ -> ℝ
axiom max_int_spec : (179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368 : ℤ) = HPow.hPow 2 (Int.toNat (HPow.hPow 2 (Int.toNat ((11 : ℤ) - (1 : ℤ))))) - HPow.hPow 2 (Int.toNat (HPow.hPow 2 (Int.toNat ((11 : ℤ) - (1 : ℤ))) - (53 : ℤ)))
axiom max_real_int : (179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368 : ℝ) = Int.to_Real (179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368 : ℤ)
noncomputable def in_range (x : ℝ) := -(179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368 : ℝ) ≤ x ∧ x ≤ (179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368 : ℝ)
noncomputable def in_int_range (i : ℤ) := -(179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368 : ℤ) ≤ i ∧ i ≤ (179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368 : ℤ)
axiom is_finite (x : t) (fact0 : t'isFinite x) : in_range (t'real x)
noncomputable def no_overflow (m : RoundingMode.mode) (x : ℝ) := in_range (round m x)
axiom Bounded_real_no_overflow (x : ℝ) (m : RoundingMode.mode) (fact0 : in_range x) : no_overflow m x
axiom Round_monotonic (x : ℝ) (y : ℝ) (m : RoundingMode.mode) (fact0 : x ≤ y) : round m x ≤ round m y
axiom Round_idempotent (m1 : RoundingMode.mode) (m2 : RoundingMode.mode) (x : ℝ) : round m1 (round m2 x) = round m2 x
axiom Round_to_real (x : t) (m : RoundingMode.mode) (fact0 : t'isFinite x) : round m (t'real x) = t'real x
axiom Round_down_le (x : ℝ) : round RoundingMode.mode.RTN x ≤ x
axiom Round_up_ge (x : ℝ) : x ≤ round RoundingMode.mode.RTP x
axiom Round_down_neg (x : ℝ) : round RoundingMode.mode.RTN (-x) = -round RoundingMode.mode.RTP x
axiom Round_up_neg (x : ℝ) : round RoundingMode.mode.RTP (-x) = -round RoundingMode.mode.RTN x
axiom pow2sb1 : (9007199254740992 : ℤ) = HPow.hPow 2 (53 : ℕ)
noncomputable def in_safe_int_range (i : ℤ) := -(9007199254740992 : ℤ) ≤ i ∧ i ≤ (9007199254740992 : ℤ)
axiom Exact_rounding_for_integers (i : ℤ) (m : RoundingMode.mode) (fact0 : in_safe_int_range i) : round m (Int.to_Real i) = Int.to_Real i
axiom from_real : RoundingMode.mode -> ℝ -> t
axiom from_real_in_range (m : RoundingMode.mode) (r : ℝ) (fact0 : in_range (round m r)) : t'isFinite (from_real m r) ∧ t'real (from_real m r) = round m r
axiom from_real_large_neg (m : RoundingMode.mode) (r : ℝ) (fact0 : round m r < -(179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368 : ℝ)) : is_infinite (from_real m r) ∧ is_negative (from_real m r)
axiom from_real_large_pos (m : RoundingMode.mode) (r : ℝ) (fact0 : (179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368 : ℝ) < round m r) : is_infinite (from_real m r) ∧ is_positive (from_real m r)
noncomputable def same_sign (x : t) (y : t) := is_positive x ∧ is_positive y ∨ is_negative x ∧ is_negative y
noncomputable def diff_sign (x : t) (y : t) := is_positive x ∧ is_negative y ∨ is_negative x ∧ is_positive y
axiom feq_eq (x : t) (y : t) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : ¬is_zero x) (fact3 : eq x y) : x = y
axiom eq_feq (x : t) (y : t) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : x = y) : eq x y
axiom eq_refl (x : t) (fact0 : t'isFinite x) : eq x x
axiom eq_sym (x : t) (y : t) (fact0 : eq x y) : eq y x
axiom eq_trans (x : t) (y : t) (z : t) (fact0 : eq x y) (fact1 : eq y z) : eq x z
axiom eq_zero : eq zeroF (neg zeroF)
axiom eq_to_real_finite (x : t) (y : t) (fact0 : t'isFinite x) (fact1 : t'isFinite y) : eq x y = (t'real x = t'real y)
axiom eq_special (x : t) (y : t) (fact0 : eq x y) : is_not_nan x ∧ is_not_nan y ∧ (t'isFinite x ∧ t'isFinite y ∨ is_infinite x ∧ is_infinite y ∧ same_sign x y)
axiom lt_finite (x : t) (y : t) (fact0 : t'isFinite x) (fact1 : t'isFinite y) : lt x y = (t'real x < t'real y)
axiom le_finite (x : t) (y : t) (fact0 : t'isFinite x) (fact1 : t'isFinite y) : le x y = (t'real x ≤ t'real y)
axiom le_lt_trans (x : t) (y : t) (z : t) (fact0 : le x y) (fact1 : lt y z) : lt x z
axiom lt_le_trans (x : t) (y : t) (z : t) (fact0 : lt x y) (fact1 : le y z) : lt x z
axiom le_ge_asym (x : t) (y : t) (fact0 : le x y) (fact1 : le y x) : eq x y
axiom not_lt_ge (x : t) (y : t) (fact0 : ¬lt x y) (fact1 : is_not_nan x) (fact2 : is_not_nan y) : le y x
axiom not_gt_le (y : t) (x : t) (fact0 : ¬lt y x) (fact1 : is_not_nan x) (fact2 : is_not_nan y) : le x y
axiom le_special (x : t) (y : t) (fact0 : le x y) : t'isFinite x ∧ t'isFinite y ∨ is_minus_infinity x ∧ is_not_nan y ∨ is_not_nan x ∧ is_plus_infinity y
axiom lt_special (x : t) (y : t) (fact0 : lt x y) : t'isFinite x ∧ t'isFinite y ∨ is_minus_infinity x ∧ is_not_nan y ∧ ¬is_minus_infinity y ∨ is_not_nan x ∧ ¬is_plus_infinity x ∧ is_plus_infinity y
axiom lt_lt_finite (x : t) (y : t) (z : t) (fact0 : lt x y) (fact1 : lt y z) : t'isFinite y
axiom positive_to_real (x : t) (fact0 : t'isFinite x) (fact1 : is_positive x) : (0 : ℝ) ≤ t'real x
axiom to_real_positive (x : t) (fact0 : t'isFinite x) (fact1 : (0 : ℝ) < t'real x) : is_positive x
axiom negative_to_real (x : t) (fact0 : t'isFinite x) (fact1 : is_negative x) : t'real x ≤ (0 : ℝ)
axiom to_real_negative (x : t) (fact0 : t'isFinite x) (fact1 : t'real x < (0 : ℝ)) : is_negative x
axiom negative_xor_positive (x : t) : ¬(is_positive x ∧ is_negative x)
axiom negative_or_positive (x : t) (fact0 : is_not_nan x) : is_positive x ∨ is_negative x
axiom diff_sign_trans (x : t) (y : t) (z : t) (fact0 : diff_sign x y) (fact1 : diff_sign y z) : same_sign x z
axiom diff_sign_product (x : t) (y : t) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : t'real x * t'real y < (0 : ℝ)) : diff_sign x y
axiom same_sign_product (x : t) (y : t) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : same_sign x y) : (0 : ℝ) ≤ t'real x * t'real y
noncomputable def product_sign (z : t) (x : t) (y : t) := (same_sign x y → is_positive z) ∧ (diff_sign x y → is_negative z)
noncomputable def overflow_value (m : RoundingMode.mode) (x : t) := match m with | RoundingMode.mode.RTN => (if is_positive x then t'isFinite x ∧ t'real x = (179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368 : ℝ) else is_infinite x) | RoundingMode.mode.RTP => (if is_positive x then is_infinite x else t'isFinite x ∧ t'real x = -(179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368 : ℝ)) | RoundingMode.mode.RTZ => (if is_positive x then t'isFinite x ∧ t'real x = (179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368 : ℝ) else t'isFinite x ∧ t'real x = -(179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368 : ℝ)) | RoundingMode.mode.RNA => is_infinite x | RoundingMode.mode.RNE => is_infinite x
noncomputable def sign_zero_result (m : RoundingMode.mode) (x : t) := is_zero x → (match m with | RoundingMode.mode.RTN => is_negative x | _ => is_positive x)
axiom add_finite (x : t) (y : t) (m : RoundingMode.mode) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : no_overflow m (t'real x + t'real y)) : t'isFinite (add m x y) ∧ t'real (add m x y) = round m (t'real x + t'real y)
axiom add_finite_rev (m : RoundingMode.mode) (x : t) (y : t) (fact0 : t'isFinite (add m x y)) : t'isFinite x ∧ t'isFinite y
axiom add_finite_rev_n (m : RoundingMode.mode) (x : t) (y : t) (fact0 : RoundingMode.to_nearest m) (fact1 : t'isFinite (add m x y)) : no_overflow m (t'real x + t'real y) ∧ t'real (add m x y) = round m (t'real x + t'real y)
axiom sub_finite (x : t) (y : t) (m : RoundingMode.mode) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : no_overflow m (t'real x - t'real y)) : t'isFinite (sub m x y) ∧ t'real (sub m x y) = round m (t'real x - t'real y)
axiom sub_finite_rev (m : RoundingMode.mode) (x : t) (y : t) (fact0 : t'isFinite (sub m x y)) : t'isFinite x ∧ t'isFinite y
axiom sub_finite_rev_n (m : RoundingMode.mode) (x : t) (y : t) (fact0 : RoundingMode.to_nearest m) (fact1 : t'isFinite (sub m x y)) : no_overflow m (t'real x - t'real y) ∧ t'real (sub m x y) = round m (t'real x - t'real y)
axiom mul_finite (x : t) (y : t) (m : RoundingMode.mode) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : no_overflow m (t'real x * t'real y)) : t'isFinite (mul m x y) ∧ t'real (mul m x y) = round m (t'real x * t'real y)
axiom mul_finite_rev (m : RoundingMode.mode) (x : t) (y : t) (fact0 : t'isFinite (mul m x y)) : t'isFinite x ∧ t'isFinite y
axiom mul_finite_rev_n (m : RoundingMode.mode) (x : t) (y : t) (fact0 : RoundingMode.to_nearest m) (fact1 : t'isFinite (mul m x y)) : no_overflow m (t'real x * t'real y) ∧ t'real (mul m x y) = round m (t'real x * t'real y)
axiom div_finite (x : t) (y : t) (m : RoundingMode.mode) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : ¬is_zero y) (fact3 : no_overflow m (t'real x / t'real y)) : t'isFinite (div m x y) ∧ t'real (div m x y) = round m (t'real x / t'real y)
axiom div_finite_rev (m : RoundingMode.mode) (x : t) (y : t) (fact0 : t'isFinite (div m x y)) : t'isFinite x ∧ t'isFinite y ∧ ¬is_zero y ∨ t'isFinite x ∧ is_infinite y ∧ t'real (div m x y) = (0 : ℝ)
axiom div_finite_rev_n (m : RoundingMode.mode) (x : t) (y : t) (fact0 : RoundingMode.to_nearest m) (fact1 : t'isFinite (div m x y)) (fact2 : t'isFinite y) : no_overflow m (t'real x / t'real y) ∧ t'real (div m x y) = round m (t'real x / t'real y)
axiom neg_finite (x : t) (fact0 : t'isFinite x) : t'isFinite (neg x) ∧ t'real (neg x) = -t'real x
axiom neg_finite_rev (x : t) (fact0 : t'isFinite (neg x)) : t'isFinite x ∧ t'real (neg x) = -t'real x
axiom abs_finite (x : t) (fact0 : t'isFinite x) : t'isFinite (Float64.abs x) ∧ t'real (Float64.abs x) = Math.abs (t'real x) ∧ is_positive (Float64.abs x)
axiom abs_finite_rev (x : t) (fact0 : t'isFinite (Float64.abs x)) : t'isFinite x ∧ t'real (Float64.abs x) = Math.abs (t'real x)
axiom abs_universal (x : t) : ¬is_negative (Float64.abs x)
axiom fma_finite (x : t) (y : t) (z : t) (m : RoundingMode.mode) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : t'isFinite z) (fact3 : no_overflow m (t'real x * t'real y + t'real z)) : t'isFinite (fma m x y z) ∧ t'real (fma m x y z) = round m (t'real x * t'real y + t'real z)
axiom fma_finite_rev (m : RoundingMode.mode) (x : t) (y : t) (z : t) (fact0 : t'isFinite (fma m x y z)) : t'isFinite x ∧ t'isFinite y ∧ t'isFinite z
axiom fma_finite_rev_n (m : RoundingMode.mode) (x : t) (y : t) (z : t) (fact0 : RoundingMode.to_nearest m) (fact1 : t'isFinite (fma m x y z)) : no_overflow m (t'real x * t'real y + t'real z) ∧ t'real (fma m x y z) = round m (t'real x * t'real y + t'real z)
axiom sqrt_finite (x : t) (m : RoundingMode.mode) (fact0 : t'isFinite x) (fact1 : (0 : ℝ) ≤ t'real x) : t'isFinite (sqrt m x) ∧ t'real (sqrt m x) = round m (Real.sqrt (t'real x))
axiom sqrt_finite_rev (m : RoundingMode.mode) (x : t) (fact0 : t'isFinite (sqrt m x)) : t'isFinite x ∧ (0 : ℝ) ≤ t'real x ∧ t'real (sqrt m x) = round m (Real.sqrt (t'real x))
noncomputable def same_sign_real (x : t) (r : ℝ) := is_positive x ∧ (0 : ℝ) < r ∨ is_negative x ∧ r < (0 : ℝ)
axiom add_special (m : RoundingMode.mode) (x : t) (y : t) : (is_nan x ∨ is_nan y → is_nan (add m x y)) ∧ (t'isFinite x ∧ is_infinite y → is_infinite (add m x y) ∧ same_sign (add m x y) y) ∧ (is_infinite x ∧ t'isFinite y → is_infinite (add m x y) ∧ same_sign (add m x y) x) ∧ (is_infinite x ∧ is_infinite y ∧ same_sign x y → is_infinite (add m x y) ∧ same_sign (add m x y) x) ∧ (is_infinite x ∧ is_infinite y ∧ diff_sign x y → is_nan (add m x y)) ∧ (t'isFinite x ∧ t'isFinite y ∧ ¬no_overflow m (t'real x + t'real y) → same_sign_real (add m x y) (t'real x + t'real y) ∧ overflow_value m (add m x y)) ∧ (t'isFinite x ∧ t'isFinite y → (if same_sign x y then same_sign (add m x y) x else sign_zero_result m (add m x y)))
axiom sub_special (m : RoundingMode.mode) (x : t) (y : t) : (is_nan x ∨ is_nan y → is_nan (sub m x y)) ∧ (t'isFinite x ∧ is_infinite y → is_infinite (sub m x y) ∧ diff_sign (sub m x y) y) ∧ (is_infinite x ∧ t'isFinite y → is_infinite (sub m x y) ∧ same_sign (sub m x y) x) ∧ (is_infinite x ∧ is_infinite y ∧ same_sign x y → is_nan (sub m x y)) ∧ (is_infinite x ∧ is_infinite y ∧ diff_sign x y → is_infinite (sub m x y) ∧ same_sign (sub m x y) x) ∧ (t'isFinite x ∧ t'isFinite y ∧ ¬no_overflow m (t'real x - t'real y) → same_sign_real (sub m x y) (t'real x - t'real y) ∧ overflow_value m (sub m x y)) ∧ (t'isFinite x ∧ t'isFinite y → (if diff_sign x y then same_sign (sub m x y) x else sign_zero_result m (sub m x y)))
axiom mul_special (m : RoundingMode.mode) (x : t) (y : t) : (is_nan x ∨ is_nan y → is_nan (mul m x y)) ∧ (is_zero x ∧ is_infinite y → is_nan (mul m x y)) ∧ (t'isFinite x ∧ is_infinite y ∧ ¬is_zero x → is_infinite (mul m x y)) ∧ (is_infinite x ∧ is_zero y → is_nan (mul m x y)) ∧ (is_infinite x ∧ t'isFinite y ∧ ¬is_zero y → is_infinite (mul m x y)) ∧ (is_infinite x ∧ is_infinite y → is_infinite (mul m x y)) ∧ (t'isFinite x ∧ t'isFinite y ∧ ¬no_overflow m (t'real x * t'real y) → overflow_value m (mul m x y)) ∧ (¬is_nan (mul m x y) → product_sign (mul m x y) x y)
axiom div_special (m : RoundingMode.mode) (x : t) (y : t) : (is_nan x ∨ is_nan y → is_nan (div m x y)) ∧ (t'isFinite x ∧ is_infinite y → is_zero (div m x y)) ∧ (is_infinite x ∧ t'isFinite y → is_infinite (div m x y)) ∧ (is_infinite x ∧ is_infinite y → is_nan (div m x y)) ∧ (t'isFinite x ∧ t'isFinite y ∧ ¬is_zero y ∧ ¬no_overflow m (t'real x / t'real y) → overflow_value m (div m x y)) ∧ (t'isFinite x ∧ is_zero y ∧ ¬is_zero x → is_infinite (div m x y)) ∧ (is_zero x ∧ is_zero y → is_nan (div m x y)) ∧ (¬is_nan (div m x y) → product_sign (div m x y) x y)
axiom neg_special (x : t) : (is_nan x → is_nan (neg x)) ∧ (is_infinite x → is_infinite (neg x)) ∧ (¬is_nan x → diff_sign x (neg x))
axiom abs_special (x : t) : (is_nan x → is_nan (Float64.abs x)) ∧ (is_infinite x → is_infinite (Float64.abs x)) ∧ (¬is_nan x → is_positive (Float64.abs x))
axiom fma_special (m : RoundingMode.mode) (x : t) (y : t) (z : t) : (is_nan x ∨ is_nan y ∨ is_nan z → is_nan (fma m x y z)) ∧ (is_zero x ∧ is_infinite y → is_nan (fma m x y z)) ∧ (is_infinite x ∧ is_zero y → is_nan (fma m x y z)) ∧ (t'isFinite x ∧ ¬is_zero x ∧ is_infinite y ∧ t'isFinite z → is_infinite (fma m x y z) ∧ product_sign (fma m x y z) x y) ∧ (t'isFinite x ∧ ¬is_zero x ∧ is_infinite y ∧ is_infinite z → (if product_sign z x y then is_infinite (fma m x y z) ∧ same_sign (fma m x y z) z else is_nan (fma m x y z))) ∧ (is_infinite x ∧ t'isFinite y ∧ ¬is_zero y ∧ t'isFinite z → is_infinite (fma m x y z) ∧ product_sign (fma m x y z) x y) ∧ (is_infinite x ∧ t'isFinite y ∧ ¬is_zero y ∧ is_infinite z → (if product_sign z x y then is_infinite (fma m x y z) ∧ same_sign (fma m x y z) z else is_nan (fma m x y z))) ∧ (is_infinite x ∧ is_infinite y ∧ t'isFinite z → is_infinite (fma m x y z) ∧ product_sign (fma m x y z) x y) ∧ (t'isFinite x ∧ t'isFinite y ∧ is_infinite z → is_infinite (fma m x y z) ∧ same_sign (fma m x y z) z) ∧ (is_infinite x ∧ is_infinite y ∧ is_infinite z → (if product_sign z x y then is_infinite (fma m x y z) ∧ same_sign (fma m x y z) z else is_nan (fma m x y z))) ∧ (t'isFinite x ∧ t'isFinite y ∧ t'isFinite z ∧ ¬no_overflow m (t'real x * t'real y + t'real z) → same_sign_real (fma m x y z) (t'real x * t'real y + t'real z) ∧ overflow_value m (fma m x y z)) ∧ (t'isFinite x ∧ t'isFinite y ∧ t'isFinite z → (if product_sign z x y then same_sign (fma m x y z) z else t'real x * t'real y + t'real z = (0 : ℝ) → (if m = RoundingMode.mode.RTN then is_negative (fma m x y z) else is_positive (fma m x y z))))
axiom sqrt_special (m : RoundingMode.mode) (x : t) : (is_nan x → is_nan (sqrt m x)) ∧ (is_plus_infinity x → is_plus_infinity (sqrt m x)) ∧ (is_minus_infinity x → is_nan (sqrt m x)) ∧ (t'isFinite x ∧ t'real x < (0 : ℝ) → is_nan (sqrt m x)) ∧ (is_zero x → same_sign (sqrt m x) x) ∧ (t'isFinite x ∧ (0 : ℝ) < t'real x → is_positive (sqrt m x))
axiom of_int_add_exact (i : ℤ) (j : ℤ) (m : RoundingMode.mode) (n : RoundingMode.mode) (fact0 : in_safe_int_range i) (fact1 : in_safe_int_range j) (fact2 : in_safe_int_range (i + j)) : eq (of_int m (i + j)) (add n (of_int m i) (of_int m j))
axiom of_int_sub_exact (i : ℤ) (j : ℤ) (m : RoundingMode.mode) (n : RoundingMode.mode) (fact0 : in_safe_int_range i) (fact1 : in_safe_int_range j) (fact2 : in_safe_int_range (i - j)) : eq (of_int m (i - j)) (sub n (of_int m i) (of_int m j))
axiom of_int_mul_exact (i : ℤ) (j : ℤ) (m : RoundingMode.mode) (n : RoundingMode.mode) (fact0 : in_safe_int_range i) (fact1 : in_safe_int_range j) (fact2 : in_safe_int_range (i * j)) : eq (of_int m (i * j)) (mul n (of_int m i) (of_int m j))
axiom Min_r (y : t) (x : t) (fact0 : le y x) : eq (min x y) y
axiom Min_l (x : t) (y : t) (fact0 : le x y) : eq (min x y) x
axiom Max_r (y : t) (x : t) (fact0 : le y x) : eq (max x y) x
axiom Max_l (x : t) (y : t) (fact0 : le x y) : eq (max x y) y
axiom is_int : t -> Prop
axiom zeroF_is_int : is_int zeroF
axiom of_int_is_int (x : ℤ) (m : RoundingMode.mode) (fact0 : in_int_range x) : is_int (of_int m x)
axiom big_float_is_int (i : t) (m : RoundingMode.mode) (fact0 : t'isFinite i) (fact1 : le i (neg (of_int m (9007199254740992 : ℤ))) ∨ le (of_int m (9007199254740992 : ℤ)) i) : is_int i
axiom roundToIntegral_is_int (x : t) (m : RoundingMode.mode) (fact0 : t'isFinite x) : is_int (roundToIntegral m x)
axiom eq_is_int (x : t) (y : t) (fact0 : eq x y) (fact1 : is_int x) : is_int y
axiom add_int (x : t) (y : t) (m : RoundingMode.mode) (fact0 : is_int x) (fact1 : is_int y) (fact2 : t'isFinite (add m x y)) : is_int (add m x y)
axiom sub_int (x : t) (y : t) (m : RoundingMode.mode) (fact0 : is_int x) (fact1 : is_int y) (fact2 : t'isFinite (sub m x y)) : is_int (sub m x y)
axiom mul_int (x : t) (y : t) (m : RoundingMode.mode) (fact0 : is_int x) (fact1 : is_int y) (fact2 : t'isFinite (mul m x y)) : is_int (mul m x y)
axiom fma_int (x : t) (y : t) (z : t) (m : RoundingMode.mode) (fact0 : is_int x) (fact1 : is_int y) (fact2 : is_int z) (fact3 : t'isFinite (fma m x y z)) : is_int (fma m x y z)
axiom neg_int (x : t) (fact0 : is_int x) : is_int (neg x)
axiom abs_int (x : t) (fact0 : is_int x) : is_int (Float64.abs x)
axiom is_int_of_int (x : t) (m' : RoundingMode.mode) (m : RoundingMode.mode) (fact0 : is_int x) : eq x (of_int m' (to_int m x))
axiom is_int_to_int (x : t) (m : RoundingMode.mode) (fact0 : is_int x) : in_int_range (to_int m x)
axiom is_int_is_finite (x : t) (fact0 : is_int x) : t'isFinite x
axiom int_to_real (x : t) (m : RoundingMode.mode) (fact0 : is_int x) : t'real x = Int.to_Real (to_int m x)
axiom truncate_int (i : t) (m : RoundingMode.mode) (fact0 : is_int i) : eq (roundToIntegral m i) i
axiom truncate_neg (x : t) (fact0 : t'isFinite x) (fact1 : is_negative x) : roundToIntegral RoundingMode.mode.RTZ x = roundToIntegral RoundingMode.mode.RTP x
axiom truncate_pos (x : t) (fact0 : t'isFinite x) (fact1 : is_positive x) : roundToIntegral RoundingMode.mode.RTZ x = roundToIntegral RoundingMode.mode.RTN x
axiom ceil_le (x : t) (fact0 : t'isFinite x) : le x (roundToIntegral RoundingMode.mode.RTP x)
axiom ceil_lest (x : t) (y : t) (fact0 : le x y) (fact1 : is_int y) : le (roundToIntegral RoundingMode.mode.RTP x) y
axiom ceil_to_real (x : t) (fact0 : t'isFinite x) : t'real (roundToIntegral RoundingMode.mode.RTP x) = Int.to_Real (Truncate.ceil (t'real x))
axiom ceil_to_int (x : t) (m : RoundingMode.mode) (fact0 : t'isFinite x) : to_int m (roundToIntegral RoundingMode.mode.RTP x) = Truncate.ceil (t'real x)
axiom floor_le (x : t) (fact0 : t'isFinite x) : le (roundToIntegral RoundingMode.mode.RTN x) x
axiom floor_lest (y : t) (x : t) (fact0 : le y x) (fact1 : is_int y) : le y (roundToIntegral RoundingMode.mode.RTN x)
axiom floor_to_real (x : t) (fact0 : t'isFinite x) : t'real (roundToIntegral RoundingMode.mode.RTN x) = Int.to_Real (Truncate.floor (t'real x))
axiom floor_to_int (x : t) (m : RoundingMode.mode) (fact0 : t'isFinite x) : to_int m (roundToIntegral RoundingMode.mode.RTN x) = Truncate.floor (t'real x)
axiom RNA_down (x : t) (fact0 : lt (sub RoundingMode.mode.RNE x (roundToIntegral RoundingMode.mode.RTN x)) (sub RoundingMode.mode.RNE (roundToIntegral RoundingMode.mode.RTP x) x)) : roundToIntegral RoundingMode.mode.RNA x = roundToIntegral RoundingMode.mode.RTN x
axiom RNA_up (x : t) (fact0 : lt (sub RoundingMode.mode.RNE (roundToIntegral RoundingMode.mode.RTP x) x) (sub RoundingMode.mode.RNE x (roundToIntegral RoundingMode.mode.RTN x))) : roundToIntegral RoundingMode.mode.RNA x = roundToIntegral RoundingMode.mode.RTP x
axiom RNA_down_tie (x : t) (fact0 : eq (sub RoundingMode.mode.RNE x (roundToIntegral RoundingMode.mode.RTN x)) (sub RoundingMode.mode.RNE (roundToIntegral RoundingMode.mode.RTP x) x)) (fact1 : is_negative x) : roundToIntegral RoundingMode.mode.RNA x = roundToIntegral RoundingMode.mode.RTN x
axiom RNA_up_tie (x : t) (fact0 : eq (sub RoundingMode.mode.RNE (roundToIntegral RoundingMode.mode.RTP x) x) (sub RoundingMode.mode.RNE x (roundToIntegral RoundingMode.mode.RTN x))) (fact1 : is_positive x) : roundToIntegral RoundingMode.mode.RNA x = roundToIntegral RoundingMode.mode.RTP x
axiom to_int_roundToIntegral (m : RoundingMode.mode) (x : t) : to_int m x = to_int m (roundToIntegral m x)
axiom to_int_monotonic (x : t) (y : t) (m : RoundingMode.mode) (fact0 : t'isFinite x) (fact1 : t'isFinite y) (fact2 : le x y) : to_int m x ≤ to_int m y
axiom to_int_of_int (i : ℤ) (m : RoundingMode.mode) (fact0 : in_safe_int_range i) : to_int m (of_int m i) = i
axiom eq_to_int (x : t) (y : t) (m : RoundingMode.mode) (fact0 : t'isFinite x) (fact1 : eq x y) : to_int m x = to_int m y
axiom neg_to_int (x : t) (m : RoundingMode.mode) (fact0 : is_int x) : to_int m (neg x) = -to_int m x
axiom roundToIntegral_is_finite (x : t) (m : RoundingMode.mode) (fact0 : t'isFinite x) : t'isFinite (roundToIntegral m x)
axiom round_bound_ne (x : ℝ) (fact0 : no_overflow RoundingMode.mode.RNE x) : x - (1 : ℝ) / 9007199254740992 * Math.abs x - (1 : ℝ) / 404804506614621236704990693437834614099113299528284236713802716054860679135990693783920767402874248990374155728633623822779617474771586953734026799881477019843034848553132722728933815484186432682479535356945490137124014966849385397236206711298319112681620113024717539104666829230461005064372655017292012526615415482186989568 ≤ round RoundingMode.mode.RNE x ∧ round RoundingMode.mode.RNE x ≤ x + (1 : ℝ) / 9007199254740992 * Math.abs x + (1 : ℝ) / 404804506614621236704990693437834614099113299528284236713802716054860679135990693783920767402874248990374155728633623822779617474771586953734026799881477019843034848553132722728933815484186432682479535356945490137124014966849385397236206711298319112681620113024717539104666829230461005064372655017292012526615415482186989568
axiom round_bound (m : RoundingMode.mode) (x : ℝ) (fact0 : no_overflow m x) : x - (1 : ℝ) / 4503599627370496 * Math.abs x - (1 : ℝ) / 202402253307310618352495346718917307049556649764142118356901358027430339567995346891960383701437124495187077864316811911389808737385793476867013399940738509921517424276566361364466907742093216341239767678472745068562007483424692698618103355649159556340810056512358769552333414615230502532186327508646006263307707741093494784 ≤ round m x ∧ round m x ≤ x + (1 : ℝ) / 4503599627370496 * Math.abs x + (1 : ℝ) / 202402253307310618352495346718917307049556649764142118356901358027430339567995346891960383701437124495187077864316811911389808737385793476867013399940738509921517424276566361364466907742093216341239767678472745068562007483424692698618103355649159556340810056512358769552333414615230502532186327508646006263307707741093494784
end Float64
namespace dreal_TestBigConstantElimination_g1
axiom r1 : ℝ
axiom r2 : ℝ
axiom r3 : ℝ
axiom r4 : ℝ
axiom H1 : r1 = (89884656743115795386465259539451236680898848947115328636715040578866337902750481566354238661203768010560056939935696678829394884407208311246423715319737062188883946712432742638151109800623047059726541476042502884419075341171231440736956555270413618581675255342293149119973622969239858152417678164812112068608 : ℝ)
axiom H2 : r2 = (1 : ℝ) / 179769313486231590772930519078902473361797697894230657273430081157732675805500963132708477322407536021120113879871393357658789768814416622492847430639474124377767893424865485276302219601246094119453082952085005768838150682342462881473913110540827237163350510684586298239947245938479716304835356329624224137216
axiom H3 : r3 = (44942328371557897693232629769725618340449424473557664318357520289433168951375240783177119330601884005280028469967848339414697442203604155623211857659868531094441973356216371319075554900311523529863270738021251442209537670585615720368478277635206809290837627671146574559986811484619929076208839082406056034304 : ℝ)
axiom H4 : r4 = (1 : ℝ) / 89884656743115795386465259539451236680898848947115328636715040578866337902750481566354238661203768010560056939935696678829394884407208311246423715319737062188883946712432742638151109800623047059726541476042502884419075341171231440736956555270413618581675255342293149119973622969239858152417678164812112068608
theorem g1 (x : ℝ) (fact0 : abs x ≤ (25 : ℝ)) : Real.exp x ≤ (72004899338 : ℝ)
  := sorry
end dreal_TestBigConstantElimination_g1
