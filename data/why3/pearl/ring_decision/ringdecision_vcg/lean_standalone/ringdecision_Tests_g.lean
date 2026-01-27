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

namespace ringdecision_Tests_g
axiom Assoc (x : ℤ) (y : ℤ) (z : ℤ) : x + y + z = x + (y + z)
axiom Unit_def_l (x : ℤ) : (0 : ℤ) + x = x
axiom Unit_def_r (x : ℤ) : x + (0 : ℤ) = x
axiom Inv_def_l (x : ℤ) : -x + x = (0 : ℤ)
axiom Inv_def_r (x : ℤ) : x + -x = (0 : ℤ)
axiom Comm (x : ℤ) (y : ℤ) : x + y = y + x
axiom Assoc1 (x : ℤ) (y : ℤ) (z : ℤ) : x * y * z = x * (y * z)
axiom Mul_distr_l (x : ℤ) (y : ℤ) (z : ℤ) : x * (y + z) = x * y + x * z
axiom Mul_distr_r (y : ℤ) (z : ℤ) (x : ℤ) : (y + z) * x = y * x + z * x
axiom Comm1 (x : ℤ) (y : ℤ) : x * y = y * x
axiom Unitary (x : ℤ) : (1 : ℤ) * x = x
axiom NonTrivialRing : ¬(0 : ℤ) = (1 : ℤ)
axiom Assoc2 (x : ℤ) (y : ℤ) (z : ℤ) : x + y + z = x + (y + z)
axiom Unit_def_l1 (x : ℤ) : (0 : ℤ) + x = x
axiom Unit_def_r1 (x : ℤ) : x + (0 : ℤ) = x
axiom Inv_def_l1 (x : ℤ) : -x + x = (0 : ℤ)
axiom Inv_def_r1 (x : ℤ) : x + -x = (0 : ℤ)
axiom Comm2 (x : ℤ) (y : ℤ) : x + y = y + x
axiom Assoc3 (x : ℤ) (y : ℤ) (z : ℤ) : x * y * z = x * (y * z)
axiom Mul_distr_l1 (x : ℤ) (y : ℤ) (z : ℤ) : x * (y + z) = x * y + x * z
axiom Mul_distr_r1 (y : ℤ) (z : ℤ) (x : ℤ) : (y + z) * x = y * x + z * x
axiom Comm3 (x : ℤ) (y : ℤ) : x * y = y * x
axiom Unitary1 (x : ℤ) : (1 : ℤ) * x = x
axiom NonTrivialRing1 : ¬(0 : ℤ) = (1 : ℤ)
inductive t where
  | Var : ℤ -> t
  | Add : t -> t -> t
  | Mul : t -> t -> t
  | Cst : ℤ -> t
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom vars : Type
axiom inhabited_axiom_vars : Inhabited vars
attribute [instance] inhabited_axiom_vars
noncomputable def interp : t -> (ℤ -> ℤ) -> ℤ
  | (t.Var n), y => y n
  | (t.Add x1 x2), y => interp x1 y + interp x2 y
  | (t.Mul x1 x2), y => interp x1 y * interp x2 y
  | (t.Cst c), y => c
noncomputable def eq (x1 : t) (x2 : t) := ∀(y : ℤ -> ℤ), interp x1 y = interp x2 y
inductive m where
  | M : ℤ -> List ℤ -> m
axiom inhabited_axiom_m : Inhabited m
attribute [instance] inhabited_axiom_m
axiom t' : Type
axiom inhabited_axiom_t' : Inhabited t'
attribute [instance] inhabited_axiom_t'
noncomputable def mon : List ℤ -> (ℤ -> ℤ) -> ℤ
  | ([] : List ℤ), y => (1 : ℤ)
  | (List.cons x1 r), y => y x1 * mon r y
noncomputable def interp' : List m -> (ℤ -> ℤ) -> ℤ
  | ([] : List m), y => (0 : ℤ)
  | (List.cons (m.M a m1) r), y => a * mon m1 y + interp' r y
noncomputable def eq_mon (m1 : List ℤ) (m2 : List ℤ) := ∀(y : ℤ -> ℤ), mon m1 y = mon m2 y
noncomputable def eq' (x1 : List m) (x2 : List m) := ∀(y : ℤ -> ℤ), interp' x1 y = interp' x2 y
noncomputable def append_mon (m1 : m) (m2 : m) := match (m1, m2) with | (m.M a1 l1, m.M a2 l2) => m.M (a1 * a2) (l1 ++ l2)
axiom append_mon'spec (m1 : m) (m2 : m) (y : ℤ -> ℤ) : interp' (List.cons (append_mon m1 m2) ([] : List m)) y = interp' (List.cons m1 ([] : List m)) y * interp' (List.cons m2 ([] : List m)) y
noncomputable def mul_mon : List m -> m -> List m
  | ([] : List m), mon1 => ([] : List m)
  | (List.cons m1 r), mon1 => List.cons (append_mon m1 mon1) (mul_mon r mon1)
