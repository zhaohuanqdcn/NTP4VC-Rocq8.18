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
namespace patience_PatienceAbstract_play_cardqtvc
axiom card : Type
axiom inhabited_axiom_card : Inhabited card
attribute [instance] inhabited_axiom_card
structure state where
  num_stacks : ℤ
  num_elts : ℤ
  values : ℤ -> ℤ
  stack_sizes : ℤ -> ℤ
  stacks1 : ℤ -> ℤ -> ℤ
  positions : ℤ -> ℤ × ℤ
  preds : ℤ -> ℤ
axiom inhabited_axiom_state : Inhabited state
attribute [instance] inhabited_axiom_state
noncomputable def inv (s : state) := ((0 : ℤ) ≤ state.num_stacks s ∧ state.num_stacks s ≤ state.num_elts s) ∧ ((0 : ℤ) < state.num_elts s → (0 : ℤ) < state.num_stacks s) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < state.num_stacks s → (1 : ℤ) ≤ state.stack_sizes s i ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < state.stack_sizes s i → (0 : ℤ) ≤ state.stacks1 s i j ∧ state.stacks1 s i j < state.num_elts s)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < state.num_elts s → (match state.positions s i with | (is, ip) => ((0 : ℤ) ≤ is ∧ is < state.num_stacks s) ∧ ((0 : ℤ) ≤ ip ∧ ip < state.stack_sizes s is) ∧ state.stacks1 s is ip = i)) ∧ (∀(is : ℤ), (0 : ℤ) ≤ is ∧ is < state.num_stacks s → (∀(ip : ℤ), (0 : ℤ) ≤ ip ∧ ip < state.stack_sizes s is → (is, ip) = state.positions s (state.stacks1 s is ip))) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < state.num_stacks s → (let stack_i : ℤ -> ℤ := state.stacks1 s i; ∀(j : ℤ) (k : ℤ), (0 : ℤ) ≤ j ∧ j < k ∧ k < state.stack_sizes s i → stack_i j < stack_i k)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < state.num_stacks s → (let stack_i : ℤ -> ℤ := state.stacks1 s i; ∀(j : ℤ) (k : ℤ), (0 : ℤ) ≤ j ∧ j ≤ k ∧ k < state.stack_sizes s i → state.values s (stack_i k) ≤ state.values s (stack_i j))) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < state.num_elts s → (let pred : ℤ := state.preds s i; (-(1 : ℤ) ≤ pred ∧ pred < state.num_elts s) ∧ pred < i ∧ (match state.positions s i with | (is, x_ip) => (if pred < (0 : ℤ) then is = (0 : ℤ) else state.values s pred < state.values s i ∧ (0 : ℤ) < is ∧ (match state.positions s pred with | (ps, x_pp) => ps = is - (1 : ℤ))))))
theorem play_card'vc (s : state) (c : ℤ) (fact0 : inv s) : let o1 : ℤ := state.num_stacks s - (1 : ℤ); ((0 : ℤ) ≤ o1 + (1 : ℤ) → (∀(pred : ℤ), (∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ o1) ∧ (if i = (0 : ℤ) then pred = -(1 : ℤ) else pred = state.stacks1 s (i - (1 : ℤ)) (state.stack_sizes s (i - (1 : ℤ)) - (1 : ℤ)) ∧ state.values s pred < c ∧ ((0 : ℤ) ≤ pred ∧ pred < state.num_elts s) ∧ (match state.positions s pred with | (ps, x_pp) => ps = i - (1 : ℤ))) → (let top_stack_i : ℤ := state.stacks1 s i (state.stack_sizes s i - (1 : ℤ)); if c ≤ state.values s top_stack_i then let stack_i_size : ℤ := state.stack_sizes s i; let idx : ℤ := state.num_elts s; ∀(s1 : state), state.num_stacks s1 = state.num_stacks s ∧ state.num_elts s1 = idx + (1 : ℤ) ∧ state.values s1 = state.values s ∧ state.stack_sizes s1 = state.stack_sizes s ∧ state.stacks1 s1 = state.stacks1 s ∧ state.positions s1 = state.positions s ∧ state.preds s1 = state.preds s → (∀(s2 : state), state.num_stacks s2 = state.num_stacks s1 ∧ state.num_elts s2 = state.num_elts s1 ∧ state.values s2 = Function.update (state.values s1) idx c ∧ state.stack_sizes s2 = state.stack_sizes s1 ∧ state.stacks1 s2 = state.stacks1 s1 ∧ state.positions s2 = state.positions s1 ∧ state.preds s2 = state.preds s1 → (∀(s3 : state), state.num_stacks s3 = state.num_stacks s2 ∧ state.num_elts s3 = state.num_elts s2 ∧ state.values s3 = state.values s2 ∧ state.stack_sizes s3 = Function.update (state.stack_sizes s2) i (stack_i_size + (1 : ℤ)) ∧ state.stacks1 s3 = state.stacks1 s2 ∧ state.positions s3 = state.positions s2 ∧ state.preds s3 = state.preds s2 → (∀(s4 : state), state.num_stacks s4 = state.num_stacks s3 ∧ state.num_elts s4 = state.num_elts s3 ∧ state.values s4 = state.values s3 ∧ state.stack_sizes s4 = state.stack_sizes s3 ∧ state.stacks1 s4 = Function.update (state.stacks1 s3) i (Function.update (state.stacks1 s i) stack_i_size idx) ∧ state.positions s4 = state.positions s3 ∧ state.preds s4 = state.preds s3 → (∀(s5 : state), state.num_stacks s5 = state.num_stacks s4 ∧ state.num_elts s5 = state.num_elts s4 ∧ state.values s5 = state.values s4 ∧ state.stack_sizes s5 = state.stack_sizes s4 ∧ state.stacks1 s5 = state.stacks1 s4 ∧ state.positions s5 = Function.update (state.positions s4) idx (i, stack_i_size) ∧ state.preds s5 = state.preds s4 → (∀(s6 : state), state.num_stacks s6 = state.num_stacks s5 ∧ state.num_elts s6 = state.num_elts s5 ∧ state.values s6 = state.values s5 ∧ state.stack_sizes s6 = state.stack_sizes s5 ∧ state.stacks1 s6 = state.stacks1 s5 ∧ state.positions s6 = state.positions s5 ∧ state.preds s6 = Function.update (state.preds s5) idx pred → inv s6 ∧ state.num_elts s6 = state.num_elts s + (1 : ℤ) ∧ state.values s6 = Function.update (state.values s) (state.num_elts s) c))))) else if i + (1 : ℤ) = (0 : ℤ) then top_stack_i = -(1 : ℤ) else top_stack_i = state.stacks1 s (i + (1 : ℤ) - (1 : ℤ)) (state.stack_sizes s (i + (1 : ℤ) - (1 : ℤ)) - (1 : ℤ)) ∧ state.values s top_stack_i < c ∧ ((0 : ℤ) ≤ top_stack_i ∧ top_stack_i < state.num_elts s) ∧ (match state.positions s top_stack_i with | (ps, x_pp) => ps = i + (1 : ℤ) - (1 : ℤ)))) ∧ ((if o1 + (1 : ℤ) = (0 : ℤ) then pred = -(1 : ℤ) else pred = state.stacks1 s (o1 + (1 : ℤ) - (1 : ℤ)) (state.stack_sizes s (o1 + (1 : ℤ) - (1 : ℤ)) - (1 : ℤ)) ∧ state.values s pred < c ∧ ((0 : ℤ) ≤ pred ∧ pred < state.num_elts s) ∧ (match state.positions s pred with | (ps, x_pp) => ps = o1 + (1 : ℤ) - (1 : ℤ))) → (let idx : ℤ := state.num_elts s; let i : ℤ := state.num_stacks s; ∀(s1 : state), state.num_stacks s1 = state.num_stacks s ∧ state.num_elts s1 = idx + (1 : ℤ) ∧ state.values s1 = state.values s ∧ state.stack_sizes s1 = state.stack_sizes s ∧ state.stacks1 s1 = state.stacks1 s ∧ state.positions s1 = state.positions s ∧ state.preds s1 = state.preds s → (∀(s2 : state), state.num_stacks s2 = state.num_stacks s1 ∧ state.num_elts s2 = state.num_elts s1 ∧ state.values s2 = Function.update (state.values s1) idx c ∧ state.stack_sizes s2 = state.stack_sizes s1 ∧ state.stacks1 s2 = state.stacks1 s1 ∧ state.positions s2 = state.positions s1 ∧ state.preds s2 = state.preds s1 → (∀(s3 : state), state.num_stacks s3 = state.num_stacks s2 + (1 : ℤ) ∧ state.num_elts s3 = state.num_elts s2 ∧ state.values s3 = state.values s2 ∧ state.stack_sizes s3 = state.stack_sizes s2 ∧ state.stacks1 s3 = state.stacks1 s2 ∧ state.positions s3 = state.positions s2 ∧ state.preds s3 = state.preds s2 → (∀(s4 : state), state.num_stacks s4 = state.num_stacks s3 ∧ state.num_elts s4 = state.num_elts s3 ∧ state.values s4 = state.values s3 ∧ state.stack_sizes s4 = Function.update (state.stack_sizes s3) i (1 : ℤ) ∧ state.stacks1 s4 = state.stacks1 s3 ∧ state.positions s4 = state.positions s3 ∧ state.preds s4 = state.preds s3 → (∀(s5 : state), state.num_stacks s5 = state.num_stacks s4 ∧ state.num_elts s5 = state.num_elts s4 ∧ state.values s5 = state.values s4 ∧ state.stack_sizes s5 = state.stack_sizes s4 ∧ state.stacks1 s5 = Function.update (state.stacks1 s4) i (Function.update (state.stacks1 s i) (0 : ℤ) idx) ∧ state.positions s5 = state.positions s4 ∧ state.preds s5 = state.preds s4 → (∀(s6 : state), state.num_stacks s6 = state.num_stacks s5 ∧ state.num_elts s6 = state.num_elts s5 ∧ state.values s6 = state.values s5 ∧ state.stack_sizes s6 = state.stack_sizes s5 ∧ state.stacks1 s6 = state.stacks1 s5 ∧ state.positions s6 = Function.update (state.positions s5) idx (i, (0 : ℤ)) ∧ state.preds s6 = state.preds s5 → (∀(s7 : state), state.num_stacks s7 = state.num_stacks s6 ∧ state.num_elts s7 = state.num_elts s6 ∧ state.values s7 = state.values s6 ∧ state.stack_sizes s7 = state.stack_sizes s6 ∧ state.stacks1 s7 = state.stacks1 s6 ∧ state.positions s7 = state.positions s6 ∧ state.preds s7 = Function.update (state.preds s6) idx pred → inv s7 ∧ state.num_elts s7 = state.num_elts s + (1 : ℤ) ∧ state.values s7 = Function.update (state.values s) (state.num_elts s) c)))))))))) ∧ (o1 + (1 : ℤ) < (0 : ℤ) → (let idx : ℤ := state.num_elts s; let i : ℤ := state.num_stacks s; ∀(s1 : state), state.num_stacks s1 = state.num_stacks s ∧ state.num_elts s1 = idx + (1 : ℤ) ∧ state.values s1 = state.values s ∧ state.stack_sizes s1 = state.stack_sizes s ∧ state.stacks1 s1 = state.stacks1 s ∧ state.positions s1 = state.positions s ∧ state.preds s1 = state.preds s → (∀(s2 : state), state.num_stacks s2 = state.num_stacks s1 ∧ state.num_elts s2 = state.num_elts s1 ∧ state.values s2 = Function.update (state.values s1) idx c ∧ state.stack_sizes s2 = state.stack_sizes s1 ∧ state.stacks1 s2 = state.stacks1 s1 ∧ state.positions s2 = state.positions s1 ∧ state.preds s2 = state.preds s1 → (∀(s3 : state), state.num_stacks s3 = state.num_stacks s2 + (1 : ℤ) ∧ state.num_elts s3 = state.num_elts s2 ∧ state.values s3 = state.values s2 ∧ state.stack_sizes s3 = state.stack_sizes s2 ∧ state.stacks1 s3 = state.stacks1 s2 ∧ state.positions s3 = state.positions s2 ∧ state.preds s3 = state.preds s2 → (∀(s4 : state), state.num_stacks s4 = state.num_stacks s3 ∧ state.num_elts s4 = state.num_elts s3 ∧ state.values s4 = state.values s3 ∧ state.stack_sizes s4 = Function.update (state.stack_sizes s3) i (1 : ℤ) ∧ state.stacks1 s4 = state.stacks1 s3 ∧ state.positions s4 = state.positions s3 ∧ state.preds s4 = state.preds s3 → (∀(s5 : state), state.num_stacks s5 = state.num_stacks s4 ∧ state.num_elts s5 = state.num_elts s4 ∧ state.values s5 = state.values s4 ∧ state.stack_sizes s5 = state.stack_sizes s4 ∧ state.stacks1 s5 = Function.update (state.stacks1 s4) i (Function.update (state.stacks1 s i) (0 : ℤ) idx) ∧ state.positions s5 = state.positions s4 ∧ state.preds s5 = state.preds s4 → (∀(s6 : state), state.num_stacks s6 = state.num_stacks s5 ∧ state.num_elts s6 = state.num_elts s5 ∧ state.values s6 = state.values s5 ∧ state.stack_sizes s6 = state.stack_sizes s5 ∧ state.stacks1 s6 = state.stacks1 s5 ∧ state.positions s6 = Function.update (state.positions s5) idx (i, (0 : ℤ)) ∧ state.preds s6 = state.preds s5 → (∀(s7 : state), state.num_stacks s7 = state.num_stacks s6 ∧ state.num_elts s7 = state.num_elts s6 ∧ state.values s7 = state.values s6 ∧ state.stack_sizes s7 = state.stack_sizes s6 ∧ state.stacks1 s7 = state.stacks1 s6 ∧ state.positions s7 = state.positions s6 ∧ state.preds s7 = Function.update (state.preds s6) idx (-(1 : ℤ)) → inv s7 ∧ state.num_elts s7 = state.num_elts s + (1 : ℤ) ∧ state.values s7 = Function.update (state.values s) (state.num_elts s) c))))))))
  := sorry
end patience_PatienceAbstract_play_cardqtvc
