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
namespace toom_Toom_wmpn_toom22_mulqtvc
theorem wmpn_toom22_mul'vc (x : C.ptr (BitVec 64)) (sx : BitVec 32) (y : C.ptr (BitVec 64)) (sy : BitVec 32) (r : C.ptr (BitVec 64)) (k : ℤ) (scratch : C.ptr (BitVec 64)) (fact0 : C.valid x (BitVec.toInt sx)) (fact1 : C.valid y (BitVec.toInt sy)) (fact2 : C.valid r (BitVec.toInt sx + BitVec.toInt sy)) (fact3 : BitVec.toInt (29 : BitVec 32) < BitVec.toInt sy) (fact4 : (0 : ℤ) < k) (fact5 : k ≤ (64 : ℤ)) (fact6 : BitVec.toInt sx ≤ BitVec.toInt (29 : BitVec 32) * HPow.hPow (2 : ℤ) (Int.toNat k)) (fact7 : C.valid scratch ((2 : ℤ) * (BitVec.toInt sx + k))) (fact8 : C.writable r = true) (fact9 : C.writable scratch = true) (fact10 : (8 : ℤ) * BitVec.toInt sx < (2147483647 : ℤ)) (fact11 : (2 : ℤ) < BitVec.toInt sy) (fact12 : BitVec.toInt sy ≤ BitVec.toInt sx) (fact13 : BitVec.toInt sx < BitVec.toInt sy + BitVec.toInt sy - (1 : ℤ)) (fact14 : (4 : ℤ) * BitVec.toInt sx < (5 : ℤ) * BitVec.toInt sy) : ¬(2 : ℤ) = (0 : ℤ) ∧ int'32_in_bounds (Int.tdiv (BitVec.toInt sx) (2 : ℤ)) ∧ (∀(s : BitVec 32), BitVec.toInt s = Int.tdiv (BitVec.toInt sx) (2 : ℤ) → int'32_in_bounds (BitVec.toInt sx - BitVec.toInt s) ∧ (∀(n : BitVec 32), BitVec.toInt n = BitVec.toInt sx - BitVec.toInt s → int'32_in_bounds (BitVec.toInt sy - BitVec.toInt n) ∧ (∀(t : BitVec 32), BitVec.toInt t = BitVec.toInt sy - BitVec.toInt n → (C.min x ≤ C.offset x + BitVec.toInt n ∧ C.offset x + BitVec.toInt n ≤ C.max x) ∧ (∀(x1 : C.ptr (BitVec 64)), C.offset x1 = C.offset x + BitVec.toInt n ∧ C.plength x1 = C.plength x ∧ C.pelts x1 = C.pelts x ∧ C.data x1 = C.data x ∧ C.min x1 = C.min x ∧ C.max x1 = C.max x ∧ C.zone1 x1 = C.zone1 x ∧ C.writable x1 = C.writable x → (C.min y ≤ C.offset y + BitVec.toInt n ∧ C.offset y + BitVec.toInt n ≤ C.max y) ∧ (∀(y1 : C.ptr (BitVec 64)), C.offset y1 = C.offset y + BitVec.toInt n ∧ C.plength y1 = C.plength y ∧ C.pelts y1 = C.pelts y ∧ C.data y1 = C.data y ∧ C.min y1 = C.min y ∧ C.max y1 = C.max y ∧ C.zone1 y1 = C.zone1 y ∧ C.writable y1 = C.writable y → (let a0 : ℤ := Lemmas.value x (BitVec.toInt n); let a1 : ℤ := Lemmas.value x1 (BitVec.toInt s); let b0 : ℤ := Lemmas.value y (BitVec.toInt n); let b1 : ℤ := Lemmas.value y1 (BitVec.toInt t); let m : ℤ := HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n)); ((0 : ℤ) ≤ (0 : ℤ) ∧ (C.min r ≤ C.offset r - (0 : ℤ) ∧ C.offset r - (0 : ℤ) ≤ C.max r) ∧ C.writable r = true) ∧ (∀(r1 : C.ptr (BitVec 64)), C.offset r1 = C.offset r ∧ C.max r1 = C.max r ∧ C.writable r1 = C.writable r ∧ C.zone1 r1 = C.zone1 r → (∀(r' : C.ptr (BitVec 64)), C.writable r' = true ∧ C.offset r' = C.offset r1 - (0 : ℤ) ∧ C.min r1 = C.offset r1 - (0 : ℤ) ∧ C.min r' = C.min r ∧ C.max r' = C.offset r1 - (0 : ℤ) ∧ C.zone1 r' = C.zone1 r1 ∧ C.pelts r1 = C.pelts r ∧ C.plength r1 = C.plength r ∧ C.pelts r' = C.pelts r ∧ C.plength r' = C.plength r → int'32_in_bounds (BitVec.toInt sx + BitVec.toInt sy) ∧ (∀(o1 : BitVec 32), BitVec.toInt o1 = BitVec.toInt sx + BitVec.toInt sy → ((0 : ℤ) ≤ BitVec.toInt o1 ∧ (C.min r1 ≤ C.offset r1 + BitVec.toInt o1 ∧ C.offset r1 + BitVec.toInt o1 ≤ C.max r1) ∧ C.writable r1 = true) ∧ (∀(r2 : C.ptr (BitVec 64)), C.offset r2 = C.offset r1 ∧ C.min r2 = C.min r1 ∧ C.writable r2 = C.writable r1 ∧ C.zone1 r2 = C.zone1 r1 → (∀(ro : C.ptr (BitVec 64)), C.writable ro = true ∧ C.offset ro = C.offset r2 + BitVec.toInt o1 ∧ C.max r2 = C.offset r2 + BitVec.toInt o1 ∧ C.min ro = C.offset r2 + BitVec.toInt o1 ∧ C.max ro = C.max r1 ∧ C.zone1 ro = C.zone1 r2 ∧ C.pelts r2 = C.pelts r1 ∧ C.plength r2 = C.plength r1 ∧ C.pelts ro = C.pelts r1 ∧ C.plength ro = C.plength r1 → ((0 : ℤ) ≤ (0 : ℤ) ∧ (C.min scratch ≤ C.offset scratch - (0 : ℤ) ∧ C.offset scratch - (0 : ℤ) ≤ C.max scratch) ∧ C.writable scratch = true) ∧ (∀(scratch1 : C.ptr (BitVec 64)), C.offset scratch1 = C.offset scratch ∧ C.max scratch1 = C.max scratch ∧ C.writable scratch1 = C.writable scratch ∧ C.zone1 scratch1 = C.zone1 scratch → (∀(scratch' : C.ptr (BitVec 64)), C.writable scratch' = true ∧ C.offset scratch' = C.offset scratch1 - (0 : ℤ) ∧ C.min scratch1 = C.offset scratch1 - (0 : ℤ) ∧ C.min scratch' = C.min scratch ∧ C.max scratch' = C.offset scratch1 - (0 : ℤ) ∧ C.zone1 scratch' = C.zone1 scratch1 ∧ C.pelts scratch1 = C.pelts scratch ∧ C.plength scratch1 = C.plength scratch ∧ C.pelts scratch' = C.pelts scratch ∧ C.plength scratch' = C.plength scratch → int'32_in_bounds (BitVec.toInt n + BitVec.toInt n) ∧ (∀(o2 : BitVec 32), BitVec.toInt o2 = BitVec.toInt n + BitVec.toInt n → ((0 : ℤ) ≤ BitVec.toInt o2 ∧ (C.min scratch1 ≤ C.offset scratch1 + BitVec.toInt o2 ∧ C.offset scratch1 + BitVec.toInt o2 ≤ C.max scratch1) ∧ C.writable scratch1 = true) ∧ (∀(scratch2 : C.ptr (BitVec 64)), C.offset scratch2 = C.offset scratch1 ∧ C.min scratch2 = C.min scratch1 ∧ C.writable scratch2 = C.writable scratch1 ∧ C.zone1 scratch2 = C.zone1 scratch1 → (∀(s_out : C.ptr (BitVec 64)), C.writable s_out = true ∧ C.offset s_out = C.offset scratch2 + BitVec.toInt o2 ∧ C.max scratch2 = C.offset scratch2 + BitVec.toInt o2 ∧ C.min s_out = C.offset scratch2 + BitVec.toInt o2 ∧ C.max s_out = C.max scratch1 ∧ C.zone1 s_out = C.zone1 scratch2 ∧ C.pelts scratch2 = C.pelts scratch1 ∧ C.plength scratch2 = C.plength scratch1 ∧ C.pelts s_out = C.pelts scratch1 ∧ C.plength s_out = C.plength scratch1 → int'32_in_bounds (BitVec.toInt n + BitVec.toInt n) ∧ (∀(o3 : BitVec 32), BitVec.toInt o3 = BitVec.toInt n + BitVec.toInt n → ((0 : ℤ) ≤ BitVec.toInt o3 ∧ (C.min r2 ≤ C.offset r2 + BitVec.toInt o3 ∧ C.offset r2 + BitVec.toInt o3 ≤ C.max r2) ∧ C.writable r2 = true) ∧ (∀(r3 : C.ptr (BitVec 64)), C.offset r3 = C.offset r2 ∧ C.min r3 = C.min r2 ∧ C.writable r3 = C.writable r2 ∧ C.zone1 r3 = C.zone1 r2 → (∀(vinf : C.ptr (BitVec 64)), C.writable vinf = true ∧ C.offset vinf = C.offset r3 + BitVec.toInt o3 ∧ C.max r3 = C.offset r3 + BitVec.toInt o3 ∧ C.min vinf = C.offset r3 + BitVec.toInt o3 ∧ C.max vinf = C.max r2 ∧ C.zone1 vinf = C.zone1 r3 ∧ C.pelts r3 = C.pelts r2 ∧ C.plength r3 = C.plength r2 ∧ C.pelts vinf = C.pelts r2 ∧ C.plength vinf = C.plength r2 → ((0 : ℤ) ≤ BitVec.toInt n ∧ (C.min r3 ≤ C.offset r3 + BitVec.toInt n ∧ C.offset r3 + BitVec.toInt n ≤ C.max r3) ∧ C.writable r3 = true) ∧ (∀(r4 : C.ptr (BitVec 64)), C.offset r4 = C.offset r3 ∧ C.min r4 = C.min r3 ∧ C.writable r4 = C.writable r3 ∧ C.zone1 r4 = C.zone1 r3 → C.offset r4 = C.offset r3 ∧ C.min r4 = C.min r3 ∧ C.writable r4 = C.writable r3 ∧ C.zone1 r4 = C.zone1 r3 → (∀(ysm1 : C.ptr (BitVec 64)), C.writable ysm1 = true ∧ C.offset ysm1 = C.offset r4 + BitVec.toInt n ∧ C.max r4 = C.offset r4 + BitVec.toInt n ∧ C.min ysm1 = C.offset r4 + BitVec.toInt n ∧ C.max ysm1 = C.max r3 ∧ C.zone1 ysm1 = C.zone1 r4 ∧ C.pelts r4 = C.pelts r3 ∧ C.plength r4 = C.plength r3 ∧ C.pelts ysm1 = C.pelts r3 ∧ C.plength ysm1 = C.plength r3 → (∀(o4 : Bool), (BitVec.toInt s = BitVec.toInt n → o4 = true) ∧ (o4 = true → s = n) → (if o4 = true then ((C.valid x (BitVec.toInt n) ∧ C.valid x1 (BitVec.toInt n)) ∧ (∀(o5 : BitVec 32), BitVec.toInt o5 = Compare.compare_int (Lemmas.value x (BitVec.toInt n)) (Lemmas.value x1 (BitVec.toInt n)) → (BitVec.toInt o5 < (0 : ℤ)) = (Lemmas.value x (BitVec.toInt n) < Lemmas.value x1 (BitVec.toInt n)))) ∧ (if Lemmas.value x (BitVec.toInt n) < Lemmas.value x1 (BitVec.toInt n) then (C.valid x1 (BitVec.toInt n) ∧ C.valid x (BitVec.toInt n) ∧ C.valid r4 (BitVec.toInt n) ∧ C.writable r4 = true) ∧ (∀(xsm1 : C.ptr (BitVec 64)), List.length (C.data xsm1) = List.length (C.data r4) ∧ C.offset xsm1 = C.offset r4 ∧ C.min xsm1 = C.min r4 ∧ C.max xsm1 = C.max r4 ∧ C.writable xsm1 = C.writable r4 ∧ C.zone1 xsm1 = C.zone1 r4 → (∀(b : BitVec 64), ((0 : ℤ) ≤ BitVec.toUInt b ∧ BitVec.toUInt b ≤ (1 : ℤ)) ∧ Lemmas.value xsm1 (BitVec.toInt n) - HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n)) * BitVec.toUInt b = Lemmas.value x1 (BitVec.toInt n) - Lemmas.value x (BitVec.toInt n) ∧ (∀(j : ℤ), j < C.offset xsm1 ∨ C.offset xsm1 + BitVec.toInt n ≤ j → C.pelts xsm1 j = C.pelts r4 j) → Lemmas.value xsm1 (BitVec.toInt n) = a1 - a0 ∨ ¬True ∧ Lemmas.value xsm1 (BitVec.toInt n) = a0 - a1)) else (C.valid x (BitVec.toInt n) ∧ C.valid x1 (BitVec.toInt n) ∧ C.valid r4 (BitVec.toInt n) ∧ C.writable r4 = true) ∧ (∀(xsm1 : C.ptr (BitVec 64)), List.length (C.data xsm1) = List.length (C.data r4) ∧ C.offset xsm1 = C.offset r4 ∧ C.min xsm1 = C.min r4 ∧ C.max xsm1 = C.max r4 ∧ C.writable xsm1 = C.writable r4 ∧ C.zone1 xsm1 = C.zone1 r4 → (∀(b : BitVec 64), ((0 : ℤ) ≤ BitVec.toUInt b ∧ BitVec.toUInt b ≤ (1 : ℤ)) ∧ Lemmas.value xsm1 (BitVec.toInt n) - HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n)) * BitVec.toUInt b = Lemmas.value x (BitVec.toInt n) - Lemmas.value x1 (BitVec.toInt n) ∧ (∀(j : ℤ), j < C.offset xsm1 ∨ C.offset xsm1 + BitVec.toInt n ≤ j → C.pelts xsm1 j = C.pelts r4 j) → Lemmas.value xsm1 (BitVec.toInt n) = a0 - a1))) else (C.min x ≤ C.offset x + BitVec.toInt s ∧ C.offset x + BitVec.toInt s < C.max x) ∧ (let o5 : BitVec 64 := C.pelts x (C.offset x + BitVec.toInt s); ∀(o6 : Bool), (BitVec.toUInt o5 = BitVec.toUInt (0 : BitVec 64) → o6 = true) ∧ (o6 = true → o5 = (0 : BitVec 64)) → (o6 = true → C.valid x (BitVec.toInt s) ∧ C.valid x1 (BitVec.toInt s)) ∧ (∀(o7 : Bool), (if o6 = true then ∃(o8 : BitVec 32), BitVec.toInt o8 = Compare.compare_int (Lemmas.value x (BitVec.toInt s)) (Lemmas.value x1 (BitVec.toInt s)) ∧ o7 = (if BitVec.toInt o8 < (0 : ℤ) then true else false) else o7 = false) → (if o7 = true then (C.valid x1 (BitVec.toInt s) ∧ C.valid x (BitVec.toInt s) ∧ C.valid r4 (BitVec.toInt s) ∧ C.writable r4 = true) ∧ (∀(xsm1 : C.ptr (BitVec 64)), List.length (C.data xsm1) = List.length (C.data r4) ∧ C.offset xsm1 = C.offset r4 ∧ C.min xsm1 = C.min r4 ∧ C.max xsm1 = C.max r4 ∧ C.writable xsm1 = C.writable r4 ∧ C.zone1 xsm1 = C.zone1 r4 → (∀(b : BitVec 64), ((0 : ℤ) ≤ BitVec.toUInt b ∧ BitVec.toUInt b ≤ (1 : ℤ)) ∧ Lemmas.value xsm1 (BitVec.toInt s) - HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt s)) * BitVec.toUInt b = Lemmas.value x1 (BitVec.toInt s) - Lemmas.value x (BitVec.toInt s) ∧ (∀(j : ℤ), j < C.offset xsm1 ∨ C.offset xsm1 + BitVec.toInt s ≤ j → C.pelts xsm1 j = C.pelts r4 j) → ((C.min xsm1 ≤ C.offset xsm1 + BitVec.toInt s ∧ C.offset xsm1 + BitVec.toInt s < C.max xsm1) ∧ C.writable xsm1 = true) ∧ (∀(xsm11 : C.ptr (BitVec 64)), List.length (C.data xsm11) = List.length (C.data xsm1) ∧ C.offset xsm11 = C.offset xsm1 ∧ C.min xsm11 = C.min xsm1 ∧ C.max xsm11 = C.max xsm1 ∧ C.writable xsm11 = C.writable xsm1 ∧ C.zone1 xsm11 = C.zone1 xsm1 → C.pelts xsm11 = Function.update (C.pelts xsm1) (C.offset xsm11 + BitVec.toInt s) (0 : BitVec 64) ∧ C.pelts xsm11 (C.offset xsm11 + BitVec.toInt s) = (0 : BitVec 64) → Lemmas.value xsm11 (BitVec.toInt n) = a1 - a0 ∨ ¬True ∧ Lemmas.value xsm11 (BitVec.toInt n) = a0 - a1))) else (C.valid x (BitVec.toInt s) ∧ C.valid x1 (BitVec.toInt s) ∧ C.valid r4 (BitVec.toInt s) ∧ C.writable r4 = true) ∧ (∀(xsm1 : C.ptr (BitVec 64)), List.length (C.data xsm1) = List.length (C.data r4) ∧ C.offset xsm1 = C.offset r4 ∧ C.min xsm1 = C.min r4 ∧ C.max xsm1 = C.max r4 ∧ C.writable xsm1 = C.writable r4 ∧ C.zone1 xsm1 = C.zone1 r4 → (∀(b : BitVec 64), ((0 : ℤ) ≤ BitVec.toUInt b ∧ BitVec.toUInt b ≤ (1 : ℤ)) ∧ Lemmas.value xsm1 (BitVec.toInt s) - HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt s)) * BitVec.toUInt b = Lemmas.value x (BitVec.toInt s) - Lemmas.value x1 (BitVec.toInt s) ∧ (∀(j : ℤ), j < C.offset xsm1 ∨ C.offset xsm1 + BitVec.toInt s ≤ j → C.pelts xsm1 j = C.pelts r4 j) → (C.min x ≤ C.offset x + BitVec.toInt s ∧ C.offset x + BitVec.toInt s < C.max x) ∧ (let lx : BitVec 64 := C.pelts x (C.offset x + BitVec.toInt s); uint'64_in_bounds (BitVec.toUInt lx - BitVec.toUInt b) ∧ (∀(o8 : BitVec 64), BitVec.toUInt o8 = BitVec.toUInt lx - BitVec.toUInt b → ((C.min xsm1 ≤ C.offset xsm1 + BitVec.toInt s ∧ C.offset xsm1 + BitVec.toInt s < C.max xsm1) ∧ C.writable xsm1 = true) ∧ (∀(xsm11 : C.ptr (BitVec 64)), List.length (C.data xsm11) = List.length (C.data xsm1) ∧ C.offset xsm11 = C.offset xsm1 ∧ C.min xsm11 = C.min xsm1 ∧ C.max xsm11 = C.max xsm1 ∧ C.writable xsm11 = C.writable xsm1 ∧ C.zone1 xsm11 = C.zone1 xsm1 → C.pelts xsm11 = Function.update (C.pelts xsm1) (C.offset xsm11 + BitVec.toInt s) o8 ∧ C.pelts xsm11 (C.offset xsm11 + BitVec.toInt s) = o8 → Lemmas.value xsm11 (BitVec.toInt n) = a0 - a1)))))))))) ∧ (∀(vm1_neg : Bool) (r5 : C.ptr (BitVec 64)), List.length (C.data r5) = List.length (C.data r4) ∧ C.offset r5 = C.offset r4 ∧ C.min r5 = C.min r4 ∧ C.max r5 = C.max r4 ∧ C.writable r5 = C.writable r4 ∧ C.zone1 r5 = C.zone1 r4 → List.length (C.data r5) = List.length (C.data r4) ∧ C.offset r5 = C.offset r4 ∧ C.min r5 = C.min r4 ∧ C.max r5 = C.max r4 ∧ C.writable r5 = C.writable r4 ∧ C.zone1 r5 = C.zone1 r4 → vm1_neg = true ∧ Lemmas.value r5 (BitVec.toInt n) = a1 - a0 ∨ ¬vm1_neg = true ∧ Lemmas.value r5 (BitVec.toInt n) = a0 - a1 → (∀(o4 : Bool), (BitVec.toInt t = BitVec.toInt n → o4 = true) ∧ (o4 = true → t = n) → (if o4 = true then ((C.valid y (BitVec.toInt n) ∧ C.valid y1 (BitVec.toInt n)) ∧ (∀(o5 : BitVec 32), BitVec.toInt o5 = Compare.compare_int (Lemmas.value y (BitVec.toInt n)) (Lemmas.value y1 (BitVec.toInt n)) → (BitVec.toInt o5 < (0 : ℤ)) = (Lemmas.value y (BitVec.toInt n) < Lemmas.value y1 (BitVec.toInt n)))) ∧ (if Lemmas.value y (BitVec.toInt n) < Lemmas.value y1 (BitVec.toInt n) then (C.valid y1 (BitVec.toInt n) ∧ C.valid y (BitVec.toInt n) ∧ C.valid ysm1 (BitVec.toInt n) ∧ C.writable ysm1 = true) ∧ (∀(ysm11 : C.ptr (BitVec 64)), List.length (C.data ysm11) = List.length (C.data ysm1) ∧ C.offset ysm11 = C.offset ysm1 ∧ C.min ysm11 = C.min ysm1 ∧ C.max ysm11 = C.max ysm1 ∧ C.writable ysm11 = C.writable ysm1 ∧ C.zone1 ysm11 = C.zone1 ysm1 → (∀(b : BitVec 64), ((0 : ℤ) ≤ BitVec.toUInt b ∧ BitVec.toUInt b ≤ (1 : ℤ)) ∧ Lemmas.value ysm11 (BitVec.toInt n) - HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n)) * BitVec.toUInt b = Lemmas.value y1 (BitVec.toInt n) - Lemmas.value y (BitVec.toInt n) ∧ (∀(j : ℤ), j < C.offset ysm11 ∨ C.offset ysm11 + BitVec.toInt n ≤ j → C.pelts ysm11 j = C.pelts ysm1 j) → (if vm1_neg = true then false else true) = vm1_neg ∧ Lemmas.value ysm11 (BitVec.toInt n) = b0 - b1 ∨ ((if vm1_neg = true then false else true) = true) = (¬vm1_neg = true) ∧ Lemmas.value ysm11 (BitVec.toInt n) = b1 - b0)) else (C.valid y (BitVec.toInt n) ∧ C.valid y1 (BitVec.toInt n) ∧ C.valid ysm1 (BitVec.toInt n) ∧ C.writable ysm1 = true) ∧ (∀(ysm11 : C.ptr (BitVec 64)), List.length (C.data ysm11) = List.length (C.data ysm1) ∧ C.offset ysm11 = C.offset ysm1 ∧ C.min ysm11 = C.min ysm1 ∧ C.max ysm11 = C.max ysm1 ∧ C.writable ysm11 = C.writable ysm1 ∧ C.zone1 ysm11 = C.zone1 ysm1 → (∀(b : BitVec 64), ((0 : ℤ) ≤ BitVec.toUInt b ∧ BitVec.toUInt b ≤ (1 : ℤ)) ∧ Lemmas.value ysm11 (BitVec.toInt n) - HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n)) * BitVec.toUInt b = Lemmas.value y (BitVec.toInt n) - Lemmas.value y1 (BitVec.toInt n) ∧ (∀(j : ℤ), j < C.offset ysm11 ∨ C.offset ysm11 + BitVec.toInt n ≤ j → C.pelts ysm11 j = C.pelts ysm1 j) → Lemmas.value ysm11 (BitVec.toInt n) = b0 - b1 ∨ (vm1_neg = true) = (¬vm1_neg = true) ∧ Lemmas.value ysm11 (BitVec.toInt n) = b1 - b0))) else (C.min y ≤ C.offset y + BitVec.toInt t ∧ C.offset y + BitVec.toInt t ≤ C.max y) ∧ (∀(y0t : C.ptr (BitVec 64)), C.offset y0t = C.offset y + BitVec.toInt t ∧ C.plength y0t = C.plength y ∧ C.pelts y0t = C.pelts y ∧ C.data y0t = C.data y ∧ C.min y0t = C.min y ∧ C.max y0t = C.max y ∧ C.zone1 y0t = C.zone1 y ∧ C.writable y0t = C.writable y → int'32_in_bounds (BitVec.toInt n - BitVec.toInt t) ∧ (∀(o5 : BitVec 32), BitVec.toInt o5 = BitVec.toInt n - BitVec.toInt t → C.valid y0t (BitVec.toInt o5) ∧ (∀(o6 : BitVec 32), ((0 : ℤ) ≤ BitVec.toInt o6 ∧ BitVec.toInt o6 ≤ (1 : ℤ)) ∧ (BitVec.toInt o6 = (1 : ℤ)) = (Lemmas.value y0t (BitVec.toInt o5) = (0 : ℤ)) → (∀(c0 : Bool), (BitVec.toInt o6 = BitVec.toInt (1 : BitVec 32) → c0 = true) ∧ (c0 = true → o6 = (1 : BitVec 32)) → (C.valid y (BitVec.toInt t) ∧ C.valid y1 (BitVec.toInt t)) ∧ (∀(o7 : BitVec 32), BitVec.toInt o7 = Compare.compare_int (Lemmas.value y (BitVec.toInt t)) (Lemmas.value y1 (BitVec.toInt t)) → (if c0 = true ∧ BitVec.toInt o7 < (0 : ℤ) then (C.valid y1 (BitVec.toInt t) ∧ C.valid y (BitVec.toInt t) ∧ C.valid ysm1 (BitVec.toInt t) ∧ C.writable ysm1 = true) ∧ (∀(ysm11 : C.ptr (BitVec 64)), List.length (C.data ysm11) = List.length (C.data ysm1) ∧ C.offset ysm11 = C.offset ysm1 ∧ C.min ysm11 = C.min ysm1 ∧ C.max ysm11 = C.max ysm1 ∧ C.writable ysm11 = C.writable ysm1 ∧ C.zone1 ysm11 = C.zone1 ysm1 → (∀(b : BitVec 64), ((0 : ℤ) ≤ BitVec.toUInt b ∧ BitVec.toUInt b ≤ (1 : ℤ)) ∧ Lemmas.value ysm11 (BitVec.toInt t) - HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt t)) * BitVec.toUInt b = Lemmas.value y1 (BitVec.toInt t) - Lemmas.value y (BitVec.toInt t) ∧ (∀(j : ℤ), j < C.offset ysm11 ∨ C.offset ysm11 + BitVec.toInt t ≤ j → C.pelts ysm11 j = C.pelts ysm1 j) → (C.min ysm11 ≤ C.offset ysm11 + BitVec.toInt t ∧ C.offset ysm11 + BitVec.toInt t ≤ C.max ysm11) ∧ (∀(ysm1t : C.ptr (BitVec 64)), C.offset ysm1t = C.offset ysm11 + BitVec.toInt t ∧ C.plength ysm1t = C.plength ysm11 ∧ C.pelts ysm1t = C.pelts ysm11 ∧ C.data ysm1t = C.data ysm11 ∧ C.min ysm1t = C.min ysm11 ∧ C.max ysm1t = C.max ysm11 ∧ C.zone1 ysm1t = C.zone1 ysm11 ∧ C.writable ysm1t = C.writable ysm11 → int'32_in_bounds (BitVec.toInt n - BitVec.toInt t) ∧ (∀(o8 : BitVec 32), BitVec.toInt o8 = BitVec.toInt n - BitVec.toInt t → (C.valid ysm1t (BitVec.toInt o8) ∧ C.writable ysm1t = true) ∧ (∀(ysm1t1 : C.ptr (BitVec 64)) (ysm12 : C.ptr (BitVec 64)), C.data ysm1t1 = C.data ysm12 ∧ List.length (C.data ysm12) = List.length (C.data ysm1t) ∧ C.offset ysm1t1 = C.offset ysm1t ∧ C.min ysm1t1 = C.min ysm1t ∧ C.max ysm1t1 = C.max ysm1t ∧ C.writable ysm1t1 = C.writable ysm1t ∧ C.zone1 ysm1t1 = C.zone1 ysm1t → List.length (C.data ysm12) = List.length (C.data ysm11) ∧ C.offset ysm12 = C.offset ysm11 ∧ C.min ysm12 = C.min ysm11 ∧ C.max ysm12 = C.max ysm11 ∧ C.writable ysm12 = C.writable ysm11 ∧ C.zone1 ysm12 = C.zone1 ysm11 → Lemmas.value ysm1t1 (BitVec.toInt o8) = (0 : ℤ) ∧ (∀(j : ℤ), j < C.offset ysm1t1 ∨ C.offset ysm1t1 + BitVec.toInt o8 ≤ j → C.pelts ysm1t1 j = C.pelts ysm1t j) → (if vm1_neg = true then false else true) = vm1_neg ∧ Lemmas.value ysm12 (BitVec.toInt n) = b0 - b1 ∨ ((if vm1_neg = true then false else true) = true) = (¬vm1_neg = true) ∧ Lemmas.value ysm12 (BitVec.toInt n) = b1 - b0))))) else (((0 : ℤ) ≤ BitVec.toInt t ∧ BitVec.toInt t ≤ BitVec.toInt n) ∧ C.valid y (BitVec.toInt n) ∧ C.valid y1 (BitVec.toInt t) ∧ C.valid ysm1 (BitVec.toInt n) ∧ C.writable ysm1 = true) ∧ (∀(ysm11 : C.ptr (BitVec 64)), List.length (C.data ysm11) = List.length (C.data ysm1) ∧ C.offset ysm11 = C.offset ysm1 ∧ C.min ysm11 = C.min ysm1 ∧ C.max ysm11 = C.max ysm1 ∧ C.writable ysm11 = C.writable ysm1 ∧ C.zone1 ysm11 = C.zone1 ysm1 → (∀(b : BitVec 64), Lemmas.value ysm11 (BitVec.toInt n) - HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n)) * BitVec.toUInt b = Lemmas.value y (BitVec.toInt n) - Lemmas.value y1 (BitVec.toInt t) ∧ (∀(j : ℤ), j < C.offset ysm11 ∨ C.offset ysm11 + BitVec.toInt n ≤ j → C.pelts ysm11 j = C.pelts ysm1 j) ∧ (0 : ℤ) ≤ BitVec.toUInt b ∧ BitVec.toUInt b ≤ (1 : ℤ) → Lemmas.value ysm11 (BitVec.toInt n) = b0 - b1 ∨ (vm1_neg = true) = (¬vm1_neg = true) ∧ Lemmas.value ysm11 (BitVec.toInt n) = b1 - b0)))))))))) ∧ (∀(vm1_neg1 : Bool) (ysm11 : C.ptr (BitVec 64)), List.length (C.data ysm11) = List.length (C.data ysm1) ∧ C.offset ysm11 = C.offset ysm1 ∧ C.min ysm11 = C.min ysm1 ∧ C.max ysm11 = C.max ysm1 ∧ C.writable ysm11 = C.writable ysm1 ∧ C.zone1 ysm11 = C.zone1 ysm1 → vm1_neg1 = vm1_neg ∧ Lemmas.value ysm11 (BitVec.toInt n) = b0 - b1 ∨ (vm1_neg1 = true) = (¬vm1_neg = true) ∧ Lemmas.value ysm11 (BitVec.toInt n) = b1 - b0 → (let asm1_abs : ℤ := Lemmas.value r5 (BitVec.toInt n); let bsm1_abs : ℤ := Lemmas.value ysm11 (BitVec.toInt n); let o4 : ℤ := k - (1 : ℤ); (((0 : ℤ) ≤ k + k ∧ o4 + o4 + (1 : ℤ) < k + k) ∧ C.valid r5 (BitVec.toInt n) ∧ C.valid ysm11 (BitVec.toInt n) ∧ C.valid scratch2 (BitVec.toInt n + BitVec.toInt n) ∧ (C.writable scratch2 = true ∧ C.writable s_out = true) ∧ (0 : ℤ) < BitVec.toInt n ∧ (8 : ℤ) * BitVec.toInt n < (2147483647 : ℤ) ∧ ((0 : ℤ) ≤ o4 ∧ o4 ≤ (64 : ℤ)) ∧ BitVec.toInt n ≤ BitVec.toInt (29 : BitVec 32) * HPow.hPow (2 : ℤ) (Int.toNat o4) ∧ C.valid s_out ((2 : ℤ) * (BitVec.toInt n + o4))) ∧ (∀(s_out1 : C.ptr (BitVec 64)) (scratch3 : C.ptr (BitVec 64)), C.offset s_out1 = C.offset s_out ∧ C.writable s_out1 = C.writable s_out ∧ C.zone1 s_out1 = C.zone1 s_out → C.offset scratch3 = C.offset scratch2 ∧ C.writable scratch3 = C.writable scratch2 ∧ C.zone1 scratch3 = C.zone1 scratch2 → Lemmas.value scratch3 (BitVec.toInt n + BitVec.toInt n) = Lemmas.value r5 (BitVec.toInt n) * Lemmas.value ysm11 (BitVec.toInt n) ∧ (∀(j : ℤ), C.min scratch3 ≤ j ∧ j < C.offset scratch3 ∨ C.offset scratch3 + BitVec.toInt n + BitVec.toInt n ≤ j ∧ j < C.max scratch3 → C.pelts scratch3 j = C.pelts scratch2 j) ∧ (∀(j : ℤ), C.min s_out1 ≤ j ∧ j < C.offset s_out1 → C.pelts s_out1 j = C.pelts s_out j) ∧ C.min scratch3 = C.min scratch2 ∧ C.max scratch3 = C.max scratch2 ∧ C.plength scratch3 = C.plength scratch2 ∧ C.min s_out1 = C.min s_out ∧ C.max s_out1 = C.max s_out ∧ C.plength s_out1 = C.plength s_out → (C.zone1 r5 = C.zone1 ysm11 ∧ C.max r5 = C.min ysm11 ∧ C.writable r5 = true ∧ C.writable ysm11 = true) ∧ (∀(r6 : C.ptr (BitVec 64)), List.length (C.data r6) = List.length (C.data r5) ∧ C.offset r6 = C.offset r5 ∧ C.min r6 = C.min r5 ∧ C.writable r6 = C.writable r5 ∧ C.zone1 r6 = C.zone1 r5 → C.max r6 = C.max ysm11 ∧ C.plength r6 = C.plength r5 ∧ (∀(i : ℤ), C.min r5 ≤ i ∧ i < C.max r5 → C.pelts r6 i = C.pelts r5 i) ∧ (∀(i : ℤ), C.min ysm11 ≤ i ∧ i < C.max ysm11 → C.pelts r6 i = C.pelts ysm11 i) → ((∀(s_out2 : C.ptr (BitVec 64)), C.offset s_out2 = C.offset s_out1 ∧ C.writable s_out2 = C.writable s_out1 ∧ C.zone1 s_out2 = C.zone1 s_out1 → (∀(s1 : BitVec 32) (n1 : BitVec 32), C.valid s_out2 ((2 : ℤ) * (BitVec.toInt n1 + (k - (1 : ℤ)))) ∧ (0 : ℤ) ≤ BitVec.toInt s1 ∧ BitVec.toInt s1 ≤ BitVec.toInt n1 → C.valid s_out2 ((2 : ℤ) * (BitVec.toInt s1 + (k - (1 : ℤ)))))) ∧ (if BitVec.toInt t < BitVec.toInt s then let o5 : ℤ := k - (1 : ℤ); (((0 : ℤ) ≤ k + k ∧ o5 + o5 + (1 : ℤ) < k + k) ∧ C.valid x1 (BitVec.toInt s) ∧ C.valid y1 (BitVec.toInt t) ∧ C.valid vinf (BitVec.toInt s + BitVec.toInt t) ∧ (C.writable vinf = true ∧ C.writable s_out1 = true) ∧ ((0 : ℤ) < BitVec.toInt t ∧ BitVec.toInt t ≤ BitVec.toInt s ∧ BitVec.toInt s ≤ BitVec.toInt t + BitVec.toInt t) ∧ (8 : ℤ) * BitVec.toInt s < (2147483647 : ℤ) ∧ ((0 : ℤ) ≤ o5 ∧ o5 ≤ (64 : ℤ)) ∧ BitVec.toInt s ≤ BitVec.toInt (29 : BitVec 32) * HPow.hPow (2 : ℤ) (Int.toNat o5) ∧ C.valid s_out1 ((2 : ℤ) * (BitVec.toInt s + o5))) ∧ (∀(vinf1 : C.ptr (BitVec 64)) (s_out2 : C.ptr (BitVec 64)), C.offset vinf1 = C.offset vinf ∧ C.writable vinf1 = C.writable vinf ∧ C.zone1 vinf1 = C.zone1 vinf → C.offset s_out2 = C.offset s_out1 ∧ C.writable s_out2 = C.writable s_out1 ∧ C.zone1 s_out2 = C.zone1 s_out1 → Lemmas.value vinf1 (BitVec.toInt s + BitVec.toInt t) = Lemmas.value x1 (BitVec.toInt s) * Lemmas.value y1 (BitVec.toInt t) ∧ (∀(j : ℤ), C.min vinf1 ≤ j ∧ j < C.offset vinf1 ∨ C.offset vinf1 + BitVec.toInt s + BitVec.toInt t ≤ j ∧ j < C.max vinf1 → C.pelts vinf1 j = C.pelts vinf j) ∧ (∀(j : ℤ), C.min s_out2 ≤ j ∧ j < C.offset s_out2 → C.pelts s_out2 j = C.pelts s_out1 j) ∧ C.min vinf1 = C.min vinf ∧ C.max vinf1 = C.max vinf ∧ C.plength vinf1 = C.plength vinf ∧ C.min s_out2 = C.min s_out1 ∧ C.max s_out2 = C.max s_out1 ∧ C.plength s_out2 = C.plength s_out1 → (let o6 : ℤ := k - (1 : ℤ); (((0 : ℤ) ≤ k + k ∧ o6 + o6 + (1 : ℤ) < k + k) ∧ C.valid x (BitVec.toInt n) ∧ C.valid y (BitVec.toInt n) ∧ C.valid r6 (BitVec.toInt n + BitVec.toInt n) ∧ (C.writable r6 = true ∧ C.writable s_out2 = true) ∧ (0 : ℤ) < BitVec.toInt n ∧ (8 : ℤ) * BitVec.toInt n < (2147483647 : ℤ) ∧ ((0 : ℤ) ≤ o6 ∧ o6 ≤ (64 : ℤ)) ∧ BitVec.toInt n ≤ BitVec.toInt (29 : BitVec 32) * HPow.hPow (2 : ℤ) (Int.toNat o6) ∧ C.valid s_out2 ((2 : ℤ) * (BitVec.toInt n + o6))) ∧ (∀(s_out3 : C.ptr (BitVec 64)) (r7 : C.ptr (BitVec 64)), C.offset r7 = C.offset r6 ∧ C.writable r7 = C.writable r6 ∧ C.zone1 r7 = C.zone1 r6 → C.offset s_out3 = C.offset s_out2 ∧ C.writable s_out3 = C.writable s_out2 ∧ C.zone1 s_out3 = C.zone1 s_out2 → C.offset r7 = C.offset r6 ∧ C.writable r7 = C.writable r6 ∧ C.zone1 r7 = C.zone1 r6 → Lemmas.value r7 (BitVec.toInt n + BitVec.toInt n) = Lemmas.value x (BitVec.toInt n) * Lemmas.value y (BitVec.toInt n) ∧ (∀(j : ℤ), C.min r7 ≤ j ∧ j < C.offset r7 ∨ C.offset r7 + BitVec.toInt n + BitVec.toInt n ≤ j ∧ j < C.max r7 → C.pelts r7 j = C.pelts r6 j) ∧ (∀(j : ℤ), C.min s_out3 ≤ j ∧ j < C.offset s_out3 → C.pelts s_out3 j = C.pelts s_out2 j) ∧ C.min r7 = C.min r6 ∧ C.max r7 = C.max r6 ∧ C.plength r7 = C.plength r6 ∧ C.min s_out3 = C.min s_out2 ∧ C.max s_out3 = C.max s_out2 ∧ C.plength s_out3 = C.plength s_out2 → Lemmas.value scratch3 (BitVec.toInt n + BitVec.toInt n) = asm1_abs * bsm1_abs ∧ Lemmas.value r7 (BitVec.toInt n + BitVec.toInt n) = a0 * b0 ∧ Lemmas.value vinf1 (BitVec.toInt s + BitVec.toInt t) = a1 * b1 ∧ C.min s_out3 = C.min s_out1 ∧ C.max s_out3 = C.max s_out1 ∧ C.min vinf1 = C.min vinf ∧ C.max vinf1 = C.max vinf ∧ C.plength vinf1 = C.plength vinf ∧ C.min r7 = C.min r6 ∧ C.max r7 = C.max r6 ∧ C.plength r7 = C.plength r6))) else let o5 : ℤ := k - (1 : ℤ); (((0 : ℤ) ≤ k + k ∧ o5 + o5 + (1 : ℤ) < k + k) ∧ C.valid x1 (BitVec.toInt s) ∧ C.valid y1 (BitVec.toInt s) ∧ C.valid vinf (BitVec.toInt s + BitVec.toInt s) ∧ (C.writable vinf = true ∧ C.writable s_out1 = true) ∧ (0 : ℤ) < BitVec.toInt s ∧ (8 : ℤ) * BitVec.toInt s < (2147483647 : ℤ) ∧ ((0 : ℤ) ≤ o5 ∧ o5 ≤ (64 : ℤ)) ∧ BitVec.toInt s ≤ BitVec.toInt (29 : BitVec 32) * HPow.hPow (2 : ℤ) (Int.toNat o5) ∧ C.valid s_out1 ((2 : ℤ) * (BitVec.toInt s + o5))) ∧ (∀(vinf1 : C.ptr (BitVec 64)) (s_out2 : C.ptr (BitVec 64)), C.offset vinf1 = C.offset vinf ∧ C.writable vinf1 = C.writable vinf ∧ C.zone1 vinf1 = C.zone1 vinf → C.offset s_out2 = C.offset s_out1 ∧ C.writable s_out2 = C.writable s_out1 ∧ C.zone1 s_out2 = C.zone1 s_out1 → Lemmas.value vinf1 (BitVec.toInt s + BitVec.toInt s) = Lemmas.value x1 (BitVec.toInt s) * Lemmas.value y1 (BitVec.toInt s) ∧ (∀(j : ℤ), C.min vinf1 ≤ j ∧ j < C.offset vinf1 ∨ C.offset vinf1 + BitVec.toInt s + BitVec.toInt s ≤ j ∧ j < C.max vinf1 → C.pelts vinf1 j = C.pelts vinf j) ∧ (∀(j : ℤ), C.min s_out2 ≤ j ∧ j < C.offset s_out2 → C.pelts s_out2 j = C.pelts s_out1 j) ∧ C.min vinf1 = C.min vinf ∧ C.max vinf1 = C.max vinf ∧ C.plength vinf1 = C.plength vinf ∧ C.min s_out2 = C.min s_out1 ∧ C.max s_out2 = C.max s_out1 ∧ C.plength s_out2 = C.plength s_out1 → (let o6 : ℤ := k - (1 : ℤ); (((0 : ℤ) ≤ k + k ∧ o6 + o6 + (1 : ℤ) < k + k) ∧ C.valid x (BitVec.toInt n) ∧ C.valid y (BitVec.toInt n) ∧ C.valid r6 (BitVec.toInt n + BitVec.toInt n) ∧ (C.writable r6 = true ∧ C.writable s_out2 = true) ∧ (0 : ℤ) < BitVec.toInt n ∧ (8 : ℤ) * BitVec.toInt n < (2147483647 : ℤ) ∧ ((0 : ℤ) ≤ o6 ∧ o6 ≤ (64 : ℤ)) ∧ BitVec.toInt n ≤ BitVec.toInt (29 : BitVec 32) * HPow.hPow (2 : ℤ) (Int.toNat o6) ∧ C.valid s_out2 ((2 : ℤ) * (BitVec.toInt n + o6))) ∧ (∀(s_out3 : C.ptr (BitVec 64)) (r7 : C.ptr (BitVec 64)), C.offset r7 = C.offset r6 ∧ C.writable r7 = C.writable r6 ∧ C.zone1 r7 = C.zone1 r6 → C.offset s_out3 = C.offset s_out2 ∧ C.writable s_out3 = C.writable s_out2 ∧ C.zone1 s_out3 = C.zone1 s_out2 → C.offset r7 = C.offset r6 ∧ C.writable r7 = C.writable r6 ∧ C.zone1 r7 = C.zone1 r6 → Lemmas.value r7 (BitVec.toInt n + BitVec.toInt n) = Lemmas.value x (BitVec.toInt n) * Lemmas.value y (BitVec.toInt n) ∧ (∀(j : ℤ), C.min r7 ≤ j ∧ j < C.offset r7 ∨ C.offset r7 + BitVec.toInt n + BitVec.toInt n ≤ j ∧ j < C.max r7 → C.pelts r7 j = C.pelts r6 j) ∧ (∀(j : ℤ), C.min s_out3 ≤ j ∧ j < C.offset s_out3 → C.pelts s_out3 j = C.pelts s_out2 j) ∧ C.min r7 = C.min r6 ∧ C.max r7 = C.max r6 ∧ C.plength r7 = C.plength r6 ∧ C.min s_out3 = C.min s_out2 ∧ C.max s_out3 = C.max s_out2 ∧ C.plength s_out3 = C.plength s_out2 → Lemmas.value scratch3 (BitVec.toInt n + BitVec.toInt n) = asm1_abs * bsm1_abs ∧ Lemmas.value r7 (BitVec.toInt n + BitVec.toInt n) = a0 * b0 ∧ Lemmas.value vinf1 (BitVec.toInt s + BitVec.toInt t) = a1 * b1 ∧ C.min s_out3 = C.min s_out1 ∧ C.max s_out3 = C.max s_out1 ∧ C.min vinf1 = C.min vinf ∧ C.max vinf1 = C.max vinf ∧ C.plength vinf1 = C.plength vinf ∧ C.min r7 = C.min r6 ∧ C.max r7 = C.max r6 ∧ C.plength r7 = C.plength r6))))) ∧ (∀(vinf1 : C.ptr (BitVec 64)) (s_out2 : C.ptr (BitVec 64)) (r7 : C.ptr (BitVec 64)), C.offset r7 = C.offset r6 ∧ C.writable r7 = C.writable r6 ∧ C.zone1 r7 = C.zone1 r6 → C.offset vinf1 = C.offset vinf ∧ C.writable vinf1 = C.writable vinf ∧ C.zone1 vinf1 = C.zone1 vinf → C.offset s_out2 = C.offset s_out1 ∧ C.writable s_out2 = C.writable s_out1 ∧ C.zone1 s_out2 = C.zone1 s_out1 → C.offset r7 = C.offset r6 ∧ C.writable r7 = C.writable r6 ∧ C.zone1 r7 = C.zone1 r6 → Lemmas.value scratch3 (BitVec.toInt n + BitVec.toInt n) = asm1_abs * bsm1_abs ∧ Lemmas.value r7 (BitVec.toInt n + BitVec.toInt n) = a0 * b0 ∧ Lemmas.value vinf1 (BitVec.toInt s + BitVec.toInt t) = a1 * b1 ∧ C.min s_out2 = C.min s_out1 ∧ C.max s_out2 = C.max s_out1 ∧ C.min vinf1 = C.min vinf ∧ C.max vinf1 = C.max vinf ∧ C.plength vinf1 = C.plength vinf ∧ C.min r7 = C.min r6 ∧ C.max r7 = C.max r6 ∧ C.plength r7 = C.plength r6 → ((0 : ℤ) ≤ BitVec.toInt n ∧ (C.min r7 ≤ C.offset r7 + BitVec.toInt n ∧ C.offset r7 + BitVec.toInt n ≤ C.max r7) ∧ C.writable r7 = true) ∧ (∀(r8 : C.ptr (BitVec 64)), C.offset r8 = C.offset r7 ∧ C.min r8 = C.min r7 ∧ C.writable r8 = C.writable r7 ∧ C.zone1 r8 = C.zone1 r7 → C.offset r8 = C.offset r7 ∧ C.min r8 = C.min r7 ∧ C.writable r8 = C.writable r7 ∧ C.zone1 r8 = C.zone1 r7 → (∀(v0n : C.ptr (BitVec 64)), C.writable v0n = true ∧ C.offset v0n = C.offset r8 + BitVec.toInt n ∧ C.max r8 = C.offset r8 + BitVec.toInt n ∧ C.min v0n = C.offset r8 + BitVec.toInt n ∧ C.max v0n = C.max r7 ∧ C.zone1 v0n = C.zone1 r8 ∧ C.pelts r8 = C.pelts r7 ∧ C.plength r8 = C.plength r7 ∧ C.pelts v0n = C.pelts r7 ∧ C.plength v0n = C.plength r7 → ((0 : ℤ) ≤ BitVec.toInt n ∧ (C.min vinf1 ≤ C.offset vinf1 + BitVec.toInt n ∧ C.offset vinf1 + BitVec.toInt n ≤ C.max vinf1) ∧ C.writable vinf1 = true) ∧ (∀(vinf2 : C.ptr (BitVec 64)), C.offset vinf2 = C.offset vinf1 ∧ C.min vinf2 = C.min vinf1 ∧ C.writable vinf2 = C.writable vinf1 ∧ C.zone1 vinf2 = C.zone1 vinf1 → (∀(vinfn : C.ptr (BitVec 64)), C.writable vinfn = true ∧ C.offset vinfn = C.offset vinf2 + BitVec.toInt n ∧ C.max vinf2 = C.offset vinf2 + BitVec.toInt n ∧ C.min vinfn = C.offset vinf2 + BitVec.toInt n ∧ C.max vinfn = C.max vinf1 ∧ C.zone1 vinfn = C.zone1 vinf2 ∧ C.pelts vinf2 = C.pelts vinf1 ∧ C.plength vinf2 = C.plength vinf1 ∧ C.pelts vinfn = C.pelts vinf1 ∧ C.plength vinfn = C.plength vinf1 → (let hv0 : ℤ := Lemmas.value v0n (BitVec.toInt n); let lvinf : ℤ := Lemmas.value vinf2 (BitVec.toInt n); (C.valid vinf2 (BitVec.toInt n) ∧ C.valid v0n (BitVec.toInt n) ∧ C.writable vinf2 = true) ∧ (∀(vinf3 : C.ptr (BitVec 64)), List.length (C.data vinf3) = List.length (C.data vinf2) ∧ C.offset vinf3 = C.offset vinf2 ∧ C.min vinf3 = C.min vinf2 ∧ C.max vinf3 = C.max vinf2 ∧ C.writable vinf3 = C.writable vinf2 ∧ C.zone1 vinf3 = C.zone1 vinf2 → (∀(o5 : BitVec 64), ((0 : ℤ) ≤ BitVec.toUInt o5 ∧ BitVec.toUInt o5 ≤ (1 : ℤ)) ∧ Lemmas.value vinf3 (BitVec.toInt n) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n)) * BitVec.toUInt o5 = Lemmas.value vinf2 (BitVec.toInt n) + Lemmas.value v0n (BitVec.toInt n) ∧ (∀(j : ℤ), j < C.offset vinf3 ∨ C.offset vinf3 + BitVec.toInt n ≤ j → C.pelts vinf3 j = C.pelts vinf2 j) → (C.valid vinf3 (BitVec.toInt n) ∧ C.valid r8 (BitVec.toInt n) ∧ C.valid v0n (BitVec.toInt n) ∧ C.writable v0n = true) ∧ (∀(v0n1 : C.ptr (BitVec 64)), List.length (C.data v0n1) = List.length (C.data v0n) ∧ C.offset v0n1 = C.offset v0n ∧ C.min v0n1 = C.min v0n ∧ C.max v0n1 = C.max v0n ∧ C.writable v0n1 = C.writable v0n ∧ C.zone1 v0n1 = C.zone1 v0n → (∀(c : BitVec 64), ((0 : ℤ) ≤ BitVec.toUInt c ∧ BitVec.toUInt c ≤ (1 : ℤ)) ∧ Lemmas.value v0n1 (BitVec.toInt n) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n)) * BitVec.toUInt c = Lemmas.value vinf3 (BitVec.toInt n) + Lemmas.value r8 (BitVec.toInt n) ∧ (∀(j : ℤ), j < C.offset v0n1 ∨ C.offset v0n1 + BitVec.toInt n ≤ j → C.pelts v0n1 j = C.pelts v0n j) → uint'64_in_bounds (BitVec.toUInt c + BitVec.toUInt o5) ∧ (∀(cy2 : BitVec 64), BitVec.toUInt cy2 = BitVec.toUInt c + BitVec.toUInt o5 → int'32_in_bounds (BitVec.toInt s + BitVec.toInt t) ∧ (∀(o6 : BitVec 32), BitVec.toInt o6 = BitVec.toInt s + BitVec.toInt t → int'32_in_bounds (BitVec.toInt o6 - BitVec.toInt n) ∧ (∀(o7 : BitVec 32), BitVec.toInt o7 = BitVec.toInt o6 - BitVec.toInt n → (((0 : ℤ) ≤ BitVec.toInt o7 ∧ BitVec.toInt o7 ≤ BitVec.toInt n) ∧ C.valid vinf3 (BitVec.toInt n) ∧ C.valid vinfn (BitVec.toInt o7) ∧ C.writable vinf3 = true) ∧ (∀(vinf4 : C.ptr (BitVec 64)), List.length (C.data vinf4) = List.length (C.data vinf3) ∧ C.offset vinf4 = C.offset vinf3 ∧ C.min vinf4 = C.min vinf3 ∧ C.max vinf4 = C.max vinf3 ∧ C.writable vinf4 = C.writable vinf3 ∧ C.zone1 vinf4 = C.zone1 vinf3 → (∀(c' : BitVec 64), Lemmas.value vinf4 (BitVec.toInt n) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n)) * BitVec.toUInt c' = Lemmas.value vinf3 (BitVec.toInt n) + Lemmas.value vinfn (BitVec.toInt o7) ∧ ((0 : ℤ) ≤ BitVec.toUInt c' ∧ BitVec.toUInt c' ≤ (1 : ℤ)) ∧ (∀(j : ℤ), j < C.offset vinf4 ∨ C.offset vinf4 + BitVec.toInt n ≤ j → C.pelts vinf4 j = C.pelts vinf3 j) → uint'64_in_bounds (BitVec.toUInt o5 + BitVec.toUInt c') ∧ (∀(o8 : BitVec 64), BitVec.toUInt o8 = BitVec.toUInt o5 + BitVec.toUInt c' → (C.zone1 v0n1 = C.zone1 vinf4 ∧ C.max v0n1 = C.min vinf4 ∧ C.writable v0n1 = true ∧ C.writable vinf4 = true) ∧ (∀(v0n2 : C.ptr (BitVec 64)), List.length (C.data v0n2) = List.length (C.data v0n1) ∧ C.offset v0n2 = C.offset v0n1 ∧ C.min v0n2 = C.min v0n1 ∧ C.writable v0n2 = C.writable v0n1 ∧ C.zone1 v0n2 = C.zone1 v0n1 → C.max v0n2 = C.max vinf4 ∧ C.plength v0n2 = C.plength v0n1 ∧ (∀(i : ℤ), C.min v0n1 ≤ i ∧ i < C.max v0n1 → C.pelts v0n2 i = C.pelts v0n1 i) ∧ (∀(i : ℤ), C.min vinf4 ≤ i ∧ i < C.max vinf4 → C.pelts v0n2 i = C.pelts vinf4 i) → (if vm1_neg1 = true then int'32_in_bounds (BitVec.toInt n + BitVec.toInt n) ∧ (∀(o9 : BitVec 32), BitVec.toInt o9 = BitVec.toInt n + BitVec.toInt n → (C.valid v0n2 (BitVec.toInt o9) ∧ C.valid scratch3 (BitVec.toInt o9) ∧ C.writable v0n2 = true) ∧ (∀(v0n3 : C.ptr (BitVec 64)), List.length (C.data v0n3) = List.length (C.data v0n2) ∧ C.offset v0n3 = C.offset v0n2 ∧ C.min v0n3 = C.min v0n2 ∧ C.max v0n3 = C.max v0n2 ∧ C.writable v0n3 = C.writable v0n2 ∧ C.zone1 v0n3 = C.zone1 v0n2 → (∀(c'' : BitVec 64), ((0 : ℤ) ≤ BitVec.toUInt c'' ∧ BitVec.toUInt c'' ≤ (1 : ℤ)) ∧ Lemmas.value v0n3 (BitVec.toInt o9) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt o9)) * BitVec.toUInt c'' = Lemmas.value v0n2 (BitVec.toInt o9) + Lemmas.value scratch3 (BitVec.toInt o9) ∧ (∀(j : ℤ), j < C.offset v0n3 ∨ C.offset v0n3 + BitVec.toInt o9 ≤ j → C.pelts v0n3 j = C.pelts v0n2 j) → uint'64_in_bounds (BitVec.toUInt o8 + BitVec.toUInt c'') ∧ (∀(o10 : BitVec 64), BitVec.toUInt o10 = BitVec.toUInt o8 + BitVec.toUInt c'' → BitVec.toUInt o10 ≤ (3 : ℤ) ∧ Lemmas.value v0n3 (BitVec.toInt n + BitVec.toInt n) = a1 * b1 + a0 * b0 - (a0 - a1) * (b0 - b1) + hv0 + m * lvinf - m * BitVec.toUInt cy2 - m * m * BitVec.toUInt o10 ∨ BitVec.toUInt o10 = (18446744073709551615 : ℤ) + (1 : ℤ) - (1 : ℤ) ∧ Lemmas.value v0n3 (BitVec.toInt n + BitVec.toInt n) = a1 * b1 + a0 * b0 - (a0 - a1) * (b0 - b1) + hv0 + m * lvinf - m * BitVec.toUInt cy2 + m * m ∧ BitVec.toUInt o8 = (0 : ℤ))))) else int'32_in_bounds (BitVec.toInt n + BitVec.toInt n) ∧ (∀(o9 : BitVec 32), BitVec.toInt o9 = BitVec.toInt n + BitVec.toInt n → ((0 : ℤ) ≤ BitVec.toInt o9 ∧ C.valid v0n2 (BitVec.toInt o9) ∧ C.valid scratch3 (BitVec.toInt o9) ∧ C.writable v0n2 = true) ∧ (∀(v0n3 : C.ptr (BitVec 64)), List.length (C.data v0n3) = List.length (C.data v0n2) ∧ C.offset v0n3 = C.offset v0n2 ∧ C.min v0n3 = C.min v0n2 ∧ C.max v0n3 = C.max v0n2 ∧ C.writable v0n3 = C.writable v0n2 ∧ C.zone1 v0n3 = C.zone1 v0n2 → (∀(b : BitVec 64), Lemmas.value v0n3 (BitVec.toInt o9) - HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt o9)) * BitVec.toUInt b = Lemmas.value v0n2 (BitVec.toInt o9) - Lemmas.value scratch3 (BitVec.toInt o9) ∧ ((0 : ℤ) ≤ BitVec.toUInt b ∧ BitVec.toUInt b ≤ (1 : ℤ)) ∧ (∀(j : ℤ), j < C.offset v0n3 ∨ C.offset v0n3 + BitVec.toInt o9 ≤ j → C.pelts v0n3 j = C.pelts v0n2 j) → (∀(o10 : BitVec 64), BitVec.toUInt o10 = (BitVec.toUInt o8 - BitVec.toUInt b) % ((18446744073709551615 : ℤ) + (1 : ℤ)) → BitVec.toUInt o10 ≤ (3 : ℤ) ∧ Lemmas.value v0n3 (BitVec.toInt n + BitVec.toInt n) = a1 * b1 + a0 * b0 - (a0 - a1) * (b0 - b1) + hv0 + m * lvinf - m * BitVec.toUInt cy2 - m * m * BitVec.toUInt o10 ∨ BitVec.toUInt o10 = (18446744073709551615 : ℤ) + (1 : ℤ) - (1 : ℤ) ∧ Lemmas.value v0n3 (BitVec.toInt n + BitVec.toInt n) = a1 * b1 + a0 * b0 - (a0 - a1) * (b0 - b1) + hv0 + m * lvinf - m * BitVec.toUInt cy2 + m * m ∧ BitVec.toUInt o8 = (0 : ℤ)))))) ∧ (∀(cy : BitVec 64) (v0n3 : C.ptr (BitVec 64)), List.length (C.data v0n3) = List.length (C.data v0n2) ∧ C.offset v0n3 = C.offset v0n2 ∧ C.min v0n3 = C.min v0n2 ∧ C.max v0n3 = C.max v0n2 ∧ C.writable v0n3 = C.writable v0n2 ∧ C.zone1 v0n3 = C.zone1 v0n2 → BitVec.toUInt cy ≤ (3 : ℤ) ∧ Lemmas.value v0n3 (BitVec.toInt n + BitVec.toInt n) = a1 * b1 + a0 * b0 - (a0 - a1) * (b0 - b1) + hv0 + m * lvinf - m * BitVec.toUInt cy2 - m * m * BitVec.toUInt cy ∨ BitVec.toUInt cy = (18446744073709551615 : ℤ) + (1 : ℤ) - (1 : ℤ) ∧ Lemmas.value v0n3 (BitVec.toInt n + BitVec.toInt n) = a1 * b1 + a0 * b0 - (a0 - a1) * (b0 - b1) + hv0 + m * lvinf - m * BitVec.toUInt cy2 + m * m ∧ BitVec.toUInt o8 = (0 : ℤ) → (C.zone1 r8 = C.zone1 v0n3 ∧ C.max r8 = C.min v0n3 ∧ C.writable r8 = true ∧ C.writable v0n3 = true) ∧ (∀(r9 : C.ptr (BitVec 64)), List.length (C.data r9) = List.length (C.data r8) ∧ C.offset r9 = C.offset r8 ∧ C.min r9 = C.min r8 ∧ C.writable r9 = C.writable r8 ∧ C.zone1 r9 = C.zone1 r8 → C.max r9 = C.max v0n3 ∧ C.plength r9 = C.plength r8 ∧ (∀(i : ℤ), C.min r8 ≤ i ∧ i < C.max r8 → C.pelts r9 i = C.pelts r8 i) ∧ (∀(i : ℤ), C.min v0n3 ≤ i ∧ i < C.max v0n3 → C.pelts r9 i = C.pelts v0n3 i) → (C.zone1 r9 = C.zone1 vinfn ∧ C.max r9 = C.min vinfn ∧ C.writable r9 = true ∧ C.writable vinfn = true) ∧ (∀(r10 : C.ptr (BitVec 64)), List.length (C.data r10) = List.length (C.data r9) ∧ C.offset r10 = C.offset r9 ∧ C.min r10 = C.min r9 ∧ C.writable r10 = C.writable r9 ∧ C.zone1 r10 = C.zone1 r9 → C.max r10 = C.max vinfn ∧ C.plength r10 = C.plength r9 ∧ (∀(i : ℤ), C.min r9 ≤ i ∧ i < C.max r9 → C.pelts r10 i = C.pelts r9 i) ∧ (∀(i : ℤ), C.min vinfn ≤ i ∧ i < C.max vinfn → C.pelts r10 i = C.pelts vinfn i) → (C.zone1 scratch3 = C.zone1 s_out2 ∧ C.max scratch3 = C.min s_out2 ∧ C.writable scratch3 = true ∧ C.writable s_out2 = true) ∧ (∀(scratch4 : C.ptr (BitVec 64)), List.length (C.data scratch4) = List.length (C.data scratch3) ∧ C.offset scratch4 = C.offset scratch3 ∧ C.min scratch4 = C.min scratch3 ∧ C.writable scratch4 = C.writable scratch3 ∧ C.zone1 scratch4 = C.zone1 scratch3 → C.max scratch4 = C.max s_out2 ∧ C.plength scratch4 = C.plength scratch3 ∧ (∀(i : ℤ), C.min scratch3 ≤ i ∧ i < C.max scratch3 → C.pelts scratch4 i = C.pelts scratch3 i) ∧ (∀(i : ℤ), C.min s_out2 ≤ i ∧ i < C.max s_out2 → C.pelts scratch4 i = C.pelts s_out2 i) → int'32_in_bounds (BitVec.toInt n + BitVec.toInt n) ∧ (∀(o9 : BitVec 32), BitVec.toInt o9 = BitVec.toInt n + BitVec.toInt n → (C.min r10 ≤ C.offset r10 + BitVec.toInt o9 ∧ C.offset r10 + BitVec.toInt o9 ≤ C.max r10) ∧ (∀(vinf0 : C.ptr (BitVec 64)), C.offset vinf0 = C.offset r10 + BitVec.toInt o9 ∧ C.plength vinf0 = C.plength r10 ∧ C.pelts vinf0 = C.pelts r10 ∧ C.data vinf0 = C.data r10 ∧ C.min vinf0 = C.min r10 ∧ C.max vinf0 = C.max r10 ∧ C.zone1 vinf0 = C.zone1 r10 ∧ C.writable vinf0 = C.writable r10 → (let m' : ℤ := HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt s + BitVec.toInt t - BitVec.toInt n)); (Lemmas.value r10 (BitVec.toInt sx + BitVec.toInt sy) + m * m * BitVec.toUInt cy2 < m * m * m * m' ∧ Lemmas.value x (BitVec.toInt sx) * Lemmas.value y (BitVec.toInt sy) < m * m * m * m') ∧ (Lemmas.value r10 (BitVec.toInt sx + BitVec.toInt sy) + m * m * BitVec.toUInt cy2 < m * m * m * m' ∧ Lemmas.value x (BitVec.toInt sx) * Lemmas.value y (BitVec.toInt sy) < m * m * m * m' → int'32_in_bounds (BitVec.toInt s + BitVec.toInt t) ∧ (∀(o10 : BitVec 32), BitVec.toInt o10 = BitVec.toInt s + BitVec.toInt t → (C.valid vinf0 (BitVec.toInt o10) ∧ (0 : ℤ) < BitVec.toInt o10 ∧ Lemmas.value vinf0 (BitVec.toInt o10) + BitVec.toUInt cy2 < HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt o10)) ∧ C.writable vinf0 = true) ∧ (∀(vinf01 : C.ptr (BitVec 64)) (r11 : C.ptr (BitVec 64)), C.data vinf01 = C.data r11 ∧ List.length (C.data r11) = List.length (C.data vinf0) ∧ C.offset vinf01 = C.offset vinf0 ∧ C.min vinf01 = C.min vinf0 ∧ C.max vinf01 = C.max vinf0 ∧ C.writable vinf01 = C.writable vinf0 ∧ C.zone1 vinf01 = C.zone1 vinf0 → List.length (C.data r11) = List.length (C.data r10) ∧ C.offset r11 = C.offset r10 ∧ C.min r11 = C.min r10 ∧ C.max r11 = C.max r10 ∧ C.writable r11 = C.writable r10 ∧ C.zone1 r11 = C.zone1 r10 → Lemmas.value vinf01 (BitVec.toInt o10) = Lemmas.value vinf0 (BitVec.toInt o10) + BitVec.toUInt cy2 ∧ (∀(j : ℤ), j < C.offset vinf01 ∨ C.offset vinf01 + BitVec.toInt o10 ≤ j → C.pelts vinf01 j = C.pelts vinf0 j) → int'32_in_bounds ((3 : ℤ) * BitVec.toInt n) ∧ (∀(o11 : BitVec 32), BitVec.toInt o11 = (3 : ℤ) * BitVec.toInt n → (C.min r11 ≤ C.offset r11 + BitVec.toInt o11 ∧ C.offset r11 + BitVec.toInt o11 ≤ C.max r11) ∧ (∀(vinfn1 : C.ptr (BitVec 64)), C.offset vinfn1 = C.offset r11 + BitVec.toInt o11 ∧ C.plength vinfn1 = C.plength r11 ∧ C.pelts vinfn1 = C.pelts r11 ∧ C.data vinfn1 = C.data r11 ∧ C.min vinfn1 = C.min r11 ∧ C.max vinfn1 = C.max r11 ∧ C.zone1 vinfn1 = C.zone1 r11 ∧ C.writable vinfn1 = C.writable r11 → (if BitVec.toUInt cy ≤ (3 : ℤ) then int'32_in_bounds (BitVec.toInt s + BitVec.toInt t) ∧ (∀(o12 : BitVec 32), BitVec.toInt o12 = BitVec.toInt s + BitVec.toInt t → int'32_in_bounds (BitVec.toInt o12 - BitVec.toInt n) ∧ (∀(o13 : BitVec 32), BitVec.toInt o13 = BitVec.toInt o12 - BitVec.toInt n → (C.valid vinfn1 (BitVec.toInt o13) ∧ (0 : ℤ) < BitVec.toInt o13 ∧ Lemmas.value vinfn1 (BitVec.toInt o13) + BitVec.toUInt cy < HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt o13)) ∧ C.writable vinfn1 = true) ∧ (∀(vinfn2 : C.ptr (BitVec 64)) (r12 : C.ptr (BitVec 64)), C.data vinfn2 = C.data r12 ∧ List.length (C.data r12) = List.length (C.data vinfn1) ∧ C.offset vinfn2 = C.offset vinfn1 ∧ C.min vinfn2 = C.min vinfn1 ∧ C.max vinfn2 = C.max vinfn1 ∧ C.writable vinfn2 = C.writable vinfn1 ∧ C.zone1 vinfn2 = C.zone1 vinfn1 → List.length (C.data r12) = List.length (C.data r11) ∧ C.offset r12 = C.offset r11 ∧ C.min r12 = C.min r11 ∧ C.max r12 = C.max r11 ∧ C.writable r12 = C.writable r11 ∧ C.zone1 r12 = C.zone1 r11 → Lemmas.value vinfn2 (BitVec.toInt o13) = Lemmas.value vinfn1 (BitVec.toInt o13) + BitVec.toUInt cy ∧ (∀(j : ℤ), j < C.offset vinfn2 ∨ C.offset vinfn2 + BitVec.toInt o13 ≤ j → C.pelts vinfn2 j = C.pelts vinfn1 j) → (C.zone1 r12 = C.zone1 ro ∧ C.max r12 = C.min ro ∧ C.writable r12 = true ∧ C.writable ro = true) ∧ (∀(r13 : C.ptr (BitVec 64)), List.length (C.data r13) = List.length (C.data r12) ∧ C.offset r13 = C.offset r12 ∧ C.min r13 = C.min r12 ∧ C.writable r13 = C.writable r12 ∧ C.zone1 r13 = C.zone1 r12 → C.max r13 = C.max ro ∧ C.plength r13 = C.plength r12 ∧ (∀(i : ℤ), C.min r12 ≤ i ∧ i < C.max r12 → C.pelts r13 i = C.pelts r12 i) ∧ (∀(i : ℤ), C.min ro ≤ i ∧ i < C.max ro → C.pelts r13 i = C.pelts ro i) → (C.zone1 r' = C.zone1 r13 ∧ C.max r' = C.min r13 ∧ C.writable r' = true ∧ C.writable r13 = true) ∧ (∀(r14 : C.ptr (BitVec 64)), List.length (C.data r14) = List.length (C.data r13) ∧ C.offset r14 = C.offset r13 ∧ C.max r14 = C.max r13 ∧ C.writable r14 = C.writable r13 ∧ C.zone1 r14 = C.zone1 r13 → C.min r14 = C.min r' ∧ C.plength r14 = C.plength r13 ∧ (∀(i : ℤ), C.min r' ≤ i ∧ i < C.max r' → C.pelts r14 i = C.pelts r' i) ∧ (∀(i : ℤ), C.min r13 ≤ i ∧ i < C.max r13 → C.pelts r14 i = C.pelts r13 i) → (C.zone1 scratch' = C.zone1 scratch4 ∧ C.max scratch' = C.min scratch4 ∧ C.writable scratch' = true ∧ C.writable scratch4 = true) ∧ (∀(scratch5 : C.ptr (BitVec 64)), List.length (C.data scratch5) = List.length (C.data scratch4) ∧ C.offset scratch5 = C.offset scratch4 ∧ C.max scratch5 = C.max scratch4 ∧ C.writable scratch5 = C.writable scratch4 ∧ C.zone1 scratch5 = C.zone1 scratch4 → C.min scratch5 = C.min scratch' ∧ C.plength scratch5 = C.plength scratch4 ∧ (∀(i : ℤ), C.min scratch' ≤ i ∧ i < C.max scratch' → C.pelts scratch5 i = C.pelts scratch' i) ∧ (∀(i : ℤ), C.min scratch4 ≤ i ∧ i < C.max scratch4 → C.pelts scratch5 i = C.pelts scratch4 i) → C.min r14 = C.min r ∧ C.max r14 = C.max r ∧ C.plength r14 = C.plength r ∧ C.min scratch5 = C.min scratch ∧ C.max scratch5 = C.max scratch ∧ C.plength scratch5 = C.plength scratch ∧ Lemmas.value r14 (BitVec.toInt sx + BitVec.toInt sy) = Lemmas.value x (BitVec.toInt sx) * Lemmas.value y (BitVec.toInt sy) ∧ (∀(j : ℤ), C.min r14 ≤ j ∧ j < C.offset r14 ∨ C.offset r14 + BitVec.toInt sx + BitVec.toInt sy ≤ j ∧ j < C.max r14 → C.pelts r14 j = C.pelts r j) ∧ (∀(j : ℤ), C.min scratch5 ≤ j ∧ j < C.offset scratch5 → C.pelts scratch5 j = C.pelts scratch j))))))) else int'32_in_bounds (BitVec.toInt s + BitVec.toInt t) ∧ (∀(o12 : BitVec 32), BitVec.toInt o12 = BitVec.toInt s + BitVec.toInt t → int'32_in_bounds (BitVec.toInt o12 - BitVec.toInt n) ∧ (∀(o13 : BitVec 32), BitVec.toInt o13 = BitVec.toInt o12 - BitVec.toInt n → (C.valid vinfn1 (BitVec.toInt o13) ∧ (0 : ℤ) < BitVec.toInt o13 ∧ (0 : ℤ) ≤ Lemmas.value vinfn1 (BitVec.toInt o13) - (1 : ℤ) ∧ C.writable vinfn1 = true) ∧ (∀(vinfn2 : C.ptr (BitVec 64)) (r12 : C.ptr (BitVec 64)), C.data vinfn2 = C.data r12 ∧ List.length (C.data r12) = List.length (C.data vinfn1) ∧ C.offset vinfn2 = C.offset vinfn1 ∧ C.min vinfn2 = C.min vinfn1 ∧ C.max vinfn2 = C.max vinfn1 ∧ C.writable vinfn2 = C.writable vinfn1 ∧ C.zone1 vinfn2 = C.zone1 vinfn1 → List.length (C.data r12) = List.length (C.data r11) ∧ C.offset r12 = C.offset r11 ∧ C.min r12 = C.min r11 ∧ C.max r12 = C.max r11 ∧ C.writable r12 = C.writable r11 ∧ C.zone1 r12 = C.zone1 r11 → Lemmas.value vinfn2 (BitVec.toInt o13) = Lemmas.value vinfn1 (BitVec.toInt o13) - (1 : ℤ) ∧ (∀(j : ℤ), j < C.offset vinfn2 ∨ C.offset vinfn2 + BitVec.toInt o13 ≤ j → C.pelts vinfn2 j = C.pelts vinfn1 j) → (C.zone1 r12 = C.zone1 ro ∧ C.max r12 = C.min ro ∧ C.writable r12 = true ∧ C.writable ro = true) ∧ (∀(r13 : C.ptr (BitVec 64)), List.length (C.data r13) = List.length (C.data r12) ∧ C.offset r13 = C.offset r12 ∧ C.min r13 = C.min r12 ∧ C.writable r13 = C.writable r12 ∧ C.zone1 r13 = C.zone1 r12 → C.max r13 = C.max ro ∧ C.plength r13 = C.plength r12 ∧ (∀(i : ℤ), C.min r12 ≤ i ∧ i < C.max r12 → C.pelts r13 i = C.pelts r12 i) ∧ (∀(i : ℤ), C.min ro ≤ i ∧ i < C.max ro → C.pelts r13 i = C.pelts ro i) → (C.zone1 r' = C.zone1 r13 ∧ C.max r' = C.min r13 ∧ C.writable r' = true ∧ C.writable r13 = true) ∧ (∀(r14 : C.ptr (BitVec 64)), List.length (C.data r14) = List.length (C.data r13) ∧ C.offset r14 = C.offset r13 ∧ C.max r14 = C.max r13 ∧ C.writable r14 = C.writable r13 ∧ C.zone1 r14 = C.zone1 r13 → C.min r14 = C.min r' ∧ C.plength r14 = C.plength r13 ∧ (∀(i : ℤ), C.min r' ≤ i ∧ i < C.max r' → C.pelts r14 i = C.pelts r' i) ∧ (∀(i : ℤ), C.min r13 ≤ i ∧ i < C.max r13 → C.pelts r14 i = C.pelts r13 i) → (C.zone1 scratch' = C.zone1 scratch4 ∧ C.max scratch' = C.min scratch4 ∧ C.writable scratch' = true ∧ C.writable scratch4 = true) ∧ (∀(scratch5 : C.ptr (BitVec 64)), List.length (C.data scratch5) = List.length (C.data scratch4) ∧ C.offset scratch5 = C.offset scratch4 ∧ C.max scratch5 = C.max scratch4 ∧ C.writable scratch5 = C.writable scratch4 ∧ C.zone1 scratch5 = C.zone1 scratch4 → C.min scratch5 = C.min scratch' ∧ C.plength scratch5 = C.plength scratch4 ∧ (∀(i : ℤ), C.min scratch' ≤ i ∧ i < C.max scratch' → C.pelts scratch5 i = C.pelts scratch' i) ∧ (∀(i : ℤ), C.min scratch4 ≤ i ∧ i < C.max scratch4 → C.pelts scratch5 i = C.pelts scratch4 i) → C.min r14 = C.min r ∧ C.max r14 = C.max r ∧ C.plength r14 = C.plength r ∧ C.min scratch5 = C.min scratch ∧ C.max scratch5 = C.max scratch ∧ C.plength scratch5 = C.plength scratch ∧ Lemmas.value r14 (BitVec.toInt sx + BitVec.toInt sy) = Lemmas.value x (BitVec.toInt sx) * Lemmas.value y (BitVec.toInt sy) ∧ (∀(j : ℤ), C.min r14 ≤ j ∧ j < C.offset r14 ∨ C.offset r14 + BitVec.toInt sx + BitVec.toInt sy ≤ j ∧ j < C.max r14 → C.pelts r14 j = C.pelts r j) ∧ (∀(j : ℤ), C.min scratch5 ≤ j ∧ j < C.offset scratch5 → C.pelts scratch5 j = C.pelts scratch j)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  := sorry
end toom_Toom_wmpn_toom22_mulqtvc