axiom mul_mon'spec (x : List m) (mon1 : m) (y : ℤ -> ℤ) : interp' (mul_mon x mon1) y = interp' x y * interp' (List.cons mon1 ([] : List m)) y
noncomputable def mul_devel : List m -> List m -> List m
  | ([] : List m), x2 => ([] : List m)
  | (List.cons (m.M a m1) r), x2 => mul_mon x2 (m.M a m1) ++ mul_devel r x2
axiom mul_devel'spec (x1 : List m) (x2 : List m) (y : ℤ -> ℤ) : interp' (mul_devel x1 x2) y = interp' x1 y * interp' x2 y
noncomputable def conv : t -> List m
  | (t.Var v) => List.cons (m.M (1 : ℤ) (List.cons v ([] : List ℤ))) ([] : List m)
  | (t.Add x1 x2) => conv x1 ++ conv x2
  | (t.Mul x1 x2) => mul_devel (conv x1) (conv x2)
  | (t.Cst n) => List.cons (m.M n ([] : List ℤ)) ([] : List m)
axiom conv'spec (x : t) (y : ℤ -> ℤ) : interp x y = interp' (conv x) y
noncomputable def insert : ℤ -> List ℤ -> List ℤ
  | x, ([] : List ℤ) => List.cons x ([] : List ℤ)
  | x, (List.cons y r) => if x ≤ y then List.cons x (List.cons y r) else List.cons y (insert x r)
axiom insert'spec (x : ℤ) (l : List ℤ) : eq_mon (List.cons x l) (insert x l)
noncomputable def insertion_sort : List ℤ -> List ℤ
  | ([] : List ℤ) => ([] : List ℤ)
  | (List.cons x r) => insert x (insertion_sort r)
axiom insertion_sort'spec (l : List ℤ) : eq_mon l (insertion_sort l)
noncomputable def sort_mon (x : m) := match x with | m.M a m1 => m.M a (insertion_sort m1)
axiom sort_mon'spec (x : m) : eq' (List.cons x ([] : List m)) (List.cons (sort_mon x) ([] : List m))
noncomputable def sort_mons : List m -> List m
  | ([] : List m) => ([] : List m)
  | (List.cons m1 r) => List.cons (sort_mon m1) (sort_mons r)
axiom sort_mons'spec (x : List m) : eq' (sort_mons x) x
noncomputable def le_mon : List ℤ -> List ℤ -> Bool
  | ([] : List ℤ), x => if List.length ([] : List ℤ) < List.length x then true else if List.length ([] : List ℤ) = List.length x then true else false
  | x, ([] : List ℤ) => if List.length x < List.length ([] : List ℤ) then true else false
  | (List.cons v1 r1), (List.cons v2 r2) => if List.length (List.cons v1 r1) < List.length (List.cons v2 r2) then true else if List.length (List.cons v1 r1) = List.length (List.cons v2 r2) then if v1 < v2 then true else if v1 = v2 then le_mon r1 r2 else false else false
noncomputable def same : List ℤ -> List ℤ -> Bool
  | ([] : List ℤ), ([] : List ℤ) => true
  | ([] : List ℤ), x => false
  | x, ([] : List ℤ) => false
  | (List.cons x1 l11), (List.cons x2 l21) => if x1 = x2 then same l11 l21 else false
axiom same'spec (l1 : List ℤ) (l2 : List ℤ) (fact0 : same l1 l2 = true) : eq_mon l1 l2
noncomputable def insert_mon : m -> List m -> List m
  | x, ([] : List m) => List.cons x ([] : List m)
  | (m.M a1 l1), (List.cons (m.M a2 l2) r) => if same l1 l2 = true then let s : ℤ := a1 + a2; if s = (0 : ℤ) then r else List.cons (m.M s l1) r else if le_mon l1 l2 = true then List.cons (m.M a1 l1) (List.cons (m.M a2 l2) r) else List.cons (m.M a2 l2) (insert_mon (m.M a1 l1) r)
axiom insert_mon'spec (m1 : m) (x : List m) : eq' (insert_mon m1 x) (List.cons m1 x)
noncomputable def insertion_sort_mon : List m -> List m
  | ([] : List m) => ([] : List m)
  | (List.cons m1 r) => insert_mon m1 (insertion_sort_mon r)
axiom insertion_sort_mon'spec (x : List m) : eq' (insertion_sort_mon x) x
noncomputable def normalize (x : List m) := insertion_sort_mon (sort_mons x)
axiom normalize'spec (x : List m) : eq' (normalize x) x
theorem g (x : ℤ) : (x + (3 : ℤ)) * (x + (2 : ℤ)) = x * x + (5 : ℤ) * x + (6 : ℤ)
  := sorry
end ringdecision_Tests_g
