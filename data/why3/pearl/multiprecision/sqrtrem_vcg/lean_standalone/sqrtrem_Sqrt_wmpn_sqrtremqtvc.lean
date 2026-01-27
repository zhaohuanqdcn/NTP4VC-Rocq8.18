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
namespace sqrtrem_Sqrt_wmpn_sqrtremqtvc
noncomputable def ceilhalf (n : ℤ) := Int.tdiv (n + (1 : ℤ)) (2 : ℤ)
axiom ceilhalf'spec'0 (n : ℤ) : n ≤ (2 : ℤ) * ceilhalf n
axiom ceilhalf'spec (n : ℤ) : n < (2 : ℤ) * (ceilhalf n + (1 : ℤ))
theorem wmpn_sqrtrem'vc (sp : C.ptr (BitVec 64)) (n : BitVec 32) (rp : C.ptr (BitVec 64)) (np : C.ptr (BitVec 64)) (fact0 : C.valid sp (ceilhalf (BitVec.toInt n))) (fact1 : C.valid rp (BitVec.toInt n)) (fact2 : C.valid np (BitVec.toInt n)) (fact3 : C.writable sp = true) (fact4 : C.writable rp = true) (fact5 : C.writable np = true) (fact6 : (1 : ℤ) ≤ BitVec.toInt n) (fact7 : (4 : ℤ) * BitVec.toInt n < (2147483647 : ℤ)) (fact8 : (0 : ℤ) < BitVec.toUInt (C.pelts np (C.offset np + BitVec.toInt n - (1 : ℤ)))) : let o1 : ℤ := BitVec.toInt n; let k : ℤ := ceilhalf o1; o1 ≤ (2 : ℤ) * k ∧ o1 < (2 : ℤ) * (k + (1 : ℤ)) → int'32_in_bounds (BitVec.toInt n - (1 : ℤ)) ∧ (∀(o2 : BitVec 32), BitVec.toInt o2 = BitVec.toInt n - (1 : ℤ) → (C.min np ≤ C.offset np + BitVec.toInt o2 ∧ C.offset np + BitVec.toInt o2 < C.max np) ∧ (let high : BitVec 64 := C.pelts np (C.offset np + BitVec.toInt o2); (0 : ℤ) < BitVec.toUInt high ∧ (∀(o3 : BitVec 32), HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toInt o3)) * BitVec.toUInt high ≤ (18446744073709551615 : ℤ) ∧ (18446744073709551615 : ℤ) < (2 : ℤ) * HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toInt o3)) * BitVec.toUInt high ∧ (0 : ℤ) ≤ BitVec.toInt o3 ∧ BitVec.toInt o3 < (64 : ℤ) → (0 : ℤ) ≤ BitVec.toInt o3 ∧ (∀(o4 : BitVec 64), BitVec.toUInt o4 = BitVec.toInt o3 → (¬(2 : ℤ) = (0 : ℤ) ∧ uint'64_in_bounds (Int.tdiv (BitVec.toUInt o4) (2 : ℤ))) ∧ (∀(o5 : BitVec 64), BitVec.toUInt o5 = Int.tdiv (BitVec.toUInt o4) (2 : ℤ) → (∀(o6 : Bool), (BitVec.toInt n = BitVec.toInt (1 : BitVec 32) → o6 = true) ∧ (o6 = true → n = (1 : BitVec 32)) → (if o6 = true then ∀(o7 : Bool), (BitVec.toUInt o5 = BitVec.toUInt (0 : BitVec 64) → o7 = true) ∧ (o7 = true → o5 = (0 : BitVec 64)) → (if o7 = true then (C.valid rp (1 : ℤ) ∧ (4611686018427387904 : ℤ) ≤ BitVec.toUInt high ∧ C.writable rp = true) ∧ (∀(rp1 : C.ptr (BitVec 64)), List.length (C.data rp1) = List.length (C.data rp) ∧ C.offset rp1 = C.offset rp ∧ C.min rp1 = C.min rp ∧ C.max rp1 = C.max rp ∧ C.writable rp1 = C.writable rp ∧ C.zone1 rp1 = C.zone1 rp → (∀(s : BitVec 64), (BitVec.toUInt s * BitVec.toUInt s ≤ BitVec.toUInt high ∧ BitVec.toUInt high < (BitVec.toUInt s + (1 : ℤ)) * (BitVec.toUInt s + (1 : ℤ))) ∧ BitVec.toUInt s * BitVec.toUInt s + BitVec.toUInt (C.pelts rp1 (C.offset rp1)) = BitVec.toUInt high ∧ BitVec.toUInt (C.pelts rp1 (C.offset rp1)) ≤ (2 : ℤ) * BitVec.toUInt s → ((C.min sp ≤ C.offset sp ∧ C.offset sp < C.max sp) ∧ C.writable sp = true) ∧ (∀(sp1 : C.ptr (BitVec 64)), List.length (C.data sp1) = List.length (C.data sp) ∧ C.offset sp1 = C.offset sp ∧ C.min sp1 = C.min sp ∧ C.max sp1 = C.max sp ∧ C.writable sp1 = C.writable sp ∧ C.zone1 sp1 = C.zone1 sp → C.pelts sp1 = Function.update (C.pelts sp) (C.offset sp1) s → (C.min rp1 ≤ C.offset rp1 ∧ C.offset rp1 < C.max rp1) ∧ (let o8 : BitVec 64 := C.pelts rp1 (C.offset rp1); ∀(o9 : Bool), (BitVec.toUInt o8 = BitVec.toUInt (0 : BitVec 64) → o9 = true) ∧ (o9 = true → o8 = (0 : BitVec 64)) → (∀(res : BitVec 32), (if o9 = true then res = (0 : BitVec 32) else res = (1 : BitVec 32)) → Lemmas.value np (BitVec.toInt n) = Lemmas.value sp1 (ceilhalf (BitVec.toInt n)) * Lemmas.value sp1 (ceilhalf (BitVec.toInt n)) + Lemmas.value rp1 (BitVec.toInt res) ∧ ((0 : ℤ) ≤ BitVec.toInt res ∧ BitVec.toInt res ≤ BitVec.toInt n) ∧ Lemmas.value rp1 (BitVec.toInt res) ≤ (2 : ℤ) * Lemmas.value sp1 (ceilhalf (BitVec.toInt n)) ∧ ((0 : ℤ) < BitVec.toInt res → (0 : ℤ) < BitVec.toUInt (C.pelts rp1 (C.offset rp1 + BitVec.toInt res - (1 : ℤ)))) ∧ C.max rp1 = C.max rp ∧ C.min rp1 = C.min rp ∧ C.plength rp1 = C.plength rp ∧ C.max sp1 = C.max sp ∧ C.min sp1 = C.min sp ∧ C.plength sp1 = C.plength sp))))) else uint'64_in_bounds ((2 : ℤ) * BitVec.toUInt o5) ∧ (∀(o8 : BitVec 64), BitVec.toUInt o8 = (2 : ℤ) * BitVec.toUInt o5 → (((0 : ℤ) ≤ BitVec.toUInt o8 ∧ BitVec.toUInt o8 < (64 : ℤ)) ∧ HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt o8)) * BitVec.toUInt high ≤ (18446744073709551615 : ℤ)) ∧ (∀(nh : BitVec 64), BitVec.toUInt nh = HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt o8)) * BitVec.toUInt high → (C.valid rp (1 : ℤ) ∧ (4611686018427387904 : ℤ) ≤ BitVec.toUInt nh ∧ C.writable rp = true) ∧ (∀(rp1 : C.ptr (BitVec 64)), List.length (C.data rp1) = List.length (C.data rp) ∧ C.offset rp1 = C.offset rp ∧ C.min rp1 = C.min rp ∧ C.max rp1 = C.max rp ∧ C.writable rp1 = C.writable rp ∧ C.zone1 rp1 = C.zone1 rp → (∀(ncc : BitVec 64), (BitVec.toUInt ncc * BitVec.toUInt ncc ≤ BitVec.toUInt nh ∧ BitVec.toUInt nh < (BitVec.toUInt ncc + (1 : ℤ)) * (BitVec.toUInt ncc + (1 : ℤ))) ∧ BitVec.toUInt ncc * BitVec.toUInt ncc + BitVec.toUInt (C.pelts rp1 (C.offset rp1)) = BitVec.toUInt nh ∧ BitVec.toUInt (C.pelts rp1 (C.offset rp1)) ≤ (2 : ℤ) * BitVec.toUInt ncc → ((0 : ℤ) ≤ BitVec.toUInt o5 ∧ BitVec.toUInt o5 < (64 : ℤ)) ∧ (∀(cc : BitVec 64), BitVec.toUInt cc = BitVec.toUInt ncc / HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt o5)) → ((C.min sp ≤ C.offset sp ∧ C.offset sp < C.max sp) ∧ C.writable sp = true) ∧ (∀(sp1 : C.ptr (BitVec 64)), List.length (C.data sp1) = List.length (C.data sp) ∧ C.offset sp1 = C.offset sp ∧ C.min sp1 = C.min sp ∧ C.max sp1 = C.max sp ∧ C.writable sp1 = C.writable sp ∧ C.zone1 sp1 = C.zone1 sp → C.pelts sp1 = Function.update (C.pelts sp) (C.offset sp1) cc → uint'64_in_bounds (BitVec.toUInt cc * BitVec.toUInt cc) ∧ (∀(o9 : BitVec 64), BitVec.toUInt o9 = BitVec.toUInt cc * BitVec.toUInt cc → uint'64_in_bounds (BitVec.toUInt high - BitVec.toUInt o9) ∧ (∀(o10 : BitVec 64), BitVec.toUInt o10 = BitVec.toUInt high - BitVec.toUInt o9 → ((C.min rp1 ≤ C.offset rp1 ∧ C.offset rp1 < C.max rp1) ∧ C.writable rp1 = true) ∧ (∀(rp2 : C.ptr (BitVec 64)), List.length (C.data rp2) = List.length (C.data rp1) ∧ C.offset rp2 = C.offset rp1 ∧ C.min rp2 = C.min rp1 ∧ C.max rp2 = C.max rp1 ∧ C.writable rp2 = C.writable rp1 ∧ C.zone1 rp2 = C.zone1 rp1 → C.pelts rp2 = Function.update (C.pelts rp1) (C.offset rp2) o10 → (C.min rp2 ≤ C.offset rp2 ∧ C.offset rp2 < C.max rp2) ∧ (let o11 : BitVec 64 := C.pelts rp2 (C.offset rp2); ∀(o12 : Bool), (BitVec.toUInt o11 = BitVec.toUInt (0 : BitVec 64) → o12 = true) ∧ (o12 = true → o11 = (0 : BitVec 64)) → (∀(res : BitVec 32), (if o12 = true then res = (0 : BitVec 32) else res = (1 : BitVec 32)) → Lemmas.value np (BitVec.toInt n) = Lemmas.value sp1 (ceilhalf (BitVec.toInt n)) * Lemmas.value sp1 (ceilhalf (BitVec.toInt n)) + Lemmas.value rp2 (BitVec.toInt res) ∧ ((0 : ℤ) ≤ BitVec.toInt res ∧ BitVec.toInt res ≤ BitVec.toInt n) ∧ Lemmas.value rp2 (BitVec.toInt res) ≤ (2 : ℤ) * Lemmas.value sp1 (ceilhalf (BitVec.toInt n)) ∧ ((0 : ℤ) < BitVec.toInt res → (0 : ℤ) < BitVec.toUInt (C.pelts rp2 (C.offset rp2 + BitVec.toInt res - (1 : ℤ)))) ∧ C.max rp2 = C.max rp ∧ C.min rp2 = C.min rp ∧ C.plength rp2 = C.plength rp ∧ C.max sp1 = C.max sp ∧ C.min sp1 = C.min sp ∧ C.plength sp1 = C.plength sp)))))))))))) else int'32_in_bounds (BitVec.toInt n + (1 : ℤ)) ∧ (∀(o7 : BitVec 32), BitVec.toInt o7 = BitVec.toInt n + (1 : ℤ) → (¬(2 : ℤ) = (0 : ℤ) ∧ int'32_in_bounds (Int.tdiv (BitVec.toInt o7) (2 : ℤ))) ∧ (∀(o8 : BitVec 32), BitVec.toInt o8 = Int.tdiv (BitVec.toInt o7) (2 : ℤ) → (0 : ℤ) ≤ BitVec.toInt n ∧ (∀(o9 : BitVec 64), BitVec.toUInt o9 = BitVec.toInt n → (¬(2 : ℤ) = (0 : ℤ) ∧ uint'64_in_bounds (Int.tmod (BitVec.toUInt o9) (2 : ℤ))) ∧ (∀(o10 : BitVec 64), BitVec.toUInt o10 = Int.tmod (BitVec.toUInt o9) (2 : ℤ) → BitVec.toUInt o10 ≤ (2147483647 : ℤ) ∧ (∀(adj : BitVec 32), BitVec.toInt adj = BitVec.toUInt o10 → (0 : ℤ) ≤ BitVec.toInt o8 ∧ (∀(o11 : BitVec 32), BitVec.toUInt o11 = BitVec.toInt o8 → (¬(2 : ℤ) = (0 : ℤ) ∧ uint'32_in_bounds (Int.tdiv (BitVec.toUInt o11) (2 : ℤ))) ∧ (∀(o12 : BitVec 32), BitVec.toUInt o12 = Int.tdiv (BitVec.toUInt o11) (2 : ℤ) → uint'32_in_bounds (BitVec.toUInt o12 + (1 : ℤ)) ∧ (∀(o13 : BitVec 32), BitVec.toUInt o13 = BitVec.toUInt o12 + (1 : ℤ) → (0 : ℤ) ≤ BitVec.toUInt o13 ∧ (∀(scratch : C.ptr (BitVec 64)), C.plength scratch = BitVec.toUInt o13 ∧ C.offset scratch = (0 : ℤ) ∧ C.min scratch = (0 : ℤ) ∧ C.max scratch = BitVec.toUInt o13 ∧ C.writable scratch = true → (∀(o14 : Bool), (BitVec.toInt adj = BitVec.toInt (0 : BitVec 32) → o14 = true) ∧ (o14 = true → adj = (0 : BitVec 32)) → (∀(o15 : Bool), (if ¬o14 = true then o15 = true else ∃(o16 : Bool), ((BitVec.toUInt o5 = BitVec.toUInt (0 : BitVec 64) → o16 = true) ∧ (o16 = true → o5 = (0 : BitVec 64))) ∧ o15 = (if o16 = true then false else true)) → (if o15 = true then (0 : ℤ) ≤ BitVec.toInt o8 ∧ (∀(o16 : BitVec 32), BitVec.toUInt o16 = BitVec.toInt o8 → uint'32_in_bounds ((2 : ℤ) * BitVec.toUInt o16) ∧ (∀(o17 : BitVec 32), BitVec.toUInt o17 = (2 : ℤ) * BitVec.toUInt o16 → (0 : ℤ) ≤ BitVec.toUInt o17 ∧ (∀(o18 : C.ptr (BitVec 64)), C.plength o18 = BitVec.toUInt o17 ∧ C.offset o18 = (0 : ℤ) ∧ C.min o18 = (0 : ℤ) ∧ C.max o18 = BitVec.toUInt o17 ∧ C.writable o18 = true → ((C.min o18 ≤ C.offset o18 ∧ C.offset o18 < C.max o18) ∧ C.writable o18 = true) ∧ (∀(tp : C.ptr (BitVec 64)), List.length (C.data tp) = List.length (C.data o18) ∧ C.offset tp = C.offset o18 ∧ C.min tp = C.min o18 ∧ C.max tp = C.max o18 ∧ C.writable tp = C.writable o18 ∧ C.zone1 tp = C.zone1 o18 → List.length (C.data tp) = List.length (C.data o18) ∧ C.offset tp = C.offset o18 ∧ C.min tp = C.min o18 ∧ C.max tp = C.max o18 ∧ C.writable tp = C.writable o18 ∧ C.zone1 tp = C.zone1 o18 → C.pelts tp = Function.update (C.pelts o18) (C.offset tp) (0 : BitVec 64) → (((0 : ℤ) ≤ BitVec.toInt adj ∧ (C.min tp ≤ C.offset tp + BitVec.toInt adj ∧ C.offset tp + BitVec.toInt adj ≤ C.max tp) ∧ C.writable tp = true) ∧ (∀(tp1 : C.ptr (BitVec 64)), C.offset tp1 = C.offset tp ∧ C.min tp1 = C.min tp ∧ C.writable tp1 = C.writable tp ∧ C.zone1 tp1 = C.zone1 tp → C.offset tp1 = C.offset tp ∧ C.min tp1 = C.min tp ∧ C.writable tp1 = C.writable tp ∧ C.zone1 tp1 = C.zone1 tp → (∀(tpa : C.ptr (BitVec 64)), C.writable tpa = true ∧ C.offset tpa = C.offset tp1 + BitVec.toInt adj ∧ C.max tp1 = C.offset tp1 + BitVec.toInt adj ∧ C.min tpa = C.offset tp1 + BitVec.toInt adj ∧ C.max tpa = C.max tp ∧ C.zone1 tpa = C.zone1 tp1 ∧ C.pelts tp1 = C.pelts tp ∧ C.plength tp1 = C.plength tp ∧ C.pelts tpa = C.pelts tp ∧ C.plength tpa = C.plength tp → (∀(o19 : Bool), (BitVec.toUInt o5 = BitVec.toUInt (0 : BitVec 64) → o19 = true) ∧ (o19 = true → o5 = (0 : BitVec 64)) → (if ¬o19 = true then uint'64_in_bounds ((2 : ℤ) * BitVec.toUInt o5) ∧ (∀(o20 : BitVec 64), BitVec.toUInt o20 = (2 : ℤ) * BitVec.toUInt o5 → (((0 : ℤ) < BitVec.toUInt o20 ∧ BitVec.toUInt o20 < (64 : ℤ)) ∧ C.valid tpa (BitVec.toInt n) ∧ C.valid np (BitVec.toInt n) ∧ C.writable tpa = true ∧ (0 : ℤ) < BitVec.toInt n) ∧ (∀(tpa1 : C.ptr (BitVec 64)) (np1 : C.ptr (BitVec 64)), C.offset tpa1 = C.offset tpa ∧ C.writable tpa1 = C.writable tpa ∧ C.zone1 tpa1 = C.zone1 tpa → C.offset np1 = C.offset np ∧ C.writable np1 = C.writable np ∧ C.zone1 np1 = C.zone1 np → (∀(h : BitVec 64), Lemmas.value tpa1 (BitVec.toInt n) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n)) * BitVec.toUInt h = Lemmas.value np (BitVec.toInt n) * HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt o20)) ∧ (∀(j : ℤ), j < C.offset tpa1 ∨ C.offset tpa1 + BitVec.toInt n ≤ j → C.pelts tpa1 j = C.pelts tpa j) ∧ (∀(j : ℤ), C.pelts np1 j = C.pelts np j) ∧ (C.min tpa1 = C.min tpa ∧ C.max tpa1 = C.max tpa ∧ C.plength tpa1 = C.plength tpa) ∧ C.min np1 = C.min np ∧ C.max np1 = C.max np ∧ C.plength np1 = C.plength np → (C.zone1 tp1 = C.zone1 tpa1 ∧ C.max tp1 = C.min tpa1 ∧ C.writable tp1 = true ∧ C.writable tpa1 = true) ∧ (∀(tp2 : C.ptr (BitVec 64)), List.length (C.data tp2) = List.length (C.data tp1) ∧ C.offset tp2 = C.offset tp1 ∧ C.min tp2 = C.min tp1 ∧ C.writable tp2 = C.writable tp1 ∧ C.zone1 tp2 = C.zone1 tp1 → List.length (C.data tp2) = List.length (C.data tp1) ∧ C.offset tp2 = C.offset tp1 ∧ C.min tp2 = C.min tp1 ∧ C.writable tp2 = C.writable tp1 ∧ C.zone1 tp2 = C.zone1 tp1 → C.max tp2 = C.max tpa1 ∧ C.plength tp2 = C.plength tp1 ∧ (∀(i : ℤ), C.min tp1 ≤ i ∧ i < C.max tp1 → C.pelts tp2 i = C.pelts tp1 i) ∧ (∀(i : ℤ), C.min tpa1 ≤ i ∧ i < C.max tpa1 → C.pelts tp2 i = C.pelts tpa1 i) → Lemmas.value tp2 (BitVec.toInt n + BitVec.toInt adj) = HPow.hPow (2 : ℤ) (Int.toNat ((2 : ℤ) * BitVec.toUInt o5)) * HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt adj)) * Lemmas.value np1 (BitVec.toInt n) ∧ HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n + BitVec.toInt adj)) ≤ (4 : ℤ) * Lemmas.value tp2 (BitVec.toInt n + BitVec.toInt adj) ∧ C.max tp2 = C.max tp ∧ C.plength tp2 = C.plength tp ∧ (C.min np1 = C.min np ∧ C.max np1 = C.max np ∧ C.plength np1 = C.plength np) ∧ (∀(j : ℤ), C.pelts np1 j = C.pelts np j))))) else (C.valid np (BitVec.toInt n) ∧ C.valid tpa (BitVec.toInt n) ∧ C.writable tpa = true) ∧ (∀(tpa1 : C.ptr (BitVec 64)), List.length (C.data tpa1) = List.length (C.data tpa) ∧ C.offset tpa1 = C.offset tpa ∧ C.min tpa1 = C.min tpa ∧ C.max tpa1 = C.max tpa ∧ C.writable tpa1 = C.writable tpa ∧ C.zone1 tpa1 = C.zone1 tpa → Lemmas.map_eq_sub_shift (C.pelts tpa1) (C.pelts np) (C.offset tpa1) (C.offset np) (BitVec.toInt n) ∧ (∀(j : ℤ), j < C.offset tpa1 ∨ C.offset tpa1 + BitVec.toInt n ≤ j → C.pelts tpa1 j = C.pelts tpa j) → (C.zone1 tp1 = C.zone1 tpa1 ∧ C.max tp1 = C.min tpa1 ∧ C.writable tp1 = true ∧ C.writable tpa1 = true) ∧ (∀(tp2 : C.ptr (BitVec 64)), List.length (C.data tp2) = List.length (C.data tp1) ∧ C.offset tp2 = C.offset tp1 ∧ C.min tp2 = C.min tp1 ∧ C.writable tp2 = C.writable tp1 ∧ C.zone1 tp2 = C.zone1 tp1 → List.length (C.data tp2) = List.length (C.data tp1) ∧ C.offset tp2 = C.offset tp1 ∧ C.min tp2 = C.min tp1 ∧ C.writable tp2 = C.writable tp1 ∧ C.zone1 tp2 = C.zone1 tp1 → C.max tp2 = C.max tpa1 ∧ C.plength tp2 = C.plength tp1 ∧ (∀(i : ℤ), C.min tp1 ≤ i ∧ i < C.max tp1 → C.pelts tp2 i = C.pelts tp1 i) ∧ (∀(i : ℤ), C.min tpa1 ≤ i ∧ i < C.max tpa1 → C.pelts tp2 i = C.pelts tpa1 i) → Lemmas.value tp2 (BitVec.toInt n + BitVec.toInt adj) = HPow.hPow (2 : ℤ) (Int.toNat ((2 : ℤ) * BitVec.toUInt o5)) * HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt adj)) * Lemmas.value np (BitVec.toInt n) ∧ HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n + BitVec.toInt adj)) ≤ (4 : ℤ) * Lemmas.value tp2 (BitVec.toInt n + BitVec.toInt adj) ∧ C.max tp2 = C.max tp ∧ C.plength tp2 = C.plength tp))))))) ∧ (∀(tp1 : C.ptr (BitVec 64)) (np1 : C.ptr (BitVec 64)), C.offset tp1 = C.offset tp ∧ C.min tp1 = C.min tp ∧ C.writable tp1 = C.writable tp ∧ C.zone1 tp1 = C.zone1 tp → C.offset np1 = C.offset np ∧ C.writable np1 = C.writable np ∧ C.zone1 np1 = C.zone1 np → Lemmas.value tp1 (BitVec.toInt n + BitVec.toInt adj) = HPow.hPow (2 : ℤ) (Int.toNat ((2 : ℤ) * BitVec.toUInt o5)) * HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt adj)) * Lemmas.value np1 (BitVec.toInt n) ∧ HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n + BitVec.toInt adj)) ≤ (4 : ℤ) * Lemmas.value tp1 (BitVec.toInt n + BitVec.toInt adj) ∧ C.max tp1 = C.max tp ∧ C.plength tp1 = C.plength tp ∧ (C.min np1 = C.min np ∧ C.max np1 = C.max np ∧ C.plength np1 = C.plength np) ∧ (∀(j : ℤ), C.pelts np1 j = C.pelts np j) → (∀(o19 : Bool), (BitVec.toInt adj = BitVec.toInt (0 : BitVec 32) → o19 = true) ∧ (o19 = true → adj = (0 : BitVec 32)) → (∀(o20 : BitVec 64), (if ¬o19 = true then o20 = (32 : BitVec 64) else o20 = (0 : BitVec 64)) → uint'64_in_bounds (BitVec.toUInt o5 + BitVec.toUInt o20) ∧ (∀(o21 : BitVec 64), BitVec.toUInt o21 = BitVec.toUInt o5 + BitVec.toUInt o20 → (let vn : ℤ := Lemmas.value np1 (BitVec.toInt n); (C.valid tp1 (BitVec.toInt o8 + BitVec.toInt o8) ∧ C.valid sp (BitVec.toInt o8) ∧ (1 : ℤ) ≤ BitVec.toInt o8 ∧ C.valid scratch ((1 : ℤ) + BitVec.toInt o8 / (2 : ℤ)) ∧ HPow.hPow (2 : ℤ) (Int.toNat ((64 : ℤ) - (2 : ℤ))) ≤ BitVec.toUInt (C.pelts tp1 (C.offset tp1 + BitVec.toInt o8 + BitVec.toInt o8 - (1 : ℤ))) ∧ (C.writable sp = true ∧ C.writable scratch = true ∧ C.writable tp1 = true) ∧ (4 : ℤ) * BitVec.toInt o8 < (2147483647 : ℤ)) ∧ (∀(tp2 : C.ptr (BitVec 64)) (scratch1 : C.ptr (BitVec 64)) (sp1 : C.ptr (BitVec 64)), C.offset tp2 = C.offset tp1 ∧ C.min tp2 = C.min tp1 ∧ C.writable tp2 = C.writable tp1 ∧ C.zone1 tp2 = C.zone1 tp1 → C.offset tp2 = C.offset tp1 ∧ C.min tp2 = C.min tp1 ∧ C.writable tp2 = C.writable tp1 ∧ C.zone1 tp2 = C.zone1 tp1 → C.offset scratch1 = C.offset scratch ∧ C.writable scratch1 = C.writable scratch ∧ C.zone1 scratch1 = C.zone1 scratch → C.offset sp1 = C.offset sp ∧ C.writable sp1 = C.writable sp ∧ C.zone1 sp1 = C.zone1 sp → (∀(o22 : BitVec 64), Lemmas.value sp1 (BitVec.toInt o8) * Lemmas.value sp1 (BitVec.toInt o8) + Lemmas.value tp2 (BitVec.toInt o8) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt o8)) * BitVec.toUInt o22 = Lemmas.value tp1 (BitVec.toInt o8 + BitVec.toInt o8) ∧ Lemmas.value tp2 (BitVec.toInt o8) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt o8)) * BitVec.toUInt o22 ≤ (2 : ℤ) * Lemmas.value sp1 (BitVec.toInt o8) ∧ HPow.hPow (2 : ℤ) (Int.toNat ((64 : ℤ) - (1 : ℤ))) ≤ BitVec.toUInt (C.pelts sp1 (C.offset sp1 + BitVec.toInt o8 - (1 : ℤ))) ∧ ((0 : ℤ) ≤ BitVec.toUInt o22 ∧ BitVec.toUInt o22 ≤ (1 : ℤ)) ∧ C.max tp2 = C.max tp1 ∧ C.min tp2 = C.min tp1 ∧ C.plength tp2 = C.plength tp1 ∧ C.max scratch1 = C.max scratch ∧ C.min scratch1 = C.min scratch ∧ C.plength scratch1 = C.plength scratch ∧ C.max sp1 = C.max sp ∧ C.min sp1 = C.min sp ∧ C.plength sp1 = C.plength sp → (let vs : ℤ := Lemmas.value sp1 (BitVec.toInt o8); let vr : ℤ := Lemmas.value tp2 (BitVec.toInt o8) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt o8)) * BitVec.toUInt o22; let vs0 : ℤ := vs % HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt o21)); (0 : ℤ) ≤ (1 : ℤ) ∧ (∀(s0 : C.ptr (BitVec 64)), C.plength s0 = (1 : ℤ) ∧ C.offset s0 = (0 : ℤ) ∧ C.min s0 = (0 : ℤ) ∧ C.max s0 = (1 : ℤ) ∧ C.writable s0 = true → (((0 : ℤ) ≤ BitVec.toUInt o21 ∧ BitVec.toUInt o21 < (64 : ℤ)) ∧ HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt o21)) * BitVec.toUInt (1 : BitVec 64) ≤ (18446744073709551615 : ℤ)) ∧ (∀(o23 : BitVec 64), BitVec.toUInt o23 = HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt o21)) * BitVec.toUInt (1 : BitVec 64) → (C.min sp1 ≤ C.offset sp1 ∧ C.offset sp1 < C.max sp1) ∧ (let o24 : BitVec 64 := C.pelts sp1 (C.offset sp1); (¬BitVec.toUInt o23 = (0 : ℤ) ∧ uint'64_in_bounds (Int.tmod (BitVec.toUInt o24) (BitVec.toUInt o23))) ∧ (∀(s00 : BitVec 64), BitVec.toUInt s00 = Int.tmod (BitVec.toUInt o24) (BitVec.toUInt o23) → ((C.min s0 ≤ C.offset s0 ∧ C.offset s0 < C.max s0) ∧ C.writable s0 = true) ∧ (∀(s01 : C.ptr (BitVec 64)), List.length (C.data s01) = List.length (C.data s0) ∧ C.offset s01 = C.offset s0 ∧ C.min s01 = C.min s0 ∧ C.max s01 = C.max s0 ∧ C.writable s01 = C.writable s0 ∧ C.zone1 s01 = C.zone1 s0 → C.pelts s01 = Function.update (C.pelts s0) (C.offset s01) s00 → uint'64_in_bounds ((2 : ℤ) * BitVec.toUInt s00) ∧ (∀(o25 : BitVec 64), BitVec.toUInt o25 = (2 : ℤ) * BitVec.toUInt s00 → (C.valid sp1 (BitVec.toInt o8) ∧ C.valid tp2 (BitVec.toInt o8) ∧ C.writable tp2 = true) ∧ (∀(tp3 : C.ptr (BitVec 64)), List.length (C.data tp3) = List.length (C.data tp2) ∧ C.offset tp3 = C.offset tp2 ∧ C.min tp3 = C.min tp2 ∧ C.max tp3 = C.max tp2 ∧ C.writable tp3 = C.writable tp2 ∧ C.zone1 tp3 = C.zone1 tp2 → List.length (C.data tp3) = List.length (C.data tp2) ∧ C.offset tp3 = C.offset tp2 ∧ C.min tp3 = C.min tp2 ∧ C.max tp3 = C.max tp2 ∧ C.writable tp3 = C.writable tp2 ∧ C.zone1 tp3 = C.zone1 tp2 → (∀(rc : BitVec 64), Lemmas.value tp3 (BitVec.toInt o8) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt o8)) * BitVec.toUInt rc = Lemmas.value tp2 (BitVec.toInt o8) + Lemmas.value sp1 (BitVec.toInt o8) * BitVec.toUInt o25 ∧ (∀(j : ℤ), j < C.offset tp3 ∨ C.offset tp3 + BitVec.toInt o8 ≤ j → C.pelts tp3 j = C.pelts tp2 j) → uint'64_in_bounds (BitVec.toUInt o22 + BitVec.toUInt rc) ∧ (∀(o26 : BitVec 64), BitVec.toUInt o26 = BitVec.toUInt o22 + BitVec.toUInt rc → (C.valid s01 (1 : ℤ) ∧ C.valid tp3 (1 : ℤ) ∧ C.writable tp3 = true) ∧ (∀(tp4 : C.ptr (BitVec 64)), List.length (C.data tp4) = List.length (C.data tp3) ∧ C.offset tp4 = C.offset tp3 ∧ C.min tp4 = C.min tp3 ∧ C.max tp4 = C.max tp3 ∧ C.writable tp4 = C.writable tp3 ∧ C.zone1 tp4 = C.zone1 tp3 → List.length (C.data tp4) = List.length (C.data tp3) ∧ C.offset tp4 = C.offset tp3 ∧ C.min tp4 = C.min tp3 ∧ C.max tp4 = C.max tp3 ∧ C.writable tp4 = C.writable tp3 ∧ C.zone1 tp4 = C.zone1 tp3 → (∀(o27 : BitVec 64), Lemmas.value tp4 (1 : ℤ) - HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (1 : ℕ) * BitVec.toUInt o27 = Lemmas.value tp3 (1 : ℤ) - Lemmas.value s01 (1 : ℤ) * BitVec.toUInt s00 ∧ (∀(j : ℤ), j < C.offset tp4 ∨ C.offset tp4 + (1 : ℤ) ≤ j → C.pelts tp4 j = C.pelts tp3 j) → (if (1 : ℤ) < BitVec.toInt o8 then (C.min tp4 ≤ C.offset tp4 + (1 : ℤ) ∧ C.offset tp4 + (1 : ℤ) ≤ C.max tp4) ∧ (∀(tp11 : C.ptr (BitVec 64)), C.offset tp11 = C.offset tp4 + (1 : ℤ) ∧ C.plength tp11 = C.plength tp4 ∧ C.pelts tp11 = C.pelts tp4 ∧ C.data tp11 = C.data tp4 ∧ C.min tp11 = C.min tp4 ∧ C.max tp11 = C.max tp4 ∧ C.zone1 tp11 = C.zone1 tp4 ∧ C.writable tp11 = C.writable tp4 → int'32_in_bounds (BitVec.toInt o8 - (1 : ℤ)) ∧ (∀(o28 : BitVec 32), BitVec.toInt o28 = BitVec.toInt o8 - (1 : ℤ) → (C.valid tp11 (BitVec.toInt o28) ∧ (0 : ℤ) < BitVec.toInt o28 ∧ C.writable tp11 = true) ∧ (∀(tp12 : C.ptr (BitVec 64)) (tp5 : C.ptr (BitVec 64)), List.length (C.data tp12) = List.length (C.data tp11) ∧ C.offset tp12 = C.offset tp11 ∧ C.min tp12 = C.min tp11 ∧ C.max tp12 = C.max tp11 ∧ C.writable tp12 = C.writable tp11 ∧ C.zone1 tp12 = C.zone1 tp11 → C.data tp5 = C.data tp12 ∧ List.length (C.data tp12) = List.length (C.data tp4) ∧ C.offset tp5 = C.offset tp4 ∧ C.min tp5 = C.min tp4 ∧ C.max tp5 = C.max tp4 ∧ C.writable tp5 = C.writable tp4 ∧ C.zone1 tp5 = C.zone1 tp4 → (∀(o29 : BitVec 64), Lemmas.value tp12 (BitVec.toInt o28) - HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt o28)) * BitVec.toUInt o29 = Lemmas.value tp11 (BitVec.toInt o28) - BitVec.toUInt o27 ∧ ((0 : ℤ) ≤ BitVec.toUInt o29 ∧ BitVec.toUInt o29 ≤ (1 : ℤ)) ∧ (∀(j : ℤ), j < C.offset tp12 ∨ C.offset tp12 + BitVec.toInt o28 ≤ j → C.pelts tp12 j = C.pelts tp11 j) → uint'64_in_bounds (BitVec.toUInt o26 - BitVec.toUInt o29) ∧ (∀(o30 : BitVec 64), BitVec.toUInt o30 = BitVec.toUInt o26 - BitVec.toUInt o29 → Lemmas.value tp5 (BitVec.toInt o8) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt o8)) * BitVec.toUInt o30 = vr + (2 : ℤ) * vs0 * vs - vs0 * vs0))))) else uint'64_in_bounds (BitVec.toUInt o26 - BitVec.toUInt o27) ∧ (∀(o28 : BitVec 64), BitVec.toUInt o28 = BitVec.toUInt o26 - BitVec.toUInt o27 → Lemmas.value tp4 (BitVec.toInt o8) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt o8)) * BitVec.toUInt o28 = vr + (2 : ℤ) * vs0 * vs - vs0 * vs0)) ∧ (∀(rl : BitVec 64) (tp5 : C.ptr (BitVec 64)), List.length (C.data tp5) = List.length (C.data tp4) ∧ C.offset tp5 = C.offset tp4 ∧ C.min tp5 = C.min tp4 ∧ C.max tp5 = C.max tp4 ∧ C.writable tp5 = C.writable tp4 ∧ C.zone1 tp5 = C.zone1 tp4 → Lemmas.value tp5 (BitVec.toInt o8) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt o8)) * BitVec.toUInt rl = vr + (2 : ℤ) * vs0 * vs - vs0 * vs0 → (((0 : ℤ) < BitVec.toUInt o21 ∧ BitVec.toUInt o21 < (64 : ℤ)) ∧ C.valid sp1 (BitVec.toInt o8) ∧ C.valid sp1 (BitVec.toInt o8) ∧ (0 : ℤ) < BitVec.toInt o8 ∧ C.writable sp1 = true ∧ (C.offset sp1 ≤ C.offset sp1 ∨ C.offset sp1 + BitVec.toInt o8 ≤ C.offset sp1)) ∧ (∀(sp2 : C.ptr (BitVec 64)), List.length (C.data sp2) = List.length (C.data sp1) ∧ C.offset sp2 = C.offset sp1 ∧ C.min sp2 = C.min sp1 ∧ C.max sp2 = C.max sp1 ∧ C.writable sp2 = C.writable sp1 ∧ C.zone1 sp2 = C.zone1 sp1 → (∀(r : BitVec 64), BitVec.toUInt r + ((18446744073709551615 : ℤ) + (1 : ℤ)) * Lemmas.value sp2 (BitVec.toInt o8) = Lemmas.value sp1 (BitVec.toInt o8) * HPow.hPow (2 : ℤ) (Int.toNat ((64 : ℤ) - BitVec.toUInt o21)) ∧ (∀(j : ℤ), j < C.offset sp2 ∨ C.offset sp2 + BitVec.toInt o8 ≤ j → C.pelts sp2 j = C.pelts sp1 j) ∧ C.min sp2 = C.min sp1 ∧ C.max sp2 = C.max sp1 ∧ C.plength sp2 = C.plength sp1 → (let vsp : ℤ := Lemmas.value sp2 (BitVec.toInt o8); (0 : ℤ) < vn ∧ ((0 : ℤ) < vn → (((0 : ℤ) ≤ BitVec.toUInt (1 : BitVec 64) ∧ BitVec.toUInt (1 : BitVec 64) < (64 : ℤ)) ∧ HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt (1 : BitVec 64))) * BitVec.toUInt o21 ≤ (18446744073709551615 : ℤ)) ∧ (∀(o28 : BitVec 64), BitVec.toUInt o28 = HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt (1 : BitVec 64))) * BitVec.toUInt o21 → (if BitVec.toUInt o28 < (64 : ℤ) then int'32_in_bounds (BitVec.toInt o8 + (1 : ℤ)) ∧ (∀(o29 : BitVec 32), BitVec.toInt o29 = BitVec.toInt o8 + (1 : ℤ) → HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt o28)) * (vn - vsp * vsp) = Lemmas.value tp5 (BitVec.toInt o29) ∧ ((0 : ℤ) ≤ BitVec.toUInt o28 ∧ BitVec.toUInt o28 < (64 : ℤ)) ∧ C.valid tp5 (BitVec.toInt o29) ∧ (0 : ℤ) < BitVec.toInt o29 ∧ BitVec.toInt o29 ≤ k + (1 : ℤ)) else (C.min tp5 ≤ C.offset tp5 + (1 : ℤ) ∧ C.offset tp5 + (1 : ℤ) ≤ C.max tp5) ∧ (∀(tp11 : C.ptr (BitVec 64)), C.offset tp11 = C.offset tp5 + (1 : ℤ) ∧ C.plength tp11 = C.plength tp5 ∧ C.pelts tp11 = C.pelts tp5 ∧ C.data tp11 = C.data tp5 ∧ C.min tp11 = C.min tp5 ∧ C.max tp11 = C.max tp5 ∧ C.zone1 tp11 = C.zone1 tp5 ∧ C.writable tp11 = C.writable tp5 → uint'64_in_bounds (BitVec.toUInt o28 - (64 : ℤ)) ∧ (∀(o29 : BitVec 64), BitVec.toUInt o29 = BitVec.toUInt o28 - (64 : ℤ) → HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt o29)) * (vn - vsp * vsp) = Lemmas.value tp11 (BitVec.toInt o8) ∧ ((0 : ℤ) ≤ BitVec.toUInt o29 ∧ BitVec.toUInt o29 < (64 : ℤ)) ∧ C.valid tp11 (BitVec.toInt o8) ∧ (0 : ℤ) < BitVec.toInt o8 ∧ BitVec.toInt o8 ≤ k + (1 : ℤ)))) ∧ (∀(c2 : BitVec 64) (tp6 : C.ptr (BitVec 64)) (tn : BitVec 32), HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt c2)) * (vn - vsp * vsp) = Lemmas.value tp6 (BitVec.toInt tn) ∧ ((0 : ℤ) ≤ BitVec.toUInt c2 ∧ BitVec.toUInt c2 < (64 : ℤ)) ∧ C.valid tp6 (BitVec.toInt tn) ∧ (0 : ℤ) < BitVec.toInt tn ∧ BitVec.toInt tn ≤ k + (1 : ℤ) → (∀(o29 : Bool), (BitVec.toUInt c2 = BitVec.toUInt (0 : BitVec 64) → o29 = true) ∧ (o29 = true → c2 = (0 : BitVec 64)) → (if ¬o29 = true then (C.valid tp6 (BitVec.toInt tn) ∧ C.valid rp (BitVec.toInt tn) ∧ ((0 : ℤ) < BitVec.toUInt c2 ∧ BitVec.toUInt c2 < (64 : ℤ)) ∧ (0 : ℤ) < BitVec.toInt tn ∧ C.writable rp = true) ∧ (∀(o30 : C.ptr (BitVec 64)) (rp1 : C.ptr (BitVec 64)), C.offset o30 = C.offset tp6 ∧ C.writable o30 = C.writable tp6 ∧ C.zone1 o30 = C.zone1 tp6 → C.offset rp1 = C.offset rp ∧ C.writable rp1 = C.writable rp ∧ C.zone1 rp1 = C.zone1 rp → (∀(b : BitVec 64), BitVec.toUInt b + ((18446744073709551615 : ℤ) + (1 : ℤ)) * Lemmas.value rp1 (BitVec.toInt tn) = Lemmas.value o30 (BitVec.toInt tn) * HPow.hPow (2 : ℤ) (Int.toNat ((64 : ℤ) - BitVec.toUInt c2)) ∧ (∀(j : ℤ), j < C.offset rp1 ∨ C.offset rp1 + BitVec.toInt tn ≤ j → C.pelts rp1 j = C.pelts rp j) ∧ C.pelts o30 = C.pelts tp6 ∧ (C.min o30 = C.min tp6 ∧ C.max o30 = C.max tp6 ∧ C.plength o30 = C.plength tp6) ∧ C.min rp1 = C.min rp ∧ C.max rp1 = C.max rp ∧ C.plength rp1 = C.plength rp → Lemmas.value rp1 (BitVec.toInt tn) = vn - vsp * vsp ∧ ((0 : ℤ) < BitVec.toInt tn ∧ BitVec.toInt tn ≤ k + (1 : ℤ)) ∧ C.min rp1 = C.min rp ∧ C.max rp1 = C.max rp ∧ C.plength rp1 = C.plength rp)) else (C.valid tp6 (BitVec.toInt tn) ∧ C.valid rp (BitVec.toInt tn) ∧ C.writable rp = true) ∧ (∀(rp1 : C.ptr (BitVec 64)), List.length (C.data rp1) = List.length (C.data rp) ∧ C.offset rp1 = C.offset rp ∧ C.min rp1 = C.min rp ∧ C.max rp1 = C.max rp ∧ C.writable rp1 = C.writable rp ∧ C.zone1 rp1 = C.zone1 rp → Lemmas.map_eq_sub_shift (C.pelts rp1) (C.pelts tp6) (C.offset rp1) (C.offset tp6) (BitVec.toInt tn) ∧ (∀(j : ℤ), j < C.offset rp1 ∨ C.offset rp1 + BitVec.toInt tn ≤ j → C.pelts rp1 j = C.pelts rp j) → Lemmas.value rp1 (BitVec.toInt tn) = vn - vsp * vsp ∧ ((0 : ℤ) < BitVec.toInt tn ∧ BitVec.toInt tn ≤ k + (1 : ℤ)) ∧ C.min rp1 = C.min rp ∧ C.max rp1 = C.max rp ∧ C.plength rp1 = C.plength rp))) ∧ (∀(rn : BitVec 32) (rp1 : C.ptr (BitVec 64)), C.offset rp1 = C.offset rp ∧ C.writable rp1 = C.writable rp ∧ C.zone1 rp1 = C.zone1 rp → Lemmas.value rp1 (BitVec.toInt rn) = vn - vsp * vsp ∧ ((0 : ℤ) < BitVec.toInt rn ∧ BitVec.toInt rn ≤ k + (1 : ℤ)) ∧ C.min rp1 = C.min rp ∧ C.max rp1 = C.max rp ∧ C.plength rp1 = C.plength rp → ((1 : ℤ) ≤ BitVec.toInt rn ∧ BitVec.toInt rn ≤ BitVec.toInt rn) ∧ (∀(rn1 : BitVec 32), Lemmas.value rp1 (BitVec.toInt rn1) = Lemmas.value rp1 (BitVec.toInt rn) ∧ (1 : ℤ) ≤ BitVec.toInt rn1 ∧ BitVec.toInt rn1 ≤ BitVec.toInt rn → int'32_in_bounds (BitVec.toInt rn1 - (1 : ℤ)) ∧ (∀(o29 : BitVec 32), BitVec.toInt o29 = BitVec.toInt rn1 - (1 : ℤ) → (C.min rp1 ≤ C.offset rp1 + BitVec.toInt o29 ∧ C.offset rp1 + BitVec.toInt o29 < C.max rp1) ∧ (let o30 : BitVec 64 := C.pelts rp1 (C.offset rp1 + BitVec.toInt o29); ∀(o31 : Bool), (BitVec.toUInt o30 = BitVec.toUInt (0 : BitVec 64) → o31 = true) ∧ (o31 = true → o30 = (0 : BitVec 64)) → (if o31 = true then int'32_in_bounds (BitVec.toInt rn1 - (1 : ℤ)) ∧ (∀(o32 : BitVec 32), BitVec.toInt o32 = BitVec.toInt rn1 - (1 : ℤ) → (∀(o33 : Bool), (BitVec.toInt o32 = BitVec.toInt (0 : BitVec 32) → o33 = true) ∧ (o33 = true → o32 = (0 : BitVec 32)) → (if o33 = true then Lemmas.value np1 (BitVec.toInt n) = Lemmas.value sp2 (ceilhalf (BitVec.toInt n)) * Lemmas.value sp2 (ceilhalf (BitVec.toInt n)) + Lemmas.value rp1 (BitVec.toInt o32) ∧ ((0 : ℤ) ≤ BitVec.toInt o32 ∧ BitVec.toInt o32 ≤ BitVec.toInt n) ∧ Lemmas.value rp1 (BitVec.toInt o32) ≤ (2 : ℤ) * Lemmas.value sp2 (ceilhalf (BitVec.toInt n)) ∧ ((0 : ℤ) < BitVec.toInt o32 → (0 : ℤ) < BitVec.toUInt (C.pelts rp1 (C.offset rp1 + BitVec.toInt o32 - (1 : ℤ)))) ∧ (∀(j : ℤ), C.pelts np1 j = C.pelts np j) ∧ C.max np1 = C.max np ∧ C.min np1 = C.min np ∧ C.plength np1 = C.plength np ∧ C.max rp1 = C.max rp ∧ C.min rp1 = C.min rp ∧ C.plength rp1 = C.plength rp ∧ C.max sp2 = C.max sp ∧ C.min sp2 = C.min sp ∧ C.plength sp2 = C.plength sp else BitVec.toInt o32 < BitVec.toInt rn1 ∧ Lemmas.value rp1 (BitVec.toInt o32) = Lemmas.value rp1 (BitVec.toInt rn) ∧ (1 : ℤ) ≤ BitVec.toInt o32 ∧ BitVec.toInt o32 ≤ BitVec.toInt rn))) else Lemmas.value np1 (BitVec.toInt n) = Lemmas.value sp2 (ceilhalf (BitVec.toInt n)) * Lemmas.value sp2 (ceilhalf (BitVec.toInt n)) + Lemmas.value rp1 (BitVec.toInt rn1) ∧ ((0 : ℤ) ≤ BitVec.toInt rn1 ∧ BitVec.toInt rn1 ≤ BitVec.toInt n) ∧ Lemmas.value rp1 (BitVec.toInt rn1) ≤ (2 : ℤ) * Lemmas.value sp2 (ceilhalf (BitVec.toInt n)) ∧ ((0 : ℤ) < BitVec.toInt rn1 → (0 : ℤ) < BitVec.toUInt (C.pelts rp1 (C.offset rp1 + BitVec.toInt rn1 - (1 : ℤ)))) ∧ (∀(j : ℤ), C.pelts np1 j = C.pelts np j) ∧ C.max np1 = C.max np ∧ C.min np1 = C.min np ∧ C.plength np1 = C.plength np ∧ C.max rp1 = C.max rp ∧ C.min rp1 = C.min rp ∧ C.plength rp1 = C.plength rp ∧ C.max sp2 = C.max sp ∧ C.min sp2 = C.min sp ∧ C.plength sp2 = C.plength sp))))))))))))))))))))))))))))))))))) else (C.valid np (BitVec.toInt n) ∧ C.valid rp (BitVec.toInt n) ∧ C.writable rp = true) ∧ (∀(rp1 : C.ptr (BitVec 64)), List.length (C.data rp1) = List.length (C.data rp) ∧ C.offset rp1 = C.offset rp ∧ C.min rp1 = C.min rp ∧ C.max rp1 = C.max rp ∧ C.writable rp1 = C.writable rp ∧ C.zone1 rp1 = C.zone1 rp → Lemmas.map_eq_sub_shift (C.pelts rp1) (C.pelts np) (C.offset rp1) (C.offset np) (BitVec.toInt n) ∧ (∀(j : ℤ), j < C.offset rp1 ∨ C.offset rp1 + BitVec.toInt n ≤ j → C.pelts rp1 j = C.pelts rp j) → (C.valid rp1 (BitVec.toInt o8 + BitVec.toInt o8) ∧ C.valid sp (BitVec.toInt o8) ∧ (1 : ℤ) ≤ BitVec.toInt o8 ∧ C.valid scratch ((1 : ℤ) + BitVec.toInt o8 / (2 : ℤ)) ∧ HPow.hPow (2 : ℤ) (Int.toNat ((64 : ℤ) - (2 : ℤ))) ≤ BitVec.toUInt (C.pelts rp1 (C.offset rp1 + BitVec.toInt o8 + BitVec.toInt o8 - (1 : ℤ))) ∧ (C.writable sp = true ∧ C.writable scratch = true ∧ C.writable rp1 = true) ∧ (4 : ℤ) * BitVec.toInt o8 < (2147483647 : ℤ)) ∧ (∀(scratch1 : C.ptr (BitVec 64)) (rp2 : C.ptr (BitVec 64)) (sp1 : C.ptr (BitVec 64)), C.offset scratch1 = C.offset scratch ∧ C.writable scratch1 = C.writable scratch ∧ C.zone1 scratch1 = C.zone1 scratch → C.offset rp2 = C.offset rp1 ∧ C.min rp2 = C.min rp1 ∧ C.writable rp2 = C.writable rp1 ∧ C.zone1 rp2 = C.zone1 rp1 → C.offset sp1 = C.offset sp ∧ C.writable sp1 = C.writable sp ∧ C.zone1 sp1 = C.zone1 sp → (∀(h : BitVec 64), Lemmas.value sp1 (BitVec.toInt o8) * Lemmas.value sp1 (BitVec.toInt o8) + Lemmas.value rp2 (BitVec.toInt o8) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt o8)) * BitVec.toUInt h = Lemmas.value rp1 (BitVec.toInt o8 + BitVec.toInt o8) ∧ Lemmas.value rp2 (BitVec.toInt o8) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt o8)) * BitVec.toUInt h ≤ (2 : ℤ) * Lemmas.value sp1 (BitVec.toInt o8) ∧ HPow.hPow (2 : ℤ) (Int.toNat ((64 : ℤ) - (1 : ℤ))) ≤ BitVec.toUInt (C.pelts sp1 (C.offset sp1 + BitVec.toInt o8 - (1 : ℤ))) ∧ ((0 : ℤ) ≤ BitVec.toUInt h ∧ BitVec.toUInt h ≤ (1 : ℤ)) ∧ C.max rp2 = C.max rp1 ∧ C.min rp2 = C.min rp1 ∧ C.plength rp2 = C.plength rp1 ∧ C.max scratch1 = C.max scratch ∧ C.min scratch1 = C.min scratch ∧ C.plength scratch1 = C.plength scratch ∧ C.max sp1 = C.max sp ∧ C.min sp1 = C.min sp ∧ C.plength sp1 = C.plength sp → ((C.min rp2 ≤ C.offset rp2 + BitVec.toInt o8 ∧ C.offset rp2 + BitVec.toInt o8 < C.max rp2) ∧ C.writable rp2 = true) ∧ (∀(rp3 : C.ptr (BitVec 64)), List.length (C.data rp3) = List.length (C.data rp2) ∧ C.offset rp3 = C.offset rp2 ∧ C.min rp3 = C.min rp2 ∧ C.max rp3 = C.max rp2 ∧ C.writable rp3 = C.writable rp2 ∧ C.zone1 rp3 = C.zone1 rp2 → C.pelts rp3 = Function.update (C.pelts rp2) (C.offset rp3 + BitVec.toInt o8) h ∧ C.pelts rp3 (C.offset rp3 + BitVec.toInt o8) = h → BitVec.toUInt h ≤ (2147483647 : ℤ) ∧ (∀(o16 : BitVec 32), BitVec.toInt o16 = BitVec.toUInt h → int'32_in_bounds (BitVec.toInt o8 + BitVec.toInt o16) ∧ (∀(o17 : BitVec 32), BitVec.toInt o17 = BitVec.toInt o8 + BitVec.toInt o16 → ((1 : ℤ) ≤ BitVec.toInt o17 ∧ BitVec.toInt o17 ≤ BitVec.toInt o17) ∧ (∀(rn : BitVec 32), Lemmas.value rp3 (BitVec.toInt rn) = Lemmas.value rp3 (BitVec.toInt o17) ∧ (1 : ℤ) ≤ BitVec.toInt rn ∧ BitVec.toInt rn ≤ BitVec.toInt o17 → int'32_in_bounds (BitVec.toInt rn - (1 : ℤ)) ∧ (∀(o18 : BitVec 32), BitVec.toInt o18 = BitVec.toInt rn - (1 : ℤ) → (C.min rp3 ≤ C.offset rp3 + BitVec.toInt o18 ∧ C.offset rp3 + BitVec.toInt o18 < C.max rp3) ∧ (let o19 : BitVec 64 := C.pelts rp3 (C.offset rp3 + BitVec.toInt o18); ∀(o20 : Bool), (BitVec.toUInt o19 = BitVec.toUInt (0 : BitVec 64) → o20 = true) ∧ (o20 = true → o19 = (0 : BitVec 64)) → (if o20 = true then int'32_in_bounds (BitVec.toInt rn - (1 : ℤ)) ∧ (∀(o21 : BitVec 32), BitVec.toInt o21 = BitVec.toInt rn - (1 : ℤ) → (∀(o22 : Bool), (BitVec.toInt o21 = BitVec.toInt (0 : BitVec 32) → o22 = true) ∧ (o22 = true → o21 = (0 : BitVec 32)) → (if o22 = true then Lemmas.value np (BitVec.toInt n) = Lemmas.value sp1 (ceilhalf (BitVec.toInt n)) * Lemmas.value sp1 (ceilhalf (BitVec.toInt n)) + Lemmas.value rp3 (BitVec.toInt o21) ∧ ((0 : ℤ) ≤ BitVec.toInt o21 ∧ BitVec.toInt o21 ≤ BitVec.toInt n) ∧ Lemmas.value rp3 (BitVec.toInt o21) ≤ (2 : ℤ) * Lemmas.value sp1 (ceilhalf (BitVec.toInt n)) ∧ ((0 : ℤ) < BitVec.toInt o21 → (0 : ℤ) < BitVec.toUInt (C.pelts rp3 (C.offset rp3 + BitVec.toInt o21 - (1 : ℤ)))) ∧ C.max rp3 = C.max rp ∧ C.min rp3 = C.min rp ∧ C.plength rp3 = C.plength rp ∧ C.max sp1 = C.max sp ∧ C.min sp1 = C.min sp ∧ C.plength sp1 = C.plength sp else BitVec.toInt o21 < BitVec.toInt rn ∧ Lemmas.value rp3 (BitVec.toInt o21) = Lemmas.value rp3 (BitVec.toInt o17) ∧ (1 : ℤ) ≤ BitVec.toInt o21 ∧ BitVec.toInt o21 ≤ BitVec.toInt o17))) else Lemmas.value np (BitVec.toInt n) = Lemmas.value sp1 (ceilhalf (BitVec.toInt n)) * Lemmas.value sp1 (ceilhalf (BitVec.toInt n)) + Lemmas.value rp3 (BitVec.toInt rn) ∧ ((0 : ℤ) ≤ BitVec.toInt rn ∧ BitVec.toInt rn ≤ BitVec.toInt n) ∧ Lemmas.value rp3 (BitVec.toInt rn) ≤ (2 : ℤ) * Lemmas.value sp1 (ceilhalf (BitVec.toInt n)) ∧ ((0 : ℤ) < BitVec.toInt rn → (0 : ℤ) < BitVec.toUInt (C.pelts rp3 (C.offset rp3 + BitVec.toInt rn - (1 : ℤ)))) ∧ C.max rp3 = C.max rp ∧ C.min rp3 = C.min rp ∧ C.plength rp3 = C.plength rp ∧ C.max sp1 = C.max sp ∧ C.min sp1 = C.min sp ∧ C.plength sp1 = C.plength sp)))))))))))))))))))))))))))))
  := sorry
end sqrtrem_Sqrt_wmpn_sqrtremqtvc
