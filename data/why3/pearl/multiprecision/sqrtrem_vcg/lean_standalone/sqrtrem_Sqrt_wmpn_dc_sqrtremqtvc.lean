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
namespace Const
axiom const :  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> β -> α -> β
axiom const'def {β : Type} {α : Type} [Inhabited β] [Inhabited α] (v : β) (x : α) : (const : β -> α -> β) v x = v
end Const
namespace MapEq
noncomputable def map_eq_sub {α : Type} [Inhabited α] (a1 : ℤ -> α) (a2 : ℤ -> α) (l : ℤ) (u : ℤ) := ∀(i : ℤ), l ≤ i ∧ i < u → a1 i = a2 i
end MapEq
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
namespace Unsigned
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom max : ℤ
axiom to_int : t -> ℤ
noncomputable def in_bounds (n : ℤ) := (0 : ℤ) ≤ n ∧ n ≤ max
axiom to_int_in_bounds (n : t) : in_bounds (to_int n)
axiom extensionality (x : t) (y : t) (fact0 : to_int x = to_int y) : x = y
axiom zero_unsigned : t
axiom zero_unsigned_is_zero : to_int zero_unsigned = (0 : ℤ)
axiom radix : ℤ
axiom radix_def : radix = max + (1 : ℤ)
end Unsigned
namespace C
noncomputable def in_us_bounds (n : ℤ) := (0 : ℤ) ≤ n ∧ n ≤ (4294967295 : ℤ)
noncomputable def in_bounds (n : ℤ) := -(2147483648 : ℤ) ≤ n ∧ n ≤ (2147483647 : ℤ)
axiom zone : Type
axiom inhabited_axiom_zone : Inhabited zone
attribute [instance] inhabited_axiom_zone
axiom null_zone : zone
axiom ptr : Type -> Type
axiom inhabited_axiom_ptr {α : Type} [Inhabited α] : Inhabited (ptr α)
attribute [instance] inhabited_axiom_ptr
axiom data :  {α : Type} -> [Inhabited α] -> ptr α -> List α
axiom offset :  {α : Type} -> [Inhabited α] -> ptr α -> ℤ
axiom min :  {α : Type} -> [Inhabited α] -> ptr α -> ℤ
axiom max :  {α : Type} -> [Inhabited α] -> ptr α -> ℤ
axiom writable :  {α : Type} -> [Inhabited α] -> ptr α -> Bool
axiom zone1 :  {α : Type} -> [Inhabited α] -> ptr α -> zone
noncomputable def plength {α : Type} [Inhabited α] (p : ptr α) := Int.ofNat (List.length (data p))
noncomputable def pelts {α : Type} [Inhabited α] (p : ptr α) := getElem! (data p) ∘ Int.toNat
axiom is_not_null :  {α : Type} -> [Inhabited α] -> ptr α -> Prop
axiom is_not_null'spec {α : Type} [Inhabited α] (p : ptr α) : is_not_null p = (¬zone1 p = null_zone)
noncomputable def valid_ptr_shift {α : Type} [Inhabited α] (p : ptr α) (i : ℤ) := min p ≤ offset p + i ∧ offset p + i < max p
noncomputable def valid {α : Type} [Inhabited α] (p : ptr α) (sz : ℤ) := in_bounds sz ∧ (0 : ℤ) ≤ sz ∧ ((0 : ℤ) ≤ min p ∧ min p ≤ offset p) ∧ offset p + sz ≤ max p ∧ max p ≤ plength p
axiom valid_itv_to_shift {α : Type} [Inhabited α] (p : ptr α) (sz : ℤ) (i : ℤ) (fact0 : valid p sz) (fact1 : (0 : ℤ) ≤ i) (fact2 : i < sz) : valid_ptr_shift p i
end C
namespace Config
end Config
namespace Types
axiom limb : Type
axiom inhabited_axiom_limb : Inhabited limb
attribute [instance] inhabited_axiom_limb
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
end Types
namespace Int32Eq
end Int32Eq
namespace UInt64Eq
end UInt64Eq
namespace Lemmas
noncomputable def map_eq_sub_shift {α : Type} [Inhabited α] (x : ℤ -> α) (y : ℤ -> α) (xi : ℤ) (yi : ℤ) (sz : ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < sz → x (xi + i) = y (yi + i)
axiom value_sub : (ℤ -> BitVec 64) -> ℤ -> ℤ -> ℤ
axiom value_sub'def (n : ℤ) (m : ℤ) (x : ℤ -> BitVec 64) : if n < m then value_sub x n m = BitVec.toUInt (x n) + ((18446744073709551615 : ℤ) + (1 : ℤ)) * value_sub x (n + (1 : ℤ)) m else value_sub x n m = (0 : ℤ)
noncomputable def value (x : C.ptr (BitVec 64)) (sz : ℤ) := value_sub (C.pelts x) (C.offset x) (C.offset x + sz)
end Lemmas
namespace Compare
noncomputable def compare_int (x : ℤ) (y : ℤ) := if x < y then -(1 : ℤ) else if x = y then (0 : ℤ) else (1 : ℤ)
end Compare
namespace Alias
axiom mem : Type
axiom inhabited_axiom_mem : Inhabited mem
attribute [instance] inhabited_axiom_mem
axiom zr : mem -> C.zone
axiom zx : mem -> C.zone
axiom zy : mem -> C.zone
axiom mr : mem -> BitVec 32
axiom mx : mem -> BitVec 32
axiom my : mem -> BitVec 32
axiom lr : mem -> BitVec 32
axiom lx : mem -> BitVec 32
axiom ly : mem -> BitVec 32
axiom ok : mem -> Bool
noncomputable def identical (p1 : C.ptr (BitVec 64)) (p2 : C.ptr (BitVec 64)) := C.data p1 = C.data p2 ∧ C.offset p1 = C.offset p2 ∧ C.min p1 = C.min p2 ∧ C.max p1 = C.max p2 ∧ C.zone1 p1 = C.zone1 p2
end Alias
namespace Util
end Util
namespace UtilOld
end UtilOld
namespace Add_1
end Add_1
namespace Add
end Add
namespace AddOld
end AddOld
namespace Sub_1
end Sub_1
namespace SubOld
end SubOld
namespace Mul
end Mul
namespace Mul_basecase
end Mul_basecase
namespace LogicalUtil
end LogicalUtil
namespace Logical
end Logical
namespace LogicalOld
end LogicalOld
namespace Div
noncomputable def reciprocal (v : BitVec 64) (d : BitVec 64) := BitVec.toUInt v = (((18446744073709551615 : ℤ) + (1 : ℤ)) * ((18446744073709551615 : ℤ) + (1 : ℤ)) - (1 : ℤ)) / BitVec.toUInt d - ((18446744073709551615 : ℤ) + (1 : ℤ))
noncomputable def reciprocal_3by2 (v : BitVec 64) (dh : BitVec 64) (dl : BitVec 64) := BitVec.toUInt v = (((18446744073709551615 : ℤ) + (1 : ℤ)) * ((18446744073709551615 : ℤ) + (1 : ℤ)) * ((18446744073709551615 : ℤ) + (1 : ℤ)) - (1 : ℤ)) / (BitVec.toUInt dl + ((18446744073709551615 : ℤ) + (1 : ℤ)) * BitVec.toUInt dh) - ((18446744073709551615 : ℤ) + (1 : ℤ))
noncomputable def normalized (x : C.ptr (BitVec 64)) (sz : BitVec 32) := C.valid x (BitVec.toInt sz) ∧ ((18446744073709551615 : ℤ) + (1 : ℤ)) / (2 : ℤ) ≤ BitVec.toUInt (C.pelts x (C.offset x + BitVec.toInt sz - (1 : ℤ)))
end Div
namespace Fxp
noncomputable def pow2 (k : ℤ) := HPow.hPow (2 : ℝ) (Int.to_Real k)
noncomputable def trunc_at (x : ℝ) (k : ℤ) := Int.to_Real (Truncate.floor (x * pow2 (-k))) * pow2 k
axiom fxp : Type
axiom inhabited_axiom_fxp : Inhabited fxp
attribute [instance] inhabited_axiom_fxp
axiom ival : fxp -> BitVec 64
axiom rval : fxp -> ℝ
axiom iexp : fxp -> ℤ
axiom fxp'invariant (self : fxp) : rval self = trunc_at (rval self) (iexp self) ∧ BitVec.toUInt (ival self) = Truncate.floor (rval self * pow2 (-iexp self)) % ((18446744073709551615 : ℤ) + (1 : ℤ))
noncomputable def fxp'eq (a : fxp) (b : fxp) := ival a = ival b ∧ rval a = rval b ∧ iexp a = iexp b
axiom fxp'inj (a : fxp) (b : fxp) (fact0 : fxp'eq a b) : a = b
end Fxp
namespace Sqrt1
end Sqrt1
namespace Valuation
axiom valuation : ℤ -> ℤ -> ℤ
axiom valuation'def (p : ℤ) (n : ℤ) (fact0 : (1 : ℤ) < p) (fact1 : (1 : ℤ) ≤ n) : if Int.tmod n p = (0 : ℤ) then valuation n p = valuation (Int.tdiv n p) p + (1 : ℤ) else valuation n p = (0 : ℤ)
axiom valuation'spec'0 (p : ℤ) (n : ℤ) (fact0 : (1 : ℤ) < p) (fact1 : (1 : ℤ) ≤ n) : (0 : ℤ) ≤ valuation n p
axiom valuation'spec (p : ℤ) (n : ℤ) (fact0 : (1 : ℤ) < p) (fact1 : (1 : ℤ) ≤ n) : HPow.hPow p (Int.toNat (valuation n p)) ∣  n
end Valuation
namespace Toom
end Toom
namespace sqrtrem_Sqrt_wmpn_dc_sqrtremqtvc
theorem wmpn_dc_sqrtrem'vc (np : C.ptr (BitVec 64)) (n : BitVec 32) (sp : C.ptr (BitVec 64)) (scratch : C.ptr (BitVec 64)) (o1 : Bool) (fact0 : C.valid np (BitVec.toInt n + BitVec.toInt n)) (fact1 : C.valid sp (BitVec.toInt n)) (fact2 : (1 : ℤ) ≤ BitVec.toInt n) (fact3 : C.valid scratch ((1 : ℤ) + BitVec.toInt n / (2 : ℤ))) (fact4 : HPow.hPow (2 : ℤ) (Int.toNat ((64 : ℤ) - (2 : ℤ))) ≤ BitVec.toUInt (C.pelts np (C.offset np + BitVec.toInt n + BitVec.toInt n - (1 : ℤ)))) (fact5 : C.writable sp = true) (fact6 : C.writable scratch = true) (fact7 : C.writable np = true) (fact8 : (4 : ℤ) * BitVec.toInt n < (2147483647 : ℤ)) (fact9 : BitVec.toInt n = BitVec.toInt (1 : BitVec 32) → o1 = true) (fact10 : o1 = true → n = (1 : BitVec 32)) : if o1 = true then (C.valid scratch (1 : ℤ) ∧ C.valid sp (1 : ℤ) ∧ C.valid np (2 : ℤ) ∧ HPow.hPow (2 : ℤ) (Int.toNat ((64 : ℤ) - (2 : ℤ))) ≤ BitVec.toUInt (C.pelts np (C.offset np + (1 : ℤ))) ∧ C.writable sp = true ∧ C.writable scratch = true) ∧ (∀(scratch1 : C.ptr (BitVec 64)) (sp1 : C.ptr (BitVec 64)), List.length (C.data scratch1) = List.length (C.data scratch) ∧ C.offset scratch1 = C.offset scratch ∧ C.min scratch1 = C.min scratch ∧ C.max scratch1 = C.max scratch ∧ C.writable scratch1 = C.writable scratch ∧ C.zone1 scratch1 = C.zone1 scratch → List.length (C.data sp1) = List.length (C.data sp) ∧ C.offset sp1 = C.offset sp ∧ C.min sp1 = C.min sp ∧ C.max sp1 = C.max sp ∧ C.writable sp1 = C.writable sp ∧ C.zone1 sp1 = C.zone1 sp → (∀(r : BitVec 64), Lemmas.value np (2 : ℤ) = BitVec.toUInt (C.pelts sp1 (C.offset sp1)) * BitVec.toUInt (C.pelts sp1 (C.offset sp1)) + BitVec.toUInt r * ((18446744073709551615 : ℤ) + (1 : ℤ)) + BitVec.toUInt (C.pelts scratch1 (C.offset scratch1)) ∧ BitVec.toUInt (C.pelts scratch1 (C.offset scratch1)) + BitVec.toUInt r * ((18446744073709551615 : ℤ) + (1 : ℤ)) ≤ (2 : ℤ) * BitVec.toUInt (C.pelts sp1 (C.offset sp1)) ∧ (0 : ℤ) ≤ BitVec.toUInt r ∧ BitVec.toUInt r ≤ (1 : ℤ) → (C.min scratch1 ≤ C.offset scratch1 ∧ C.offset scratch1 < C.max scratch1) ∧ ((C.min np ≤ C.offset np ∧ C.offset np < C.max np) ∧ C.writable np = true) ∧ (∀(np1 : C.ptr (BitVec 64)), List.length (C.data np1) = List.length (C.data np) ∧ C.offset np1 = C.offset np ∧ C.min np1 = C.min np ∧ C.max np1 = C.max np ∧ C.writable np1 = C.writable np ∧ C.zone1 np1 = C.zone1 np → C.pelts np1 = Function.update (C.pelts np) (C.offset np1) (C.pelts scratch1 (C.offset scratch1)) → Lemmas.value sp1 (BitVec.toInt n) * Lemmas.value sp1 (BitVec.toInt n) + Lemmas.value np1 (BitVec.toInt n) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n)) * BitVec.toUInt r = Lemmas.value np (BitVec.toInt n + BitVec.toInt n) ∧ Lemmas.value np1 (BitVec.toInt n) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n)) * BitVec.toUInt r ≤ (2 : ℤ) * Lemmas.value sp1 (BitVec.toInt n) ∧ HPow.hPow (2 : ℤ) (Int.toNat ((64 : ℤ) - (1 : ℤ))) ≤ BitVec.toUInt (C.pelts sp1 (C.offset sp1 + BitVec.toInt n - (1 : ℤ))) ∧ ((0 : ℤ) ≤ BitVec.toUInt r ∧ BitVec.toUInt r ≤ (1 : ℤ)) ∧ C.max np1 = C.max np ∧ C.min np1 = C.min np ∧ C.plength np1 = C.plength np ∧ C.max scratch1 = C.max scratch ∧ C.min scratch1 = C.min scratch ∧ C.plength scratch1 = C.plength scratch ∧ C.max sp1 = C.max sp ∧ C.min sp1 = C.min sp ∧ C.plength sp1 = C.plength sp))) else (¬(2 : ℤ) = (0 : ℤ) ∧ int'32_in_bounds (Int.tdiv (BitVec.toInt n) (2 : ℤ))) ∧ (∀(l : BitVec 32), BitVec.toInt l = Int.tdiv (BitVec.toInt n) (2 : ℤ) → int'32_in_bounds (BitVec.toInt n - BitVec.toInt l) ∧ (∀(h : BitVec 32), BitVec.toInt h = BitVec.toInt n - BitVec.toInt l → (let vn : ℤ := Lemmas.value np (BitVec.toInt n + BitVec.toInt n); int'32_in_bounds (BitVec.toInt l + BitVec.toInt l) ∧ (∀(o2 : BitVec 32), BitVec.toInt o2 = BitVec.toInt l + BitVec.toInt l → ((0 : ℤ) ≤ BitVec.toInt o2 ∧ (C.min np ≤ C.offset np + BitVec.toInt o2 ∧ C.offset np + BitVec.toInt o2 ≤ C.max np) ∧ C.writable np = true) ∧ (∀(np1 : C.ptr (BitVec 64)), C.offset np1 = C.offset np ∧ C.min np1 = C.min np ∧ C.writable np1 = C.writable np ∧ C.zone1 np1 = C.zone1 np → (∀(np' : C.ptr (BitVec 64)), C.writable np' = true ∧ C.offset np' = C.offset np1 + BitVec.toInt o2 ∧ C.max np1 = C.offset np1 + BitVec.toInt o2 ∧ C.min np' = C.offset np1 + BitVec.toInt o2 ∧ C.max np' = C.max np ∧ C.zone1 np' = C.zone1 np1 ∧ C.pelts np1 = C.pelts np ∧ C.plength np1 = C.plength np ∧ C.pelts np' = C.pelts np ∧ C.plength np' = C.plength np → (let n0 : ℤ := Lemmas.value np1 (BitVec.toInt l); let n1 : ℤ := Lemmas.value_sub (C.pelts np1) (C.offset np1 + BitVec.toInt l) (C.offset np1 + BitVec.toInt l + BitVec.toInt l); HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n + BitVec.toInt n)) ≤ (4 : ℤ) * vn ∧ (HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n + BitVec.toInt n)) ≤ (4 : ℤ) * vn → ((0 : ℤ) ≤ BitVec.toInt l ∧ (C.min sp ≤ C.offset sp + BitVec.toInt l ∧ C.offset sp + BitVec.toInt l ≤ C.max sp) ∧ C.writable sp = true) ∧ (∀(sp1 : C.ptr (BitVec 64)), C.offset sp1 = C.offset sp ∧ C.min sp1 = C.min sp ∧ C.writable sp1 = C.writable sp ∧ C.zone1 sp1 = C.zone1 sp → (∀(spl : C.ptr (BitVec 64)), C.writable spl = true ∧ C.offset spl = C.offset sp1 + BitVec.toInt l ∧ C.max sp1 = C.offset sp1 + BitVec.toInt l ∧ C.min spl = C.offset sp1 + BitVec.toInt l ∧ C.max spl = C.max sp ∧ C.zone1 spl = C.zone1 sp1 ∧ C.pelts sp1 = C.pelts sp ∧ C.plength sp1 = C.plength sp ∧ C.pelts spl = C.pelts sp ∧ C.plength spl = C.plength sp → (BitVec.toInt h < BitVec.toInt n ∧ C.valid np' (BitVec.toInt h + BitVec.toInt h) ∧ C.valid spl (BitVec.toInt h) ∧ (1 : ℤ) ≤ BitVec.toInt h ∧ C.valid scratch ((1 : ℤ) + BitVec.toInt h / (2 : ℤ)) ∧ HPow.hPow (2 : ℤ) (Int.toNat ((64 : ℤ) - (2 : ℤ))) ≤ BitVec.toUInt (C.pelts np' (C.offset np' + BitVec.toInt h + BitVec.toInt h - (1 : ℤ))) ∧ (C.writable spl = true ∧ C.writable scratch = true ∧ C.writable np' = true) ∧ (4 : ℤ) * BitVec.toInt h < (2147483647 : ℤ)) ∧ (∀(spl1 : C.ptr (BitVec 64)) (np'1 : C.ptr (BitVec 64)) (scratch1 : C.ptr (BitVec 64)), C.offset spl1 = C.offset spl ∧ C.writable spl1 = C.writable spl ∧ C.zone1 spl1 = C.zone1 spl → C.offset np'1 = C.offset np' ∧ C.min np'1 = C.min np' ∧ C.writable np'1 = C.writable np' ∧ C.zone1 np'1 = C.zone1 np' → C.offset scratch1 = C.offset scratch ∧ C.writable scratch1 = C.writable scratch ∧ C.zone1 scratch1 = C.zone1 scratch → (∀(o3 : BitVec 64), Lemmas.value spl1 (BitVec.toInt h) * Lemmas.value spl1 (BitVec.toInt h) + Lemmas.value np'1 (BitVec.toInt h) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt h)) * BitVec.toUInt o3 = Lemmas.value np' (BitVec.toInt h + BitVec.toInt h) ∧ Lemmas.value np'1 (BitVec.toInt h) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt h)) * BitVec.toUInt o3 ≤ (2 : ℤ) * Lemmas.value spl1 (BitVec.toInt h) ∧ HPow.hPow (2 : ℤ) (Int.toNat ((64 : ℤ) - (1 : ℤ))) ≤ BitVec.toUInt (C.pelts spl1 (C.offset spl1 + BitVec.toInt h - (1 : ℤ))) ∧ ((0 : ℤ) ≤ BitVec.toUInt o3 ∧ BitVec.toUInt o3 ≤ (1 : ℤ)) ∧ C.max np'1 = C.max np' ∧ C.min np'1 = C.min np' ∧ C.plength np'1 = C.plength np' ∧ C.max scratch1 = C.max scratch ∧ C.min scratch1 = C.min scratch ∧ C.plength scratch1 = C.plength scratch ∧ C.max spl1 = C.max spl ∧ C.min spl1 = C.min spl ∧ C.plength spl1 = C.plength spl → HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt l)) ≤ (2 : ℤ) * Lemmas.value spl1 (BitVec.toInt h) ∧ (HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt l)) ≤ (2 : ℤ) * Lemmas.value spl1 (BitVec.toInt h) → (let r' : ℤ := Lemmas.value np'1 (BitVec.toInt h) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt h)) * BitVec.toUInt o3; (∀(o4 : Bool), (BitVec.toUInt o3 = BitVec.toUInt (0 : BitVec 64) → o4 = true) ∧ (o4 = true → o3 = (0 : BitVec 64)) → (if ¬o4 = true then ((0 : ℤ) ≤ BitVec.toInt h ∧ C.valid np'1 (BitVec.toInt h) ∧ C.valid spl1 (BitVec.toInt h) ∧ C.writable np'1 = true) ∧ (∀(np'2 : C.ptr (BitVec 64)), List.length (C.data np'2) = List.length (C.data np'1) ∧ C.offset np'2 = C.offset np'1 ∧ C.min np'2 = C.min np'1 ∧ C.max np'2 = C.max np'1 ∧ C.writable np'2 = C.writable np'1 ∧ C.zone1 np'2 = C.zone1 np'1 → (∀(b : BitVec 64), Lemmas.value np'2 (BitVec.toInt h) - HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt h)) * BitVec.toUInt b = Lemmas.value np'1 (BitVec.toInt h) - Lemmas.value spl1 (BitVec.toInt h) ∧ ((0 : ℤ) ≤ BitVec.toUInt b ∧ BitVec.toUInt b ≤ (1 : ℤ)) ∧ (∀(j : ℤ), j < C.offset np'2 ∨ C.offset np'2 + BitVec.toInt h ≤ j → C.pelts np'2 j = C.pelts np'1 j) → BitVec.toUInt o3 = (1 : ℤ) ∧ Lemmas.value np'2 (BitVec.toInt h) = r' - Lemmas.value spl1 (BitVec.toInt h) ∨ BitVec.toUInt o3 = (0 : ℤ) ∧ Lemmas.value np'2 (BitVec.toInt h) = r')) else BitVec.toUInt o3 = (1 : ℤ) ∧ Lemmas.value np'1 (BitVec.toInt h) = r' - Lemmas.value spl1 (BitVec.toInt h) ∨ BitVec.toUInt o3 = (0 : ℤ) ∧ Lemmas.value np'1 (BitVec.toInt h) = r')) ∧ (∀(np'2 : C.ptr (BitVec 64)), List.length (C.data np'2) = List.length (C.data np'1) ∧ C.offset np'2 = C.offset np'1 ∧ C.min np'2 = C.min np'1 ∧ C.max np'2 = C.max np'1 ∧ C.writable np'2 = C.writable np'1 ∧ C.zone1 np'2 = C.zone1 np'1 → BitVec.toUInt o3 = (1 : ℤ) ∧ Lemmas.value np'2 (BitVec.toInt h) = r' - Lemmas.value spl1 (BitVec.toInt h) ∨ BitVec.toUInt o3 = (0 : ℤ) ∧ Lemmas.value np'2 (BitVec.toInt h) = r' → (C.zone1 np1 = C.zone1 np'2 ∧ C.max np1 = C.min np'2 ∧ C.writable np1 = true ∧ C.writable np'2 = true) ∧ (∀(np2 : C.ptr (BitVec 64)), List.length (C.data np2) = List.length (C.data np1) ∧ C.offset np2 = C.offset np1 ∧ C.min np2 = C.min np1 ∧ C.writable np2 = C.writable np1 ∧ C.zone1 np2 = C.zone1 np1 → C.max np2 = C.max np'2 ∧ C.plength np2 = C.plength np1 ∧ (∀(i : ℤ), C.min np1 ≤ i ∧ i < C.max np1 → C.pelts np2 i = C.pelts np1 i) ∧ (∀(i : ℤ), C.min np'2 ≤ i ∧ i < C.max np'2 → C.pelts np2 i = C.pelts np'2 i) → ((0 : ℤ) ≤ BitVec.toInt l ∧ (C.min np2 ≤ C.offset np2 + BitVec.toInt l ∧ C.offset np2 + BitVec.toInt l ≤ C.max np2) ∧ C.writable np2 = true) ∧ (∀(np3 : C.ptr (BitVec 64)), C.offset np3 = C.offset np2 ∧ C.min np3 = C.min np2 ∧ C.writable np3 = C.writable np2 ∧ C.zone1 np3 = C.zone1 np2 → (∀(npl : C.ptr (BitVec 64)), C.writable npl = true ∧ C.offset npl = C.offset np3 + BitVec.toInt l ∧ C.max np3 = C.offset np3 + BitVec.toInt l ∧ C.min npl = C.offset np3 + BitVec.toInt l ∧ C.max npl = C.max np2 ∧ C.zone1 npl = C.zone1 np3 ∧ C.pelts np3 = C.pelts np2 ∧ C.plength np3 = C.plength np2 ∧ C.pelts npl = C.pelts np2 ∧ C.plength npl = C.plength np2 → (((1 : ℤ) ≤ BitVec.toInt h ∧ BitVec.toInt h ≤ BitVec.toInt n ∧ BitVec.toInt n ≤ (2147483647 : ℤ) - (1 : ℤ)) ∧ C.valid npl (BitVec.toInt n) ∧ C.valid spl1 (BitVec.toInt h) ∧ C.valid scratch1 (BitVec.toInt n - BitVec.toInt h + (1 : ℤ)) ∧ (C.writable npl = true ∧ C.writable scratch1 = true) ∧ (0 : ℤ) < BitVec.toUInt (C.pelts spl1 (C.offset spl1 + BitVec.toInt h - (1 : ℤ)))) ∧ (∀(npl1 : C.ptr (BitVec 64)) (scratch2 : C.ptr (BitVec 64)), List.length (C.data npl1) = List.length (C.data npl) ∧ C.offset npl1 = C.offset npl ∧ C.min npl1 = C.min npl ∧ C.max npl1 = C.max npl ∧ C.writable npl1 = C.writable npl ∧ C.zone1 npl1 = C.zone1 npl → List.length (C.data scratch2) = List.length (C.data scratch1) ∧ C.offset scratch2 = C.offset scratch1 ∧ C.min scratch2 = C.min scratch1 ∧ C.max scratch2 = C.max scratch1 ∧ C.writable scratch2 = C.writable scratch1 ∧ C.zone1 scratch2 = C.zone1 scratch1 → Lemmas.value npl (BitVec.toInt n) = Lemmas.value scratch2 (BitVec.toInt n - BitVec.toInt h + (1 : ℤ)) * Lemmas.value spl1 (BitVec.toInt h) + Lemmas.value npl1 (BitVec.toInt h) ∧ Lemmas.value npl1 (BitVec.toInt h) < Lemmas.value spl1 (BitVec.toInt h) → (C.min scratch2 ≤ C.offset scratch2 + BitVec.toInt l ∧ C.offset scratch2 + BitVec.toInt l < C.max scratch2) ∧ (let sl : BitVec 64 := C.pelts scratch2 (C.offset scratch2 + BitVec.toInt l); uint'64_in_bounds (BitVec.toUInt o3 + BitVec.toUInt sl) ∧ (∀(o4 : BitVec 64), BitVec.toUInt o4 = BitVec.toUInt o3 + BitVec.toUInt sl → (C.min scratch2 ≤ C.offset scratch2 ∧ C.offset scratch2 < C.max scratch2) ∧ (let sh : BitVec 64 := C.pelts scratch2 (C.offset scratch2); (¬(2 : ℤ) = (0 : ℤ) ∧ uint'64_in_bounds (Int.tmod (BitVec.toUInt sh) (2 : ℤ))) ∧ (∀(o5 : BitVec 64), BitVec.toUInt o5 = Int.tmod (BitVec.toUInt sh) (2 : ℤ) → BitVec.toUInt o5 ≤ (9223372036854775807 : ℤ) ∧ (∀(o6 : BitVec 64), BitVec.toInt o6 = BitVec.toUInt o5 → (C.valid scratch2 (BitVec.toInt l) ∧ C.valid sp1 (BitVec.toInt l) ∧ ((0 : ℤ) < (1 : ℤ) ∧ (1 : ℤ) < (64 : ℤ)) ∧ (0 : ℤ) < BitVec.toInt l ∧ C.writable sp1 = true) ∧ (∀(scratch3 : C.ptr (BitVec 64)) (sp2 : C.ptr (BitVec 64)), C.offset scratch3 = C.offset scratch2 ∧ C.writable scratch3 = C.writable scratch2 ∧ C.zone1 scratch3 = C.zone1 scratch2 → C.offset sp2 = C.offset sp1 ∧ C.writable sp2 = C.writable sp1 ∧ C.zone1 sp2 = C.zone1 sp1 → (∀(r : BitVec 64), BitVec.toUInt r + ((18446744073709551615 : ℤ) + (1 : ℤ)) * Lemmas.value sp2 (BitVec.toInt l) = Lemmas.value scratch3 (BitVec.toInt l) * HPow.hPow (2 : ℤ) (Int.toNat ((64 : ℤ) - (1 : ℤ))) ∧ (∀(j : ℤ), j < C.offset sp2 ∨ C.offset sp2 + BitVec.toInt l ≤ j → C.pelts sp2 j = C.pelts sp1 j) ∧ C.pelts scratch3 = C.pelts scratch2 ∧ (C.min scratch3 = C.min scratch2 ∧ C.max scratch3 = C.max scratch2 ∧ C.plength scratch3 = C.plength scratch2) ∧ C.min sp2 = C.min sp1 ∧ C.max sp2 = C.max sp1 ∧ C.plength sp2 = C.plength sp1 → int'32_in_bounds (BitVec.toInt l - (1 : ℤ)) ∧ (∀(o7 : BitVec 32), BitVec.toInt o7 = BitVec.toInt l - (1 : ℤ) → (C.min sp2 ≤ C.offset sp2 + BitVec.toInt o7 ∧ C.offset sp2 + BitVec.toInt o7 < C.max sp2) ∧ (let st : BitVec 64 := C.pelts sp2 (C.offset sp2 + BitVec.toInt o7); uint'64_in_bounds (64 : ℤ) ∧ (∀(o8 : BitVec 64), BitVec.toUInt o8 = (64 : ℤ) → uint'64_in_bounds (BitVec.toUInt o8 - (1 : ℤ)) ∧ (∀(o9 : BitVec 64), BitVec.toUInt o9 = BitVec.toUInt o8 - (1 : ℤ) → ((0 : ℤ) ≤ BitVec.toUInt o9 ∧ BitVec.toUInt o9 < (64 : ℤ)) ∧ (∀(ql : BitVec 64), BitVec.toUInt ql = BitVec.toUInt o4 * HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt o9)) % ((18446744073709551615 : ℤ) + (1 : ℤ)) ∧ BitVec.toUInt ql ≤ (18446744073709551615 : ℤ) + (1 : ℤ) - HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt o9)) → ((0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) < (64 : ℤ)) ∧ (∀(qh : BitVec 64), BitVec.toUInt qh = BitVec.toUInt o4 / HPow.hPow (2 : ℤ) (1 : ℕ) → uint'64_in_bounds (BitVec.toUInt st + BitVec.toUInt ql) ∧ (∀(o10 : BitVec 64), BitVec.toUInt o10 = BitVec.toUInt st + BitVec.toUInt ql → int'32_in_bounds (BitVec.toInt l - (1 : ℤ)) ∧ (∀(o11 : BitVec 32), BitVec.toInt o11 = BitVec.toInt l - (1 : ℤ) → ((C.min sp2 ≤ C.offset sp2 + BitVec.toInt o11 ∧ C.offset sp2 + BitVec.toInt o11 < C.max sp2) ∧ C.writable sp2 = true) ∧ (∀(sp3 : C.ptr (BitVec 64)), List.length (C.data sp3) = List.length (C.data sp2) ∧ C.offset sp3 = C.offset sp2 ∧ C.min sp3 = C.min sp2 ∧ C.max sp3 = C.max sp2 ∧ C.writable sp3 = C.writable sp2 ∧ C.zone1 sp3 = C.zone1 sp2 → C.pelts sp3 = Function.update (C.pelts sp2) (C.offset sp3 + BitVec.toInt o11) o10 ∧ C.pelts sp3 (C.offset sp3 + BitVec.toInt o11) = o10 → ((BitVec.toInt o6 = (0 : ℤ) → o6 = (0 : BitVec 64)) → (if ¬o6 = (0 : BitVec 64) then (C.valid npl1 (BitVec.toInt h) ∧ C.valid spl1 (BitVec.toInt h) ∧ C.writable npl1 = true) ∧ (∀(npl2 : C.ptr (BitVec 64)), List.length (C.data npl2) = List.length (C.data npl1) ∧ C.offset npl2 = C.offset npl1 ∧ C.min npl2 = C.min npl1 ∧ C.max npl2 = C.max npl1 ∧ C.writable npl2 = C.writable npl1 ∧ C.zone1 npl2 = C.zone1 npl1 → (∀(c' : BitVec 64), ((0 : ℤ) ≤ BitVec.toUInt c' ∧ BitVec.toUInt c' ≤ (1 : ℤ)) ∧ Lemmas.value npl2 (BitVec.toInt h) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt h)) * BitVec.toUInt c' = Lemmas.value npl1 (BitVec.toInt h) + Lemmas.value spl1 (BitVec.toInt h) ∧ (∀(j : ℤ), j < C.offset npl2 ∨ C.offset npl2 + BitVec.toInt h ≤ j → C.pelts npl2 j = C.pelts npl1 j) → BitVec.toUInt c' ≤ (9223372036854775807 : ℤ) ∧ (∀(o12 : BitVec 64), BitVec.toInt o12 = BitVec.toUInt c' → n1 + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt l)) * r' = (2 : ℤ) * Lemmas.value spl1 (BitVec.toInt h) * (Lemmas.value sp3 (BitVec.toInt l) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt l)) * BitVec.toUInt qh) + Lemmas.value npl2 (BitVec.toInt h) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt h)) * BitVec.toInt o12 ∧ ((0 : ℤ) ≤ BitVec.toInt o12 ∧ BitVec.toInt o12 ≤ (1 : ℤ)) ∧ (0 : ℤ) ≤ Lemmas.value npl2 (BitVec.toInt h) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt h)) * BitVec.toInt o12 ∧ Lemmas.value npl2 (BitVec.toInt h) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt h)) * BitVec.toInt o12 < (2 : ℤ) * Lemmas.value spl1 (BitVec.toInt h)))) else n1 + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt l)) * r' = (2 : ℤ) * Lemmas.value spl1 (BitVec.toInt h) * (Lemmas.value sp3 (BitVec.toInt l) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt l)) * BitVec.toUInt qh) + Lemmas.value npl1 (BitVec.toInt h) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt h)) * BitVec.toInt o6 ∧ ((0 : ℤ) ≤ BitVec.toInt o6 ∧ BitVec.toInt o6 ≤ (1 : ℤ)) ∧ (0 : ℤ) ≤ Lemmas.value npl1 (BitVec.toInt h) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt h)) * BitVec.toInt o6 ∧ Lemmas.value npl1 (BitVec.toInt h) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt h)) * BitVec.toInt o6 < (2 : ℤ) * Lemmas.value spl1 (BitVec.toInt h))) ∧ (∀(c : BitVec 64) (npl2 : C.ptr (BitVec 64)), List.length (C.data npl2) = List.length (C.data npl1) ∧ C.offset npl2 = C.offset npl1 ∧ C.min npl2 = C.min npl1 ∧ C.max npl2 = C.max npl1 ∧ C.writable npl2 = C.writable npl1 ∧ C.zone1 npl2 = C.zone1 npl1 → n1 + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt l)) * r' = (2 : ℤ) * Lemmas.value spl1 (BitVec.toInt h) * (Lemmas.value sp3 (BitVec.toInt l) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt l)) * BitVec.toUInt qh) + Lemmas.value npl2 (BitVec.toInt h) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt h)) * BitVec.toInt c ∧ ((0 : ℤ) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ (1 : ℤ)) ∧ (0 : ℤ) ≤ Lemmas.value npl2 (BitVec.toInt h) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt h)) * BitVec.toInt c ∧ Lemmas.value npl2 (BitVec.toInt h) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt h)) * BitVec.toInt c < (2 : ℤ) * Lemmas.value spl1 (BitVec.toInt h) → (let dq : ℤ := Lemmas.value sp3 (BitVec.toInt l) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt l)) * BitVec.toUInt qh; let r'' : ℤ := Lemmas.value npl2 (BitVec.toInt h) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt h)) * BitVec.toInt c; (C.zone1 np3 = C.zone1 npl2 ∧ C.max np3 = C.min npl2 ∧ C.writable np3 = true ∧ C.writable npl2 = true) ∧ (∀(np4 : C.ptr (BitVec 64)), List.length (C.data np4) = List.length (C.data np3) ∧ C.offset np4 = C.offset np3 ∧ C.min np4 = C.min np3 ∧ C.writable np4 = C.writable np3 ∧ C.zone1 np4 = C.zone1 np3 → C.max np4 = C.max npl2 ∧ C.plength np4 = C.plength np3 ∧ (∀(i : ℤ), C.min np3 ≤ i ∧ i < C.max np3 → C.pelts np4 i = C.pelts np3 i) ∧ (∀(i : ℤ), C.min npl2 ≤ i ∧ i < C.max npl2 → C.pelts np4 i = C.pelts npl2 i) → ((0 : ℤ) ≤ BitVec.toInt n ∧ (C.min np4 ≤ C.offset np4 + BitVec.toInt n ∧ C.offset np4 + BitVec.toInt n ≤ C.max np4) ∧ C.writable np4 = true) ∧ (∀(np5 : C.ptr (BitVec 64)), C.offset np5 = C.offset np4 ∧ C.min np5 = C.min np4 ∧ C.writable np5 = C.writable np4 ∧ C.zone1 np5 = C.zone1 np4 → (∀(npn : C.ptr (BitVec 64)), C.writable npn = true ∧ C.offset npn = C.offset np5 + BitVec.toInt n ∧ C.max np5 = C.offset np5 + BitVec.toInt n ∧ C.min npn = C.offset np5 + BitVec.toInt n ∧ C.max npn = C.max np4 ∧ C.zone1 npn = C.zone1 np5 ∧ C.pelts np5 = C.pelts np4 ∧ C.plength np5 = C.plength np4 ∧ C.pelts npn = C.pelts np4 ∧ C.plength npn = C.plength np4 → (C.valid sp3 (BitVec.toInt l) ∧ C.valid sp3 (BitVec.toInt l) ∧ C.valid npn (BitVec.toInt l + BitVec.toInt l) ∧ C.writable npn = true ∧ ((0 : ℤ) < BitVec.toInt l ∧ BitVec.toInt l ≤ BitVec.toInt l) ∧ (8 : ℤ) * BitVec.toInt l < (2147483647 : ℤ) ∧ BitVec.toInt l ≤ BitVec.toInt (29 : BitVec 32) * HPow.hPow (2 : ℤ) (64 : ℕ) ∧ (0 : ℤ) ≤ (64 : ℤ) ∧ (64 : ℤ) ≤ (64 : ℤ)) ∧ (∀(npn1 : C.ptr (BitVec 64)), C.offset npn1 = C.offset npn ∧ C.writable npn1 = C.writable npn ∧ C.zone1 npn1 = C.zone1 npn → C.min npn1 = C.min npn ∧ C.max npn1 = C.max npn ∧ C.plength npn1 = C.plength npn ∧ Lemmas.value npn1 (BitVec.toInt l + BitVec.toInt l) = Lemmas.value sp3 (BitVec.toInt l) * Lemmas.value sp3 (BitVec.toInt l) ∧ (∀(j : ℤ), C.min npn1 ≤ j ∧ j < C.offset npn1 ∨ C.offset npn1 + BitVec.toInt l + BitVec.toInt l ≤ j ∧ j < C.max npn1 → C.pelts npn1 j = C.pelts npn j) → int'32_in_bounds ((2 : ℤ) * BitVec.toInt l) ∧ (∀(ll : BitVec 32), BitVec.toInt ll = (2 : ℤ) * BitVec.toInt l → ((0 : ℤ) ≤ BitVec.toInt ll ∧ C.valid np5 (BitVec.toInt ll) ∧ C.valid npn1 (BitVec.toInt ll) ∧ C.writable np5 = true) ∧ (∀(np6 : C.ptr (BitVec 64)), List.length (C.data np6) = List.length (C.data np5) ∧ C.offset np6 = C.offset np5 ∧ C.min np6 = C.min np5 ∧ C.max np6 = C.max np5 ∧ C.writable np6 = C.writable np5 ∧ C.zone1 np6 = C.zone1 np5 → (∀(bo : BitVec 64), Lemmas.value np6 (BitVec.toInt ll) - HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt ll)) * BitVec.toUInt bo = Lemmas.value np5 (BitVec.toInt ll) - Lemmas.value npn1 (BitVec.toInt ll) ∧ ((0 : ℤ) ≤ BitVec.toUInt bo ∧ BitVec.toUInt bo ≤ (1 : ℤ)) ∧ (∀(j : ℤ), j < C.offset np6 ∨ C.offset np6 + BitVec.toInt ll ≤ j → C.pelts np6 j = C.pelts np5 j) → uint'64_in_bounds (BitVec.toUInt qh + BitVec.toUInt bo) ∧ (∀(b : BitVec 64), BitVec.toUInt b = BitVec.toUInt qh + BitVec.toUInt bo → (∀(o12 : Bool), (BitVec.toInt l = BitVec.toInt h → o12 = true) ∧ (o12 = true → l = h) → (if o12 = true then BitVec.toUInt b ≤ (9223372036854775807 : ℤ) ∧ (∀(o13 : BitVec 64), BitVec.toInt o13 = BitVec.toUInt b → int'64_in_bounds (BitVec.toInt c - BitVec.toInt o13) ∧ (∀(o14 : BitVec 64), BitVec.toInt o14 = BitVec.toInt c - BitVec.toInt o13 → Lemmas.value np6 (BitVec.toInt n) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n)) * BitVec.toInt o14 = n0 + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt l)) * r'' - dq * dq ∧ -(1 : ℤ) ≤ BitVec.toInt o14 ∧ BitVec.toInt o14 ≤ (1 : ℤ))) else (C.min np6 ≤ C.offset np6 + BitVec.toInt ll ∧ C.offset np6 + BitVec.toInt ll ≤ C.max np6) ∧ (∀(nll : C.ptr (BitVec 64)), C.offset nll = C.offset np6 + BitVec.toInt ll ∧ C.plength nll = C.plength np6 ∧ C.pelts nll = C.pelts np6 ∧ C.data nll = C.data np6 ∧ C.min nll = C.min np6 ∧ C.max nll = C.max np6 ∧ C.zone1 nll = C.zone1 np6 ∧ C.writable nll = C.writable np6 → (C.valid nll (1 : ℤ) ∧ (0 : ℤ) < (1 : ℤ) ∧ C.writable nll = true) ∧ (∀(nll1 : C.ptr (BitVec 64)) (np7 : C.ptr (BitVec 64)), C.data nll1 = C.data np7 ∧ List.length (C.data np7) = List.length (C.data nll) ∧ C.offset nll1 = C.offset nll ∧ C.min nll1 = C.min nll ∧ C.max nll1 = C.max nll ∧ C.writable nll1 = C.writable nll ∧ C.zone1 nll1 = C.zone1 nll → List.length (C.data np7) = List.length (C.data np6) ∧ C.offset np7 = C.offset np6 ∧ C.min np7 = C.min np6 ∧ C.max np7 = C.max np6 ∧ C.writable np7 = C.writable np6 ∧ C.zone1 np7 = C.zone1 np6 → (∀(bo1 : BitVec 64), Lemmas.value nll1 (1 : ℤ) - HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (1 : ℕ) * BitVec.toUInt bo1 = Lemmas.value nll (1 : ℤ) - BitVec.toUInt b ∧ ((0 : ℤ) ≤ BitVec.toUInt bo1 ∧ BitVec.toUInt bo1 ≤ (1 : ℤ)) ∧ (∀(j : ℤ), j < C.offset nll1 ∨ C.offset nll1 + (1 : ℤ) ≤ j → C.pelts nll1 j = C.pelts nll j) → BitVec.toUInt bo1 ≤ (9223372036854775807 : ℤ) ∧ (∀(o13 : BitVec 64), BitVec.toInt o13 = BitVec.toUInt bo1 → int'64_in_bounds (BitVec.toInt c - BitVec.toInt o13) ∧ (∀(o14 : BitVec 64), BitVec.toInt o14 = BitVec.toInt c - BitVec.toInt o13 → Lemmas.value np7 (BitVec.toInt n) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n)) * BitVec.toInt o14 = n0 + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt l)) * r'' - dq * dq ∧ -(1 : ℤ) ≤ BitVec.toInt o14 ∧ BitVec.toInt o14 ≤ (1 : ℤ)))))))) ∧ (∀(c1 : BitVec 64) (np7 : C.ptr (BitVec 64)), List.length (C.data np7) = List.length (C.data np6) ∧ C.offset np7 = C.offset np6 ∧ C.min np7 = C.min np6 ∧ C.max np7 = C.max np6 ∧ C.writable np7 = C.writable np6 ∧ C.zone1 np7 = C.zone1 np6 → Lemmas.value np7 (BitVec.toInt n) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n)) * BitVec.toInt c1 = n0 + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt l)) * r'' - dq * dq ∧ -(1 : ℤ) ≤ BitVec.toInt c1 ∧ BitVec.toInt c1 ≤ (1 : ℤ) → (if BitVec.toInt c1 < (0 : ℤ) then (C.valid spl1 (BitVec.toInt h) ∧ (0 : ℤ) < BitVec.toInt h ∧ C.writable spl1 = true) ∧ (∀(spl2 : C.ptr (BitVec 64)), List.length (C.data spl2) = List.length (C.data spl1) ∧ C.offset spl2 = C.offset spl1 ∧ C.min spl2 = C.min spl1 ∧ C.max spl2 = C.max spl1 ∧ C.writable spl2 = C.writable spl1 ∧ C.zone1 spl2 = C.zone1 spl1 → (∀(o12 : BitVec 64), Lemmas.value spl2 (BitVec.toInt h) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt h)) * BitVec.toUInt o12 = Lemmas.value spl1 (BitVec.toInt h) + BitVec.toUInt qh ∧ ((0 : ℤ) ≤ BitVec.toUInt o12 ∧ BitVec.toUInt o12 ≤ (1 : ℤ)) ∧ (∀(j : ℤ), j < C.offset spl2 ∨ C.offset spl2 + BitVec.toInt h ≤ j → C.pelts spl2 j = C.pelts spl1 j) → (C.zone1 sp3 = C.zone1 spl2 ∧ C.max sp3 = C.min spl2 ∧ C.writable sp3 = true ∧ C.writable spl2 = true) ∧ (∀(sp4 : C.ptr (BitVec 64)), List.length (C.data sp4) = List.length (C.data sp3) ∧ C.offset sp4 = C.offset sp3 ∧ C.min sp4 = C.min sp3 ∧ C.writable sp4 = C.writable sp3 ∧ C.zone1 sp4 = C.zone1 sp3 → C.max sp4 = C.max spl2 ∧ C.plength sp4 = C.plength sp3 ∧ (∀(i : ℤ), C.min sp3 ≤ i ∧ i < C.max sp3 → C.pelts sp4 i = C.pelts sp3 i) ∧ (∀(i : ℤ), C.min spl2 ≤ i ∧ i < C.max spl2 → C.pelts sp4 i = C.pelts spl2 i) → (C.valid sp4 (BitVec.toInt n) ∧ C.valid np7 (BitVec.toInt n) ∧ C.writable np7 = true) ∧ (∀(np8 : C.ptr (BitVec 64)), List.length (C.data np8) = List.length (C.data np7) ∧ C.offset np8 = C.offset np7 ∧ C.min np8 = C.min np7 ∧ C.max np8 = C.max np7 ∧ C.writable np8 = C.writable np7 ∧ C.zone1 np8 = C.zone1 np7 → (∀(c' : BitVec 64), Lemmas.value np8 (BitVec.toInt n) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n)) * BitVec.toUInt c' = Lemmas.value np7 (BitVec.toInt n) + Lemmas.value sp4 (BitVec.toInt n) * (2 : ℤ) ∧ (∀(j : ℤ), j < C.offset np8 ∨ C.offset np8 + BitVec.toInt n ≤ j → C.pelts np8 j = C.pelts np7 j) → uint'64_in_bounds ((2 : ℤ) * BitVec.toUInt o12) ∧ (∀(o13 : BitVec 64), BitVec.toUInt o13 = (2 : ℤ) * BitVec.toUInt o12 → uint'64_in_bounds (BitVec.toUInt o13 + BitVec.toUInt c') ∧ (∀(o14 : BitVec 64), BitVec.toUInt o14 = BitVec.toUInt o13 + BitVec.toUInt c' → BitVec.toUInt o14 ≤ (9223372036854775807 : ℤ) ∧ (∀(o15 : BitVec 64), BitVec.toInt o15 = BitVec.toUInt o14 → int'64_in_bounds (BitVec.toInt c1 + BitVec.toInt o15) ∧ (∀(o16 : BitVec 64), BitVec.toInt o16 = BitVec.toInt c1 + BitVec.toInt o15 → (C.valid np8 (BitVec.toInt n) ∧ (0 : ℤ) < BitVec.toInt n ∧ C.writable np8 = true) ∧ (∀(np9 : C.ptr (BitVec 64)), List.length (C.data np9) = List.length (C.data np8) ∧ C.offset np9 = C.offset np8 ∧ C.min np9 = C.min np8 ∧ C.max np9 = C.max np8 ∧ C.writable np9 = C.writable np8 ∧ C.zone1 np9 = C.zone1 np8 → (∀(o17 : BitVec 64), Lemmas.value np9 (BitVec.toInt n) - HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n)) * BitVec.toUInt o17 = Lemmas.value np8 (BitVec.toInt n) - (1 : ℤ) ∧ ((0 : ℤ) ≤ BitVec.toUInt o17 ∧ BitVec.toUInt o17 ≤ (1 : ℤ)) ∧ (∀(j : ℤ), j < C.offset np9 ∨ C.offset np9 + BitVec.toInt n ≤ j → C.pelts np9 j = C.pelts np8 j) → BitVec.toUInt o17 ≤ (9223372036854775807 : ℤ) ∧ (∀(o18 : BitVec 64), BitVec.toInt o18 = BitVec.toUInt o17 → int'64_in_bounds (BitVec.toInt o16 - BitVec.toInt o18) ∧ (∀(o19 : BitVec 64), BitVec.toInt o19 = BitVec.toInt o16 - BitVec.toInt o18 → (C.valid sp4 (BitVec.toInt n) ∧ (0 : ℤ) < BitVec.toInt n ∧ C.writable sp4 = true) ∧ (∀(sp5 : C.ptr (BitVec 64)), List.length (C.data sp5) = List.length (C.data sp4) ∧ C.offset sp5 = C.offset sp4 ∧ C.min sp5 = C.min sp4 ∧ C.max sp5 = C.max sp4 ∧ C.writable sp5 = C.writable sp4 ∧ C.zone1 sp5 = C.zone1 sp4 → (∀(bo1 : BitVec 64), Lemmas.value sp5 (BitVec.toInt n) - HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n)) * BitVec.toUInt bo1 = Lemmas.value sp4 (BitVec.toInt n) - (1 : ℤ) ∧ ((0 : ℤ) ≤ BitVec.toUInt bo1 ∧ BitVec.toUInt bo1 ≤ (1 : ℤ)) ∧ (∀(j : ℤ), j < C.offset sp5 ∨ C.offset sp5 + BitVec.toInt n ≤ j → C.pelts sp5 j = C.pelts sp4 j) → uint'64_in_bounds (BitVec.toUInt o12 - BitVec.toUInt bo1) ∧ (∀(o20 : BitVec 64), BitVec.toUInt o20 = BitVec.toUInt o12 - BitVec.toUInt bo1 → (C.zone1 np9 = C.zone1 npn1 ∧ C.max np9 = C.min npn1 ∧ C.writable np9 = true ∧ C.writable npn1 = true) ∧ (∀(np10 : C.ptr (BitVec 64)), List.length (C.data np10) = List.length (C.data np9) ∧ C.offset np10 = C.offset np9 ∧ C.min np10 = C.min np9 ∧ C.writable np10 = C.writable np9 ∧ C.zone1 np10 = C.zone1 np9 → C.max np10 = C.max npn1 ∧ C.plength np10 = C.plength np9 ∧ (∀(i : ℤ), C.min np9 ≤ i ∧ i < C.max np9 → C.pelts np10 i = C.pelts np9 i) ∧ (∀(i : ℤ), C.min npn1 ≤ i ∧ i < C.max npn1 → C.pelts np10 i = C.pelts npn1 i) → (0 : ℤ) ≤ BitVec.toInt o19 ∧ (∀(result : BitVec 64), BitVec.toUInt result = BitVec.toInt o19 → Lemmas.value sp5 (BitVec.toInt n) * Lemmas.value sp5 (BitVec.toInt n) + Lemmas.value np10 (BitVec.toInt n) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n)) * BitVec.toUInt result = Lemmas.value np (BitVec.toInt n + BitVec.toInt n) ∧ Lemmas.value np10 (BitVec.toInt n) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n)) * BitVec.toUInt result ≤ (2 : ℤ) * Lemmas.value sp5 (BitVec.toInt n) ∧ HPow.hPow (2 : ℤ) (Int.toNat ((64 : ℤ) - (1 : ℤ))) ≤ BitVec.toUInt (C.pelts sp5 (C.offset sp5 + BitVec.toInt n - (1 : ℤ))) ∧ ((0 : ℤ) ≤ BitVec.toUInt result ∧ BitVec.toUInt result ≤ (1 : ℤ)) ∧ C.max np10 = C.max np ∧ C.min np10 = C.min np ∧ C.plength np10 = C.plength np ∧ C.max scratch3 = C.max scratch ∧ C.min scratch3 = C.min scratch ∧ C.plength scratch3 = C.plength scratch ∧ C.max sp5 = C.max sp ∧ C.min sp5 = C.min sp ∧ C.plength sp5 = C.plength sp)))))))))))))))))) else (C.zone1 sp3 = C.zone1 spl1 ∧ C.max sp3 = C.min spl1 ∧ C.writable sp3 = true ∧ C.writable spl1 = true) ∧ (∀(sp4 : C.ptr (BitVec 64)), List.length (C.data sp4) = List.length (C.data sp3) ∧ C.offset sp4 = C.offset sp3 ∧ C.min sp4 = C.min sp3 ∧ C.writable sp4 = C.writable sp3 ∧ C.zone1 sp4 = C.zone1 sp3 → C.max sp4 = C.max spl1 ∧ C.plength sp4 = C.plength sp3 ∧ (∀(i : ℤ), C.min sp3 ≤ i ∧ i < C.max sp3 → C.pelts sp4 i = C.pelts sp3 i) ∧ (∀(i : ℤ), C.min spl1 ≤ i ∧ i < C.max spl1 → C.pelts sp4 i = C.pelts spl1 i) → (C.zone1 np7 = C.zone1 npn1 ∧ C.max np7 = C.min npn1 ∧ C.writable np7 = true ∧ C.writable npn1 = true) ∧ (∀(np8 : C.ptr (BitVec 64)), List.length (C.data np8) = List.length (C.data np7) ∧ C.offset np8 = C.offset np7 ∧ C.min np8 = C.min np7 ∧ C.writable np8 = C.writable np7 ∧ C.zone1 np8 = C.zone1 np7 → C.max np8 = C.max npn1 ∧ C.plength np8 = C.plength np7 ∧ (∀(i : ℤ), C.min np7 ≤ i ∧ i < C.max np7 → C.pelts np8 i = C.pelts np7 i) ∧ (∀(i : ℤ), C.min npn1 ≤ i ∧ i < C.max npn1 → C.pelts np8 i = C.pelts npn1 i) → (0 : ℤ) ≤ BitVec.toInt c1 ∧ (∀(result : BitVec 64), BitVec.toUInt result = BitVec.toInt c1 → Lemmas.value sp4 (BitVec.toInt n) * Lemmas.value sp4 (BitVec.toInt n) + Lemmas.value np8 (BitVec.toInt n) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n)) * BitVec.toUInt result = Lemmas.value np (BitVec.toInt n + BitVec.toInt n) ∧ Lemmas.value np8 (BitVec.toInt n) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n)) * BitVec.toUInt result ≤ (2 : ℤ) * Lemmas.value sp4 (BitVec.toInt n) ∧ HPow.hPow (2 : ℤ) (Int.toNat ((64 : ℤ) - (1 : ℤ))) ≤ BitVec.toUInt (C.pelts sp4 (C.offset sp4 + BitVec.toInt n - (1 : ℤ))) ∧ ((0 : ℤ) ≤ BitVec.toUInt result ∧ BitVec.toUInt result ≤ (1 : ℤ)) ∧ C.max np8 = C.max np ∧ C.min np8 = C.min np ∧ C.plength np8 = C.plength np ∧ C.max scratch3 = C.max scratch ∧ C.min scratch3 = C.min scratch ∧ C.plength scratch3 = C.plength scratch ∧ C.max sp4 = C.max sp ∧ C.min sp4 = C.min sp ∧ C.plength sp4 = C.plength sp))))))))))))))))))))))))))))))))))))))))))))))))))
  := sorry
end sqrtrem_Sqrt_wmpn_dc_sqrtremqtvc
