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
namespace Memory
axiom loc : Type
axiom inhabited_axiom_loc : Inhabited loc
attribute [instance] inhabited_axiom_loc
axiom null : loc
axiom memory : Type
axiom inhabited_axiom_memory : Inhabited memory
attribute [instance] inhabited_axiom_memory
axiom left1 : memory -> loc -> loc
axiom right1 : memory -> loc -> loc
axiom mark : memory -> loc -> Bool
axiom color : memory -> loc -> Bool
noncomputable def update {α : Type} [Inhabited α] (m1 : loc -> α) (m2 : loc -> α) (l : loc) (v : α) := m1 l = v ∧ (∀(x : loc), ¬x = l → m1 x = m2 x)
end Memory
namespace GraphShape
noncomputable def edge (m : Memory.memory) (x : Memory.loc) (y : Memory.loc) := ¬x = Memory.null ∧ (Memory.left1 m x = y ∨ Memory.right1 m x = y)
inductive path : Memory.memory -> Memory.loc -> Memory.loc -> Prop where
 | path_nil (m : Memory.memory) (x : Memory.loc) : path m x x
 | path_cons (m : Memory.memory) (x : Memory.loc) (y : Memory.loc) (z : Memory.loc) : edge m x y → path m y z → path m x z
noncomputable def well_colored_on (graph : Finset Memory.loc) (gray : Finset Memory.loc) (m : Memory.memory) (mark : Memory.loc -> Bool) := gray ⊆ graph ∧ (∀(x : Memory.loc), x ∈ gray → mark x = true) ∧ (∀(x : Memory.loc) (y : Memory.loc), x ∈ graph ∧ edge m x y ∧ ¬y = Memory.null ∧ mark x = true → x ∈ gray ∨ mark y = true)
noncomputable def unchanged_structure (m1 : Memory.memory) (m2 : Memory.memory) := ∀(x : Memory.loc), ¬x = Memory.null → Memory.left1 m2 x = Memory.left1 m1 x ∧ Memory.right1 m2 x = Memory.right1 m1 x
end GraphShape
namespace schorr_waite_with_ghost_monitor_SchorrWaite_schorr_waiteqtvc
theorem schorr_waite'vc (root : Memory.loc) (graph : Finset Memory.loc) (heap : Memory.memory) (fact0 : root ∈ graph) (fact1 : ∀(l : Memory.loc), l ∈ graph ∧ ¬l = Memory.null → Memory.left1 heap l ∈ graph ∧ Memory.right1 heap l ∈ graph) (fact2 : ∀(x : Memory.loc), x ∈ graph → ¬Memory.mark heap x = true) : (∀(p : Memory.loc) (t : Memory.loc) (pc : ℤ) (heap1 : Memory.memory), (0 : ℤ) ≤ pc ∧ pc < (2 : ℤ) → (if pc = (0 : ℤ) then (pc = (0 : ℤ) → True) ∧ (pc = (1 : ℤ) ∧ ¬(¬p = Memory.null ∨ ¬t = Memory.null ∧ ¬Memory.mark heap1 t = true) → (1 : ℤ) = (2 : ℤ) ∧ root = t ∧ Memory.null = p) ∧ (pc = (1 : ℤ) ∧ (¬p = Memory.null ∨ ¬t = Memory.null ∧ ¬Memory.mark heap1 t = true) → ((t = Memory.null ∨ Memory.mark heap1 t = true) ∧ Memory.color heap1 p = true → root = p ∧ Memory.null = Memory.right1 heap1 p ∧ Memory.update (Memory.right1 heap1) (Memory.right1 heap1) p t) ∧ ((t = Memory.null ∨ Memory.mark heap1 t = true) ∧ ¬Memory.color heap1 p = true → Memory.null = p ∧ root = Memory.right1 heap1 p ∧ Memory.update (Memory.right1 heap1) (Memory.right1 heap1) Memory.null (Memory.left1 heap1 p) ∧ Memory.update (Memory.left1 heap1) (Memory.left1 heap1) Memory.null t ∧ Memory.update (Memory.color heap1) (Memory.color heap1) Memory.null true) ∧ (¬(t = Memory.null ∨ Memory.mark heap1 t = true) → Memory.null = t ∧ root = Memory.left1 heap1 t ∧ Memory.update (Memory.left1 heap1) (Memory.left1 heap1) t p ∧ Memory.update (Memory.mark heap1) (Memory.mark heap1) Memory.null true ∧ Memory.update (Memory.color heap1) (Memory.color heap1) Memory.null false)) else pc = (1 : ℤ) ∧ (∀(o1 : Bool), (if ¬p = Memory.null then o1 = true else if ¬t = Memory.null then o1 = (if Memory.mark heap1 t = true then false else true) else o1 = false) → (if o1 = true then ∀(o2 : Bool), (if t = Memory.null then o2 = true else o2 = Memory.mark heap1 t) → (if o2 = true then ¬p = Memory.null ∧ (if Memory.color heap1 p = true then ¬p = Memory.null ∧ ¬p = Memory.null ∧ (∀(heap2 : Memory.memory), Memory.left1 heap2 = Memory.left1 heap1 ∧ Memory.mark heap2 = Memory.mark heap1 ∧ Memory.color heap2 = Memory.color heap1 → Memory.update (Memory.right1 heap2) (Memory.right1 heap1) p t → (pc = (0 : ℤ) → p = root ∧ Memory.right1 heap1 p = Memory.null ∧ heap2 = heap1) ∧ (pc = (1 : ℤ) ∧ ¬(¬p = Memory.null ∨ ¬t = Memory.null ∧ ¬Memory.mark heap1 t = true) → (1 : ℤ) = (2 : ℤ) ∧ p = t ∧ Memory.right1 heap1 p = p ∧ heap2 = heap1) ∧ (pc = (1 : ℤ) ∧ (¬p = Memory.null ∨ ¬t = Memory.null ∧ ¬Memory.mark heap1 t = true) → ((t = Memory.null ∨ Memory.mark heap1 t = true) ∧ Memory.color heap1 p = true → Memory.update (Memory.right1 heap2) (Memory.right1 heap1) p t ∧ Memory.left1 heap2 = Memory.left1 heap1 ∧ Memory.mark heap2 = Memory.mark heap1 ∧ Memory.color heap2 = Memory.color heap1) ∧ ((t = Memory.null ∨ Memory.mark heap1 t = true) ∧ ¬Memory.color heap1 p = true → Memory.right1 heap1 p = p ∧ p = Memory.right1 heap1 p ∧ Memory.update (Memory.right1 heap2) (Memory.right1 heap1) (Memory.right1 heap1 p) (Memory.left1 heap1 p) ∧ Memory.update (Memory.left1 heap2) (Memory.left1 heap1) (Memory.right1 heap1 p) t ∧ Memory.update (Memory.color heap2) (Memory.color heap1) (Memory.right1 heap1 p) true ∧ Memory.mark heap2 = Memory.mark heap1) ∧ (¬(t = Memory.null ∨ Memory.mark heap1 t = true) → Memory.right1 heap1 p = t ∧ p = Memory.left1 heap1 t ∧ Memory.update (Memory.left1 heap2) (Memory.left1 heap1) t p ∧ Memory.update (Memory.mark heap2) (Memory.mark heap1) (Memory.right1 heap1 p) true ∧ Memory.update (Memory.color heap2) (Memory.color heap1) (Memory.right1 heap1 p) false ∧ Memory.right1 heap2 = Memory.right1 heap1))) else ¬p = Memory.null ∧ ¬p = Memory.null ∧ ¬p = Memory.null ∧ (∀(heap2 : Memory.memory), Memory.left1 heap2 = Memory.left1 heap1 ∧ Memory.mark heap2 = Memory.mark heap1 ∧ Memory.color heap2 = Memory.color heap1 → Memory.update (Memory.right1 heap2) (Memory.right1 heap1) p (Memory.left1 heap1 p) → ¬p = Memory.null ∧ (∀(heap3 : Memory.memory), Memory.right1 heap3 = Memory.right1 heap2 ∧ Memory.mark heap3 = Memory.mark heap2 ∧ Memory.color heap3 = Memory.color heap2 → Memory.update (Memory.left1 heap3) (Memory.left1 heap2) p t → ¬p = Memory.null ∧ (∀(heap4 : Memory.memory), Memory.left1 heap4 = Memory.left1 heap3 ∧ Memory.right1 heap4 = Memory.right1 heap3 ∧ Memory.mark heap4 = Memory.mark heap3 → Memory.update (Memory.color heap4) (Memory.color heap3) p true → (pc = (0 : ℤ) → Memory.right1 heap1 p = root ∧ p = Memory.null ∧ heap4 = heap1) ∧ (pc = (1 : ℤ) ∧ ¬(¬p = Memory.null ∨ ¬t = Memory.null ∧ ¬Memory.mark heap1 t = true) → (1 : ℤ) = (2 : ℤ) ∧ Memory.right1 heap1 p = t ∧ heap4 = heap1) ∧ (pc = (1 : ℤ) ∧ (¬p = Memory.null ∨ ¬t = Memory.null ∧ ¬Memory.mark heap1 t = true) → ((t = Memory.null ∨ Memory.mark heap1 t = true) ∧ Memory.color heap1 p = true → Memory.right1 heap1 p = p ∧ p = Memory.right1 heap1 p ∧ Memory.update (Memory.right1 heap4) (Memory.right1 heap1) p t ∧ Memory.left1 heap4 = Memory.left1 heap1 ∧ Memory.mark heap4 = Memory.mark heap1 ∧ Memory.color heap4 = Memory.color heap1) ∧ ((t = Memory.null ∨ Memory.mark heap1 t = true) ∧ ¬Memory.color heap1 p = true → Memory.update (Memory.right1 heap4) (Memory.right1 heap1) p (Memory.left1 heap1 p) ∧ Memory.update (Memory.left1 heap4) (Memory.left1 heap1) p t ∧ Memory.update (Memory.color heap4) (Memory.color heap1) p true ∧ Memory.mark heap4 = Memory.mark heap1) ∧ (¬(t = Memory.null ∨ Memory.mark heap1 t = true) → p = t ∧ Memory.right1 heap1 p = Memory.left1 heap1 t ∧ Memory.update (Memory.left1 heap4) (Memory.left1 heap1) t p ∧ Memory.update (Memory.mark heap4) (Memory.mark heap1) p true ∧ Memory.update (Memory.color heap4) (Memory.color heap1) p false ∧ Memory.right1 heap4 = Memory.right1 heap1)))))) else ¬t = Memory.null ∧ ¬t = Memory.null ∧ (∀(heap2 : Memory.memory), Memory.right1 heap2 = Memory.right1 heap1 ∧ Memory.mark heap2 = Memory.mark heap1 ∧ Memory.color heap2 = Memory.color heap1 → Memory.update (Memory.left1 heap2) (Memory.left1 heap1) t p → ¬t = Memory.null ∧ (∀(heap3 : Memory.memory), Memory.left1 heap3 = Memory.left1 heap2 ∧ Memory.right1 heap3 = Memory.right1 heap2 ∧ Memory.color heap3 = Memory.color heap2 → Memory.update (Memory.mark heap3) (Memory.mark heap2) t true → ¬t = Memory.null ∧ (∀(heap4 : Memory.memory), Memory.left1 heap4 = Memory.left1 heap3 ∧ Memory.right1 heap4 = Memory.right1 heap3 ∧ Memory.mark heap4 = Memory.mark heap3 → Memory.update (Memory.color heap4) (Memory.color heap3) t false → (pc = (0 : ℤ) → Memory.left1 heap1 t = root ∧ t = Memory.null ∧ heap4 = heap1) ∧ (pc = (1 : ℤ) ∧ ¬(¬p = Memory.null ∨ ¬t = Memory.null ∧ ¬Memory.mark heap1 t = true) → (1 : ℤ) = (2 : ℤ) ∧ Memory.left1 heap1 t = t ∧ t = p ∧ heap4 = heap1) ∧ (pc = (1 : ℤ) ∧ (¬p = Memory.null ∨ ¬t = Memory.null ∧ ¬Memory.mark heap1 t = true) → ((t = Memory.null ∨ Memory.mark heap1 t = true) ∧ Memory.color heap1 p = true → Memory.left1 heap1 t = p ∧ t = Memory.right1 heap1 p ∧ Memory.update (Memory.right1 heap4) (Memory.right1 heap1) p t ∧ Memory.left1 heap4 = Memory.left1 heap1 ∧ Memory.mark heap4 = Memory.mark heap1 ∧ Memory.color heap4 = Memory.color heap1) ∧ ((t = Memory.null ∨ Memory.mark heap1 t = true) ∧ ¬Memory.color heap1 p = true → t = p ∧ Memory.left1 heap1 t = Memory.right1 heap1 p ∧ Memory.update (Memory.right1 heap4) (Memory.right1 heap1) t (Memory.left1 heap1 p) ∧ Memory.update (Memory.left1 heap4) (Memory.left1 heap1) t t ∧ Memory.update (Memory.color heap4) (Memory.color heap1) t true ∧ Memory.mark heap4 = Memory.mark heap1) ∧ (¬(t = Memory.null ∨ Memory.mark heap1 t = true) → Memory.update (Memory.left1 heap4) (Memory.left1 heap1) t p ∧ Memory.update (Memory.mark heap4) (Memory.mark heap1) t true ∧ Memory.update (Memory.color heap4) (Memory.color heap1) t false ∧ Memory.right1 heap4 = Memory.right1 heap1)))))) else (pc = (0 : ℤ) → (2 : ℤ) = (1 : ℤ) ∧ t = root ∧ p = Memory.null) ∧ (pc = (1 : ℤ) ∧ ¬(¬p = Memory.null ∨ ¬t = Memory.null ∧ ¬Memory.mark heap1 t = true) → True) ∧ (pc = (1 : ℤ) ∧ (¬p = Memory.null ∨ ¬t = Memory.null ∧ ¬Memory.mark heap1 t = true) → (2 : ℤ) = (1 : ℤ) ∧ ((t = Memory.null ∨ Memory.mark heap1 t = true) ∧ Memory.color heap1 p = true → t = p ∧ p = Memory.right1 heap1 p ∧ Memory.update (Memory.right1 heap1) (Memory.right1 heap1) p t) ∧ ((t = Memory.null ∨ Memory.mark heap1 t = true) ∧ ¬Memory.color heap1 p = true → t = Memory.right1 heap1 p ∧ Memory.update (Memory.right1 heap1) (Memory.right1 heap1) p (Memory.left1 heap1 p) ∧ Memory.update (Memory.left1 heap1) (Memory.left1 heap1) p t ∧ Memory.update (Memory.color heap1) (Memory.color heap1) p true) ∧ (¬(t = Memory.null ∨ Memory.mark heap1 t = true) → p = t ∧ t = Memory.left1 heap1 t ∧ Memory.update (Memory.left1 heap1) (Memory.left1 heap1) t p ∧ Memory.update (Memory.mark heap1) (Memory.mark heap1) p true ∧ Memory.update (Memory.color heap1) (Memory.color heap1) p false)))))) ∧ (∀(p : Memory.loc) (t : Memory.loc) (heap1 : Memory.memory) (gray_nodes : Finset Memory.loc), t ∈ graph ∧ GraphShape.well_colored_on graph gray_nodes heap (Memory.mark heap1) ∧ (∀(x : Memory.loc), ¬x = Memory.null ∧ ¬Memory.mark heap1 x = true → Memory.left1 heap1 x = Memory.left1 heap x ∧ Memory.right1 heap1 x = Memory.right1 heap x) → (∀(o1 : Bool), (if t = Memory.null then o1 = true else o1 = Memory.mark heap1 t) → (if o1 = true then GraphShape.unchanged_structure heap1 heap1 ∧ GraphShape.well_colored_on graph gray_nodes heap (Memory.mark heap1) ∧ (¬t = Memory.null → Memory.mark heap1 t = true) else let new_gray : Finset Memory.loc := insert t gray_nodes; ((0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) < (2 : ℤ)) ∧ (∀(p1 : Memory.loc) (t1 : Memory.loc) (pc : ℤ) (heap2 : Memory.memory), ((1 : ℤ) = (0 : ℤ) → pc = (1 : ℤ) ∧ t1 = root ∧ p1 = Memory.null ∧ heap2 = heap1) ∧ (¬(¬p = Memory.null ∨ ¬t = Memory.null ∧ ¬Memory.mark heap1 t = true) → pc = (2 : ℤ) ∧ t1 = t ∧ p1 = p ∧ heap2 = heap1) ∧ (¬p = Memory.null ∨ ¬t = Memory.null ∧ ¬Memory.mark heap1 t = true → pc = (1 : ℤ) ∧ ((t = Memory.null ∨ Memory.mark heap1 t = true) ∧ Memory.color heap1 p = true → t1 = p ∧ p1 = Memory.right1 heap1 p ∧ Memory.update (Memory.right1 heap2) (Memory.right1 heap1) p t ∧ Memory.left1 heap2 = Memory.left1 heap1 ∧ Memory.mark heap2 = Memory.mark heap1 ∧ Memory.color heap2 = Memory.color heap1) ∧ ((t = Memory.null ∨ Memory.mark heap1 t = true) ∧ ¬Memory.color heap1 p = true → p1 = p ∧ t1 = Memory.right1 heap1 p ∧ Memory.update (Memory.right1 heap2) (Memory.right1 heap1) p1 (Memory.left1 heap1 p) ∧ Memory.update (Memory.left1 heap2) (Memory.left1 heap1) p1 t ∧ Memory.update (Memory.color heap2) (Memory.color heap1) p1 true ∧ Memory.mark heap2 = Memory.mark heap1) ∧ (¬(t = Memory.null ∨ Memory.mark heap1 t = true) → p1 = t ∧ t1 = Memory.left1 heap1 t ∧ Memory.update (Memory.left1 heap2) (Memory.left1 heap1) t p ∧ Memory.update (Memory.mark heap2) (Memory.mark heap1) p1 true ∧ Memory.update (Memory.color heap2) (Memory.color heap1) p1 false ∧ Memory.right1 heap2 = Memory.right1 heap1)) → (((0 : ℤ) ≤ Int.ofNat (Finset.card graph) - Int.ofNat (Finset.card gray_nodes) ∧ Int.ofNat (Finset.card graph) - Int.ofNat (Finset.card new_gray) < Int.ofNat (Finset.card graph) - Int.ofNat (Finset.card gray_nodes)) ∧ pc = (1 : ℤ) ∧ t1 ∈ graph ∧ GraphShape.well_colored_on graph new_gray heap (Memory.mark heap2) ∧ (∀(x : Memory.loc), ¬x = Memory.null ∧ ¬Memory.mark heap2 x = true → Memory.left1 heap2 x = Memory.left1 heap x ∧ Memory.right1 heap2 x = Memory.right1 heap x)) ∧ (∀(heap3 : Memory.memory), GraphShape.unchanged_structure heap2 heap3 ∧ GraphShape.well_colored_on graph new_gray heap (Memory.mark heap3) ∧ (¬t1 = Memory.null → Memory.mark heap3 t1 = true) ∧ (∀(x : Memory.loc), ¬x = Memory.null → ¬GraphShape.path heap t1 x ∨ Memory.mark heap2 x = true → Memory.mark heap3 x = Memory.mark heap2 x ∧ Memory.color heap3 x = Memory.color heap2 x) → ((0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) < (2 : ℤ)) ∧ (∀(p2 : Memory.loc) (t2 : Memory.loc) (pc1 : ℤ) (heap4 : Memory.memory), ((1 : ℤ) = (0 : ℤ) → pc1 = (1 : ℤ) ∧ t2 = root ∧ p2 = Memory.null ∧ heap4 = heap3) ∧ (¬(¬p1 = Memory.null ∨ ¬t1 = Memory.null ∧ ¬Memory.mark heap3 t1 = true) → pc1 = (2 : ℤ) ∧ t2 = t1 ∧ p2 = p1 ∧ heap4 = heap3) ∧ (¬p1 = Memory.null ∨ ¬t1 = Memory.null ∧ ¬Memory.mark heap3 t1 = true → pc1 = (1 : ℤ) ∧ ((t1 = Memory.null ∨ Memory.mark heap3 t1 = true) ∧ Memory.color heap3 p1 = true → t2 = p1 ∧ p2 = Memory.right1 heap3 p1 ∧ Memory.update (Memory.right1 heap4) (Memory.right1 heap3) p1 t1 ∧ Memory.left1 heap4 = Memory.left1 heap3 ∧ Memory.mark heap4 = Memory.mark heap3 ∧ Memory.color heap4 = Memory.color heap3) ∧ ((t1 = Memory.null ∨ Memory.mark heap3 t1 = true) ∧ ¬Memory.color heap3 p1 = true → p2 = p1 ∧ t2 = Memory.right1 heap3 p1 ∧ Memory.update (Memory.right1 heap4) (Memory.right1 heap3) p2 (Memory.left1 heap3 p1) ∧ Memory.update (Memory.left1 heap4) (Memory.left1 heap3) p2 t1 ∧ Memory.update (Memory.color heap4) (Memory.color heap3) p2 true ∧ Memory.mark heap4 = Memory.mark heap3) ∧ (¬(t1 = Memory.null ∨ Memory.mark heap3 t1 = true) → p2 = t1 ∧ t2 = Memory.left1 heap3 t1 ∧ Memory.update (Memory.left1 heap4) (Memory.left1 heap3) t1 p1 ∧ Memory.update (Memory.mark heap4) (Memory.mark heap3) p2 true ∧ Memory.update (Memory.color heap4) (Memory.color heap3) p2 false ∧ Memory.right1 heap4 = Memory.right1 heap3)) → (((0 : ℤ) ≤ Int.ofNat (Finset.card graph) - Int.ofNat (Finset.card gray_nodes) ∧ Int.ofNat (Finset.card graph) - Int.ofNat (Finset.card new_gray) < Int.ofNat (Finset.card graph) - Int.ofNat (Finset.card gray_nodes)) ∧ pc1 = (1 : ℤ) ∧ t2 ∈ graph ∧ GraphShape.well_colored_on graph new_gray heap (Memory.mark heap4) ∧ (∀(x : Memory.loc), ¬x = Memory.null ∧ ¬Memory.mark heap4 x = true → Memory.left1 heap4 x = Memory.left1 heap x ∧ Memory.right1 heap4 x = Memory.right1 heap x)) ∧ (∀(heap5 : Memory.memory), GraphShape.unchanged_structure heap4 heap5 ∧ GraphShape.well_colored_on graph new_gray heap (Memory.mark heap5) ∧ (¬t2 = Memory.null → Memory.mark heap5 t2 = true) ∧ (∀(x : Memory.loc), ¬x = Memory.null → ¬GraphShape.path heap t2 x ∨ Memory.mark heap4 x = true → Memory.mark heap5 x = Memory.mark heap4 x ∧ Memory.color heap5 x = Memory.color heap4 x) → ((0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) < (2 : ℤ)) ∧ (∀(p3 : Memory.loc) (t3 : Memory.loc) (pc2 : ℤ) (heap6 : Memory.memory), ((1 : ℤ) = (0 : ℤ) → pc2 = (1 : ℤ) ∧ t3 = root ∧ p3 = Memory.null ∧ heap6 = heap5) ∧ (¬(¬p2 = Memory.null ∨ ¬t2 = Memory.null ∧ ¬Memory.mark heap5 t2 = true) → pc2 = (2 : ℤ) ∧ t3 = t2 ∧ p3 = p2 ∧ heap6 = heap5) ∧ (¬p2 = Memory.null ∨ ¬t2 = Memory.null ∧ ¬Memory.mark heap5 t2 = true → pc2 = (1 : ℤ) ∧ ((t2 = Memory.null ∨ Memory.mark heap5 t2 = true) ∧ Memory.color heap5 p2 = true → t3 = p2 ∧ p3 = Memory.right1 heap5 p2 ∧ Memory.update (Memory.right1 heap6) (Memory.right1 heap5) p2 t2 ∧ Memory.left1 heap6 = Memory.left1 heap5 ∧ Memory.mark heap6 = Memory.mark heap5 ∧ Memory.color heap6 = Memory.color heap5) ∧ ((t2 = Memory.null ∨ Memory.mark heap5 t2 = true) ∧ ¬Memory.color heap5 p2 = true → p3 = p2 ∧ t3 = Memory.right1 heap5 p2 ∧ Memory.update (Memory.right1 heap6) (Memory.right1 heap5) p3 (Memory.left1 heap5 p2) ∧ Memory.update (Memory.left1 heap6) (Memory.left1 heap5) p3 t2 ∧ Memory.update (Memory.color heap6) (Memory.color heap5) p3 true ∧ Memory.mark heap6 = Memory.mark heap5) ∧ (¬(t2 = Memory.null ∨ Memory.mark heap5 t2 = true) → p3 = t2 ∧ t3 = Memory.left1 heap5 t2 ∧ Memory.update (Memory.left1 heap6) (Memory.left1 heap5) t2 p2 ∧ Memory.update (Memory.mark heap6) (Memory.mark heap5) p3 true ∧ Memory.update (Memory.color heap6) (Memory.color heap5) p3 false ∧ Memory.right1 heap6 = Memory.right1 heap5)) → pc2 = (1 : ℤ) ∧ (t3 = t ∧ p3 = p) ∧ GraphShape.unchanged_structure heap1 heap6 ∧ GraphShape.well_colored_on graph gray_nodes heap (Memory.mark heap6) ∧ (¬t3 = Memory.null → Memory.mark heap6 t3 = true) ∧ (∀(x : Memory.loc), ¬x = Memory.null → ¬GraphShape.path heap t3 x ∨ Memory.mark heap1 x = true → Memory.mark heap6 x = Memory.mark heap1 x ∧ Memory.color heap6 x = Memory.color heap1 x))))))))) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < (2 : ℤ) ∧ (((0 : ℤ) = (1 : ℤ) → (1 : ℤ) = (2 : ℤ) ∧ root = Memory.null) → (let o1 : Finset Memory.loc := (∅ : Finset Memory.loc); (root ∈ graph ∧ GraphShape.well_colored_on graph o1 heap (Memory.mark heap) ∧ (∀(x : Memory.loc), ¬x = Memory.null ∧ ¬Memory.mark heap x = true → True)) ∧ (∀(heap1 : Memory.memory), GraphShape.unchanged_structure heap heap1 ∧ GraphShape.well_colored_on graph o1 heap (Memory.mark heap1) ∧ (¬root = Memory.null → Memory.mark heap1 root = true) ∧ (∀(x : Memory.loc), ¬x = Memory.null → ¬GraphShape.path heap root x ∨ Memory.mark heap x = true → Memory.mark heap1 x = Memory.mark heap x ∧ Memory.color heap1 x = Memory.color heap x) → ((0 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) < (2 : ℤ)) ∧ (∀(p : Memory.loc) (t : Memory.loc) (pc : ℤ) (heap2 : Memory.memory), ((1 : ℤ) = (0 : ℤ) → pc = (1 : ℤ) ∧ t = root ∧ p = Memory.null ∧ heap2 = heap1) ∧ (¬(¬True ∨ ¬root = Memory.null ∧ ¬Memory.mark heap1 root = true) → pc = (2 : ℤ) ∧ t = root ∧ p = Memory.null ∧ heap2 = heap1) ∧ (¬True ∨ ¬root = Memory.null ∧ ¬Memory.mark heap1 root = true → pc = (1 : ℤ) ∧ ((root = Memory.null ∨ Memory.mark heap1 root = true) ∧ Memory.color heap1 Memory.null = true → t = Memory.null ∧ p = Memory.right1 heap1 Memory.null ∧ Memory.update (Memory.right1 heap2) (Memory.right1 heap1) Memory.null root ∧ Memory.left1 heap2 = Memory.left1 heap1 ∧ Memory.mark heap2 = Memory.mark heap1 ∧ Memory.color heap2 = Memory.color heap1) ∧ ((root = Memory.null ∨ Memory.mark heap1 root = true) ∧ ¬Memory.color heap1 Memory.null = true → p = Memory.null ∧ t = Memory.right1 heap1 Memory.null ∧ Memory.update (Memory.right1 heap2) (Memory.right1 heap1) p (Memory.left1 heap1 Memory.null) ∧ Memory.update (Memory.left1 heap2) (Memory.left1 heap1) p root ∧ Memory.update (Memory.color heap2) (Memory.color heap1) p true ∧ Memory.mark heap2 = Memory.mark heap1) ∧ (¬(root = Memory.null ∨ Memory.mark heap1 root = true) → p = root ∧ t = Memory.left1 heap1 root ∧ Memory.update (Memory.left1 heap2) (Memory.left1 heap1) root Memory.null ∧ Memory.update (Memory.mark heap2) (Memory.mark heap1) p true ∧ Memory.update (Memory.color heap2) (Memory.color heap1) p false ∧ Memory.right1 heap2 = Memory.right1 heap1)) → GraphShape.unchanged_structure heap heap2 ∧ (∀(x : Memory.loc), GraphShape.path heap root x ∧ ¬x = Memory.null → Memory.mark heap2 x = true) ∧ (∀(x : Memory.loc), ¬GraphShape.path heap root x ∧ ¬x = Memory.null → Memory.mark heap2 x = Memory.mark heap x)))))
  := sorry
end schorr_waite_with_ghost_monitor_SchorrWaite_schorr_waiteqtvc
