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
namespace String
axiom zero_char : BitVec 8
axiom zero_char'def : BitVec.toInt zero_char = (0 : ℤ)
axiom numcodes (i : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (10 : ℤ)) : BitVec.toInt (([48, 49, 50, 51, 52, 53, 54, 55, 56, 57] : List (BitVec 8))[Int.toNat i]!) = BitVec.toInt (([48] : List (BitVec 8))[(0 : ℕ)]!) + i
axiom lowcodes (i : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (26 : ℤ)) : BitVec.toInt (([97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122] : List (BitVec 8))[Int.toNat i]!) = BitVec.toInt (([97] : List (BitVec 8))[(0 : ℕ)]!) + i
axiom upcodes (i : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (26 : ℤ)) : BitVec.toInt (([65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90] : List (BitVec 8))[Int.toNat i]!) = BitVec.toInt (([65] : List (BitVec 8))[(0 : ℕ)]!) + i
axiom code_0 : BitVec.toInt (([48] : List (BitVec 8))[(0 : ℕ)]!) = (48 : ℤ)
axiom code_a : BitVec.toInt (([97] : List (BitVec 8))[(0 : ℕ)]!) = (97 : ℤ)
axiom code_A : BitVec.toInt (([65] : List (BitVec 8))[(0 : ℕ)]!) = (65 : ℤ)
axiom code_minus : BitVec.toInt (([45] : List (BitVec 8))[(0 : ℕ)]!) = (45 : ℤ)
axiom strlen : (ℤ -> BitVec 8) -> ℤ -> ℤ
axiom strlen_def (i : ℤ) (s : ℤ -> BitVec 8) (ofs : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : ∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → ¬BitVec.toInt (s (ofs + j)) = (0 : ℤ)) (fact2 : BitVec.toInt (s (ofs + i)) = (0 : ℤ)) : strlen s ofs = i
axiom strlen_invalid (s : ℤ -> BitVec 8) (ofs : ℤ) (fact0 : ∀(i : ℤ), (0 : ℤ) ≤ i → ¬BitVec.toInt (s (ofs + i)) = (0 : ℤ)) : strlen s ofs < (0 : ℤ)
noncomputable def valid_string (p : C.ptr (BitVec 8)) := (0 : ℤ) ≤ strlen (C.pelts p) (C.offset p) ∧ C.valid p ((1 : ℤ) + strlen (C.pelts p) (C.offset p))
end String
namespace UChar
axiom cast_mem : Type
axiom cast_mem_inhabited : Inhabited cast_mem
attribute [instance] cast_mem_inhabited
axiom mi : cast_mem -> ℤ
axiom ma : cast_mem -> ℤ
axiom z : cast_mem -> C.zone
axiom l : cast_mem -> ℤ
axiom ok : cast_mem -> Bool
end UChar
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
namespace Z
axiom mpz_ptr : Type
axiom inhabited_axiom_mpz_ptr : Inhabited mpz_ptr
attribute [instance] inhabited_axiom_mpz_ptr
axiom mpz_eq : mpz_ptr -> mpz_ptr -> Prop
axiom mpz_eq'spec (x : mpz_ptr) (y : mpz_ptr) : mpz_eq x y = (x = y)
axiom mpz_memo : Type
axiom inhabited_axiom_mpz_memo : Inhabited mpz_memo
attribute [instance] inhabited_axiom_mpz_memo
axiom abs_value_of : mpz_memo -> mpz_ptr -> ℤ
axiom alloc : mpz_memo -> mpz_ptr -> ℤ
axiom abs_size : mpz_memo -> mpz_ptr -> ℤ
axiom sgn : mpz_memo -> mpz_ptr -> ℤ
axiom readers : mpz_memo -> mpz_ptr -> ℤ
axiom zones : mpz_memo -> mpz_ptr -> C.zone
axiom mpz_memo'invariant (self : mpz_memo) (p : mpz_ptr) : (0 : ℤ) ≤ alloc self p ∧ (sgn self p = (1 : ℤ) ∨ sgn self p = -(1 : ℤ)) ∧ abs_size self p ≤ alloc self p ∧ (0 : ℤ) ≤ abs_size self p ∧ abs_size self p ≤ (2147483647 : ℤ) ∧ (0 : ℤ) ≤ abs_value_of self p ∧ ((1 : ℤ) ≤ abs_size self p → HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (abs_size self p - (1 : ℤ))) ≤ abs_value_of self p) ∧ abs_value_of self p < HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (abs_size self p))
noncomputable def value_of (x : mpz_ptr) (memo : mpz_memo) := sgn memo x * abs_value_of memo x
noncomputable def sgn_value (p : C.ptr (BitVec 64)) (sz : BitVec 32) := if (0 : ℤ) ≤ BitVec.toInt sz then Lemmas.value p (BitVec.toInt sz) else -Lemmas.value p (-BitVec.toInt sz)
noncomputable def mpz_unchanged (x : mpz_ptr) (memo1 : mpz_memo) (memo2 : mpz_memo) := readers memo1 x = readers memo2 x ∧ (-(2 : ℤ) < readers memo1 x → abs_value_of memo1 x = abs_value_of memo2 x ∧ alloc memo1 x = alloc memo2 x ∧ abs_size memo1 x = abs_size memo2 x ∧ sgn memo1 x = sgn memo2 x ∧ zones memo1 x = zones memo2 x)
structure mpz_struct where
  addr : mpz_ptr
