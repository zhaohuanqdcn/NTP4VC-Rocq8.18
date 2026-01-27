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
namespace Valuation
axiom valuation : ℤ -> ℤ -> ℤ
axiom valuation'def (p : ℤ) (n : ℤ) (fact0 : (1 : ℤ) < p) (fact1 : (1 : ℤ) ≤ n) : if Int.tmod n p = (0 : ℤ) then valuation n p = valuation (Int.tdiv n p) p + (1 : ℤ) else valuation n p = (0 : ℤ)
axiom valuation'spec'0 (p : ℤ) (n : ℤ) (fact0 : (1 : ℤ) < p) (fact1 : (1 : ℤ) ≤ n) : (0 : ℤ) ≤ valuation n p
axiom valuation'spec (p : ℤ) (n : ℤ) (fact0 : (1 : ℤ) < p) (fact1 : (1 : ℤ) ≤ n) : HPow.hPow p (Int.toNat (valuation n p)) ∣  n
end Valuation
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
namespace toom_Toom_wmpn_mulqtvc
theorem wmpn_mul'vc (x : C.ptr (BitVec 64)) (sx : BitVec 32) (y : C.ptr (BitVec 64)) (sy : BitVec 32) (r : C.ptr (BitVec 64)) (k : ℤ) (fact0 : C.valid x (BitVec.toInt sx)) (fact1 : C.valid y (BitVec.toInt sy)) (fact2 : C.valid r (BitVec.toInt sx + BitVec.toInt sy)) (fact3 : C.writable r = true) (fact4 : (0 : ℤ) < BitVec.toInt sy) (fact5 : BitVec.toInt sy ≤ BitVec.toInt sx) (fact6 : (8 : ℤ) * BitVec.toInt sx < (2147483647 : ℤ)) (fact7 : BitVec.toInt sx ≤ BitVec.toInt (29 : BitVec 32) * HPow.hPow (2 : ℤ) (Int.toNat k)) (fact8 : (0 : ℤ) ≤ k) (fact9 : k ≤ (64 : ℤ)) : if BitVec.toInt sy ≤ BitVec.toInt (29 : BitVec 32) then (((0 : ℤ) < BitVec.toInt sy ∧ BitVec.toInt sy ≤ BitVec.toInt sx) ∧ C.valid x (BitVec.toInt sx) ∧ C.valid y (BitVec.toInt sy) ∧ C.valid r (BitVec.toInt sy + BitVec.toInt sx) ∧ C.writable r = true) ∧ (∀(r1 : C.ptr (BitVec 64)), List.length (C.data r1) = List.length (C.data r) ∧ C.offset r1 = C.offset r ∧ C.min r1 = C.min r ∧ C.max r1 = C.max r ∧ C.writable r1 = C.writable r ∧ C.zone1 r1 = C.zone1 r → Lemmas.value r1 (BitVec.toInt sy + BitVec.toInt sx) = Lemmas.value x (BitVec.toInt sx) * Lemmas.value y (BitVec.toInt sy) ∧ (∀(j : ℤ), j < C.offset r1 ∨ C.offset r1 + (BitVec.toInt sy + BitVec.toInt sx) ≤ j → C.pelts r1 j = C.pelts r j) → int'32_in_bounds (BitVec.toInt sx + BitVec.toInt sy) ∧ (∀(o1 : BitVec 32), BitVec.toInt o1 = BitVec.toInt sx + BitVec.toInt sy → int'32_in_bounds (BitVec.toInt o1 - (1 : ℤ)) ∧ (∀(o2 : BitVec 32), BitVec.toInt o2 = BitVec.toInt o1 - (1 : ℤ) → (C.min r1 ≤ C.offset r1 + BitVec.toInt o2 ∧ C.offset r1 + BitVec.toInt o2 < C.max r1) ∧ C.min r1 = C.min r ∧ C.max r1 = C.max r ∧ C.plength r1 = C.plength r ∧ Lemmas.value r1 (BitVec.toInt sx + BitVec.toInt sy) = Lemmas.value x (BitVec.toInt sx) * Lemmas.value y (BitVec.toInt sy) ∧ C.pelts r1 (C.offset r1 + BitVec.toInt o2) = C.pelts r1 (C.offset r1 + BitVec.toInt sx + BitVec.toInt sy - (1 : ℤ)) ∧ (∀(j : ℤ), C.min r1 ≤ j ∧ j < C.offset r1 ∨ C.offset r1 + BitVec.toInt sx + BitVec.toInt sy ≤ j ∧ j < C.max r1 → C.pelts r1 j = C.pelts r j)))) else int'32_in_bounds ((5 : ℤ) * BitVec.toInt sy) ∧ (∀(o1 : BitVec 32), BitVec.toInt o1 = (5 : ℤ) * BitVec.toInt sy → int'32_in_bounds (BitVec.toInt o1 + (128 : ℤ)) ∧ (∀(o2 : BitVec 32), BitVec.toInt o2 = BitVec.toInt o1 + (128 : ℤ) → (0 : ℤ) ≤ BitVec.toInt o2 ∧ (∀(o3 : BitVec 32), BitVec.toUInt o3 = BitVec.toInt o2 → (0 : ℤ) ≤ BitVec.toUInt o3 ∧ (∀(scratch : C.ptr (BitVec 64)), C.plength scratch = BitVec.toUInt o3 ∧ C.offset scratch = (0 : ℤ) ∧ C.min scratch = (0 : ℤ) ∧ C.max scratch = BitVec.toUInt o3 ∧ C.writable scratch = true → ((0 : ℤ) ≤ (0 : ℤ) ∧ (C.min r ≤ C.offset r - (0 : ℤ) ∧ C.offset r - (0 : ℤ) ≤ C.max r) ∧ C.writable r = true) ∧ (∀(r1 : C.ptr (BitVec 64)), C.offset r1 = C.offset r ∧ C.max r1 = C.max r ∧ C.writable r1 = C.writable r ∧ C.zone1 r1 = C.zone1 r → (∀(rol : C.ptr (BitVec 64)), C.writable rol = true ∧ C.offset rol = C.offset r1 - (0 : ℤ) ∧ C.min r1 = C.offset r1 - (0 : ℤ) ∧ C.min rol = C.min r ∧ C.max rol = C.offset r1 - (0 : ℤ) ∧ C.zone1 rol = C.zone1 r1 ∧ C.pelts r1 = C.pelts r ∧ C.plength r1 = C.plength r ∧ C.pelts rol = C.pelts r ∧ C.plength rol = C.plength r → int'32_in_bounds (BitVec.toInt sx + BitVec.toInt sy) ∧ (∀(o4 : BitVec 32), BitVec.toInt o4 = BitVec.toInt sx + BitVec.toInt sy → ((0 : ℤ) ≤ BitVec.toInt o4 ∧ (C.min r1 ≤ C.offset r1 + BitVec.toInt o4 ∧ C.offset r1 + BitVec.toInt o4 ≤ C.max r1) ∧ C.writable r1 = true) ∧ (∀(r2 : C.ptr (BitVec 64)), C.offset r2 = C.offset r1 ∧ C.min r2 = C.min r1 ∧ C.writable r2 = C.writable r1 ∧ C.zone1 r2 = C.zone1 r1 → (∀(ror : C.ptr (BitVec 64)), C.writable ror = true ∧ C.offset ror = C.offset r2 + BitVec.toInt o4 ∧ C.max r2 = C.offset r2 + BitVec.toInt o4 ∧ C.min ror = C.offset r2 + BitVec.toInt o4 ∧ C.max ror = C.max r1 ∧ C.zone1 ror = C.zone1 r2 ∧ C.pelts r2 = C.pelts r1 ∧ C.plength r2 = C.plength r1 ∧ C.pelts ror = C.pelts r1 ∧ C.plength ror = C.plength r1 → int'32_in_bounds ((5 : ℤ) * BitVec.toInt sy) ∧ (∀(o5 : BitVec 32), BitVec.toInt o5 = (5 : ℤ) * BitVec.toInt sy → int'32_in_bounds ((2 : ℤ) * BitVec.toInt sx) ∧ (∀(o6 : BitVec 32), BitVec.toInt o6 = (2 : ℤ) * BitVec.toInt sx → (if BitVec.toInt o5 ≤ BitVec.toInt o6 then int'32_in_bounds ((3 : ℤ) * BitVec.toInt sy) ∧ (∀(o7 : BitVec 32), BitVec.toInt o7 = (3 : ℤ) * BitVec.toInt sy → (¬(2 : ℤ) = (0 : ℤ) ∧ int'32_in_bounds (Int.tdiv (BitVec.toInt o7) (2 : ℤ))) ∧ (∀(su : BitVec 32), BitVec.toInt su = Int.tdiv (BitVec.toInt o7) (2 : ℤ) → int'32_in_bounds (BitVec.toInt su + BitVec.toInt sy) ∧ (∀(sr : BitVec 32), BitVec.toInt sr = BitVec.toInt su + BitVec.toInt sy → int'32_in_bounds ((4 : ℤ) * BitVec.toInt sy) ∧ (∀(o8 : BitVec 32), BitVec.toInt o8 = (4 : ℤ) * BitVec.toInt sy → (0 : ℤ) ≤ BitVec.toInt o8 ∧ (∀(o9 : BitVec 32), BitVec.toUInt o9 = BitVec.toInt o8 → (0 : ℤ) ≤ BitVec.toUInt o9 ∧ (∀(ws : C.ptr (BitVec 64)), C.plength ws = BitVec.toUInt o9 ∧ C.offset ws = (0 : ℤ) ∧ C.min ws = (0 : ℤ) ∧ C.max ws = BitVec.toUInt o9 ∧ C.writable ws = true → (((0 : ℤ) ≤ k + k + (1 : ℤ) ∧ k + k < k + k + (1 : ℤ)) ∧ C.valid x (BitVec.toInt su) ∧ C.valid y (BitVec.toInt sy) ∧ C.valid r2 (BitVec.toInt su + BitVec.toInt sy) ∧ (C.writable r2 = true ∧ C.writable scratch = true) ∧ BitVec.toInt (29 : BitVec 32) < BitVec.toInt sy ∧ ((0 : ℤ) < k ∧ k ≤ (64 : ℤ)) ∧ BitVec.toInt su ≤ BitVec.toInt (29 : BitVec 32) * HPow.hPow (2 : ℤ) (Int.toNat k) ∧ C.valid scratch ((2 : ℤ) * (BitVec.toInt su + k)) ∧ (8 : ℤ) * BitVec.toInt su < (2147483647 : ℤ) ∧ ((4 : ℤ) < BitVec.toInt sy + (2 : ℤ) ∧ BitVec.toInt sy + (2 : ℤ) ≤ BitVec.toInt su) ∧ BitVec.toInt su + (6 : ℤ) ≤ (3 : ℤ) * BitVec.toInt sy) ∧ (∀(scratch1 : C.ptr (BitVec 64)) (r3 : C.ptr (BitVec 64)), C.offset scratch1 = C.offset scratch ∧ C.writable scratch1 = C.writable scratch ∧ C.zone1 scratch1 = C.zone1 scratch → C.offset r3 = C.offset r2 ∧ C.writable r3 = C.writable r2 ∧ C.zone1 r3 = C.zone1 r2 → C.min r3 = C.min r2 ∧ C.max r3 = C.max r2 ∧ C.plength r3 = C.plength r2 ∧ C.min scratch1 = C.min scratch ∧ C.max scratch1 = C.max scratch ∧ C.plength scratch1 = C.plength scratch ∧ Lemmas.value r3 (BitVec.toInt su + BitVec.toInt sy) = Lemmas.value x (BitVec.toInt su) * Lemmas.value y (BitVec.toInt sy) ∧ (∀(j : ℤ), C.min r3 ≤ j ∧ j < C.offset r3 ∨ C.offset r3 + BitVec.toInt su + BitVec.toInt sy ≤ j ∧ j < C.max r3 → C.pelts r3 j = C.pelts r2 j) ∧ (∀(j : ℤ), C.min scratch1 ≤ j ∧ j < C.offset scratch1 → C.pelts scratch1 j = C.pelts scratch j) → int'32_in_bounds (BitVec.toInt sx - BitVec.toInt su) ∧ (∀(o10 : BitVec 32), BitVec.toInt o10 = BitVec.toInt sx - BitVec.toInt su → (C.min x ≤ C.offset x + BitVec.toInt su ∧ C.offset x + BitVec.toInt su ≤ C.max x) ∧ (∀(o11 : C.ptr (BitVec 64)), C.offset o11 = C.offset x + BitVec.toInt su ∧ C.plength o11 = C.plength x ∧ C.pelts o11 = C.pelts x ∧ C.data o11 = C.data x ∧ C.min o11 = C.min x ∧ C.max o11 = C.max x ∧ C.zone1 o11 = C.zone1 x ∧ C.writable o11 = C.writable x → (C.min r3 ≤ C.offset r3 + BitVec.toInt su ∧ C.offset r3 + BitVec.toInt su ≤ C.max r3) ∧ (∀(o12 : C.ptr (BitVec 64)), C.offset o12 = C.offset r3 + BitVec.toInt su ∧ C.plength o12 = C.plength r3 ∧ C.pelts o12 = C.pelts r3 ∧ C.data o12 = C.data r3 ∧ C.min o12 = C.min r3 ∧ C.max o12 = C.max r3 ∧ C.zone1 o12 = C.zone1 r3 ∧ C.writable o12 = C.writable r3 → ((-(2147483648 : ℤ) ≤ (2 : ℤ) * BitVec.toInt o10 ∧ (2 : ℤ) * BitVec.toInt o10 ≤ (2147483647 : ℤ)) ∧ BitVec.toInt su + BitVec.toInt o10 = BitVec.toInt sx ∧ BitVec.toInt sr = BitVec.toInt su + BitVec.toInt sy ∧ (BitVec.toInt su ≤ BitVec.toInt su ∧ BitVec.toInt su < BitVec.toInt sx) ∧ BitVec.toInt o10 < BitVec.toInt sx ∧ (2 : ℤ) * BitVec.toInt sy - BitVec.toInt su ≤ BitVec.toInt o10 ∧ Lemmas.value r3 (BitVec.toInt sr) = Lemmas.value x (BitVec.toInt su) * Lemmas.value y (BitVec.toInt sy) ∧ C.offset o12 = C.offset r3 + BitVec.toInt su ∧ C.offset o11 = C.offset x + BitVec.toInt su ∧ (C.min o11 = C.min x ∧ C.max o11 = C.max x) ∧ C.plength o11 = C.plength x ∧ (C.min o12 = C.min r3 ∧ C.max o12 = C.max r3) ∧ C.plength o12 = C.plength r3 ∧ C.writable o12 = true ∧ (C.min ws = (0 : ℤ) ∧ C.max ws = C.plength ws ∧ C.plength ws = (4 : ℤ) * BitVec.toInt sy) ∧ (C.min scratch1 = (0 : ℤ) ∧ C.max scratch1 = C.plength scratch1) ∧ C.plength scratch1 = (5 : ℤ) * BitVec.toInt sy + (128 : ℤ) ∧ C.pelts o12 = C.pelts r3 ∧ C.pelts o11 = C.pelts x) ∧ (∀(or : BitVec 32) (ou : BitVec 32) (rp : C.ptr (BitVec 64)) (up : C.ptr (BitVec 64)) (ws1 : C.ptr (BitVec 64)) (un : BitVec 32) (scratch2 : C.ptr (BitVec 64)) (r4 : C.ptr (BitVec 64)), C.offset ws1 = C.offset ws ∧ C.writable ws1 = C.writable ws ∧ C.zone1 ws1 = C.zone1 ws → C.offset scratch2 = C.offset scratch1 ∧ C.writable scratch2 = C.writable scratch1 ∧ C.zone1 scratch2 = C.zone1 scratch1 → List.length (C.data r4) = List.length (C.data r3) ∧ C.offset r4 = C.offset r3 ∧ C.min r4 = C.min r3 ∧ C.max r4 = C.max r3 ∧ C.writable r4 = C.writable r3 ∧ C.zone1 r4 = C.zone1 r3 → (-(2147483648 : ℤ) ≤ (2 : ℤ) * BitVec.toInt un ∧ (2 : ℤ) * BitVec.toInt un ≤ (2147483647 : ℤ)) ∧ BitVec.toInt ou + BitVec.toInt un = BitVec.toInt sx ∧ BitVec.toInt or = BitVec.toInt ou + BitVec.toInt sy ∧ (BitVec.toInt su ≤ BitVec.toInt ou ∧ BitVec.toInt ou < BitVec.toInt sx) ∧ BitVec.toInt un < BitVec.toInt sx ∧ (2 : ℤ) * BitVec.toInt sy - BitVec.toInt su ≤ BitVec.toInt un ∧ Lemmas.value r4 (BitVec.toInt or) = Lemmas.value x (BitVec.toInt ou) * Lemmas.value y (BitVec.toInt sy) ∧ C.offset rp = C.offset r4 + BitVec.toInt ou ∧ C.offset up = C.offset x + BitVec.toInt ou ∧ (C.min up = C.min x ∧ C.max up = C.max x) ∧ C.plength up = C.plength x ∧ (C.min rp = C.min r4 ∧ C.max rp = C.max r4) ∧ C.plength rp = C.plength r4 ∧ C.writable rp = true ∧ (C.min ws1 = (0 : ℤ) ∧ C.max ws1 = C.plength ws1 ∧ C.plength ws1 = (4 : ℤ) * BitVec.toInt sy) ∧ (C.min scratch2 = (0 : ℤ) ∧ C.max scratch2 = C.plength scratch2) ∧ C.plength scratch2 = (5 : ℤ) * BitVec.toInt sy + (128 : ℤ) ∧ C.pelts rp = C.pelts r4 ∧ C.pelts up = C.pelts x → int'32_in_bounds ((2 : ℤ) * BitVec.toInt sy) ∧ (∀(o13 : BitVec 32), BitVec.toInt o13 = (2 : ℤ) * BitVec.toInt sy → (if BitVec.toInt o13 ≤ BitVec.toInt un then (((0 : ℤ) ≤ k + k + (1 : ℤ) ∧ k + k < k + k + (1 : ℤ)) ∧ C.valid up (BitVec.toInt su) ∧ C.valid y (BitVec.toInt sy) ∧ C.valid ws1 (BitVec.toInt su + BitVec.toInt sy) ∧ (C.writable ws1 = true ∧ C.writable scratch2 = true) ∧ BitVec.toInt (29 : BitVec 32) < BitVec.toInt sy ∧ ((0 : ℤ) < k ∧ k ≤ (64 : ℤ)) ∧ BitVec.toInt su ≤ BitVec.toInt (29 : BitVec 32) * HPow.hPow (2 : ℤ) (Int.toNat k) ∧ C.valid scratch2 ((2 : ℤ) * (BitVec.toInt su + k)) ∧ (8 : ℤ) * BitVec.toInt su < (2147483647 : ℤ) ∧ ((4 : ℤ) < BitVec.toInt sy + (2 : ℤ) ∧ BitVec.toInt sy + (2 : ℤ) ≤ BitVec.toInt su) ∧ BitVec.toInt su + (6 : ℤ) ≤ (3 : ℤ) * BitVec.toInt sy) ∧ (∀(ws2 : C.ptr (BitVec 64)) (scratch3 : C.ptr (BitVec 64)), C.offset ws2 = C.offset ws1 ∧ C.writable ws2 = C.writable ws1 ∧ C.zone1 ws2 = C.zone1 ws1 → C.offset scratch3 = C.offset scratch2 ∧ C.writable scratch3 = C.writable scratch2 ∧ C.zone1 scratch3 = C.zone1 scratch2 → C.min ws2 = C.min ws1 ∧ C.max ws2 = C.max ws1 ∧ C.plength ws2 = C.plength ws1 ∧ C.min scratch3 = C.min scratch2 ∧ C.max scratch3 = C.max scratch2 ∧ C.plength scratch3 = C.plength scratch2 ∧ Lemmas.value ws2 (BitVec.toInt su + BitVec.toInt sy) = Lemmas.value up (BitVec.toInt su) * Lemmas.value y (BitVec.toInt sy) ∧ (∀(j : ℤ), C.min ws2 ≤ j ∧ j < C.offset ws2 ∨ C.offset ws2 + BitVec.toInt su + BitVec.toInt sy ≤ j ∧ j < C.max ws2 → C.pelts ws2 j = C.pelts ws1 j) ∧ (∀(j : ℤ), C.min scratch3 ≤ j ∧ j < C.offset scratch3 → C.pelts scratch3 j = C.pelts scratch2 j) → (C.valid rp (BitVec.toInt sy) ∧ C.valid ws2 (BitVec.toInt sy) ∧ C.writable rp = true) ∧ (∀(rp1 : C.ptr (BitVec 64)) (r5 : C.ptr (BitVec 64)), C.data rp1 = C.data r5 ∧ List.length (C.data r5) = List.length (C.data rp) ∧ C.offset rp1 = C.offset rp ∧ C.min rp1 = C.min rp ∧ C.max rp1 = C.max rp ∧ C.writable rp1 = C.writable rp ∧ C.zone1 rp1 = C.zone1 rp → C.data rp1 = C.data r5 ∧ List.length (C.data r5) = List.length (C.data rp) ∧ C.offset rp1 = C.offset rp ∧ C.min rp1 = C.min rp ∧ C.max rp1 = C.max rp ∧ C.writable rp1 = C.writable rp ∧ C.zone1 rp1 = C.zone1 rp → List.length (C.data r5) = List.length (C.data r4) ∧ C.offset r5 = C.offset r4 ∧ C.min r5 = C.min r4 ∧ C.max r5 = C.max r4 ∧ C.writable r5 = C.writable r4 ∧ C.zone1 r5 = C.zone1 r4 → (∀(cy : BitVec 64), ((0 : ℤ) ≤ BitVec.toUInt cy ∧ BitVec.toUInt cy ≤ (1 : ℤ)) ∧ Lemmas.value rp1 (BitVec.toInt sy) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt sy)) * BitVec.toUInt cy = Lemmas.value rp (BitVec.toInt sy) + Lemmas.value ws2 (BitVec.toInt sy) ∧ (∀(j : ℤ), j < C.offset rp1 ∨ C.offset rp1 + BitVec.toInt sy ≤ j → C.pelts rp1 j = C.pelts rp j) → (C.min rp1 ≤ C.offset rp1 + BitVec.toInt sy ∧ C.offset rp1 + BitVec.toInt sy ≤ C.max rp1) ∧ (∀(rpn : C.ptr (BitVec 64)), C.offset rpn = C.offset rp1 + BitVec.toInt sy ∧ C.plength rpn = C.plength rp1 ∧ C.pelts rpn = C.pelts rp1 ∧ C.data rpn = C.data rp1 ∧ C.min rpn = C.min rp1 ∧ C.max rpn = C.max rp1 ∧ C.zone1 rpn = C.zone1 rp1 ∧ C.writable rpn = C.writable rp1 → (C.min ws2 ≤ C.offset ws2 + BitVec.toInt sy ∧ C.offset ws2 + BitVec.toInt sy ≤ C.max ws2) ∧ (∀(wsy : C.ptr (BitVec 64)), C.offset wsy = C.offset ws2 + BitVec.toInt sy ∧ C.plength wsy = C.plength ws2 ∧ C.pelts wsy = C.pelts ws2 ∧ C.data wsy = C.data ws2 ∧ C.min wsy = C.min ws2 ∧ C.max wsy = C.max ws2 ∧ C.zone1 wsy = C.zone1 ws2 ∧ C.writable wsy = C.writable ws2 → (C.valid wsy (BitVec.toInt su) ∧ C.valid rpn (BitVec.toInt su) ∧ C.writable rpn = true) ∧ (∀(rpn1 : C.ptr (BitVec 64)) (rp2 : C.ptr (BitVec 64)) (r6 : C.ptr (BitVec 64)), C.data rpn1 = C.data r6 ∧ List.length (C.data r6) = List.length (C.data rpn) ∧ C.offset rpn1 = C.offset rpn ∧ C.min rpn1 = C.min rpn ∧ C.max rpn1 = C.max rpn ∧ C.writable rpn1 = C.writable rpn ∧ C.zone1 rpn1 = C.zone1 rpn → C.data rp2 = C.data r6 ∧ List.length (C.data r6) = List.length (C.data rp1) ∧ C.offset rp2 = C.offset rp1 ∧ C.min rp2 = C.min rp1 ∧ C.max rp2 = C.max rp1 ∧ C.writable rp2 = C.writable rp1 ∧ C.zone1 rp2 = C.zone1 rp1 → List.length (C.data r6) = List.length (C.data r5) ∧ C.offset r6 = C.offset r5 ∧ C.min r6 = C.min r5 ∧ C.max r6 = C.max r5 ∧ C.writable r6 = C.writable r5 ∧ C.zone1 r6 = C.zone1 r5 → Lemmas.map_eq_sub_shift (C.pelts rpn1) (C.pelts wsy) (C.offset rpn1) (C.offset wsy) (BitVec.toInt su) ∧ (∀(j : ℤ), j < C.offset rpn1 ∨ C.offset rpn1 + BitVec.toInt su ≤ j → C.pelts rpn1 j = C.pelts rpn j) → (C.valid rpn1 (BitVec.toInt su) ∧ (0 : ℤ) < BitVec.toInt su ∧ Lemmas.value rpn1 (BitVec.toInt su) + BitVec.toUInt cy < HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt su)) ∧ C.writable rpn1 = true) ∧ (∀(rpn2 : C.ptr (BitVec 64)) (rp3 : C.ptr (BitVec 64)) (r7 : C.ptr (BitVec 64)), C.data rpn2 = C.data r7 ∧ List.length (C.data r7) = List.length (C.data rpn1) ∧ C.offset rpn2 = C.offset rpn1 ∧ C.min rpn2 = C.min rpn1 ∧ C.max rpn2 = C.max rpn1 ∧ C.writable rpn2 = C.writable rpn1 ∧ C.zone1 rpn2 = C.zone1 rpn1 → C.data rp3 = C.data r7 ∧ List.length (C.data r7) = List.length (C.data rp2) ∧ C.offset rp3 = C.offset rp2 ∧ C.min rp3 = C.min rp2 ∧ C.max rp3 = C.max rp2 ∧ C.writable rp3 = C.writable rp2 ∧ C.zone1 rp3 = C.zone1 rp2 → List.length (C.data r7) = List.length (C.data r6) ∧ C.offset r7 = C.offset r6 ∧ C.min r7 = C.min r6 ∧ C.max r7 = C.max r6 ∧ C.writable r7 = C.writable r6 ∧ C.zone1 r7 = C.zone1 r6 → Lemmas.value rpn2 (BitVec.toInt su) = Lemmas.value rpn1 (BitVec.toInt su) + BitVec.toUInt cy ∧ (∀(j : ℤ), j < C.offset rpn2 ∨ C.offset rpn2 + BitVec.toInt su ≤ j → C.pelts rpn2 j = C.pelts rpn1 j) → int'32_in_bounds (BitVec.toInt un - BitVec.toInt su) ∧ (∀(o14 : BitVec 32), BitVec.toInt o14 = BitVec.toInt un - BitVec.toInt su → (C.min up ≤ C.offset up + BitVec.toInt su ∧ C.offset up + BitVec.toInt su ≤ C.max up) ∧ (∀(o15 : C.ptr (BitVec 64)), C.offset o15 = C.offset up + BitVec.toInt su ∧ C.plength o15 = C.plength up ∧ C.pelts o15 = C.pelts up ∧ C.data o15 = C.data up ∧ C.min o15 = C.min up ∧ C.max o15 = C.max up ∧ C.zone1 o15 = C.zone1 up ∧ C.writable o15 = C.writable up → int'32_in_bounds (BitVec.toInt ou + BitVec.toInt su) ∧ (∀(o16 : BitVec 32), BitVec.toInt o16 = BitVec.toInt ou + BitVec.toInt su → int'32_in_bounds (BitVec.toInt or + BitVec.toInt su) ∧ (∀(o17 : BitVec 32), BitVec.toInt o17 = BitVec.toInt or + BitVec.toInt su → (C.min rp3 ≤ C.offset rp3 + BitVec.toInt su ∧ C.offset rp3 + BitVec.toInt su ≤ C.max rp3) ∧ (∀(o18 : C.ptr (BitVec 64)), C.offset o18 = C.offset rp3 + BitVec.toInt su ∧ C.plength o18 = C.plength rp3 ∧ C.pelts o18 = C.pelts rp3 ∧ C.data o18 = C.data rp3 ∧ C.min o18 = C.min rp3 ∧ C.max o18 = C.max rp3 ∧ C.zone1 o18 = C.zone1 rp3 ∧ C.writable o18 = C.writable rp3 → ((0 : ℤ) ≤ BitVec.toInt un ∧ BitVec.toInt o14 < BitVec.toInt un) ∧ (-(2147483648 : ℤ) ≤ (2 : ℤ) * BitVec.toInt o14 ∧ (2 : ℤ) * BitVec.toInt o14 ≤ (2147483647 : ℤ)) ∧ BitVec.toInt o16 + BitVec.toInt o14 = BitVec.toInt sx ∧ BitVec.toInt o17 = BitVec.toInt o16 + BitVec.toInt sy ∧ (BitVec.toInt su ≤ BitVec.toInt o16 ∧ BitVec.toInt o16 < BitVec.toInt sx) ∧ BitVec.toInt o14 < BitVec.toInt sx ∧ (2 : ℤ) * BitVec.toInt sy - BitVec.toInt su ≤ BitVec.toInt o14 ∧ Lemmas.value r7 (BitVec.toInt o17) = Lemmas.value x (BitVec.toInt o16) * Lemmas.value y (BitVec.toInt sy) ∧ C.offset o18 = C.offset r7 + BitVec.toInt o16 ∧ C.offset o15 = C.offset x + BitVec.toInt o16 ∧ (C.min o15 = C.min x ∧ C.max o15 = C.max x) ∧ C.plength o15 = C.plength x ∧ (C.min o18 = C.min r7 ∧ C.max o18 = C.max r7) ∧ C.plength o18 = C.plength r7 ∧ C.writable o18 = true ∧ (C.min ws2 = (0 : ℤ) ∧ C.max ws2 = C.plength ws2 ∧ C.plength ws2 = (4 : ℤ) * BitVec.toInt sy) ∧ (C.min scratch3 = (0 : ℤ) ∧ C.max scratch3 = C.plength scratch3) ∧ C.plength scratch3 = (5 : ℤ) * BitVec.toInt sy + (128 : ℤ) ∧ C.pelts o18 = C.pelts r7 ∧ C.pelts o15 = C.pelts x)))))))))))) else (if BitVec.toInt sy ≤ BitVec.toInt un then int'32_in_bounds ((5 : ℤ) * BitVec.toInt sy) ∧ (∀(o14 : BitVec 32), BitVec.toInt o14 = (5 : ℤ) * BitVec.toInt sy → int'32_in_bounds ((4 : ℤ) * BitVec.toInt un) ∧ (∀(o15 : BitVec 32), BitVec.toInt o15 = (4 : ℤ) * BitVec.toInt un → (if BitVec.toInt o15 < BitVec.toInt o14 then (((0 : ℤ) ≤ k + k + (1 : ℤ) ∧ k + k < k + k + (1 : ℤ)) ∧ C.valid up (BitVec.toInt un) ∧ C.valid y (BitVec.toInt sy) ∧ C.valid ws1 (BitVec.toInt un + BitVec.toInt sy) ∧ BitVec.toInt (29 : BitVec 32) < BitVec.toInt sy ∧ ((0 : ℤ) < k ∧ k ≤ (64 : ℤ)) ∧ BitVec.toInt un ≤ BitVec.toInt (29 : BitVec 32) * HPow.hPow (2 : ℤ) (Int.toNat k) ∧ C.valid scratch2 ((2 : ℤ) * (BitVec.toInt un + k)) ∧ (C.writable ws1 = true ∧ C.writable scratch2 = true) ∧ (8 : ℤ) * BitVec.toInt un < (2147483647 : ℤ) ∧ ((2 : ℤ) < BitVec.toInt sy ∧ BitVec.toInt sy ≤ BitVec.toInt un ∧ BitVec.toInt un < BitVec.toInt sy + BitVec.toInt sy - (1 : ℤ)) ∧ (4 : ℤ) * BitVec.toInt un < (5 : ℤ) * BitVec.toInt sy) ∧ (∀(ws2 : C.ptr (BitVec 64)) (scratch3 : C.ptr (BitVec 64)), C.offset ws2 = C.offset ws1 ∧ C.writable ws2 = C.writable ws1 ∧ C.zone1 ws2 = C.zone1 ws1 → C.offset scratch3 = C.offset scratch2 ∧ C.writable scratch3 = C.writable scratch2 ∧ C.zone1 scratch3 = C.zone1 scratch2 → C.min ws2 = C.min ws1 ∧ C.max ws2 = C.max ws1 ∧ C.plength ws2 = C.plength ws1 ∧ C.min scratch3 = C.min scratch2 ∧ C.max scratch3 = C.max scratch2 ∧ C.plength scratch3 = C.plength scratch2 ∧ Lemmas.value ws2 (BitVec.toInt un + BitVec.toInt sy) = Lemmas.value up (BitVec.toInt un) * Lemmas.value y (BitVec.toInt sy) ∧ (∀(j : ℤ), C.min ws2 ≤ j ∧ j < C.offset ws2 ∨ C.offset ws2 + BitVec.toInt un + BitVec.toInt sy ≤ j ∧ j < C.max ws2 → C.pelts ws2 j = C.pelts ws1 j) ∧ (∀(j : ℤ), C.min scratch3 ≤ j ∧ j < C.offset scratch3 → C.pelts scratch3 j = C.pelts scratch2 j) → Lemmas.value ws2 (BitVec.toInt un + BitVec.toInt sy) = Lemmas.value up (BitVec.toInt un) * Lemmas.value y (BitVec.toInt sy) ∧ (C.min ws2 = C.min ws1 ∧ C.max ws2 = C.max ws1 ∧ C.plength ws2 = C.plength ws1) ∧ C.min scratch3 = C.min scratch2 ∧ C.max scratch3 = C.max scratch2 ∧ C.plength scratch3 = C.plength scratch2) else (((0 : ℤ) ≤ k + k + (1 : ℤ) ∧ k + k < k + k + (1 : ℤ)) ∧ C.valid up (BitVec.toInt un) ∧ C.valid y (BitVec.toInt sy) ∧ C.valid ws1 (BitVec.toInt un + BitVec.toInt sy) ∧ (C.writable ws1 = true ∧ C.writable scratch2 = true) ∧ BitVec.toInt (29 : BitVec 32) < BitVec.toInt sy ∧ ((0 : ℤ) < k ∧ k ≤ (64 : ℤ)) ∧ BitVec.toInt un ≤ BitVec.toInt (29 : BitVec 32) * HPow.hPow (2 : ℤ) (Int.toNat k) ∧ C.valid scratch2 ((2 : ℤ) * (BitVec.toInt un + k)) ∧ (8 : ℤ) * BitVec.toInt un < (2147483647 : ℤ) ∧ ((4 : ℤ) < BitVec.toInt sy + (2 : ℤ) ∧ BitVec.toInt sy + (2 : ℤ) ≤ BitVec.toInt un) ∧ BitVec.toInt un + (6 : ℤ) ≤ (3 : ℤ) * BitVec.toInt sy) ∧ (∀(ws2 : C.ptr (BitVec 64)) (scratch3 : C.ptr (BitVec 64)), C.offset ws2 = C.offset ws1 ∧ C.writable ws2 = C.writable ws1 ∧ C.zone1 ws2 = C.zone1 ws1 → C.offset scratch3 = C.offset scratch2 ∧ C.writable scratch3 = C.writable scratch2 ∧ C.zone1 scratch3 = C.zone1 scratch2 → C.min ws2 = C.min ws1 ∧ C.max ws2 = C.max ws1 ∧ C.plength ws2 = C.plength ws1 ∧ C.min scratch3 = C.min scratch2 ∧ C.max scratch3 = C.max scratch2 ∧ C.plength scratch3 = C.plength scratch2 ∧ Lemmas.value ws2 (BitVec.toInt un + BitVec.toInt sy) = Lemmas.value up (BitVec.toInt un) * Lemmas.value y (BitVec.toInt sy) ∧ (∀(j : ℤ), C.min ws2 ≤ j ∧ j < C.offset ws2 ∨ C.offset ws2 + BitVec.toInt un + BitVec.toInt sy ≤ j ∧ j < C.max ws2 → C.pelts ws2 j = C.pelts ws1 j) ∧ (∀(j : ℤ), C.min scratch3 ≤ j ∧ j < C.offset scratch3 → C.pelts scratch3 j = C.pelts scratch2 j) → Lemmas.value ws2 (BitVec.toInt un + BitVec.toInt sy) = Lemmas.value up (BitVec.toInt un) * Lemmas.value y (BitVec.toInt sy) ∧ (C.min ws2 = C.min ws1 ∧ C.max ws2 = C.max ws1 ∧ C.plength ws2 = C.plength ws1) ∧ C.min scratch3 = C.min scratch2 ∧ C.max scratch3 = C.max scratch2 ∧ C.plength scratch3 = C.plength scratch2)))) else let o14 : ℤ := k - (1 : ℤ); (((0 : ℤ) ≤ k + k + (1 : ℤ) ∧ o14 + o14 + (1 : ℤ) < k + k + (1 : ℤ)) ∧ C.valid y (BitVec.toInt sy) ∧ C.valid up (BitVec.toInt un) ∧ C.valid ws1 (BitVec.toInt sy + BitVec.toInt un) ∧ C.writable ws1 = true ∧ ((0 : ℤ) < BitVec.toInt un ∧ BitVec.toInt un ≤ BitVec.toInt sy) ∧ (8 : ℤ) * BitVec.toInt sy < (2147483647 : ℤ) ∧ BitVec.toInt sy ≤ BitVec.toInt (29 : BitVec 32) * HPow.hPow (2 : ℤ) (Int.toNat o14) ∧ (0 : ℤ) ≤ o14 ∧ o14 ≤ (64 : ℤ)) ∧ (∀(ws2 : C.ptr (BitVec 64)), C.offset ws2 = C.offset ws1 ∧ C.writable ws2 = C.writable ws1 ∧ C.zone1 ws2 = C.zone1 ws1 → C.min ws2 = C.min ws1 ∧ C.max ws2 = C.max ws1 ∧ C.plength ws2 = C.plength ws1 ∧ Lemmas.value ws2 (BitVec.toInt sy + BitVec.toInt un) = Lemmas.value y (BitVec.toInt sy) * Lemmas.value up (BitVec.toInt un) ∧ (∀(j : ℤ), C.min ws2 ≤ j ∧ j < C.offset ws2 ∨ C.offset ws2 + BitVec.toInt sy + BitVec.toInt un ≤ j ∧ j < C.max ws2 → C.pelts ws2 j = C.pelts ws1 j) → Lemmas.value ws2 (BitVec.toInt un + BitVec.toInt sy) = Lemmas.value up (BitVec.toInt un) * Lemmas.value y (BitVec.toInt sy) ∧ C.min ws2 = C.min ws1 ∧ C.max ws2 = C.max ws1 ∧ C.plength ws2 = C.plength ws1)) ∧ (∀(ws2 : C.ptr (BitVec 64)) (scratch3 : C.ptr (BitVec 64)), C.offset ws2 = C.offset ws1 ∧ C.writable ws2 = C.writable ws1 ∧ C.zone1 ws2 = C.zone1 ws1 → C.offset scratch3 = C.offset scratch2 ∧ C.writable scratch3 = C.writable scratch2 ∧ C.zone1 scratch3 = C.zone1 scratch2 → Lemmas.value ws2 (BitVec.toInt un + BitVec.toInt sy) = Lemmas.value up (BitVec.toInt un) * Lemmas.value y (BitVec.toInt sy) ∧ (C.min ws2 = C.min ws1 ∧ C.max ws2 = C.max ws1 ∧ C.plength ws2 = C.plength ws1) ∧ C.min scratch3 = C.min scratch2 ∧ C.max scratch3 = C.max scratch2 ∧ C.plength scratch3 = C.plength scratch2 → (C.valid rp (BitVec.toInt sy) ∧ C.valid ws2 (BitVec.toInt sy) ∧ C.writable rp = true) ∧ (∀(rp1 : C.ptr (BitVec 64)) (r5 : C.ptr (BitVec 64)), C.data rp1 = C.data r5 ∧ List.length (C.data r5) = List.length (C.data rp) ∧ C.offset rp1 = C.offset rp ∧ C.min rp1 = C.min rp ∧ C.max rp1 = C.max rp ∧ C.writable rp1 = C.writable rp ∧ C.zone1 rp1 = C.zone1 rp → C.data rp1 = C.data r5 ∧ List.length (C.data r5) = List.length (C.data rp) ∧ C.offset rp1 = C.offset rp ∧ C.min rp1 = C.min rp ∧ C.max rp1 = C.max rp ∧ C.writable rp1 = C.writable rp ∧ C.zone1 rp1 = C.zone1 rp → List.length (C.data r5) = List.length (C.data r4) ∧ C.offset r5 = C.offset r4 ∧ C.min r5 = C.min r4 ∧ C.max r5 = C.max r4 ∧ C.writable r5 = C.writable r4 ∧ C.zone1 r5 = C.zone1 r4 → (∀(cy : BitVec 64), ((0 : ℤ) ≤ BitVec.toUInt cy ∧ BitVec.toUInt cy ≤ (1 : ℤ)) ∧ Lemmas.value rp1 (BitVec.toInt sy) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt sy)) * BitVec.toUInt cy = Lemmas.value rp (BitVec.toInt sy) + Lemmas.value ws2 (BitVec.toInt sy) ∧ (∀(j : ℤ), j < C.offset rp1 ∨ C.offset rp1 + BitVec.toInt sy ≤ j → C.pelts rp1 j = C.pelts rp j) → (C.min rp1 ≤ C.offset rp1 + BitVec.toInt sy ∧ C.offset rp1 + BitVec.toInt sy ≤ C.max rp1) ∧ (∀(rpn : C.ptr (BitVec 64)), C.offset rpn = C.offset rp1 + BitVec.toInt sy ∧ C.plength rpn = C.plength rp1 ∧ C.pelts rpn = C.pelts rp1 ∧ C.data rpn = C.data rp1 ∧ C.min rpn = C.min rp1 ∧ C.max rpn = C.max rp1 ∧ C.zone1 rpn = C.zone1 rp1 ∧ C.writable rpn = C.writable rp1 → (C.min ws2 ≤ C.offset ws2 + BitVec.toInt sy ∧ C.offset ws2 + BitVec.toInt sy ≤ C.max ws2) ∧ (∀(wsy : C.ptr (BitVec 64)), C.offset wsy = C.offset ws2 + BitVec.toInt sy ∧ C.plength wsy = C.plength ws2 ∧ C.pelts wsy = C.pelts ws2 ∧ C.data wsy = C.data ws2 ∧ C.min wsy = C.min ws2 ∧ C.max wsy = C.max ws2 ∧ C.zone1 wsy = C.zone1 ws2 ∧ C.writable wsy = C.writable ws2 → (C.valid wsy (BitVec.toInt un) ∧ C.valid rpn (BitVec.toInt un) ∧ C.writable rpn = true) ∧ (∀(rpn1 : C.ptr (BitVec 64)) (r6 : C.ptr (BitVec 64)), C.data rpn1 = C.data r6 ∧ List.length (C.data r6) = List.length (C.data rpn) ∧ C.offset rpn1 = C.offset rpn ∧ C.min rpn1 = C.min rpn ∧ C.max rpn1 = C.max rpn ∧ C.writable rpn1 = C.writable rpn ∧ C.zone1 rpn1 = C.zone1 rpn → List.length (C.data r6) = List.length (C.data r5) ∧ C.offset r6 = C.offset r5 ∧ C.min r6 = C.min r5 ∧ C.max r6 = C.max r5 ∧ C.writable r6 = C.writable r5 ∧ C.zone1 r6 = C.zone1 r5 → Lemmas.map_eq_sub_shift (C.pelts rpn1) (C.pelts wsy) (C.offset rpn1) (C.offset wsy) (BitVec.toInt un) ∧ (∀(j : ℤ), j < C.offset rpn1 ∨ C.offset rpn1 + BitVec.toInt un ≤ j → C.pelts rpn1 j = C.pelts rpn j) → int'32_in_bounds (BitVec.toInt sy + BitVec.toInt un) ∧ (∀(sr1 : BitVec 32), BitVec.toInt sr1 = BitVec.toInt sy + BitVec.toInt un → (C.valid rpn1 (BitVec.toInt un) ∧ (0 : ℤ) < BitVec.toInt un ∧ Lemmas.value rpn1 (BitVec.toInt un) + BitVec.toUInt cy < HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt un)) ∧ C.writable rpn1 = true) ∧ (∀(rpn2 : C.ptr (BitVec 64)) (r7 : C.ptr (BitVec 64)), C.data rpn2 = C.data r7 ∧ List.length (C.data r7) = List.length (C.data rpn1) ∧ C.offset rpn2 = C.offset rpn1 ∧ C.min rpn2 = C.min rpn1 ∧ C.max rpn2 = C.max rpn1 ∧ C.writable rpn2 = C.writable rpn1 ∧ C.zone1 rpn2 = C.zone1 rpn1 → List.length (C.data r7) = List.length (C.data r6) ∧ C.offset r7 = C.offset r6 ∧ C.min r7 = C.min r6 ∧ C.max r7 = C.max r6 ∧ C.writable r7 = C.writable r6 ∧ C.zone1 r7 = C.zone1 r6 → Lemmas.value rpn2 (BitVec.toInt un) = Lemmas.value rpn1 (BitVec.toInt un) + BitVec.toUInt cy ∧ (∀(j : ℤ), j < C.offset rpn2 ∨ C.offset rpn2 + BitVec.toInt un ≤ j → C.pelts rpn2 j = C.pelts rpn1 j) → (C.offset ws2 = (0 : ℤ) ∧ C.min ws2 = (0 : ℤ) ∧ C.max ws2 = C.plength ws2 ∧ C.writable ws2 = true) ∧ (C.offset scratch3 = (0 : ℤ) ∧ C.min scratch3 = (0 : ℤ) ∧ C.max scratch3 = C.plength scratch3 ∧ C.writable scratch3 = true) ∧ (C.zone1 r7 = C.zone1 ror ∧ C.max r7 = C.min ror ∧ C.writable r7 = true ∧ C.writable ror = true) ∧ (∀(r8 : C.ptr (BitVec 64)), List.length (C.data r8) = List.length (C.data r7) ∧ C.offset r8 = C.offset r7 ∧ C.min r8 = C.min r7 ∧ C.writable r8 = C.writable r7 ∧ C.zone1 r8 = C.zone1 r7 → C.max r8 = C.max ror ∧ C.plength r8 = C.plength r7 ∧ (∀(i : ℤ), C.min r7 ≤ i ∧ i < C.max r7 → C.pelts r8 i = C.pelts r7 i) ∧ (∀(i : ℤ), C.min ror ≤ i ∧ i < C.max ror → C.pelts r8 i = C.pelts ror i) → (C.zone1 rol = C.zone1 r8 ∧ C.max rol = C.min r8 ∧ C.writable rol = true ∧ C.writable r8 = true) ∧ (∀(r9 : C.ptr (BitVec 64)), List.length (C.data r9) = List.length (C.data r8) ∧ C.offset r9 = C.offset r8 ∧ C.max r9 = C.max r8 ∧ C.writable r9 = C.writable r8 ∧ C.zone1 r9 = C.zone1 r8 → C.min r9 = C.min rol ∧ C.plength r9 = C.plength r8 ∧ (∀(i : ℤ), C.min rol ≤ i ∧ i < C.max rol → C.pelts r9 i = C.pelts rol i) ∧ (∀(i : ℤ), C.min r8 ≤ i ∧ i < C.max r8 → C.pelts r9 i = C.pelts r8 i) → int'32_in_bounds (BitVec.toInt sx + BitVec.toInt sy) ∧ (∀(o14 : BitVec 32), BitVec.toInt o14 = BitVec.toInt sx + BitVec.toInt sy → int'32_in_bounds (BitVec.toInt o14 - (1 : ℤ)) ∧ (∀(o15 : BitVec 32), BitVec.toInt o15 = BitVec.toInt o14 - (1 : ℤ) → (C.min r9 ≤ C.offset r9 + BitVec.toInt o15 ∧ C.offset r9 + BitVec.toInt o15 < C.max r9) ∧ C.min r9 = C.min r ∧ C.max r9 = C.max r ∧ C.plength r9 = C.plength r ∧ Lemmas.value r9 (BitVec.toInt sx + BitVec.toInt sy) = Lemmas.value x (BitVec.toInt sx) * Lemmas.value y (BitVec.toInt sy) ∧ C.pelts r9 (C.offset r9 + BitVec.toInt o15) = C.pelts r9 (C.offset r9 + BitVec.toInt sx + BitVec.toInt sy - (1 : ℤ)) ∧ (∀(j : ℤ), C.min r9 ≤ j ∧ j < C.offset r9 ∨ C.offset r9 + BitVec.toInt sx + BitVec.toInt sy ≤ j ∧ j < C.max r9 → C.pelts r9 j = C.pelts r j)))))))))))))))))))))))))) else int'32_in_bounds ((5 : ℤ) * BitVec.toInt sy) ∧ (∀(o7 : BitVec 32), BitVec.toInt o7 = (5 : ℤ) * BitVec.toInt sy → int'32_in_bounds ((4 : ℤ) * BitVec.toInt sx) ∧ (∀(o8 : BitVec 32), BitVec.toInt o8 = (4 : ℤ) * BitVec.toInt sx → (if BitVec.toInt o8 < BitVec.toInt o7 then (((0 : ℤ) ≤ k + k + (1 : ℤ) ∧ k + k < k + k + (1 : ℤ)) ∧ C.valid x (BitVec.toInt sx) ∧ C.valid y (BitVec.toInt sy) ∧ C.valid r2 (BitVec.toInt sx + BitVec.toInt sy) ∧ BitVec.toInt (29 : BitVec 32) < BitVec.toInt sy ∧ ((0 : ℤ) < k ∧ k ≤ (64 : ℤ)) ∧ BitVec.toInt sx ≤ BitVec.toInt (29 : BitVec 32) * HPow.hPow (2 : ℤ) (Int.toNat k) ∧ C.valid scratch ((2 : ℤ) * (BitVec.toInt sx + k)) ∧ (C.writable r2 = true ∧ C.writable scratch = true) ∧ (8 : ℤ) * BitVec.toInt sx < (2147483647 : ℤ) ∧ ((2 : ℤ) < BitVec.toInt sy ∧ BitVec.toInt sy ≤ BitVec.toInt sx ∧ BitVec.toInt sx < BitVec.toInt sy + BitVec.toInt sy - (1 : ℤ)) ∧ (4 : ℤ) * BitVec.toInt sx < (5 : ℤ) * BitVec.toInt sy) ∧ (∀(scratch1 : C.ptr (BitVec 64)) (r3 : C.ptr (BitVec 64)), C.offset scratch1 = C.offset scratch ∧ C.writable scratch1 = C.writable scratch ∧ C.zone1 scratch1 = C.zone1 scratch → C.offset r3 = C.offset r2 ∧ C.writable r3 = C.writable r2 ∧ C.zone1 r3 = C.zone1 r2 → C.min r3 = C.min r2 ∧ C.max r3 = C.max r2 ∧ C.plength r3 = C.plength r2 ∧ C.min scratch1 = C.min scratch ∧ C.max scratch1 = C.max scratch ∧ C.plength scratch1 = C.plength scratch ∧ Lemmas.value r3 (BitVec.toInt sx + BitVec.toInt sy) = Lemmas.value x (BitVec.toInt sx) * Lemmas.value y (BitVec.toInt sy) ∧ (∀(j : ℤ), C.min r3 ≤ j ∧ j < C.offset r3 ∨ C.offset r3 + BitVec.toInt sx + BitVec.toInt sy ≤ j ∧ j < C.max r3 → C.pelts r3 j = C.pelts r2 j) ∧ (∀(j : ℤ), C.min scratch1 ≤ j ∧ j < C.offset scratch1 → C.pelts scratch1 j = C.pelts scratch j) → (C.offset scratch1 = (0 : ℤ) ∧ C.min scratch1 = (0 : ℤ) ∧ C.max scratch1 = C.plength scratch1 ∧ C.writable scratch1 = true) ∧ (C.zone1 r3 = C.zone1 ror ∧ C.max r3 = C.min ror ∧ C.writable r3 = true ∧ C.writable ror = true) ∧ (∀(r4 : C.ptr (BitVec 64)), List.length (C.data r4) = List.length (C.data r3) ∧ C.offset r4 = C.offset r3 ∧ C.min r4 = C.min r3 ∧ C.writable r4 = C.writable r3 ∧ C.zone1 r4 = C.zone1 r3 → C.max r4 = C.max ror ∧ C.plength r4 = C.plength r3 ∧ (∀(i : ℤ), C.min r3 ≤ i ∧ i < C.max r3 → C.pelts r4 i = C.pelts r3 i) ∧ (∀(i : ℤ), C.min ror ≤ i ∧ i < C.max ror → C.pelts r4 i = C.pelts ror i) → (C.zone1 rol = C.zone1 r4 ∧ C.max rol = C.min r4 ∧ C.writable rol = true ∧ C.writable r4 = true) ∧ (∀(r5 : C.ptr (BitVec 64)), List.length (C.data r5) = List.length (C.data r4) ∧ C.offset r5 = C.offset r4 ∧ C.max r5 = C.max r4 ∧ C.writable r5 = C.writable r4 ∧ C.zone1 r5 = C.zone1 r4 → C.min r5 = C.min rol ∧ C.plength r5 = C.plength r4 ∧ (∀(i : ℤ), C.min rol ≤ i ∧ i < C.max rol → C.pelts r5 i = C.pelts rol i) ∧ (∀(i : ℤ), C.min r4 ≤ i ∧ i < C.max r4 → C.pelts r5 i = C.pelts r4 i) → int'32_in_bounds (BitVec.toInt sx + BitVec.toInt sy) ∧ (∀(o9 : BitVec 32), BitVec.toInt o9 = BitVec.toInt sx + BitVec.toInt sy → int'32_in_bounds (BitVec.toInt o9 - (1 : ℤ)) ∧ (∀(o10 : BitVec 32), BitVec.toInt o10 = BitVec.toInt o9 - (1 : ℤ) → (C.min r5 ≤ C.offset r5 + BitVec.toInt o10 ∧ C.offset r5 + BitVec.toInt o10 < C.max r5) ∧ C.min r5 = C.min r ∧ C.max r5 = C.max r ∧ C.plength r5 = C.plength r ∧ Lemmas.value r5 (BitVec.toInt sx + BitVec.toInt sy) = Lemmas.value x (BitVec.toInt sx) * Lemmas.value y (BitVec.toInt sy) ∧ C.pelts r5 (C.offset r5 + BitVec.toInt o10) = C.pelts r5 (C.offset r5 + BitVec.toInt sx + BitVec.toInt sy - (1 : ℤ)) ∧ (∀(j : ℤ), C.min r5 ≤ j ∧ j < C.offset r5 ∨ C.offset r5 + BitVec.toInt sx + BitVec.toInt sy ≤ j ∧ j < C.max r5 → C.pelts r5 j = C.pelts r j)))))) else (((0 : ℤ) ≤ k + k + (1 : ℤ) ∧ k + k < k + k + (1 : ℤ)) ∧ C.valid x (BitVec.toInt sx) ∧ C.valid y (BitVec.toInt sy) ∧ C.valid r2 (BitVec.toInt sx + BitVec.toInt sy) ∧ (C.writable r2 = true ∧ C.writable scratch = true) ∧ BitVec.toInt (29 : BitVec 32) < BitVec.toInt sy ∧ ((0 : ℤ) < k ∧ k ≤ (64 : ℤ)) ∧ BitVec.toInt sx ≤ BitVec.toInt (29 : BitVec 32) * HPow.hPow (2 : ℤ) (Int.toNat k) ∧ C.valid scratch ((2 : ℤ) * (BitVec.toInt sx + k)) ∧ (8 : ℤ) * BitVec.toInt sx < (2147483647 : ℤ) ∧ ((4 : ℤ) < BitVec.toInt sy + (2 : ℤ) ∧ BitVec.toInt sy + (2 : ℤ) ≤ BitVec.toInt sx) ∧ BitVec.toInt sx + (6 : ℤ) ≤ (3 : ℤ) * BitVec.toInt sy) ∧ (∀(scratch1 : C.ptr (BitVec 64)) (r3 : C.ptr (BitVec 64)), C.offset scratch1 = C.offset scratch ∧ C.writable scratch1 = C.writable scratch ∧ C.zone1 scratch1 = C.zone1 scratch → C.offset r3 = C.offset r2 ∧ C.writable r3 = C.writable r2 ∧ C.zone1 r3 = C.zone1 r2 → C.min r3 = C.min r2 ∧ C.max r3 = C.max r2 ∧ C.plength r3 = C.plength r2 ∧ C.min scratch1 = C.min scratch ∧ C.max scratch1 = C.max scratch ∧ C.plength scratch1 = C.plength scratch ∧ Lemmas.value r3 (BitVec.toInt sx + BitVec.toInt sy) = Lemmas.value x (BitVec.toInt sx) * Lemmas.value y (BitVec.toInt sy) ∧ (∀(j : ℤ), C.min r3 ≤ j ∧ j < C.offset r3 ∨ C.offset r3 + BitVec.toInt sx + BitVec.toInt sy ≤ j ∧ j < C.max r3 → C.pelts r3 j = C.pelts r2 j) ∧ (∀(j : ℤ), C.min scratch1 ≤ j ∧ j < C.offset scratch1 → C.pelts scratch1 j = C.pelts scratch j) → (C.offset scratch1 = (0 : ℤ) ∧ C.min scratch1 = (0 : ℤ) ∧ C.max scratch1 = C.plength scratch1 ∧ C.writable scratch1 = true) ∧ (C.zone1 r3 = C.zone1 ror ∧ C.max r3 = C.min ror ∧ C.writable r3 = true ∧ C.writable ror = true) ∧ (∀(r4 : C.ptr (BitVec 64)), List.length (C.data r4) = List.length (C.data r3) ∧ C.offset r4 = C.offset r3 ∧ C.min r4 = C.min r3 ∧ C.writable r4 = C.writable r3 ∧ C.zone1 r4 = C.zone1 r3 → C.max r4 = C.max ror ∧ C.plength r4 = C.plength r3 ∧ (∀(i : ℤ), C.min r3 ≤ i ∧ i < C.max r3 → C.pelts r4 i = C.pelts r3 i) ∧ (∀(i : ℤ), C.min ror ≤ i ∧ i < C.max ror → C.pelts r4 i = C.pelts ror i) → (C.zone1 rol = C.zone1 r4 ∧ C.max rol = C.min r4 ∧ C.writable rol = true ∧ C.writable r4 = true) ∧ (∀(r5 : C.ptr (BitVec 64)), List.length (C.data r5) = List.length (C.data r4) ∧ C.offset r5 = C.offset r4 ∧ C.max r5 = C.max r4 ∧ C.writable r5 = C.writable r4 ∧ C.zone1 r5 = C.zone1 r4 → C.min r5 = C.min rol ∧ C.plength r5 = C.plength r4 ∧ (∀(i : ℤ), C.min rol ≤ i ∧ i < C.max rol → C.pelts r5 i = C.pelts rol i) ∧ (∀(i : ℤ), C.min r4 ≤ i ∧ i < C.max r4 → C.pelts r5 i = C.pelts r4 i) → int'32_in_bounds (BitVec.toInt sx + BitVec.toInt sy) ∧ (∀(o9 : BitVec 32), BitVec.toInt o9 = BitVec.toInt sx + BitVec.toInt sy → int'32_in_bounds (BitVec.toInt o9 - (1 : ℤ)) ∧ (∀(o10 : BitVec 32), BitVec.toInt o10 = BitVec.toInt o9 - (1 : ℤ) → (C.min r5 ≤ C.offset r5 + BitVec.toInt o10 ∧ C.offset r5 + BitVec.toInt o10 < C.max r5) ∧ C.min r5 = C.min r ∧ C.max r5 = C.max r ∧ C.plength r5 = C.plength r ∧ Lemmas.value r5 (BitVec.toInt sx + BitVec.toInt sy) = Lemmas.value x (BitVec.toInt sx) * Lemmas.value y (BitVec.toInt sy) ∧ C.pelts r5 (C.offset r5 + BitVec.toInt o10) = C.pelts r5 (C.offset r5 + BitVec.toInt sx + BitVec.toInt sy - (1 : ℤ)) ∧ (∀(j : ℤ), C.min r5 ≤ j ∧ j < C.offset r5 ∨ C.offset r5 + BitVec.toInt sx + BitVec.toInt sy ≤ j ∧ j < C.max r5 → C.pelts r5 j = C.pelts r j)))))))))))))))))))))
  := sorry
end toom_Toom_wmpn_mulqtvc