axiom inhabited_axiom_mpz_struct : Inhabited mpz_struct
attribute [instance] inhabited_axiom_mpz_struct
end Z
namespace Zutil
axiom mpz_mem : Type
axiom inhabited_axiom_mpz_mem : Inhabited mpz_mem
attribute [instance] inhabited_axiom_mpz_mem
axiom ptr : mpz_mem -> Z.mpz_ptr
axiom ok : mpz_mem -> Bool
end Zutil
namespace LogicalUtil
end LogicalUtil
namespace Logical
end Logical
namespace BaseInfo
axiom wmpn_base_info : Type
axiom inhabited_axiom_wmpn_base_info : Inhabited wmpn_base_info
attribute [instance] inhabited_axiom_wmpn_base_info
axiom b : wmpn_base_info -> ℤ
axiom exp : wmpn_base_info -> BitVec 32
axiom bb : wmpn_base_info -> BitVec 64
axiom wmpn_base_info'invariant (self : wmpn_base_info) : (2 : ℤ) ≤ b self ∧ b self ≤ (256 : ℤ) ∧ BitVec.toUInt (bb self) < (18446744073709551615 : ℤ) + (1 : ℤ) ∧ (18446744073709551615 : ℤ) + (1 : ℤ) ≤ BitVec.toUInt (bb self) * b self ∧ (7 : ℤ) ≤ BitVec.toUInt (exp self) ∧ BitVec.toUInt (exp self) ≤ (63 : ℤ) ∧ BitVec.toUInt (bb self) = HPow.hPow (b self) (Int.toNat (BitVec.toUInt (exp self)))
noncomputable def wmpn_base_info'eq (a : wmpn_base_info) (b1 : wmpn_base_info) := b a = b b1 ∧ exp a = exp b1 ∧ bb a = bb b1
axiom wmpn_base_info'inj (a : wmpn_base_info) (b1 : wmpn_base_info) (fact0 : wmpn_base_info'eq a b1) : a = b1
end BaseInfo
namespace LogicalOld
end LogicalOld
namespace String_lemmas
noncomputable def in_base (b : ℤ) (x : ℤ -> BitVec 8) (n : ℤ) (m : ℤ) := ∀(i : ℤ), n ≤ i ∧ i < m → (0 : ℤ) ≤ BitVec.toInt (x i) ∧ BitVec.toInt (x i) < b
axiom svalue_le_sub : ℤ -> (ℤ -> BitVec 8) -> ℤ -> ℤ -> ℤ
axiom svalue_le_sub'def (n : ℤ) (m : ℤ) (b : ℤ) (x : ℤ -> BitVec 8) : if n < m then svalue_le_sub b x n m = BitVec.toInt (x n) + b * svalue_le_sub b x (n + (1 : ℤ)) m else svalue_le_sub b x n m = (0 : ℤ)
noncomputable def string_in_base (b : ℤ) (p : C.ptr (BitVec 8)) := in_base b (C.pelts p) (C.min p) (C.max p)
noncomputable def svalue_le (b : ℤ) (x : C.ptr (BitVec 8)) (sz : ℤ) := svalue_le_sub b (C.pelts x) (C.offset x) (C.offset x + sz)
axiom svalue_sub : ℤ -> (ℤ -> BitVec 8) -> ℤ -> ℤ -> ℤ
axiom svalue_sub'def (n : ℤ) (m : ℤ) (b : ℤ) (x : ℤ -> BitVec 8) : if n < m then svalue_sub b x n m = BitVec.toInt (x (m - (1 : ℤ))) + b * svalue_sub b x n (m - (1 : ℤ)) else svalue_sub b x n m = (0 : ℤ)
noncomputable def svalue (b : ℤ) (x : C.ptr (BitVec 8)) (sz : ℤ) := svalue_sub b (C.pelts x) (C.offset x) (C.offset x + sz)
end String_lemmas
namespace Conversions
noncomputable def num_to_lowercase_text (d : BitVec 8) := if (0 : ℤ) ≤ BitVec.toInt d ∧ BitVec.toInt d < (36 : ℤ) then ([48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122] : List (BitVec 8))[Int.toNat (BitVec.toInt d)]! else BitVec.ofNat 8 (Int.toNat (-(1 : ℤ)))
noncomputable def to_lowercase_text (d : ℤ -> BitVec 8) (t : ℤ -> BitVec 8) (m : ℤ) (n : ℤ) := ∀(i : ℤ), n ≤ i ∧ i < m → t i = num_to_lowercase_text (d i)
noncomputable def num_to_uppercase_text (d : BitVec 8) := if (0 : ℤ) ≤ BitVec.toInt d ∧ BitVec.toInt d < (36 : ℤ) then ([48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90] : List (BitVec 8))[Int.toNat (BitVec.toInt d)]! else BitVec.ofNat 8 (Int.toNat (-(1 : ℤ)))
noncomputable def to_uppercase_text (d : ℤ -> BitVec 8) (t : ℤ -> BitVec 8) (m : ℤ) (n : ℤ) := ∀(i : ℤ), n ≤ i ∧ i < m → t i = num_to_uppercase_text (d i)
noncomputable def num_to_bothcase_text (d : BitVec 8) := if (0 : ℤ) ≤ BitVec.toInt d ∧ BitVec.toInt d < (62 : ℤ) then ([48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122] : List (BitVec 8))[Int.toNat (BitVec.toInt d)]! else BitVec.ofNat 8 (Int.toNat (-(1 : ℤ)))
noncomputable def to_bothcase_text (d : ℤ -> BitVec 8) (t : ℤ -> BitVec 8) (m : ℤ) (n : ℤ) := ∀(i : ℤ), n ≤ i ∧ i < m → t i = num_to_bothcase_text (d i)
noncomputable def text_to_num_onecase (c : BitVec 8) := if BitVec.toInt (([48] : List (BitVec 8))[(0 : ℕ)]!) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ BitVec.toInt (([57] : List (BitVec 8))[(0 : ℕ)]!) then BitVec.toInt c - BitVec.toInt (([48] : List (BitVec 8))[(0 : ℕ)]!) else if BitVec.toInt (([97] : List (BitVec 8))[(0 : ℕ)]!) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ BitVec.toInt (([122] : List (BitVec 8))[(0 : ℕ)]!) then BitVec.toInt c - BitVec.toInt (([97] : List (BitVec 8))[(0 : ℕ)]!) + (10 : ℤ) else if BitVec.toInt (([65] : List (BitVec 8))[(0 : ℕ)]!) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ BitVec.toInt (([90] : List (BitVec 8))[(0 : ℕ)]!) then BitVec.toInt c - BitVec.toInt (([65] : List (BitVec 8))[(0 : ℕ)]!) + (10 : ℤ) else -(1 : ℤ)
noncomputable def text_to_num_bothcase (c : BitVec 8) := if BitVec.toInt (([48] : List (BitVec 8))[(0 : ℕ)]!) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ BitVec.toInt (([57] : List (BitVec 8))[(0 : ℕ)]!) then BitVec.toInt c - BitVec.toInt (([48] : List (BitVec 8))[(0 : ℕ)]!) else if BitVec.toInt (([97] : List (BitVec 8))[(0 : ℕ)]!) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ BitVec.toInt (([122] : List (BitVec 8))[(0 : ℕ)]!) then BitVec.toInt c - BitVec.toInt (([97] : List (BitVec 8))[(0 : ℕ)]!) + (36 : ℤ) else if BitVec.toInt (([65] : List (BitVec 8))[(0 : ℕ)]!) ≤ BitVec.toInt c ∧ BitVec.toInt c ≤ BitVec.toInt (([90] : List (BitVec 8))[(0 : ℕ)]!) then BitVec.toInt c - BitVec.toInt (([65] : List (BitVec 8))[(0 : ℕ)]!) + (10 : ℤ) else -(1 : ℤ)
noncomputable def text_to_num (base : ℤ) (c : BitVec 8) := if -(36 : ℤ) ≤ base ∧ base ≤ (36 : ℤ) then text_to_num_onecase c else text_to_num_bothcase c
noncomputable def num_to_text (base : ℤ) (d : BitVec 8) := if (0 : ℤ) ≤ base ∧ base ≤ (36 : ℤ) then num_to_lowercase_text d else if (36 : ℤ) < base ∧ base ≤ (62 : ℤ) then num_to_bothcase_text d else if -(36 : ℤ) ≤ base then num_to_uppercase_text d else BitVec.ofNat 8 (Int.toNat (-(1 : ℤ)))
noncomputable def to_num (base : ℤ) (t : ℤ -> BitVec 8) (d : ℤ -> BitVec 8) (n : ℤ) (m : ℤ) := ∀(i : ℤ), n ≤ i ∧ i < m → BitVec.toInt (d i) = text_to_num base (t i)
end Conversions
namespace String_value
axiom abs_value_sub_text : ℤ -> (ℤ -> BitVec 8) -> ℤ -> ℤ -> ℤ
axiom abs_value_sub_text'def (n : ℤ) (m : ℤ) (b : ℤ) (s : ℤ -> BitVec 8) : if n < m then abs_value_sub_text b s n m = Conversions.text_to_num b (s (m - (1 : ℤ))) + b * abs_value_sub_text b s n (m - (1 : ℤ)) else abs_value_sub_text b s n m = (0 : ℤ)
noncomputable def abs_value_text (b : ℤ) (s : ℤ -> BitVec 8) (ofs : ℤ) := abs_value_sub_text b s ofs (ofs + String.strlen s ofs)
noncomputable def value_text (b : ℤ) (s : ℤ -> BitVec 8) (ofs : ℤ) := if s ofs = ([45] : List (BitVec 8))[(0 : ℕ)]! then -abs_value_text b s (ofs + (1 : ℤ)) else abs_value_text b s ofs
noncomputable def text_in_base (b : ℤ) (t : ℤ -> BitVec 8) (n : ℤ) (m : ℤ) := ∀(i : ℤ), n ≤ i ∧ i < m → (0 : ℤ) ≤ Conversions.text_to_num b (t i) ∧ Conversions.text_to_num b (t i) < b
noncomputable def string_in_base (b : ℤ) (s : ℤ -> BitVec 8) (ofs : ℤ) := text_in_base b s ofs (ofs + String.strlen s ofs) ∧ (0 : ℤ) < String.strlen s ofs ∨ s ofs = ([45] : List (BitVec 8))[(0 : ℕ)]! ∧ text_in_base b s (ofs + (1 : ℤ)) (ofs + String.strlen s ofs) ∧ (1 : ℤ) < String.strlen s ofs
end String_value
namespace Compare
noncomputable def compare_int (x : ℤ) (y : ℤ) := if x < y then -(1 : ℤ) else if x = y then (0 : ℤ) else (1 : ℤ)
end Compare
namespace Valuation
axiom valuation : ℤ -> ℤ -> ℤ
axiom valuation'def (p : ℤ) (n : ℤ) (fact0 : (1 : ℤ) < p) (fact1 : (1 : ℤ) ≤ n) : if Int.tmod n p = (0 : ℤ) then valuation n p = valuation (Int.tdiv n p) p + (1 : ℤ) else valuation n p = (0 : ℤ)
axiom valuation'spec'0 (p : ℤ) (n : ℤ) (fact0 : (1 : ℤ) < p) (fact1 : (1 : ℤ) ≤ n) : (0 : ℤ) ≤ valuation n p
axiom valuation'spec (p : ℤ) (n : ℤ) (fact0 : (1 : ℤ) < p) (fact1 : (1 : ℤ) ≤ n) : HPow.hPow p (Int.toNat (valuation n p)) ∣  n
end Valuation
namespace Add
end Add
namespace AddOld
end AddOld
namespace SubOld
end SubOld
namespace Mul
end Mul
namespace Mul_basecase
end Mul_basecase
namespace Div
noncomputable def reciprocal (v : BitVec 64) (d : BitVec 64) := BitVec.toUInt v = (((18446744073709551615 : ℤ) + (1 : ℤ)) * ((18446744073709551615 : ℤ) + (1 : ℤ)) - (1 : ℤ)) / BitVec.toUInt d - ((18446744073709551615 : ℤ) + (1 : ℤ))
noncomputable def reciprocal_3by2 (v : BitVec 64) (dh : BitVec 64) (dl : BitVec 64) := BitVec.toUInt v = (((18446744073709551615 : ℤ) + (1 : ℤ)) * ((18446744073709551615 : ℤ) + (1 : ℤ)) * ((18446744073709551615 : ℤ) + (1 : ℤ)) - (1 : ℤ)) / (BitVec.toUInt dl + ((18446744073709551615 : ℤ) + (1 : ℤ)) * BitVec.toUInt dh) - ((18446744073709551615 : ℤ) + (1 : ℤ))
noncomputable def normalized (x : C.ptr (BitVec 64)) (sz : BitVec 32) := C.valid x (BitVec.toInt sz) ∧ ((18446744073709551615 : ℤ) + (1 : ℤ)) / (2 : ℤ) ≤ BitVec.toUInt (C.pelts x (C.offset x + BitVec.toInt sz - (1 : ℤ)))
end Div
namespace Add_1
end Add_1
namespace Sub_1
end Sub_1
namespace Toom
end Toom
namespace Powm
noncomputable def redc (ur : ℤ) (u : ℤ) (n : ℤ) (m : ℤ) := ur % m = HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat n) * u % m
noncomputable def valueb (p : C.ptr (BitVec 64)) (nbits : ℤ) := if nbits < (0 : ℤ) then (0 : ℤ) else let i : ℤ := nbits / (64 : ℤ); Lemmas.value p i + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat i) * (BitVec.toUInt (C.pelts p (C.offset p + i)) % HPow.hPow (2 : ℤ) (Int.toNat (nbits - (64 : ℤ) * i)))
end Powm
namespace Get_str
end Get_str
namespace mpz_get_str_Zget_str_wmpz_get_strqtvc
noncomputable def effective (b : ℤ) := if abs b < (2 : ℤ) then (10 : ℤ) else abs b
theorem wmpz_get_str'vc (sp : C.ptr (BitVec 8)) (sz : BitVec 32) (mpz : Z.mpz_memo) (u : Z.mpz_ptr) (base : BitVec 32) (fact0 : C.valid sp (BitVec.toInt sz)) (fact1 : C.writable sp = true) (fact2 : (2 : ℤ) ≤ BitVec.toInt sz) (fact3 : Z.abs_value_of mpz u < HPow.hPow (effective (BitVec.toInt base)) (Int.toNat (BitVec.toInt sz - (2 : ℤ)))) (fact4 : Z.readers mpz u = (0 : ℤ)) (fact5 : (64 : ℤ) * Z.abs_size mpz u + (7 : ℤ) ≤ (2147483647 : ℤ)) (fact6 : -(36 : ℤ) ≤ BitVec.toInt base) (fact7 : BitVec.toInt base ≤ (62 : ℤ)) : (∀(result : List (BitVec 8)), (if (36 : ℤ) < BitVec.toInt base then result = ([48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122] : List (BitVec 8)) else if (0 : ℤ) ≤ BitVec.toInt base then result = ([48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122] : List (BitVec 8)) else result = ([48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90] : List (BitVec 8))) → (BitVec.toInt base < (0 : ℤ) → result = ([48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90] : List (BitVec 8))) ∧ ((0 : ℤ) ≤ BitVec.toInt base ∧ BitVec.toInt base ≤ (36 : ℤ) → result = ([48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122] : List (BitVec 8))) ∧ ((36 : ℤ) < BitVec.toInt base → result = ([48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122] : List (BitVec 8))) ∧ effective (BitVec.toInt base) ≤ Int.ofNat (List.length result)) ∧ (∀(digits : List (BitVec 8)), (BitVec.toInt base < (0 : ℤ) → digits = ([48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90] : List (BitVec 8))) ∧ ((0 : ℤ) ≤ BitVec.toInt base ∧ BitVec.toInt base ≤ (36 : ℤ) → digits = ([48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122] : List (BitVec 8))) ∧ ((36 : ℤ) < BitVec.toInt base → digits = ([48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122] : List (BitVec 8))) ∧ effective (BitVec.toInt base) ≤ Int.ofNat (List.length digits) → (if BitVec.toInt base ≤ (0 : ℤ) then int'32_in_bounds (-BitVec.toInt base) ∧ (∀(o1 : BitVec 32), BitVec.toInt o1 = -BitVec.toInt base → (if BitVec.toInt o1 ≤ (1 : ℤ) then BitVec.toInt (10 : BitVec 32) = effective (BitVec.toInt base) else BitVec.toInt o1 = effective (BitVec.toInt base))) else if BitVec.toInt base ≤ (1 : ℤ) then BitVec.toInt (10 : BitVec 32) = effective (BitVec.toInt base) else BitVec.toInt base = effective (BitVec.toInt base)) ∧ (∀(base1 : BitVec 32), BitVec.toInt base1 = effective (BitVec.toInt base) → -(2 : ℤ) < Z.readers mpz u ∧ (∀(un : BitVec 32), BitVec.toInt un = Z.abs_size mpz u → (∀(o1 : Bool), (BitVec.toInt un = BitVec.toInt (0 : BitVec 32) → o1 = true) ∧ (o1 = true → un = (0 : BitVec 32)) → (if o1 = true then let o2 : BitVec 8 := ([48] : List (BitVec 8))[(0 : ℕ)]!; ((C.min sp ≤ C.offset sp + (0 : ℤ) ∧ C.offset sp + (0 : ℤ) < C.max sp) ∧ C.writable sp = true) ∧ (∀(sp1 : C.ptr (BitVec 8)), List.length (C.data sp1) = List.length (C.data sp) ∧ C.offset sp1 = C.offset sp ∧ C.min sp1 = C.min sp ∧ C.max sp1 = C.max sp ∧ C.writable sp1 = C.writable sp ∧ C.zone1 sp1 = C.zone1 sp → C.pelts sp1 = Function.update (C.pelts sp) (C.offset sp1 + (0 : ℤ)) o2 ∧ C.pelts sp1 (C.offset sp1 + (0 : ℤ)) = o2 → (let o3 : BitVec 8 := String.zero_char; ((C.min sp1 ≤ C.offset sp1 + (1 : ℤ) ∧ C.offset sp1 + (1 : ℤ) < C.max sp1) ∧ C.writable sp1 = true) ∧ (∀(sp2 : C.ptr (BitVec 8)), List.length (C.data sp2) = List.length (C.data sp1) ∧ C.offset sp2 = C.offset sp1 ∧ C.min sp2 = C.min sp1 ∧ C.max sp2 = C.max sp1 ∧ C.writable sp2 = C.writable sp1 ∧ C.zone1 sp2 = C.zone1 sp1 → C.pelts sp2 = Function.update (C.pelts sp1) (C.offset sp2 + (1 : ℤ)) o3 ∧ C.pelts sp2 (C.offset sp2 + (1 : ℤ)) = o3 → String.valid_string sp2 ∧ String_value.string_in_base (effective (BitVec.toInt base)) (C.pelts sp2) (C.offset sp2) ∧ (∀(x : Z.mpz_ptr), Z.mpz_unchanged x mpz mpz) ∧ String_value.value_text (effective (BitVec.toInt base)) (C.pelts sp2) (C.offset sp2) = Z.value_of u mpz))) else -(2 : ℤ) < Z.readers mpz u ∧ (∀(o2 : BitVec 32), BitVec.toInt o2 = Z.sgn mpz u * Z.abs_size mpz u → (if BitVec.toInt o2 < (0 : ℤ) then let o3 : BitVec 8 := ([45] : List (BitVec 8))[(0 : ℕ)]!; ((C.min sp ≤ C.offset sp + (0 : ℤ) ∧ C.offset sp + (0 : ℤ) < C.max sp) ∧ C.writable sp = true) ∧ (∀(sp1 : C.ptr (BitVec 8)), List.length (C.data sp1) = List.length (C.data sp) ∧ C.offset sp1 = C.offset sp ∧ C.min sp1 = C.min sp ∧ C.max sp1 = C.max sp ∧ C.writable sp1 = C.writable sp ∧ C.zone1 sp1 = C.zone1 sp → C.pelts sp1 = Function.update (C.pelts sp) (C.offset sp1 + (0 : ℤ)) o3 ∧ C.pelts sp1 (C.offset sp1 + (0 : ℤ)) = o3 → int'32_in_bounds ((0 : ℤ) + (1 : ℤ)) ∧ (∀(o4 : BitVec 32), BitVec.toInt o4 = (0 : ℤ) + (1 : ℤ) → (0 : ℤ) ≤ BitVec.toInt base1 ∧ (∀(o5 : BitVec 64), BitVec.toUInt o5 = BitVec.toInt base1 → ((2 : ℤ) ≤ BitVec.toUInt o5 ∧ BitVec.toUInt o5 ≤ (256 : ℤ)) ∧ (∀(bits : BitVec 32), ((0 : ℤ) ≤ BitVec.toUInt bits ∧ BitVec.toUInt bits ≤ (8 : ℤ)) ∧ (¬BitVec.toUInt bits = (0 : ℤ) → HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt bits)) = BitVec.toUInt o5) ∧ (BitVec.toUInt bits = (0 : ℤ) → (∀(n : ℤ), (0 : ℤ) ≤ n → ¬HPow.hPow (2 : ℤ) (Int.toNat n) = BitVec.toUInt o5)) → (0 : ℤ) ≤ Z.readers mpz u ∧ (∀(mpz1 : Z.mpz_memo), Z.abs_value_of mpz1 = Z.abs_value_of mpz ∧ Z.alloc mpz1 = Z.alloc mpz ∧ Z.abs_size mpz1 = Z.abs_size mpz ∧ Z.sgn mpz1 = Z.sgn mpz ∧ Z.zones mpz1 = Z.zones mpz → (∀(up : C.ptr (BitVec 64)), Z.readers mpz1 u = Z.readers mpz u + (1 : ℤ) ∧ (∀(y : Z.mpz_ptr), ¬u = y → Z.readers mpz1 y = Z.readers mpz y) ∧ Lemmas.value up (Z.abs_size mpz1 u) = Z.abs_value_of mpz1 u ∧ C.plength up = Z.alloc mpz1 u ∧ C.offset up = (0 : ℤ) ∧ C.min up = (0 : ℤ) ∧ C.max up = C.plength up ∧ C.zone1 up = Z.zones mpz1 u → C.writable sp1 = true ∧ (∀(sp2 : C.ptr (BitVec 8)), C.offset sp2 = C.offset sp1 ∧ C.writable sp2 = C.writable sp1 ∧ C.zone1 sp2 = C.zone1 sp1 → (∀(usp : C.ptr (BitVec 8)) (mem : UChar.cast_mem), (C.min usp = C.min sp1 ∧ C.min sp1 = UChar.mi mem) ∧ (C.max usp = C.max sp1 ∧ C.max sp1 = UChar.ma mem) ∧ C.zone1 sp1 = UChar.z mem ∧ (C.plength usp = C.plength sp1 ∧ C.plength sp1 = UChar.l mem) ∧ UChar.ok mem = true ∧ C.offset usp = C.offset sp1 ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < C.plength sp1 → C.pelts usp i = C.pelts sp1 i) ∧ C.writable usp = true → (C.min usp ≤ C.offset usp + BitVec.toInt o4 ∧ C.offset usp + BitVec.toInt o4 ≤ C.max usp) ∧ (∀(uspi : C.ptr (BitVec 8)), C.offset uspi = C.offset usp + BitVec.toInt o4 ∧ C.plength uspi = C.plength usp ∧ C.pelts uspi = C.pelts usp ∧ C.data uspi = C.data usp ∧ C.min uspi = C.min usp ∧ C.max uspi = C.max usp ∧ C.zone1 uspi = C.zone1 usp ∧ C.writable uspi = C.writable usp → (BitVec.toUInt bits = (0 : ℤ) → bits = (0 : BitVec 32)) → (if ¬bits = (0 : BitVec 32) then int'32_in_bounds (BitVec.toInt un - (1 : ℤ)) ∧ (∀(o6 : BitVec 32), BitVec.toInt o6 = BitVec.toInt un - (1 : ℤ) → (C.min up ≤ C.offset up + BitVec.toInt o6 ∧ C.offset up + BitVec.toInt o6 < C.max up) ∧ (let um : BitVec 64 := C.pelts up (C.offset up + BitVec.toInt o6); (0 : ℤ) < BitVec.toUInt um ∧ (∀(sb : BitVec 64), ((1 : ℤ) ≤ BitVec.toUInt sb ∧ BitVec.toUInt sb ≤ (64 : ℤ)) ∧ HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt sb - (1 : ℤ))) ≤ BitVec.toUInt um ∧ BitVec.toUInt um < HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt sb)) → BitVec.toUInt sb ≤ (2147483647 : ℤ) ∧ (∀(o7 : BitVec 32), BitVec.toInt o7 = BitVec.toUInt sb → int'32_in_bounds (BitVec.toInt un - (1 : ℤ)) ∧ (∀(o8 : BitVec 32), BitVec.toInt o8 = BitVec.toInt un - (1 : ℤ) → int'32_in_bounds ((64 : ℤ) * BitVec.toInt o8) ∧ (∀(o9 : BitVec 32), BitVec.toInt o9 = (64 : ℤ) * BitVec.toInt o8 → int'32_in_bounds (BitVec.toInt o9 + BitVec.toInt o7) ∧ (∀(ub : BitVec 32), BitVec.toInt ub = BitVec.toInt o9 + BitVec.toInt o7 → ((1 : ℤ) ≤ BitVec.toInt un ∧ C.valid up (BitVec.toInt un) ∧ ((1 : ℤ) ≤ BitVec.toUInt bits ∧ BitVec.toUInt bits ≤ (8 : ℤ)) ∧ C.valid uspi ((BitVec.toInt ub + BitVec.toUInt bits - (1 : ℤ)) / BitVec.toUInt bits) ∧ (0 : ℤ) ≤ BitVec.toInt ub ∧ Lemmas.value up (BitVec.toInt un) < HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toInt ub)) ∧ (0 : ℤ) < BitVec.toUInt (C.pelts up (C.offset up + BitVec.toInt un - (1 : ℤ))) ∧ (64 : ℤ) * BitVec.toInt un + (7 : ℤ) ≤ (2147483647 : ℤ) ∧ C.writable uspi = true) ∧ (∀(uspi1 : C.ptr (BitVec 8)) (usp1 : C.ptr (BitVec 8)), C.data uspi1 = C.data usp1 ∧ List.length (C.data usp1) = List.length (C.data uspi) ∧ C.offset uspi1 = C.offset uspi ∧ C.min uspi1 = C.min uspi ∧ C.max uspi1 = C.max uspi ∧ C.writable uspi1 = C.writable uspi ∧ C.zone1 uspi1 = C.zone1 uspi → List.length (C.data usp1) = List.length (C.data usp) ∧ C.offset usp1 = C.offset usp ∧ C.min usp1 = C.min usp ∧ C.max usp1 = C.max usp ∧ C.writable usp1 = C.writable usp ∧ C.zone1 usp1 = C.zone1 usp → (∀(g : BitVec 32), String_lemmas.in_base (HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt bits))) (C.pelts uspi1) (C.offset uspi1) (C.offset uspi1 + BitVec.toUInt g) ∧ String_lemmas.svalue (HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt bits))) uspi1 (BitVec.toUInt g) = Lemmas.value up (BitVec.toInt un) ∧ ((0 : ℤ) < BitVec.toUInt g ∧ BitVec.toUInt g ≤ (BitVec.toInt ub + BitVec.toUInt bits - (1 : ℤ)) / BitVec.toUInt bits) ∧ (0 : ℤ) < BitVec.toInt (C.pelts uspi1 (C.offset uspi1)) ∧ (∀(j : ℤ), j < C.offset uspi1 ∨ C.offset uspi1 + (BitVec.toInt ub + BitVec.toUInt bits - (1 : ℤ)) / BitVec.toUInt bits ≤ j → C.pelts uspi1 j = C.pelts uspi j) → BitVec.toUInt g ≤ (2147483647 : ℤ) ∧ (∀(o10 : BitVec 32), BitVec.toInt o10 = BitVec.toUInt g → int'32_in_bounds (BitVec.toInt o4 + BitVec.toInt o10) ∧ (∀(o11 : BitVec 32), BitVec.toInt o11 = BitVec.toInt o4 + BitVec.toInt o10 → (UChar.ok mem = true ∧ UChar.z mem = C.zone1 sp2 ∧ UChar.mi mem = C.min usp1 ∧ UChar.ma mem = C.max usp1 ∧ C.offset sp2 = C.offset usp1 ∧ C.plength usp1 = UChar.l mem) ∧ (∀(mem1 : UChar.cast_mem) (sp3 : C.ptr (BitVec 8)), UChar.mi mem1 = UChar.mi mem ∧ UChar.ma mem1 = UChar.ma mem ∧ UChar.z mem1 = UChar.z mem ∧ UChar.l mem1 = UChar.l mem → C.offset sp3 = C.offset sp2 ∧ C.writable sp3 = C.writable sp2 ∧ C.zone1 sp3 = C.zone1 sp2 → (C.min sp3 = UChar.mi mem1 ∧ C.max sp3 = UChar.ma mem1) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < C.plength sp3 → C.pelts sp3 i = C.pelts usp1 i) ∧ C.plength sp3 = C.plength usp1 → int'32_in_bounds (BitVec.toInt o11 - (1 : ℤ)) ∧ (∀(o12 : BitVec 32), BitVec.toInt o12 = BitVec.toInt o11 - (1 : ℤ) → (BitVec.toInt o4 ≤ BitVec.toInt o12 + (1 : ℤ) → ((BitVec.toInt o4 ≤ BitVec.toInt o4 ∧ BitVec.toInt o4 ≤ BitVec.toInt o11) ∧ ((0 : ℤ) ≤ BitVec.toInt base ∧ BitVec.toInt base ≤ (36 : ℤ) → Conversions.to_lowercase_text (C.pelts usp1) (C.pelts sp3) (C.offset sp3) (C.offset sp3 + BitVec.toInt o4)) ∧ ((36 : ℤ) < BitVec.toInt base → Conversions.to_bothcase_text (C.pelts usp1) (C.pelts sp3) (C.offset sp3) (C.offset sp3 + BitVec.toInt o4)) ∧ (BitVec.toInt base < (0 : ℤ) → Conversions.to_uppercase_text (C.pelts usp1) (C.pelts sp3) (C.offset sp3) (C.offset sp3 + BitVec.toInt o4)) ∧ String_value.abs_value_sub_text (BitVec.toInt base1) (C.pelts sp3) (C.offset sp3 + BitVec.toInt o4) (C.offset sp3 + BitVec.toInt o4) = String_lemmas.svalue_sub (BitVec.toInt base1) (C.pelts usp1) (C.offset usp1 + BitVec.toInt o4) (C.offset usp1 + BitVec.toInt o4) ∧ (∀(k : ℤ), C.offset sp3 ≤ k ∧ k < C.offset sp3 + BitVec.toInt o4 → ¬BitVec.toInt (C.pelts sp3 k) = (0 : ℤ)) ∧ String_value.text_in_base (BitVec.toInt base1) (C.pelts sp3) (C.offset sp3 + BitVec.toInt o4) (C.offset sp3 + BitVec.toInt o4) ∧ (BitVec.toInt o4 = (1 : ℤ) → C.pelts sp3 (C.offset sp3) = ([45] : List (BitVec 8))[(0 : ℕ)]!) ∧ (BitVec.toInt o4 = (0 : ℤ) → BitVec.toInt o4 < BitVec.toInt o4 → ¬C.pelts sp3 (C.offset sp3) = ([45] : List (BitVec 8))[(0 : ℕ)]!)) ∧ (∀(sp4 : C.ptr (BitVec 8)), List.length (C.data sp4) = List.length (C.data sp3) ∧ C.offset sp4 = C.offset sp3 ∧ C.min sp4 = C.min sp3 ∧ C.max sp4 = C.max sp3 ∧ C.writable sp4 = C.writable sp3 ∧ C.zone1 sp4 = C.zone1 sp3 → (∀(j : BitVec 32), let j1 : ℤ := BitVec.toInt j; (BitVec.toInt o4 ≤ j1 ∧ j1 ≤ BitVec.toInt o12) ∧ (BitVec.toInt o4 ≤ j1 ∧ j1 ≤ BitVec.toInt o11) ∧ (∀(k : ℤ), C.offset sp4 + j1 ≤ C.offset sp4 + k ∧ C.offset sp4 + k < C.offset sp4 + BitVec.toInt o11 → C.pelts sp4 (C.offset sp4 + k) = C.pelts sp3 (C.offset sp4 + k)) ∧ ((0 : ℤ) ≤ BitVec.toInt base ∧ BitVec.toInt base ≤ (36 : ℤ) → Conversions.to_lowercase_text (C.pelts usp1) (C.pelts sp4) (C.offset sp4) (C.offset sp4 + j1)) ∧ ((36 : ℤ) < BitVec.toInt base → Conversions.to_bothcase_text (C.pelts usp1) (C.pelts sp4) (C.offset sp4) (C.offset sp4 + j1)) ∧ (BitVec.toInt base < (0 : ℤ) → Conversions.to_uppercase_text (C.pelts usp1) (C.pelts sp4) (C.offset sp4) (C.offset sp4 + j1)) ∧ String_value.abs_value_sub_text (BitVec.toInt base1) (C.pelts sp4) (C.offset sp4 + BitVec.toInt o4) (C.offset sp4 + j1) = String_lemmas.svalue_sub (BitVec.toInt base1) (C.pelts usp1) (C.offset usp1 + BitVec.toInt o4) (C.offset usp1 + j1) ∧ (∀(k : ℤ), C.offset sp4 ≤ k ∧ k < C.offset sp4 + j1 → ¬BitVec.toInt (C.pelts sp4 k) = (0 : ℤ)) ∧ String_value.text_in_base (BitVec.toInt base1) (C.pelts sp4) (C.offset sp4 + BitVec.toInt o4) (C.offset sp4 + j1) ∧ (BitVec.toInt o4 = (1 : ℤ) → C.pelts sp4 (C.offset sp4) = ([45] : List (BitVec 8))[(0 : ℕ)]!) ∧ (BitVec.toInt o4 = (0 : ℤ) → BitVec.toInt o4 < j1 → ¬C.pelts sp4 (C.offset sp4) = ([45] : List (BitVec 8))[(0 : ℕ)]!) → (C.min sp4 ≤ C.offset sp4 + BitVec.toInt j ∧ C.offset sp4 + BitVec.toInt j < C.max sp4) ∧ (let o13 : BitVec 8 := C.pelts sp4 (C.offset sp4 + BitVec.toInt j); let cj : BitVec 8 := o13; ((0 : ℤ) ≤ BitVec.toInt o13 ∧ BitVec.toInt o13 ≤ (127 : ℤ) → BitVec.toInt cj = BitVec.toInt o13) → (∀(o14 : BitVec 32), BitVec.toInt o14 = BitVec.toInt cj → ((0 : ℤ) ≤ BitVec.toInt o14 ∧ BitVec.toInt o14 ≤ Int.ofNat (List.length digits)) ∧ (∀(dc : BitVec 8), ((0 : ℤ) ≤ BitVec.toInt o14 ∧ BitVec.toInt o14 < Int.ofNat (List.length digits) → dc = digits[Int.toNat (BitVec.toInt o14)]!) ∧ (BitVec.toInt o14 = Int.ofNat (List.length digits) → dc = BitVec.ofNat 8 (0 : ℕ)) → ((C.min sp4 ≤ C.offset sp4 + BitVec.toInt j ∧ C.offset sp4 + BitVec.toInt j < C.max sp4) ∧ C.writable sp4 = true) ∧ (∀(sp5 : C.ptr (BitVec 8)), List.length (C.data sp5) = List.length (C.data sp4) ∧ C.offset sp5 = C.offset sp4 ∧ C.min sp5 = C.min sp4 ∧ C.max sp5 = C.max sp4 ∧ C.writable sp5 = C.writable sp4 ∧ C.zone1 sp5 = C.zone1 sp4 → C.pelts sp5 = Function.update (C.pelts sp4) (C.offset sp5 + BitVec.toInt j) dc ∧ C.pelts sp5 (C.offset sp5 + BitVec.toInt j) = dc → (BitVec.toInt o4 ≤ j1 + (1 : ℤ) ∧ j1 + (1 : ℤ) ≤ BitVec.toInt o11) ∧ (∀(k : ℤ), C.offset sp5 + (j1 + (1 : ℤ)) ≤ C.offset sp5 + k ∧ C.offset sp5 + k < C.offset sp5 + BitVec.toInt o11 → C.pelts sp5 (C.offset sp5 + k) = C.pelts sp3 (C.offset sp5 + k)) ∧ ((0 : ℤ) ≤ BitVec.toInt base ∧ BitVec.toInt base ≤ (36 : ℤ) → Conversions.to_lowercase_text (C.pelts usp1) (C.pelts sp5) (C.offset sp5) (C.offset sp5 + (j1 + (1 : ℤ)))) ∧ ((36 : ℤ) < BitVec.toInt base → Conversions.to_bothcase_text (C.pelts usp1) (C.pelts sp5) (C.offset sp5) (C.offset sp5 + (j1 + (1 : ℤ)))) ∧ (BitVec.toInt base < (0 : ℤ) → Conversions.to_uppercase_text (C.pelts usp1) (C.pelts sp5) (C.offset sp5) (C.offset sp5 + (j1 + (1 : ℤ)))) ∧ String_value.abs_value_sub_text (BitVec.toInt base1) (C.pelts sp5) (C.offset sp5 + BitVec.toInt o4) (C.offset sp5 + (j1 + (1 : ℤ))) = String_lemmas.svalue_sub (BitVec.toInt base1) (C.pelts usp1) (C.offset usp1 + BitVec.toInt o4) (C.offset usp1 + (j1 + (1 : ℤ))) ∧ (∀(k : ℤ), C.offset sp5 ≤ k ∧ k < C.offset sp5 + (j1 + (1 : ℤ)) → ¬BitVec.toInt (C.pelts sp5 k) = (0 : ℤ)) ∧ String_value.text_in_base (BitVec.toInt base1) (C.pelts sp5) (C.offset sp5 + BitVec.toInt o4) (C.offset sp5 + (j1 + (1 : ℤ))) ∧ (BitVec.toInt o4 = (1 : ℤ) → C.pelts sp5 (C.offset sp5) = ([45] : List (BitVec 8))[(0 : ℕ)]!) ∧ (BitVec.toInt o4 = (0 : ℤ) → BitVec.toInt o4 < j1 + (1 : ℤ) → ¬C.pelts sp5 (C.offset sp5) = ([45] : List (BitVec 8))[(0 : ℕ)]!)))))) ∧ ((BitVec.toInt o4 ≤ BitVec.toInt o12 + (1 : ℤ) ∧ BitVec.toInt o12 + (1 : ℤ) ≤ BitVec.toInt o11) ∧ (∀(k : ℤ), C.offset sp4 + (BitVec.toInt o12 + (1 : ℤ)) ≤ C.offset sp4 + k ∧ C.offset sp4 + k < C.offset sp4 + BitVec.toInt o11 → C.pelts sp4 (C.offset sp4 + k) = C.pelts sp3 (C.offset sp4 + k)) ∧ ((0 : ℤ) ≤ BitVec.toInt base ∧ BitVec.toInt base ≤ (36 : ℤ) → Conversions.to_lowercase_text (C.pelts usp1) (C.pelts sp4) (C.offset sp4) (C.offset sp4 + (BitVec.toInt o12 + (1 : ℤ)))) ∧ ((36 : ℤ) < BitVec.toInt base → Conversions.to_bothcase_text (C.pelts usp1) (C.pelts sp4) (C.offset sp4) (C.offset sp4 + (BitVec.toInt o12 + (1 : ℤ)))) ∧ (BitVec.toInt base < (0 : ℤ) → Conversions.to_uppercase_text (C.pelts usp1) (C.pelts sp4) (C.offset sp4) (C.offset sp4 + (BitVec.toInt o12 + (1 : ℤ)))) ∧ String_value.abs_value_sub_text (BitVec.toInt base1) (C.pelts sp4) (C.offset sp4 + BitVec.toInt o4) (C.offset sp4 + (BitVec.toInt o12 + (1 : ℤ))) = String_lemmas.svalue_sub (BitVec.toInt base1) (C.pelts usp1) (C.offset usp1 + BitVec.toInt o4) (C.offset usp1 + (BitVec.toInt o12 + (1 : ℤ))) ∧ (∀(k : ℤ), C.offset sp4 ≤ k ∧ k < C.offset sp4 + (BitVec.toInt o12 + (1 : ℤ)) → ¬BitVec.toInt (C.pelts sp4 k) = (0 : ℤ)) ∧ String_value.text_in_base (BitVec.toInt base1) (C.pelts sp4) (C.offset sp4 + BitVec.toInt o4) (C.offset sp4 + (BitVec.toInt o12 + (1 : ℤ))) ∧ (BitVec.toInt o4 = (1 : ℤ) → C.pelts sp4 (C.offset sp4) = ([45] : List (BitVec 8))[(0 : ℕ)]!) ∧ (BitVec.toInt o4 = (0 : ℤ) → BitVec.toInt o4 < BitVec.toInt o12 + (1 : ℤ) → ¬C.pelts sp4 (C.offset sp4) = ([45] : List (BitVec 8))[(0 : ℕ)]!) → (let o13 : BitVec 8 := String.zero_char; ((C.min sp4 ≤ C.offset sp4 + BitVec.toInt o11 ∧ C.offset sp4 + BitVec.toInt o11 < C.max sp4) ∧ C.writable sp4 = true) ∧ (∀(sp5 : C.ptr (BitVec 8)), List.length (C.data sp5) = List.length (C.data sp4) ∧ C.offset sp5 = C.offset sp4 ∧ C.min sp5 = C.min sp4 ∧ C.max sp5 = C.max sp4 ∧ C.writable sp5 = C.writable sp4 ∧ C.zone1 sp5 = C.zone1 sp4 → C.pelts sp5 = Function.update (C.pelts sp4) (C.offset sp5 + BitVec.toInt o11) o13 ∧ C.pelts sp5 (C.offset sp5 + BitVec.toInt o11) = o13 → (Z.zones mpz1 u = C.zone1 up ∧ (1 : ℤ) ≤ Z.readers mpz1 u ∧ C.min up = (0 : ℤ) ∧ C.max up = C.plength up) ∧ (∀(mpz2 : Z.mpz_memo), Z.abs_value_of mpz2 = Z.abs_value_of mpz1 ∧ Z.alloc mpz2 = Z.alloc mpz1 ∧ Z.abs_size mpz2 = Z.abs_size mpz1 ∧ Z.sgn mpz2 = Z.sgn mpz1 ∧ Z.zones mpz2 = Z.zones mpz1 → Z.readers mpz2 u = Z.readers mpz1 u - (1 : ℤ) ∧ (∀(y : Z.mpz_ptr), ¬y = u → Z.readers mpz2 y = Z.readers mpz1 y) → String.valid_string sp5 ∧ String_value.string_in_base (effective (BitVec.toInt base)) (C.pelts sp5) (C.offset sp5) ∧ (∀(x : Z.mpz_ptr), Z.mpz_unchanged x mpz2 mpz) ∧ String_value.value_text (effective (BitVec.toInt base)) (C.pelts sp5) (C.offset sp5) = Z.value_of u mpz2)))))) ∧ (BitVec.toInt o12 + (1 : ℤ) < BitVec.toInt o4 → (let o13 : BitVec 8 := String.zero_char; ((C.min sp3 ≤ C.offset sp3 + BitVec.toInt o11 ∧ C.offset sp3 + BitVec.toInt o11 < C.max sp3) ∧ C.writable sp3 = true) ∧ (∀(sp4 : C.ptr (BitVec 8)), List.length (C.data sp4) = List.length (C.data sp3) ∧ C.offset sp4 = C.offset sp3 ∧ C.min sp4 = C.min sp3 ∧ C.max sp4 = C.max sp3 ∧ C.writable sp4 = C.writable sp3 ∧ C.zone1 sp4 = C.zone1 sp3 → C.pelts sp4 = Function.update (C.pelts sp3) (C.offset sp4 + BitVec.toInt o11) o13 ∧ C.pelts sp4 (C.offset sp4 + BitVec.toInt o11) = o13 → (Z.zones mpz1 u = C.zone1 up ∧ (1 : ℤ) ≤ Z.readers mpz1 u ∧ C.min up = (0 : ℤ) ∧ C.max up = C.plength up) ∧ (∀(mpz2 : Z.mpz_memo), Z.abs_value_of mpz2 = Z.abs_value_of mpz1 ∧ Z.alloc mpz2 = Z.alloc mpz1 ∧ Z.abs_size mpz2 = Z.abs_size mpz1 ∧ Z.sgn mpz2 = Z.sgn mpz1 ∧ Z.zones mpz2 = Z.zones mpz1 → Z.readers mpz2 u = Z.readers mpz1 u - (1 : ℤ) ∧ (∀(y : Z.mpz_ptr), ¬y = u → Z.readers mpz2 y = Z.readers mpz1 y) → String.valid_string sp4 ∧ String_value.string_in_base (effective (BitVec.toInt base)) (C.pelts sp4) (C.offset sp4) ∧ (∀(x : Z.mpz_ptr), Z.mpz_unchanged x mpz2 mpz) ∧ String_value.value_text (effective (BitVec.toInt base)) (C.pelts sp4) (C.offset sp4) = Z.value_of u mpz2))))))))))))))))) else (0 : ℤ) ≤ BitVec.toInt base1 ∧ (∀(o6 : BitVec 64), BitVec.toUInt o6 = BitVec.toInt base1 → ((2 : ℤ) ≤ BitVec.toUInt o6 ∧ BitVec.toUInt o6 ≤ (256 : ℤ)) ∧ (∀(info : BaseInfo.wmpn_base_info), BaseInfo.b info = BitVec.toUInt o6 → (0 : ℤ) ≤ BitVec.toInt un ∧ (∀(o7 : BitVec 32), BitVec.toUInt o7 = BitVec.toInt un → (0 : ℤ) ≤ BitVec.toUInt o7 ∧ (∀(tp : C.ptr (BitVec 64)), C.plength tp = BitVec.toUInt o7 ∧ C.offset tp = (0 : ℤ) ∧ C.min tp = (0 : ℤ) ∧ C.max tp = BitVec.toUInt o7 ∧ C.writable tp = true → (C.valid up (BitVec.toInt un) ∧ C.valid tp (BitVec.toInt un) ∧ C.writable tp = true) ∧ (∀(tp1 : C.ptr (BitVec 64)) (up1 : C.ptr (BitVec 64)), C.offset tp1 = C.offset tp ∧ C.writable tp1 = C.writable tp ∧ C.zone1 tp1 = C.zone1 tp → C.offset up1 = C.offset up ∧ C.writable up1 = C.writable up ∧ C.zone1 up1 = C.zone1 up → Lemmas.map_eq_sub_shift (C.pelts tp1) (C.pelts up) (C.offset tp1) (C.offset up) (BitVec.toInt un) ∧ (∀(j : ℤ), j < C.offset tp1 ∨ C.offset tp1 + BitVec.toInt un ≤ j → C.pelts tp1 j = C.pelts tp j) ∧ (∀(j : ℤ), C.pelts up1 j = C.pelts up j) ∧ (C.min up1 = C.min up ∧ C.max up1 = C.max up ∧ C.plength up1 = C.plength up) ∧ C.min tp1 = C.min tp ∧ C.max tp1 = C.max tp ∧ C.plength tp1 = C.plength tp → int'32_in_bounds (BitVec.toInt sz - BitVec.toInt o4) ∧ (∀(o8 : BitVec 32), BitVec.toInt o8 = BitVec.toInt sz - BitVec.toInt o4 → (C.valid tp1 (BitVec.toInt un) ∧ (1 : ℤ) ≤ BitVec.toInt un ∧ BaseInfo.b info = BitVec.toInt base1 ∧ C.writable tp1 = true ∧ C.writable uspi = true ∧ (0 : ℤ) < BitVec.toUInt (C.pelts tp1 (C.offset tp1 + BitVec.toInt un - (1 : ℤ))) ∧ (0 : ℤ) < BitVec.toInt o8 ∧ C.valid uspi (BitVec.toInt o8) ∧ Lemmas.value tp1 (BitVec.toInt un) < HPow.hPow (BitVec.toInt base1) (Int.toNat (BitVec.toInt o8 - (1 : ℤ)))) ∧ (∀(uspi1 : C.ptr (BitVec 8)) (usp1 : C.ptr (BitVec 8)), C.data uspi1 = C.data usp1 ∧ List.length (C.data usp1) = List.length (C.data uspi) ∧ C.offset uspi1 = C.offset uspi ∧ C.min uspi1 = C.min uspi ∧ C.max uspi1 = C.max uspi ∧ C.writable uspi1 = C.writable uspi ∧ C.zone1 uspi1 = C.zone1 uspi → List.length (C.data usp1) = List.length (C.data usp) ∧ C.offset usp1 = C.offset usp ∧ C.min usp1 = C.min usp ∧ C.max usp1 = C.max usp ∧ C.writable usp1 = C.writable usp ∧ C.zone1 usp1 = C.zone1 usp → (∀(g : BitVec 32), ((0 : ℤ) ≤ BitVec.toUInt g ∧ BitVec.toUInt g < BitVec.toInt o8) ∧ String_lemmas.svalue (BitVec.toInt base1) uspi1 (BitVec.toUInt g) = Lemmas.value tp1 (BitVec.toInt un) ∧ String_lemmas.in_base (BitVec.toInt base1) (C.pelts uspi1) (C.offset uspi1) (C.offset uspi1 + BitVec.toUInt g) ∧ (0 : ℤ) < BitVec.toInt (C.pelts uspi1 (C.offset uspi1)) ∧ (∀(j : ℤ), j < C.offset uspi1 ∨ C.offset uspi1 + BitVec.toInt o8 ≤ j → C.pelts uspi1 j = C.pelts uspi j) → BitVec.toUInt g ≤ (2147483647 : ℤ) ∧ (∀(o9 : BitVec 32), BitVec.toInt o9 = BitVec.toUInt g → int'32_in_bounds (BitVec.toInt o4 + BitVec.toInt o9) ∧ (∀(o10 : BitVec 32), BitVec.toInt o10 = BitVec.toInt o4 + BitVec.toInt o9 → (UChar.ok mem = true ∧ UChar.z mem = C.zone1 sp2 ∧ UChar.mi mem = C.min usp1 ∧ UChar.ma mem = C.max usp1 ∧ C.offset sp2 = C.offset usp1 ∧ C.plength usp1 = UChar.l mem) ∧ (∀(mem1 : UChar.cast_mem) (sp3 : C.ptr (BitVec 8)), UChar.mi mem1 = UChar.mi mem ∧ UChar.ma mem1 = UChar.ma mem ∧ UChar.z mem1 = UChar.z mem ∧ UChar.l mem1 = UChar.l mem → C.offset sp3 = C.offset sp2 ∧ C.writable sp3 = C.writable sp2 ∧ C.zone1 sp3 = C.zone1 sp2 → (C.min sp3 = UChar.mi mem1 ∧ C.max sp3 = UChar.ma mem1) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < C.plength sp3 → C.pelts sp3 i = C.pelts usp1 i) ∧ C.plength sp3 = C.plength usp1 → int'32_in_bounds (BitVec.toInt o10 - (1 : ℤ)) ∧ (∀(o11 : BitVec 32), BitVec.toInt o11 = BitVec.toInt o10 - (1 : ℤ) → (BitVec.toInt o4 ≤ BitVec.toInt o11 + (1 : ℤ) → ((BitVec.toInt o4 ≤ BitVec.toInt o4 ∧ BitVec.toInt o4 ≤ BitVec.toInt o10) ∧ ((0 : ℤ) ≤ BitVec.toInt base ∧ BitVec.toInt base ≤ (36 : ℤ) → Conversions.to_lowercase_text (C.pelts usp1) (C.pelts sp3) (C.offset sp3) (C.offset sp3 + BitVec.toInt o4)) ∧ ((36 : ℤ) < BitVec.toInt base → Conversions.to_bothcase_text (C.pelts usp1) (C.pelts sp3) (C.offset sp3) (C.offset sp3 + BitVec.toInt o4)) ∧ (BitVec.toInt base < (0 : ℤ) → Conversions.to_uppercase_text (C.pelts usp1) (C.pelts sp3) (C.offset sp3) (C.offset sp3 + BitVec.toInt o4)) ∧ String_value.abs_value_sub_text (BitVec.toInt base1) (C.pelts sp3) (C.offset sp3 + BitVec.toInt o4) (C.offset sp3 + BitVec.toInt o4) = String_lemmas.svalue_sub (BitVec.toInt base1) (C.pelts usp1) (C.offset usp1 + BitVec.toInt o4) (C.offset usp1 + BitVec.toInt o4) ∧ (∀(k : ℤ), C.offset sp3 ≤ k ∧ k < C.offset sp3 + BitVec.toInt o4 → ¬BitVec.toInt (C.pelts sp3 k) = (0 : ℤ)) ∧ String_value.text_in_base (BitVec.toInt base1) (C.pelts sp3) (C.offset sp3 + BitVec.toInt o4) (C.offset sp3 + BitVec.toInt o4) ∧ (BitVec.toInt o4 = (1 : ℤ) → C.pelts sp3 (C.offset sp3) = ([45] : List (BitVec 8))[(0 : ℕ)]!) ∧ (BitVec.toInt o4 = (0 : ℤ) → BitVec.toInt o4 < BitVec.toInt o4 → ¬C.pelts sp3 (C.offset sp3) = ([45] : List (BitVec 8))[(0 : ℕ)]!)) ∧ (∀(sp4 : C.ptr (BitVec 8)), List.length (C.data sp4) = List.length (C.data sp3) ∧ C.offset sp4 = C.offset sp3 ∧ C.min sp4 = C.min sp3 ∧ C.max sp4 = C.max sp3 ∧ C.writable sp4 = C.writable sp3 ∧ C.zone1 sp4 = C.zone1 sp3 → (∀(j : BitVec 32), let j1 : ℤ := BitVec.toInt j; (BitVec.toInt o4 ≤ j1 ∧ j1 ≤ BitVec.toInt o11) ∧ (BitVec.toInt o4 ≤ j1 ∧ j1 ≤ BitVec.toInt o10) ∧ (∀(k : ℤ), C.offset sp4 + j1 ≤ C.offset sp4 + k ∧ C.offset sp4 + k < C.offset sp4 + BitVec.toInt o10 → C.pelts sp4 (C.offset sp4 + k) = C.pelts sp3 (C.offset sp4 + k)) ∧ ((0 : ℤ) ≤ BitVec.toInt base ∧ BitVec.toInt base ≤ (36 : ℤ) → Conversions.to_lowercase_text (C.pelts usp1) (C.pelts sp4) (C.offset sp4) (C.offset sp4 + j1)) ∧ ((36 : ℤ) < BitVec.toInt base → Conversions.to_bothcase_text (C.pelts usp1) (C.pelts sp4) (C.offset sp4) (C.offset sp4 + j1)) ∧ (BitVec.toInt base < (0 : ℤ) → Conversions.to_uppercase_text (C.pelts usp1) (C.pelts sp4) (C.offset sp4) (C.offset sp4 + j1)) ∧ String_value.abs_value_sub_text (BitVec.toInt base1) (C.pelts sp4) (C.offset sp4 + BitVec.toInt o4) (C.offset sp4 + j1) = String_lemmas.svalue_sub (BitVec.toInt base1) (C.pelts usp1) (C.offset usp1 + BitVec.toInt o4) (C.offset usp1 + j1) ∧ (∀(k : ℤ), C.offset sp4 ≤ k ∧ k < C.offset sp4 + j1 → ¬BitVec.toInt (C.pelts sp4 k) = (0 : ℤ)) ∧ String_value.text_in_base (BitVec.toInt base1) (C.pelts sp4) (C.offset sp4 + BitVec.toInt o4) (C.offset sp4 + j1) ∧ (BitVec.toInt o4 = (1 : ℤ) → C.pelts sp4 (C.offset sp4) = ([45] : List (BitVec 8))[(0 : ℕ)]!) ∧ (BitVec.toInt o4 = (0 : ℤ) → BitVec.toInt o4 < j1 → ¬C.pelts sp4 (C.offset sp4) = ([45] : List (BitVec 8))[(0 : ℕ)]!) → (C.min sp4 ≤ C.offset sp4 + BitVec.toInt j ∧ C.offset sp4 + BitVec.toInt j < C.max sp4) ∧ (let o12 : BitVec 8 := C.pelts sp4 (C.offset sp4 + BitVec.toInt j); let cj : BitVec 8 := o12; ((0 : ℤ) ≤ BitVec.toInt o12 ∧ BitVec.toInt o12 ≤ (127 : ℤ) → BitVec.toInt cj = BitVec.toInt o12) → (∀(o13 : BitVec 32), BitVec.toInt o13 = BitVec.toInt cj → ((0 : ℤ) ≤ BitVec.toInt o13 ∧ BitVec.toInt o13 ≤ Int.ofNat (List.length digits)) ∧ (∀(dc : BitVec 8), ((0 : ℤ) ≤ BitVec.toInt o13 ∧ BitVec.toInt o13 < Int.ofNat (List.length digits) → dc = digits[Int.toNat (BitVec.toInt o13)]!) ∧ (BitVec.toInt o13 = Int.ofNat (List.length digits) → dc = BitVec.ofNat 8 (0 : ℕ)) → ((C.min sp4 ≤ C.offset sp4 + BitVec.toInt j ∧ C.offset sp4 + BitVec.toInt j < C.max sp4) ∧ C.writable sp4 = true) ∧ (∀(sp5 : C.ptr (BitVec 8)), List.length (C.data sp5) = List.length (C.data sp4) ∧ C.offset sp5 = C.offset sp4 ∧ C.min sp5 = C.min sp4 ∧ C.max sp5 = C.max sp4 ∧ C.writable sp5 = C.writable sp4 ∧ C.zone1 sp5 = C.zone1 sp4 → C.pelts sp5 = Function.update (C.pelts sp4) (C.offset sp5 + BitVec.toInt j) dc ∧ C.pelts sp5 (C.offset sp5 + BitVec.toInt j) = dc → (BitVec.toInt o4 ≤ j1 + (1 : ℤ) ∧ j1 + (1 : ℤ) ≤ BitVec.toInt o10) ∧ (∀(k : ℤ), C.offset sp5 + (j1 + (1 : ℤ)) ≤ C.offset sp5 + k ∧ C.offset sp5 + k < C.offset sp5 + BitVec.toInt o10 → C.pelts sp5 (C.offset sp5 + k) = C.pelts sp3 (C.offset sp5 + k)) ∧ ((0 : ℤ) ≤ BitVec.toInt base ∧ BitVec.toInt base ≤ (36 : ℤ) → Conversions.to_lowercase_text (C.pelts usp1) (C.pelts sp5) (C.offset sp5) (C.offset sp5 + (j1 + (1 : ℤ)))) ∧ ((36 : ℤ) < BitVec.toInt base → Conversions.to_bothcase_text (C.pelts usp1) (C.pelts sp5) (C.offset sp5) (C.offset sp5 + (j1 + (1 : ℤ)))) ∧ (BitVec.toInt base < (0 : ℤ) → Conversions.to_uppercase_text (C.pelts usp1) (C.pelts sp5) (C.offset sp5) (C.offset sp5 + (j1 + (1 : ℤ)))) ∧ String_value.abs_value_sub_text (BitVec.toInt base1) (C.pelts sp5) (C.offset sp5 + BitVec.toInt o4) (C.offset sp5 + (j1 + (1 : ℤ))) = String_lemmas.svalue_sub (BitVec.toInt base1) (C.pelts usp1) (C.offset usp1 + BitVec.toInt o4) (C.offset usp1 + (j1 + (1 : ℤ))) ∧ (∀(k : ℤ), C.offset sp5 ≤ k ∧ k < C.offset sp5 + (j1 + (1 : ℤ)) → ¬BitVec.toInt (C.pelts sp5 k) = (0 : ℤ)) ∧ String_value.text_in_base (BitVec.toInt base1) (C.pelts sp5) (C.offset sp5 + BitVec.toInt o4) (C.offset sp5 + (j1 + (1 : ℤ))) ∧ (BitVec.toInt o4 = (1 : ℤ) → C.pelts sp5 (C.offset sp5) = ([45] : List (BitVec 8))[(0 : ℕ)]!) ∧ (BitVec.toInt o4 = (0 : ℤ) → BitVec.toInt o4 < j1 + (1 : ℤ) → ¬C.pelts sp5 (C.offset sp5) = ([45] : List (BitVec 8))[(0 : ℕ)]!)))))) ∧ ((BitVec.toInt o4 ≤ BitVec.toInt o11 + (1 : ℤ) ∧ BitVec.toInt o11 + (1 : ℤ) ≤ BitVec.toInt o10) ∧ (∀(k : ℤ), C.offset sp4 + (BitVec.toInt o11 + (1 : ℤ)) ≤ C.offset sp4 + k ∧ C.offset sp4 + k < C.offset sp4 + BitVec.toInt o10 → C.pelts sp4 (C.offset sp4 + k) = C.pelts sp3 (C.offset sp4 + k)) ∧ ((0 : ℤ) ≤ BitVec.toInt base ∧ BitVec.toInt base ≤ (36 : ℤ) → Conversions.to_lowercase_text (C.pelts usp1) (C.pelts sp4) (C.offset sp4) (C.offset sp4 + (BitVec.toInt o11 + (1 : ℤ)))) ∧ ((36 : ℤ) < BitVec.toInt base → Conversions.to_bothcase_text (C.pelts usp1) (C.pelts sp4) (C.offset sp4) (C.offset sp4 + (BitVec.toInt o11 + (1 : ℤ)))) ∧ (BitVec.toInt base < (0 : ℤ) → Conversions.to_uppercase_text (C.pelts usp1) (C.pelts sp4) (C.offset sp4) (C.offset sp4 + (BitVec.toInt o11 + (1 : ℤ)))) ∧ String_value.abs_value_sub_text (BitVec.toInt base1) (C.pelts sp4) (C.offset sp4 + BitVec.toInt o4) (C.offset sp4 + (BitVec.toInt o11 + (1 : ℤ))) = String_lemmas.svalue_sub (BitVec.toInt base1) (C.pelts usp1) (C.offset usp1 + BitVec.toInt o4) (C.offset usp1 + (BitVec.toInt o11 + (1 : ℤ))) ∧ (∀(k : ℤ), C.offset sp4 ≤ k ∧ k < C.offset sp4 + (BitVec.toInt o11 + (1 : ℤ)) → ¬BitVec.toInt (C.pelts sp4 k) = (0 : ℤ)) ∧ String_value.text_in_base (BitVec.toInt base1) (C.pelts sp4) (C.offset sp4 + BitVec.toInt o4) (C.offset sp4 + (BitVec.toInt o11 + (1 : ℤ))) ∧ (BitVec.toInt o4 = (1 : ℤ) → C.pelts sp4 (C.offset sp4) = ([45] : List (BitVec 8))[(0 : ℕ)]!) ∧ (BitVec.toInt o4 = (0 : ℤ) → BitVec.toInt o4 < BitVec.toInt o11 + (1 : ℤ) → ¬C.pelts sp4 (C.offset sp4) = ([45] : List (BitVec 8))[(0 : ℕ)]!) → (let o12 : BitVec 8 := String.zero_char; ((C.min sp4 ≤ C.offset sp4 + BitVec.toInt o10 ∧ C.offset sp4 + BitVec.toInt o10 < C.max sp4) ∧ C.writable sp4 = true) ∧ (∀(sp5 : C.ptr (BitVec 8)), List.length (C.data sp5) = List.length (C.data sp4) ∧ C.offset sp5 = C.offset sp4 ∧ C.min sp5 = C.min sp4 ∧ C.max sp5 = C.max sp4 ∧ C.writable sp5 = C.writable sp4 ∧ C.zone1 sp5 = C.zone1 sp4 → C.pelts sp5 = Function.update (C.pelts sp4) (C.offset sp5 + BitVec.toInt o10) o12 ∧ C.pelts sp5 (C.offset sp5 + BitVec.toInt o10) = o12 → (Z.zones mpz1 u = C.zone1 up1 ∧ (1 : ℤ) ≤ Z.readers mpz1 u ∧ C.min up1 = (0 : ℤ) ∧ C.max up1 = C.plength up1) ∧ (∀(mpz2 : Z.mpz_memo), Z.abs_value_of mpz2 = Z.abs_value_of mpz1 ∧ Z.alloc mpz2 = Z.alloc mpz1 ∧ Z.abs_size mpz2 = Z.abs_size mpz1 ∧ Z.sgn mpz2 = Z.sgn mpz1 ∧ Z.zones mpz2 = Z.zones mpz1 → Z.readers mpz2 u = Z.readers mpz1 u - (1 : ℤ) ∧ (∀(y : Z.mpz_ptr), ¬y = u → Z.readers mpz2 y = Z.readers mpz1 y) → String.valid_string sp5 ∧ String_value.string_in_base (effective (BitVec.toInt base)) (C.pelts sp5) (C.offset sp5) ∧ (∀(x : Z.mpz_ptr), Z.mpz_unchanged x mpz2 mpz) ∧ String_value.value_text (effective (BitVec.toInt base)) (C.pelts sp5) (C.offset sp5) = Z.value_of u mpz2)))))) ∧ (BitVec.toInt o11 + (1 : ℤ) < BitVec.toInt o4 → (let o12 : BitVec 8 := String.zero_char; ((C.min sp3 ≤ C.offset sp3 + BitVec.toInt o10 ∧ C.offset sp3 + BitVec.toInt o10 < C.max sp3) ∧ C.writable sp3 = true) ∧ (∀(sp4 : C.ptr (BitVec 8)), List.length (C.data sp4) = List.length (C.data sp3) ∧ C.offset sp4 = C.offset sp3 ∧ C.min sp4 = C.min sp3 ∧ C.max sp4 = C.max sp3 ∧ C.writable sp4 = C.writable sp3 ∧ C.zone1 sp4 = C.zone1 sp3 → C.pelts sp4 = Function.update (C.pelts sp3) (C.offset sp4 + BitVec.toInt o10) o12 ∧ C.pelts sp4 (C.offset sp4 + BitVec.toInt o10) = o12 → (Z.zones mpz1 u = C.zone1 up1 ∧ (1 : ℤ) ≤ Z.readers mpz1 u ∧ C.min up1 = (0 : ℤ) ∧ C.max up1 = C.plength up1) ∧ (∀(mpz2 : Z.mpz_memo), Z.abs_value_of mpz2 = Z.abs_value_of mpz1 ∧ Z.alloc mpz2 = Z.alloc mpz1 ∧ Z.abs_size mpz2 = Z.abs_size mpz1 ∧ Z.sgn mpz2 = Z.sgn mpz1 ∧ Z.zones mpz2 = Z.zones mpz1 → Z.readers mpz2 u = Z.readers mpz1 u - (1 : ℤ) ∧ (∀(y : Z.mpz_ptr), ¬y = u → Z.readers mpz2 y = Z.readers mpz1 y) → String.valid_string sp4 ∧ String_value.string_in_base (effective (BitVec.toInt base)) (C.pelts sp4) (C.offset sp4) ∧ (∀(x : Z.mpz_ptr), Z.mpz_unchanged x mpz2 mpz) ∧ String_value.value_text (effective (BitVec.toInt base)) (C.pelts sp4) (C.offset sp4) = Z.value_of u mpz2)))))))))))))))))))))))))) else (0 : ℤ) ≤ BitVec.toInt base1 ∧ (∀(o3 : BitVec 64), BitVec.toUInt o3 = BitVec.toInt base1 → ((2 : ℤ) ≤ BitVec.toUInt o3 ∧ BitVec.toUInt o3 ≤ (256 : ℤ)) ∧ (∀(bits : BitVec 32), ((0 : ℤ) ≤ BitVec.toUInt bits ∧ BitVec.toUInt bits ≤ (8 : ℤ)) ∧ (¬BitVec.toUInt bits = (0 : ℤ) → HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt bits)) = BitVec.toUInt o3) ∧ (BitVec.toUInt bits = (0 : ℤ) → (∀(n : ℤ), (0 : ℤ) ≤ n → ¬HPow.hPow (2 : ℤ) (Int.toNat n) = BitVec.toUInt o3)) → (0 : ℤ) ≤ Z.readers mpz u ∧ (∀(mpz1 : Z.mpz_memo), Z.abs_value_of mpz1 = Z.abs_value_of mpz ∧ Z.alloc mpz1 = Z.alloc mpz ∧ Z.abs_size mpz1 = Z.abs_size mpz ∧ Z.sgn mpz1 = Z.sgn mpz ∧ Z.zones mpz1 = Z.zones mpz → (∀(up : C.ptr (BitVec 64)), Z.readers mpz1 u = Z.readers mpz u + (1 : ℤ) ∧ (∀(y : Z.mpz_ptr), ¬u = y → Z.readers mpz1 y = Z.readers mpz y) ∧ Lemmas.value up (Z.abs_size mpz1 u) = Z.abs_value_of mpz1 u ∧ C.plength up = Z.alloc mpz1 u ∧ C.offset up = (0 : ℤ) ∧ C.min up = (0 : ℤ) ∧ C.max up = C.plength up ∧ C.zone1 up = Z.zones mpz1 u → C.writable sp = true ∧ (∀(sp1 : C.ptr (BitVec 8)), C.offset sp1 = C.offset sp ∧ C.writable sp1 = C.writable sp ∧ C.zone1 sp1 = C.zone1 sp → (∀(usp : C.ptr (BitVec 8)) (mem : UChar.cast_mem), (C.min usp = C.min sp ∧ C.min sp = UChar.mi mem) ∧ (C.max usp = C.max sp ∧ C.max sp = UChar.ma mem) ∧ C.zone1 sp = UChar.z mem ∧ (C.plength usp = C.plength sp ∧ C.plength sp = UChar.l mem) ∧ UChar.ok mem = true ∧ C.offset usp = C.offset sp ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < C.plength sp → C.pelts usp i = C.pelts sp i) ∧ C.writable usp = true → (C.min usp ≤ C.offset usp + (0 : ℤ) ∧ C.offset usp + (0 : ℤ) ≤ C.max usp) ∧ (∀(uspi : C.ptr (BitVec 8)), C.offset uspi = C.offset usp + (0 : ℤ) ∧ C.plength uspi = C.plength usp ∧ C.pelts uspi = C.pelts usp ∧ C.data uspi = C.data usp ∧ C.min uspi = C.min usp ∧ C.max uspi = C.max usp ∧ C.zone1 uspi = C.zone1 usp ∧ C.writable uspi = C.writable usp → (BitVec.toUInt bits = (0 : ℤ) → bits = (0 : BitVec 32)) → (if ¬bits = (0 : BitVec 32) then int'32_in_bounds (BitVec.toInt un - (1 : ℤ)) ∧ (∀(o4 : BitVec 32), BitVec.toInt o4 = BitVec.toInt un - (1 : ℤ) → (C.min up ≤ C.offset up + BitVec.toInt o4 ∧ C.offset up + BitVec.toInt o4 < C.max up) ∧ (let um : BitVec 64 := C.pelts up (C.offset up + BitVec.toInt o4); (0 : ℤ) < BitVec.toUInt um ∧ (∀(sb : BitVec 64), ((1 : ℤ) ≤ BitVec.toUInt sb ∧ BitVec.toUInt sb ≤ (64 : ℤ)) ∧ HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt sb - (1 : ℤ))) ≤ BitVec.toUInt um ∧ BitVec.toUInt um < HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt sb)) → BitVec.toUInt sb ≤ (2147483647 : ℤ) ∧ (∀(o5 : BitVec 32), BitVec.toInt o5 = BitVec.toUInt sb → int'32_in_bounds (BitVec.toInt un - (1 : ℤ)) ∧ (∀(o6 : BitVec 32), BitVec.toInt o6 = BitVec.toInt un - (1 : ℤ) → int'32_in_bounds ((64 : ℤ) * BitVec.toInt o6) ∧ (∀(o7 : BitVec 32), BitVec.toInt o7 = (64 : ℤ) * BitVec.toInt o6 → int'32_in_bounds (BitVec.toInt o7 + BitVec.toInt o5) ∧ (∀(ub : BitVec 32), BitVec.toInt ub = BitVec.toInt o7 + BitVec.toInt o5 → ((1 : ℤ) ≤ BitVec.toInt un ∧ C.valid up (BitVec.toInt un) ∧ ((1 : ℤ) ≤ BitVec.toUInt bits ∧ BitVec.toUInt bits ≤ (8 : ℤ)) ∧ C.valid uspi ((BitVec.toInt ub + BitVec.toUInt bits - (1 : ℤ)) / BitVec.toUInt bits) ∧ (0 : ℤ) ≤ BitVec.toInt ub ∧ Lemmas.value up (BitVec.toInt un) < HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toInt ub)) ∧ (0 : ℤ) < BitVec.toUInt (C.pelts up (C.offset up + BitVec.toInt un - (1 : ℤ))) ∧ (64 : ℤ) * BitVec.toInt un + (7 : ℤ) ≤ (2147483647 : ℤ) ∧ C.writable uspi = true) ∧ (∀(uspi1 : C.ptr (BitVec 8)) (usp1 : C.ptr (BitVec 8)), C.data uspi1 = C.data usp1 ∧ List.length (C.data usp1) = List.length (C.data uspi) ∧ C.offset uspi1 = C.offset uspi ∧ C.min uspi1 = C.min uspi ∧ C.max uspi1 = C.max uspi ∧ C.writable uspi1 = C.writable uspi ∧ C.zone1 uspi1 = C.zone1 uspi → List.length (C.data usp1) = List.length (C.data usp) ∧ C.offset usp1 = C.offset usp ∧ C.min usp1 = C.min usp ∧ C.max usp1 = C.max usp ∧ C.writable usp1 = C.writable usp ∧ C.zone1 usp1 = C.zone1 usp → (∀(g : BitVec 32), String_lemmas.in_base (HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt bits))) (C.pelts uspi1) (C.offset uspi1) (C.offset uspi1 + BitVec.toUInt g) ∧ String_lemmas.svalue (HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt bits))) uspi1 (BitVec.toUInt g) = Lemmas.value up (BitVec.toInt un) ∧ ((0 : ℤ) < BitVec.toUInt g ∧ BitVec.toUInt g ≤ (BitVec.toInt ub + BitVec.toUInt bits - (1 : ℤ)) / BitVec.toUInt bits) ∧ (0 : ℤ) < BitVec.toInt (C.pelts uspi1 (C.offset uspi1)) ∧ (∀(j : ℤ), j < C.offset uspi1 ∨ C.offset uspi1 + (BitVec.toInt ub + BitVec.toUInt bits - (1 : ℤ)) / BitVec.toUInt bits ≤ j → C.pelts uspi1 j = C.pelts uspi j) → BitVec.toUInt g ≤ (2147483647 : ℤ) ∧ (∀(o8 : BitVec 32), BitVec.toInt o8 = BitVec.toUInt g → int'32_in_bounds ((0 : ℤ) + BitVec.toInt o8) ∧ (∀(o9 : BitVec 32), BitVec.toInt o9 = (0 : ℤ) + BitVec.toInt o8 → (UChar.ok mem = true ∧ UChar.z mem = C.zone1 sp1 ∧ UChar.mi mem = C.min usp1 ∧ UChar.ma mem = C.max usp1 ∧ C.offset sp1 = C.offset usp1 ∧ C.plength usp1 = UChar.l mem) ∧ (∀(mem1 : UChar.cast_mem) (sp2 : C.ptr (BitVec 8)), UChar.mi mem1 = UChar.mi mem ∧ UChar.ma mem1 = UChar.ma mem ∧ UChar.z mem1 = UChar.z mem ∧ UChar.l mem1 = UChar.l mem → C.offset sp2 = C.offset sp1 ∧ C.writable sp2 = C.writable sp1 ∧ C.zone1 sp2 = C.zone1 sp1 → (C.min sp2 = UChar.mi mem1 ∧ C.max sp2 = UChar.ma mem1) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < C.plength sp2 → C.pelts sp2 i = C.pelts usp1 i) ∧ C.plength sp2 = C.plength usp1 → int'32_in_bounds (BitVec.toInt o9 - (1 : ℤ)) ∧ (∀(o10 : BitVec 32), BitVec.toInt o10 = BitVec.toInt o9 - (1 : ℤ) → ((0 : ℤ) ≤ BitVec.toInt o10 + (1 : ℤ) → (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ BitVec.toInt o9) ∧ ((0 : ℤ) ≤ BitVec.toInt base ∧ BitVec.toInt base ≤ (36 : ℤ) → Conversions.to_lowercase_text (C.pelts usp1) (C.pelts sp2) (C.offset sp2) (C.offset sp2 + (0 : ℤ))) ∧ ((36 : ℤ) < BitVec.toInt base → Conversions.to_bothcase_text (C.pelts usp1) (C.pelts sp2) (C.offset sp2) (C.offset sp2 + (0 : ℤ))) ∧ (BitVec.toInt base < (0 : ℤ) → Conversions.to_uppercase_text (C.pelts usp1) (C.pelts sp2) (C.offset sp2) (C.offset sp2 + (0 : ℤ))) ∧ String_value.abs_value_sub_text (BitVec.toInt base1) (C.pelts sp2) (C.offset sp2 + (0 : ℤ)) (C.offset sp2 + (0 : ℤ)) = String_lemmas.svalue_sub (BitVec.toInt base1) (C.pelts usp1) (C.offset usp1 + (0 : ℤ)) (C.offset usp1 + (0 : ℤ)) ∧ (∀(k : ℤ), C.offset sp2 ≤ k ∧ k < C.offset sp2 + (0 : ℤ) → ¬BitVec.toInt (C.pelts sp2 k) = (0 : ℤ)) ∧ String_value.text_in_base (BitVec.toInt base1) (C.pelts sp2) (C.offset sp2 + (0 : ℤ)) (C.offset sp2 + (0 : ℤ)) ∧ ((0 : ℤ) = (1 : ℤ) → C.pelts sp2 (C.offset sp2) = ([45] : List (BitVec 8))[(0 : ℕ)]!) ∧ ((0 : ℤ) < (0 : ℤ) → ¬C.pelts sp2 (C.offset sp2) = ([45] : List (BitVec 8))[(0 : ℕ)]!)) ∧ (∀(sp3 : C.ptr (BitVec 8)), List.length (C.data sp3) = List.length (C.data sp2) ∧ C.offset sp3 = C.offset sp2 ∧ C.min sp3 = C.min sp2 ∧ C.max sp3 = C.max sp2 ∧ C.writable sp3 = C.writable sp2 ∧ C.zone1 sp3 = C.zone1 sp2 → (∀(j : BitVec 32), let j1 : ℤ := BitVec.toInt j; ((0 : ℤ) ≤ j1 ∧ j1 ≤ BitVec.toInt o10) ∧ ((0 : ℤ) ≤ j1 ∧ j1 ≤ BitVec.toInt o9) ∧ (∀(k : ℤ), C.offset sp3 + j1 ≤ C.offset sp3 + k ∧ C.offset sp3 + k < C.offset sp3 + BitVec.toInt o9 → C.pelts sp3 (C.offset sp3 + k) = C.pelts sp2 (C.offset sp3 + k)) ∧ ((0 : ℤ) ≤ BitVec.toInt base ∧ BitVec.toInt base ≤ (36 : ℤ) → Conversions.to_lowercase_text (C.pelts usp1) (C.pelts sp3) (C.offset sp3) (C.offset sp3 + j1)) ∧ ((36 : ℤ) < BitVec.toInt base → Conversions.to_bothcase_text (C.pelts usp1) (C.pelts sp3) (C.offset sp3) (C.offset sp3 + j1)) ∧ (BitVec.toInt base < (0 : ℤ) → Conversions.to_uppercase_text (C.pelts usp1) (C.pelts sp3) (C.offset sp3) (C.offset sp3 + j1)) ∧ String_value.abs_value_sub_text (BitVec.toInt base1) (C.pelts sp3) (C.offset sp3 + (0 : ℤ)) (C.offset sp3 + j1) = String_lemmas.svalue_sub (BitVec.toInt base1) (C.pelts usp1) (C.offset usp1 + (0 : ℤ)) (C.offset usp1 + j1) ∧ (∀(k : ℤ), C.offset sp3 ≤ k ∧ k < C.offset sp3 + j1 → ¬BitVec.toInt (C.pelts sp3 k) = (0 : ℤ)) ∧ String_value.text_in_base (BitVec.toInt base1) (C.pelts sp3) (C.offset sp3 + (0 : ℤ)) (C.offset sp3 + j1) ∧ ((0 : ℤ) = (1 : ℤ) → C.pelts sp3 (C.offset sp3) = ([45] : List (BitVec 8))[(0 : ℕ)]!) ∧ ((0 : ℤ) < j1 → ¬C.pelts sp3 (C.offset sp3) = ([45] : List (BitVec 8))[(0 : ℕ)]!) → (C.min sp3 ≤ C.offset sp3 + BitVec.toInt j ∧ C.offset sp3 + BitVec.toInt j < C.max sp3) ∧ (let o11 : BitVec 8 := C.pelts sp3 (C.offset sp3 + BitVec.toInt j); let cj : BitVec 8 := o11; ((0 : ℤ) ≤ BitVec.toInt o11 ∧ BitVec.toInt o11 ≤ (127 : ℤ) → BitVec.toInt cj = BitVec.toInt o11) → (∀(o12 : BitVec 32), BitVec.toInt o12 = BitVec.toInt cj → ((0 : ℤ) ≤ BitVec.toInt o12 ∧ BitVec.toInt o12 ≤ Int.ofNat (List.length digits)) ∧ (∀(dc : BitVec 8), ((0 : ℤ) ≤ BitVec.toInt o12 ∧ BitVec.toInt o12 < Int.ofNat (List.length digits) → dc = digits[Int.toNat (BitVec.toInt o12)]!) ∧ (BitVec.toInt o12 = Int.ofNat (List.length digits) → dc = BitVec.ofNat 8 (0 : ℕ)) → ((C.min sp3 ≤ C.offset sp3 + BitVec.toInt j ∧ C.offset sp3 + BitVec.toInt j < C.max sp3) ∧ C.writable sp3 = true) ∧ (∀(sp4 : C.ptr (BitVec 8)), List.length (C.data sp4) = List.length (C.data sp3) ∧ C.offset sp4 = C.offset sp3 ∧ C.min sp4 = C.min sp3 ∧ C.max sp4 = C.max sp3 ∧ C.writable sp4 = C.writable sp3 ∧ C.zone1 sp4 = C.zone1 sp3 → C.pelts sp4 = Function.update (C.pelts sp3) (C.offset sp4 + BitVec.toInt j) dc ∧ C.pelts sp4 (C.offset sp4 + BitVec.toInt j) = dc → ((0 : ℤ) ≤ j1 + (1 : ℤ) ∧ j1 + (1 : ℤ) ≤ BitVec.toInt o9) ∧ (∀(k : ℤ), C.offset sp4 + (j1 + (1 : ℤ)) ≤ C.offset sp4 + k ∧ C.offset sp4 + k < C.offset sp4 + BitVec.toInt o9 → C.pelts sp4 (C.offset sp4 + k) = C.pelts sp2 (C.offset sp4 + k)) ∧ ((0 : ℤ) ≤ BitVec.toInt base ∧ BitVec.toInt base ≤ (36 : ℤ) → Conversions.to_lowercase_text (C.pelts usp1) (C.pelts sp4) (C.offset sp4) (C.offset sp4 + (j1 + (1 : ℤ)))) ∧ ((36 : ℤ) < BitVec.toInt base → Conversions.to_bothcase_text (C.pelts usp1) (C.pelts sp4) (C.offset sp4) (C.offset sp4 + (j1 + (1 : ℤ)))) ∧ (BitVec.toInt base < (0 : ℤ) → Conversions.to_uppercase_text (C.pelts usp1) (C.pelts sp4) (C.offset sp4) (C.offset sp4 + (j1 + (1 : ℤ)))) ∧ String_value.abs_value_sub_text (BitVec.toInt base1) (C.pelts sp4) (C.offset sp4 + (0 : ℤ)) (C.offset sp4 + (j1 + (1 : ℤ))) = String_lemmas.svalue_sub (BitVec.toInt base1) (C.pelts usp1) (C.offset usp1 + (0 : ℤ)) (C.offset usp1 + (j1 + (1 : ℤ))) ∧ (∀(k : ℤ), C.offset sp4 ≤ k ∧ k < C.offset sp4 + (j1 + (1 : ℤ)) → ¬BitVec.toInt (C.pelts sp4 k) = (0 : ℤ)) ∧ String_value.text_in_base (BitVec.toInt base1) (C.pelts sp4) (C.offset sp4 + (0 : ℤ)) (C.offset sp4 + (j1 + (1 : ℤ))) ∧ ((0 : ℤ) = (1 : ℤ) → C.pelts sp4 (C.offset sp4) = ([45] : List (BitVec 8))[(0 : ℕ)]!) ∧ ((0 : ℤ) < j1 + (1 : ℤ) → ¬C.pelts sp4 (C.offset sp4) = ([45] : List (BitVec 8))[(0 : ℕ)]!)))))) ∧ (((0 : ℤ) ≤ BitVec.toInt o10 + (1 : ℤ) ∧ BitVec.toInt o10 + (1 : ℤ) ≤ BitVec.toInt o9) ∧ (∀(k : ℤ), C.offset sp3 + (BitVec.toInt o10 + (1 : ℤ)) ≤ C.offset sp3 + k ∧ C.offset sp3 + k < C.offset sp3 + BitVec.toInt o9 → C.pelts sp3 (C.offset sp3 + k) = C.pelts sp2 (C.offset sp3 + k)) ∧ ((0 : ℤ) ≤ BitVec.toInt base ∧ BitVec.toInt base ≤ (36 : ℤ) → Conversions.to_lowercase_text (C.pelts usp1) (C.pelts sp3) (C.offset sp3) (C.offset sp3 + (BitVec.toInt o10 + (1 : ℤ)))) ∧ ((36 : ℤ) < BitVec.toInt base → Conversions.to_bothcase_text (C.pelts usp1) (C.pelts sp3) (C.offset sp3) (C.offset sp3 + (BitVec.toInt o10 + (1 : ℤ)))) ∧ (BitVec.toInt base < (0 : ℤ) → Conversions.to_uppercase_text (C.pelts usp1) (C.pelts sp3) (C.offset sp3) (C.offset sp3 + (BitVec.toInt o10 + (1 : ℤ)))) ∧ String_value.abs_value_sub_text (BitVec.toInt base1) (C.pelts sp3) (C.offset sp3 + (0 : ℤ)) (C.offset sp3 + (BitVec.toInt o10 + (1 : ℤ))) = String_lemmas.svalue_sub (BitVec.toInt base1) (C.pelts usp1) (C.offset usp1 + (0 : ℤ)) (C.offset usp1 + (BitVec.toInt o10 + (1 : ℤ))) ∧ (∀(k : ℤ), C.offset sp3 ≤ k ∧ k < C.offset sp3 + (BitVec.toInt o10 + (1 : ℤ)) → ¬BitVec.toInt (C.pelts sp3 k) = (0 : ℤ)) ∧ String_value.text_in_base (BitVec.toInt base1) (C.pelts sp3) (C.offset sp3 + (0 : ℤ)) (C.offset sp3 + (BitVec.toInt o10 + (1 : ℤ))) ∧ ((0 : ℤ) = (1 : ℤ) → C.pelts sp3 (C.offset sp3) = ([45] : List (BitVec 8))[(0 : ℕ)]!) ∧ ((0 : ℤ) < BitVec.toInt o10 + (1 : ℤ) → ¬C.pelts sp3 (C.offset sp3) = ([45] : List (BitVec 8))[(0 : ℕ)]!) → (let o11 : BitVec 8 := String.zero_char; ((C.min sp3 ≤ C.offset sp3 + BitVec.toInt o9 ∧ C.offset sp3 + BitVec.toInt o9 < C.max sp3) ∧ C.writable sp3 = true) ∧ (∀(sp4 : C.ptr (BitVec 8)), List.length (C.data sp4) = List.length (C.data sp3) ∧ C.offset sp4 = C.offset sp3 ∧ C.min sp4 = C.min sp3 ∧ C.max sp4 = C.max sp3 ∧ C.writable sp4 = C.writable sp3 ∧ C.zone1 sp4 = C.zone1 sp3 → C.pelts sp4 = Function.update (C.pelts sp3) (C.offset sp4 + BitVec.toInt o9) o11 ∧ C.pelts sp4 (C.offset sp4 + BitVec.toInt o9) = o11 → (Z.zones mpz1 u = C.zone1 up ∧ (1 : ℤ) ≤ Z.readers mpz1 u ∧ C.min up = (0 : ℤ) ∧ C.max up = C.plength up) ∧ (∀(mpz2 : Z.mpz_memo), Z.abs_value_of mpz2 = Z.abs_value_of mpz1 ∧ Z.alloc mpz2 = Z.alloc mpz1 ∧ Z.abs_size mpz2 = Z.abs_size mpz1 ∧ Z.sgn mpz2 = Z.sgn mpz1 ∧ Z.zones mpz2 = Z.zones mpz1 → Z.readers mpz2 u = Z.readers mpz1 u - (1 : ℤ) ∧ (∀(y : Z.mpz_ptr), ¬y = u → Z.readers mpz2 y = Z.readers mpz1 y) → String.valid_string sp4 ∧ String_value.string_in_base (effective (BitVec.toInt base)) (C.pelts sp4) (C.offset sp4) ∧ (∀(x : Z.mpz_ptr), Z.mpz_unchanged x mpz2 mpz) ∧ String_value.value_text (effective (BitVec.toInt base)) (C.pelts sp4) (C.offset sp4) = Z.value_of u mpz2)))))) ∧ (BitVec.toInt o10 + (1 : ℤ) < (0 : ℤ) → (let o11 : BitVec 8 := String.zero_char; ((C.min sp2 ≤ C.offset sp2 + BitVec.toInt o9 ∧ C.offset sp2 + BitVec.toInt o9 < C.max sp2) ∧ C.writable sp2 = true) ∧ (∀(sp3 : C.ptr (BitVec 8)), List.length (C.data sp3) = List.length (C.data sp2) ∧ C.offset sp3 = C.offset sp2 ∧ C.min sp3 = C.min sp2 ∧ C.max sp3 = C.max sp2 ∧ C.writable sp3 = C.writable sp2 ∧ C.zone1 sp3 = C.zone1 sp2 → C.pelts sp3 = Function.update (C.pelts sp2) (C.offset sp3 + BitVec.toInt o9) o11 ∧ C.pelts sp3 (C.offset sp3 + BitVec.toInt o9) = o11 → (Z.zones mpz1 u = C.zone1 up ∧ (1 : ℤ) ≤ Z.readers mpz1 u ∧ C.min up = (0 : ℤ) ∧ C.max up = C.plength up) ∧ (∀(mpz2 : Z.mpz_memo), Z.abs_value_of mpz2 = Z.abs_value_of mpz1 ∧ Z.alloc mpz2 = Z.alloc mpz1 ∧ Z.abs_size mpz2 = Z.abs_size mpz1 ∧ Z.sgn mpz2 = Z.sgn mpz1 ∧ Z.zones mpz2 = Z.zones mpz1 → Z.readers mpz2 u = Z.readers mpz1 u - (1 : ℤ) ∧ (∀(y : Z.mpz_ptr), ¬y = u → Z.readers mpz2 y = Z.readers mpz1 y) → String.valid_string sp3 ∧ String_value.string_in_base (effective (BitVec.toInt base)) (C.pelts sp3) (C.offset sp3) ∧ (∀(x : Z.mpz_ptr), Z.mpz_unchanged x mpz2 mpz) ∧ String_value.value_text (effective (BitVec.toInt base)) (C.pelts sp3) (C.offset sp3) = Z.value_of u mpz2))))))))))))))))) else (0 : ℤ) ≤ BitVec.toInt base1 ∧ (∀(o4 : BitVec 64), BitVec.toUInt o4 = BitVec.toInt base1 → ((2 : ℤ) ≤ BitVec.toUInt o4 ∧ BitVec.toUInt o4 ≤ (256 : ℤ)) ∧ (∀(info : BaseInfo.wmpn_base_info), BaseInfo.b info = BitVec.toUInt o4 → (0 : ℤ) ≤ BitVec.toInt un ∧ (∀(o5 : BitVec 32), BitVec.toUInt o5 = BitVec.toInt un → (0 : ℤ) ≤ BitVec.toUInt o5 ∧ (∀(tp : C.ptr (BitVec 64)), C.plength tp = BitVec.toUInt o5 ∧ C.offset tp = (0 : ℤ) ∧ C.min tp = (0 : ℤ) ∧ C.max tp = BitVec.toUInt o5 ∧ C.writable tp = true → (C.valid up (BitVec.toInt un) ∧ C.valid tp (BitVec.toInt un) ∧ C.writable tp = true) ∧ (∀(tp1 : C.ptr (BitVec 64)) (up1 : C.ptr (BitVec 64)), C.offset tp1 = C.offset tp ∧ C.writable tp1 = C.writable tp ∧ C.zone1 tp1 = C.zone1 tp → C.offset up1 = C.offset up ∧ C.writable up1 = C.writable up ∧ C.zone1 up1 = C.zone1 up → Lemmas.map_eq_sub_shift (C.pelts tp1) (C.pelts up) (C.offset tp1) (C.offset up) (BitVec.toInt un) ∧ (∀(j : ℤ), j < C.offset tp1 ∨ C.offset tp1 + BitVec.toInt un ≤ j → C.pelts tp1 j = C.pelts tp j) ∧ (∀(j : ℤ), C.pelts up1 j = C.pelts up j) ∧ (C.min up1 = C.min up ∧ C.max up1 = C.max up ∧ C.plength up1 = C.plength up) ∧ C.min tp1 = C.min tp ∧ C.max tp1 = C.max tp ∧ C.plength tp1 = C.plength tp → int'32_in_bounds (BitVec.toInt sz - (0 : ℤ)) ∧ (∀(o6 : BitVec 32), BitVec.toInt o6 = BitVec.toInt sz - (0 : ℤ) → (C.valid tp1 (BitVec.toInt un) ∧ (1 : ℤ) ≤ BitVec.toInt un ∧ BaseInfo.b info = BitVec.toInt base1 ∧ C.writable tp1 = true ∧ C.writable uspi = true ∧ (0 : ℤ) < BitVec.toUInt (C.pelts tp1 (C.offset tp1 + BitVec.toInt un - (1 : ℤ))) ∧ (0 : ℤ) < BitVec.toInt o6 ∧ C.valid uspi (BitVec.toInt o6) ∧ Lemmas.value tp1 (BitVec.toInt un) < HPow.hPow (BitVec.toInt base1) (Int.toNat (BitVec.toInt o6 - (1 : ℤ)))) ∧ (∀(uspi1 : C.ptr (BitVec 8)) (usp1 : C.ptr (BitVec 8)), C.data uspi1 = C.data usp1 ∧ List.length (C.data usp1) = List.length (C.data uspi) ∧ C.offset uspi1 = C.offset uspi ∧ C.min uspi1 = C.min uspi ∧ C.max uspi1 = C.max uspi ∧ C.writable uspi1 = C.writable uspi ∧ C.zone1 uspi1 = C.zone1 uspi → List.length (C.data usp1) = List.length (C.data usp) ∧ C.offset usp1 = C.offset usp ∧ C.min usp1 = C.min usp ∧ C.max usp1 = C.max usp ∧ C.writable usp1 = C.writable usp ∧ C.zone1 usp1 = C.zone1 usp → (∀(g : BitVec 32), ((0 : ℤ) ≤ BitVec.toUInt g ∧ BitVec.toUInt g < BitVec.toInt o6) ∧ String_lemmas.svalue (BitVec.toInt base1) uspi1 (BitVec.toUInt g) = Lemmas.value tp1 (BitVec.toInt un) ∧ String_lemmas.in_base (BitVec.toInt base1) (C.pelts uspi1) (C.offset uspi1) (C.offset uspi1 + BitVec.toUInt g) ∧ (0 : ℤ) < BitVec.toInt (C.pelts uspi1 (C.offset uspi1)) ∧ (∀(j : ℤ), j < C.offset uspi1 ∨ C.offset uspi1 + BitVec.toInt o6 ≤ j → C.pelts uspi1 j = C.pelts uspi j) → BitVec.toUInt g ≤ (2147483647 : ℤ) ∧ (∀(o7 : BitVec 32), BitVec.toInt o7 = BitVec.toUInt g → int'32_in_bounds ((0 : ℤ) + BitVec.toInt o7) ∧ (∀(o8 : BitVec 32), BitVec.toInt o8 = (0 : ℤ) + BitVec.toInt o7 → (UChar.ok mem = true ∧ UChar.z mem = C.zone1 sp1 ∧ UChar.mi mem = C.min usp1 ∧ UChar.ma mem = C.max usp1 ∧ C.offset sp1 = C.offset usp1 ∧ C.plength usp1 = UChar.l mem) ∧ (∀(mem1 : UChar.cast_mem) (sp2 : C.ptr (BitVec 8)), UChar.mi mem1 = UChar.mi mem ∧ UChar.ma mem1 = UChar.ma mem ∧ UChar.z mem1 = UChar.z mem ∧ UChar.l mem1 = UChar.l mem → C.offset sp2 = C.offset sp1 ∧ C.writable sp2 = C.writable sp1 ∧ C.zone1 sp2 = C.zone1 sp1 → (C.min sp2 = UChar.mi mem1 ∧ C.max sp2 = UChar.ma mem1) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < C.plength sp2 → C.pelts sp2 i = C.pelts usp1 i) ∧ C.plength sp2 = C.plength usp1 → int'32_in_bounds (BitVec.toInt o8 - (1 : ℤ)) ∧ (∀(o9 : BitVec 32), BitVec.toInt o9 = BitVec.toInt o8 - (1 : ℤ) → ((0 : ℤ) ≤ BitVec.toInt o9 + (1 : ℤ) → (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ BitVec.toInt o8) ∧ ((0 : ℤ) ≤ BitVec.toInt base ∧ BitVec.toInt base ≤ (36 : ℤ) → Conversions.to_lowercase_text (C.pelts usp1) (C.pelts sp2) (C.offset sp2) (C.offset sp2 + (0 : ℤ))) ∧ ((36 : ℤ) < BitVec.toInt base → Conversions.to_bothcase_text (C.pelts usp1) (C.pelts sp2) (C.offset sp2) (C.offset sp2 + (0 : ℤ))) ∧ (BitVec.toInt base < (0 : ℤ) → Conversions.to_uppercase_text (C.pelts usp1) (C.pelts sp2) (C.offset sp2) (C.offset sp2 + (0 : ℤ))) ∧ String_value.abs_value_sub_text (BitVec.toInt base1) (C.pelts sp2) (C.offset sp2 + (0 : ℤ)) (C.offset sp2 + (0 : ℤ)) = String_lemmas.svalue_sub (BitVec.toInt base1) (C.pelts usp1) (C.offset usp1 + (0 : ℤ)) (C.offset usp1 + (0 : ℤ)) ∧ (∀(k : ℤ), C.offset sp2 ≤ k ∧ k < C.offset sp2 + (0 : ℤ) → ¬BitVec.toInt (C.pelts sp2 k) = (0 : ℤ)) ∧ String_value.text_in_base (BitVec.toInt base1) (C.pelts sp2) (C.offset sp2 + (0 : ℤ)) (C.offset sp2 + (0 : ℤ)) ∧ ((0 : ℤ) = (1 : ℤ) → C.pelts sp2 (C.offset sp2) = ([45] : List (BitVec 8))[(0 : ℕ)]!) ∧ ((0 : ℤ) < (0 : ℤ) → ¬C.pelts sp2 (C.offset sp2) = ([45] : List (BitVec 8))[(0 : ℕ)]!)) ∧ (∀(sp3 : C.ptr (BitVec 8)), List.length (C.data sp3) = List.length (C.data sp2) ∧ C.offset sp3 = C.offset sp2 ∧ C.min sp3 = C.min sp2 ∧ C.max sp3 = C.max sp2 ∧ C.writable sp3 = C.writable sp2 ∧ C.zone1 sp3 = C.zone1 sp2 → (∀(j : BitVec 32), let j1 : ℤ := BitVec.toInt j; ((0 : ℤ) ≤ j1 ∧ j1 ≤ BitVec.toInt o9) ∧ ((0 : ℤ) ≤ j1 ∧ j1 ≤ BitVec.toInt o8) ∧ (∀(k : ℤ), C.offset sp3 + j1 ≤ C.offset sp3 + k ∧ C.offset sp3 + k < C.offset sp3 + BitVec.toInt o8 → C.pelts sp3 (C.offset sp3 + k) = C.pelts sp2 (C.offset sp3 + k)) ∧ ((0 : ℤ) ≤ BitVec.toInt base ∧ BitVec.toInt base ≤ (36 : ℤ) → Conversions.to_lowercase_text (C.pelts usp1) (C.pelts sp3) (C.offset sp3) (C.offset sp3 + j1)) ∧ ((36 : ℤ) < BitVec.toInt base → Conversions.to_bothcase_text (C.pelts usp1) (C.pelts sp3) (C.offset sp3) (C.offset sp3 + j1)) ∧ (BitVec.toInt base < (0 : ℤ) → Conversions.to_uppercase_text (C.pelts usp1) (C.pelts sp3) (C.offset sp3) (C.offset sp3 + j1)) ∧ String_value.abs_value_sub_text (BitVec.toInt base1) (C.pelts sp3) (C.offset sp3 + (0 : ℤ)) (C.offset sp3 + j1) = String_lemmas.svalue_sub (BitVec.toInt base1) (C.pelts usp1) (C.offset usp1 + (0 : ℤ)) (C.offset usp1 + j1) ∧ (∀(k : ℤ), C.offset sp3 ≤ k ∧ k < C.offset sp3 + j1 → ¬BitVec.toInt (C.pelts sp3 k) = (0 : ℤ)) ∧ String_value.text_in_base (BitVec.toInt base1) (C.pelts sp3) (C.offset sp3 + (0 : ℤ)) (C.offset sp3 + j1) ∧ ((0 : ℤ) = (1 : ℤ) → C.pelts sp3 (C.offset sp3) = ([45] : List (BitVec 8))[(0 : ℕ)]!) ∧ ((0 : ℤ) < j1 → ¬C.pelts sp3 (C.offset sp3) = ([45] : List (BitVec 8))[(0 : ℕ)]!) → (C.min sp3 ≤ C.offset sp3 + BitVec.toInt j ∧ C.offset sp3 + BitVec.toInt j < C.max sp3) ∧ (let o10 : BitVec 8 := C.pelts sp3 (C.offset sp3 + BitVec.toInt j); let cj : BitVec 8 := o10; ((0 : ℤ) ≤ BitVec.toInt o10 ∧ BitVec.toInt o10 ≤ (127 : ℤ) → BitVec.toInt cj = BitVec.toInt o10) → (∀(o11 : BitVec 32), BitVec.toInt o11 = BitVec.toInt cj → ((0 : ℤ) ≤ BitVec.toInt o11 ∧ BitVec.toInt o11 ≤ Int.ofNat (List.length digits)) ∧ (∀(dc : BitVec 8), ((0 : ℤ) ≤ BitVec.toInt o11 ∧ BitVec.toInt o11 < Int.ofNat (List.length digits) → dc = digits[Int.toNat (BitVec.toInt o11)]!) ∧ (BitVec.toInt o11 = Int.ofNat (List.length digits) → dc = BitVec.ofNat 8 (0 : ℕ)) → ((C.min sp3 ≤ C.offset sp3 + BitVec.toInt j ∧ C.offset sp3 + BitVec.toInt j < C.max sp3) ∧ C.writable sp3 = true) ∧ (∀(sp4 : C.ptr (BitVec 8)), List.length (C.data sp4) = List.length (C.data sp3) ∧ C.offset sp4 = C.offset sp3 ∧ C.min sp4 = C.min sp3 ∧ C.max sp4 = C.max sp3 ∧ C.writable sp4 = C.writable sp3 ∧ C.zone1 sp4 = C.zone1 sp3 → C.pelts sp4 = Function.update (C.pelts sp3) (C.offset sp4 + BitVec.toInt j) dc ∧ C.pelts sp4 (C.offset sp4 + BitVec.toInt j) = dc → ((0 : ℤ) ≤ j1 + (1 : ℤ) ∧ j1 + (1 : ℤ) ≤ BitVec.toInt o8) ∧ (∀(k : ℤ), C.offset sp4 + (j1 + (1 : ℤ)) ≤ C.offset sp4 + k ∧ C.offset sp4 + k < C.offset sp4 + BitVec.toInt o8 → C.pelts sp4 (C.offset sp4 + k) = C.pelts sp2 (C.offset sp4 + k)) ∧ ((0 : ℤ) ≤ BitVec.toInt base ∧ BitVec.toInt base ≤ (36 : ℤ) → Conversions.to_lowercase_text (C.pelts usp1) (C.pelts sp4) (C.offset sp4) (C.offset sp4 + (j1 + (1 : ℤ)))) ∧ ((36 : ℤ) < BitVec.toInt base → Conversions.to_bothcase_text (C.pelts usp1) (C.pelts sp4) (C.offset sp4) (C.offset sp4 + (j1 + (1 : ℤ)))) ∧ (BitVec.toInt base < (0 : ℤ) → Conversions.to_uppercase_text (C.pelts usp1) (C.pelts sp4) (C.offset sp4) (C.offset sp4 + (j1 + (1 : ℤ)))) ∧ String_value.abs_value_sub_text (BitVec.toInt base1) (C.pelts sp4) (C.offset sp4 + (0 : ℤ)) (C.offset sp4 + (j1 + (1 : ℤ))) = String_lemmas.svalue_sub (BitVec.toInt base1) (C.pelts usp1) (C.offset usp1 + (0 : ℤ)) (C.offset usp1 + (j1 + (1 : ℤ))) ∧ (∀(k : ℤ), C.offset sp4 ≤ k ∧ k < C.offset sp4 + (j1 + (1 : ℤ)) → ¬BitVec.toInt (C.pelts sp4 k) = (0 : ℤ)) ∧ String_value.text_in_base (BitVec.toInt base1) (C.pelts sp4) (C.offset sp4 + (0 : ℤ)) (C.offset sp4 + (j1 + (1 : ℤ))) ∧ ((0 : ℤ) = (1 : ℤ) → C.pelts sp4 (C.offset sp4) = ([45] : List (BitVec 8))[(0 : ℕ)]!) ∧ ((0 : ℤ) < j1 + (1 : ℤ) → ¬C.pelts sp4 (C.offset sp4) = ([45] : List (BitVec 8))[(0 : ℕ)]!)))))) ∧ (((0 : ℤ) ≤ BitVec.toInt o9 + (1 : ℤ) ∧ BitVec.toInt o9 + (1 : ℤ) ≤ BitVec.toInt o8) ∧ (∀(k : ℤ), C.offset sp3 + (BitVec.toInt o9 + (1 : ℤ)) ≤ C.offset sp3 + k ∧ C.offset sp3 + k < C.offset sp3 + BitVec.toInt o8 → C.pelts sp3 (C.offset sp3 + k) = C.pelts sp2 (C.offset sp3 + k)) ∧ ((0 : ℤ) ≤ BitVec.toInt base ∧ BitVec.toInt base ≤ (36 : ℤ) → Conversions.to_lowercase_text (C.pelts usp1) (C.pelts sp3) (C.offset sp3) (C.offset sp3 + (BitVec.toInt o9 + (1 : ℤ)))) ∧ ((36 : ℤ) < BitVec.toInt base → Conversions.to_bothcase_text (C.pelts usp1) (C.pelts sp3) (C.offset sp3) (C.offset sp3 + (BitVec.toInt o9 + (1 : ℤ)))) ∧ (BitVec.toInt base < (0 : ℤ) → Conversions.to_uppercase_text (C.pelts usp1) (C.pelts sp3) (C.offset sp3) (C.offset sp3 + (BitVec.toInt o9 + (1 : ℤ)))) ∧ String_value.abs_value_sub_text (BitVec.toInt base1) (C.pelts sp3) (C.offset sp3 + (0 : ℤ)) (C.offset sp3 + (BitVec.toInt o9 + (1 : ℤ))) = String_lemmas.svalue_sub (BitVec.toInt base1) (C.pelts usp1) (C.offset usp1 + (0 : ℤ)) (C.offset usp1 + (BitVec.toInt o9 + (1 : ℤ))) ∧ (∀(k : ℤ), C.offset sp3 ≤ k ∧ k < C.offset sp3 + (BitVec.toInt o9 + (1 : ℤ)) → ¬BitVec.toInt (C.pelts sp3 k) = (0 : ℤ)) ∧ String_value.text_in_base (BitVec.toInt base1) (C.pelts sp3) (C.offset sp3 + (0 : ℤ)) (C.offset sp3 + (BitVec.toInt o9 + (1 : ℤ))) ∧ ((0 : ℤ) = (1 : ℤ) → C.pelts sp3 (C.offset sp3) = ([45] : List (BitVec 8))[(0 : ℕ)]!) ∧ ((0 : ℤ) < BitVec.toInt o9 + (1 : ℤ) → ¬C.pelts sp3 (C.offset sp3) = ([45] : List (BitVec 8))[(0 : ℕ)]!) → (let o10 : BitVec 8 := String.zero_char; ((C.min sp3 ≤ C.offset sp3 + BitVec.toInt o8 ∧ C.offset sp3 + BitVec.toInt o8 < C.max sp3) ∧ C.writable sp3 = true) ∧ (∀(sp4 : C.ptr (BitVec 8)), List.length (C.data sp4) = List.length (C.data sp3) ∧ C.offset sp4 = C.offset sp3 ∧ C.min sp4 = C.min sp3 ∧ C.max sp4 = C.max sp3 ∧ C.writable sp4 = C.writable sp3 ∧ C.zone1 sp4 = C.zone1 sp3 → C.pelts sp4 = Function.update (C.pelts sp3) (C.offset sp4 + BitVec.toInt o8) o10 ∧ C.pelts sp4 (C.offset sp4 + BitVec.toInt o8) = o10 → (Z.zones mpz1 u = C.zone1 up1 ∧ (1 : ℤ) ≤ Z.readers mpz1 u ∧ C.min up1 = (0 : ℤ) ∧ C.max up1 = C.plength up1) ∧ (∀(mpz2 : Z.mpz_memo), Z.abs_value_of mpz2 = Z.abs_value_of mpz1 ∧ Z.alloc mpz2 = Z.alloc mpz1 ∧ Z.abs_size mpz2 = Z.abs_size mpz1 ∧ Z.sgn mpz2 = Z.sgn mpz1 ∧ Z.zones mpz2 = Z.zones mpz1 → Z.readers mpz2 u = Z.readers mpz1 u - (1 : ℤ) ∧ (∀(y : Z.mpz_ptr), ¬y = u → Z.readers mpz2 y = Z.readers mpz1 y) → String.valid_string sp4 ∧ String_value.string_in_base (effective (BitVec.toInt base)) (C.pelts sp4) (C.offset sp4) ∧ (∀(x : Z.mpz_ptr), Z.mpz_unchanged x mpz2 mpz) ∧ String_value.value_text (effective (BitVec.toInt base)) (C.pelts sp4) (C.offset sp4) = Z.value_of u mpz2)))))) ∧ (BitVec.toInt o9 + (1 : ℤ) < (0 : ℤ) → (let o10 : BitVec 8 := String.zero_char; ((C.min sp2 ≤ C.offset sp2 + BitVec.toInt o8 ∧ C.offset sp2 + BitVec.toInt o8 < C.max sp2) ∧ C.writable sp2 = true) ∧ (∀(sp3 : C.ptr (BitVec 8)), List.length (C.data sp3) = List.length (C.data sp2) ∧ C.offset sp3 = C.offset sp2 ∧ C.min sp3 = C.min sp2 ∧ C.max sp3 = C.max sp2 ∧ C.writable sp3 = C.writable sp2 ∧ C.zone1 sp3 = C.zone1 sp2 → C.pelts sp3 = Function.update (C.pelts sp2) (C.offset sp3 + BitVec.toInt o8) o10 ∧ C.pelts sp3 (C.offset sp3 + BitVec.toInt o8) = o10 → (Z.zones mpz1 u = C.zone1 up1 ∧ (1 : ℤ) ≤ Z.readers mpz1 u ∧ C.min up1 = (0 : ℤ) ∧ C.max up1 = C.plength up1) ∧ (∀(mpz2 : Z.mpz_memo), Z.abs_value_of mpz2 = Z.abs_value_of mpz1 ∧ Z.alloc mpz2 = Z.alloc mpz1 ∧ Z.abs_size mpz2 = Z.abs_size mpz1 ∧ Z.sgn mpz2 = Z.sgn mpz1 ∧ Z.zones mpz2 = Z.zones mpz1 → Z.readers mpz2 u = Z.readers mpz1 u - (1 : ℤ) ∧ (∀(y : Z.mpz_ptr), ¬y = u → Z.readers mpz2 y = Z.readers mpz1 y) → String.valid_string sp3 ∧ String_value.string_in_base (effective (BitVec.toInt base)) (C.pelts sp3) (C.offset sp3) ∧ (∀(x : Z.mpz_ptr), Z.mpz_unchanged x mpz2 mpz) ∧ String_value.value_text (effective (BitVec.toInt base)) (C.pelts sp3) (C.offset sp3) = Z.value_of u mpz2)))))))))))))))))))))))))))))))
  := sorry
end mpz_get_str_Zget_str_wmpz_get_strqtvc
