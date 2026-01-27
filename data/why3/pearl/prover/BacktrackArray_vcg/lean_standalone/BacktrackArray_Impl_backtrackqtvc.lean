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

namespace Config
end Config
namespace Func
noncomputable def extensionalEqual {β : Type} {α : Type} [Inhabited β] [Inhabited α] (f : α -> β) (g : α -> β) := ∀(x : α), f x = g x
axiom functionExtensionality {β : Type} {α : Type} [Inhabited β] [Inhabited α] (f : α -> β) (g : α -> β) (fact0 : extensionalEqual f g) : f = g
axiom update :  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> (α -> β) -> α -> β -> α -> β
axiom update_def {β : Type} {α : Type} [Inhabited β] [Inhabited α] (f : α -> β) (x : α) (y : β) (z : α) : update f x y z = (if x = z then y else f z)
axiom identity :  {α : Type} -> [Inhabited α] -> α -> α
axiom identity_def {α : Type} [Inhabited α] (x : α) : identity x = x
axiom compose :  {γ : Type} -> [Inhabited γ] ->  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> (β -> γ) -> (α -> β) -> α -> γ
axiom compose_def {γ : Type} {β : Type} {α : Type} [Inhabited γ] [Inhabited β] [Inhabited α] (g : β -> γ) (f : α -> β) (x : α) : compose g f x = g (f x)
axiom const :  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> β -> α -> β
axiom const_def {β : Type} {α : Type} [Inhabited β] [Inhabited α] (x : β) (z : α) : (const : β -> α -> β) x z = x
end Func
namespace Pred
noncomputable def predExtensionalEqual {α : Type} [Inhabited α] (p : α -> Bool) (q : α -> Bool) := ∀(x : α), (p x = true) = (q x = true)
axiom predicateExtensionality {α : Type} [Inhabited α] (p : α -> Bool) (q : α -> Bool) (fact0 : predExtensionalEqual p q) : p = q
noncomputable def evalp {α : Type} [Inhabited α] (p : α -> Bool) (x : α) := p x = true
axiom pupdate :  {α : Type} -> [Inhabited α] -> (α -> Bool) -> α -> Bool -> α -> Bool
axiom pupdate_def {α : Type} [Inhabited α] (p : α -> Bool) (x : α) (y : Bool) (z : α) : (pupdate p x y z = true) = (if x = z then y = true else p z = true)
axiom pcompose :  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> (β -> Bool) -> (α -> β) -> α -> Bool
axiom pcompose_def {β : Type} {α : Type} [Inhabited β] [Inhabited α] (p : β -> Bool) (f : α -> β) (x : α) : (pcompose p f x = true) = (p (f x) = true)
axiom pfalse :  {α : Type} -> [Inhabited α] -> α -> Bool
axiom pfalse_def {α : Type} [Inhabited α] (x : α) : ¬pfalse x = true
axiom ptrue :  {α : Type} -> [Inhabited α] -> α -> Bool
axiom ptrue_def {α : Type} [Inhabited α] (x : α) : ptrue x = true
end Pred
namespace Types
structure timestamp (α : Type) where
  time : ℤ
  size : ℤ
  table : ℤ -> List α
axiom inhabited_axiom_timestamp {α : Type} [Inhabited α] : Inhabited (timestamp α)
attribute [instance] inhabited_axiom_timestamp
structure t (α : Type) where
  history : List ℤ
  current_time : ℤ
  buffer : List (List α)
  inv : α -> Bool
axiom inhabited_axiom_t {α : Type} [Inhabited α] : Inhabited (t α)
attribute [instance] inhabited_axiom_t
end Types
namespace Choice
axiom default :  {α : Type} -> [Inhabited α] -> α
axiom choice :  {α : Type} -> [Inhabited α] -> (α -> Bool) -> α
axiom choice_behaviour {α : Type} [Inhabited α] (p : α -> Bool) (x : α) (fact0 : p x = true) : p (choice p) = true
end Choice
namespace Logic
axiom func_of_array :  {α : Type} -> [Inhabited α] -> List α -> α -> ℤ -> α
axiom func_of_array_def {α : Type} [Inhabited α] (a : List α) (def1 : α) (x : ℤ) : func_of_array a def1 x = (if (0 : ℤ) ≤ x ∧ x < Int.ofNat (List.length a) then (getElem! a ∘ Int.toNat) x else def1)
noncomputable def current_timestamp {α : Type} [Inhabited α] (x : Types.t α) := Types.timestamp.mk (Types.t.current_time x) (Int.ofNat (List.length (Types.t.buffer x))) (func_of_array (Types.t.buffer x) ([] : List α))
noncomputable def correct_table {α : Type} [Inhabited α] (sz : ℤ) (b : ℤ -> List α) := ∀(x : ℤ), sz ≤ x ∨ x < (0 : ℤ) → b x = ([] : List α)
noncomputable def pop {α : Type} [Inhabited α] (l : List α) := match l with | ([] : List α) => (Choice.default : List α) | List.cons x_x q => q
noncomputable def unroll {α : Type} [Inhabited α] : ℤ -> ℤ -> List ℤ -> (ℤ -> List α) -> ℤ -> Types.timestamp α
  | tm, t0, h, b, sz => if tm = (0 : ℤ) then Types.timestamp.mk t0 sz b else match h with | ([] : List ℤ) => Types.timestamp.mk (t0 + tm) sz b | List.cons x q => (if x = -(1 : ℤ) then unroll (tm - (1 : ℤ)) t0 q b (Int.tdiv sz (2 : ℤ)) else unroll (tm - (1 : ℤ)) t0 q (Func.update b x (pop (b x))) sz)
noncomputable def unroll_correct {α : Type} [Inhabited α] : ℤ -> List ℤ -> (ℤ -> List α) -> ℤ -> Prop
  | tm, ([] : List ℤ), b, sz => tm = (0 : ℤ)
  | tm, (List.cons x q), b, sz => if x = -(1 : ℤ) then let s0 : ℤ := Int.tdiv sz (2 : ℤ); s0 * (2 : ℤ) = sz ∧ unroll_correct (tm - (1 : ℤ)) q b s0 ∧ (∀(i : ℤ), s0 ≤ i ∨ i < (0 : ℤ) → b i = ([] : List α)) else ¬b x = ([] : List α) ∧ ((0 : ℤ) ≤ x ∧ x < sz) ∧ unroll_correct (tm - (1 : ℤ)) q (Func.update b x (pop (b x))) sz
noncomputable def past_time {α : Type} [Inhabited α] (t : Types.timestamp α) (tb : Types.t α) := Types.timestamp.time t ≤ Types.t.current_time tb ∧ unroll (Types.t.current_time tb - Types.timestamp.time t) (Types.timestamp.time t) (Types.t.history tb) (func_of_array (Types.t.buffer tb) ([] : List α)) (Int.ofNat (List.length (Types.t.buffer tb))) = t
noncomputable def precede {α : Type} [Inhabited α] (tb1 : Types.t α) (tb2 : Types.t α) := ∀(t : Types.timestamp α), past_time t tb1 → past_time t tb2
noncomputable def before {α : Type} [Inhabited α] (t1 : Types.timestamp α) (t2 : Types.timestamp α) := Types.timestamp.time t1 ≤ Types.timestamp.time t2
noncomputable def list_forall {α : Type} [Inhabited α] : (α -> Bool) -> List α -> Prop
  | p, ([] : List α) => True
  | p, (List.cons x q) => p x = true ∧ list_forall p q
noncomputable def correct {α : Type} [Inhabited α] (tb : Types.t α) := (∀(t : Types.timestamp α), past_time t tb → (0 : ℤ) < Types.timestamp.size t) ∧ (∀(t : Types.timestamp α) (i : ℤ), past_time t tb ∧ (0 : ℤ) ≤ i → list_forall (Types.t.inv tb) (Types.timestamp.table t i)) ∧ (∀(t : Types.timestamp α), past_time t tb → correct_table (Types.timestamp.size t) (Types.timestamp.table t)) ∧ unroll_correct (Types.t.current_time tb) (Types.t.history tb) (func_of_array (Types.t.buffer tb) ([] : List α)) (Int.ofNat (List.length (Types.t.buffer tb)))
noncomputable def backtrack_to {α : Type} [Inhabited α] (tbold : Types.t α) (tbinter : Types.t α) (tbnew : Types.t α) := (∀(tm : Types.timestamp α), past_time tm tbold → past_time tm tbinter ∧ Types.timestamp.time tm ≤ Types.timestamp.time (current_timestamp tbold) ∧ Types.timestamp.time tm ≤ Types.timestamp.time (current_timestamp tbnew) ∧ before tm (current_timestamp tbnew) ∧ past_time tm tbnew) ∧ (∀(tm : Types.timestamp α), past_time tm tbold → past_time tm tbnew) ∧ precede tbold tbnew
end Logic
namespace BacktrackArray_Impl_backtrackqtvc
theorem backtrack'vc {α : Type} [Inhabited α] (t : Types.timestamp α) (tb : Types.t α) (fact0 : Logic.past_time t tb) (fact1 : Logic.correct tb) : let final_size : ℤ := Types.timestamp.size t; let o1 : List (List α) := Types.t.buffer tb; ∀(o2 : List (List α)), List.length o2 = List.length o1 ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length o2) → o2[Int.toNat i]! = o1[Int.toNat i]!) → (let tbc : Types.t α := Types.t.mk (Types.t.history tb) (Types.t.current_time tb) o2 (Types.t.inv tb); (∀(tbc1 : Types.t α) (tb1 : Types.t α), Types.t.inv tbc1 = Types.t.inv tb → Types.t.inv tb1 = Types.t.inv tb → (∀(delta : ℤ), Logic.correct tbc1 ∧ Logic.past_time t tbc1 ∧ (0 : ℤ) ≤ delta ∧ Types.t.current_time tbc1 = Types.timestamp.time t + delta ∧ (Types.t.history tbc1 = Types.t.history tb1 ∧ (∀(x : ℤ), ((0 : ℤ) ≤ x ∧ x < final_size) ∧ x < Int.ofNat (List.length (Types.t.buffer tbc1)) → Logic.func_of_array (Types.t.buffer tbc1) ([] : List α) x = Logic.func_of_array (Types.t.buffer tb1) ([] : List α) x)) ∧ Int.ofNat (List.length (Types.t.buffer tb1)) ≤ final_size → (if ¬delta = (0 : ℤ) then match Types.t.history tb1 with | ([] : List ℤ) => False | List.cons x q => (∀(tb2 : Types.t α), Types.t.history tb2 = q ∧ Types.t.current_time tb2 = Types.t.current_time tb1 ∧ Types.t.buffer tb2 = Types.t.buffer tb1 ∧ Types.t.inv tb2 = Types.t.inv tb1 → (∀(tbc2 : Types.t α), Types.t.history tbc2 = q ∧ Types.t.current_time tbc2 = Types.t.current_time tbc1 ∧ Types.t.buffer tbc2 = Types.t.buffer tbc1 ∧ Types.t.inv tbc2 = Types.t.inv tbc1 → (∀(tbc3 : Types.t α), Types.t.history tbc3 = Types.t.history tbc2 ∧ Types.t.current_time tbc3 = Types.t.current_time tbc2 - (1 : ℤ) ∧ Types.t.buffer tbc3 = Types.t.buffer tbc2 ∧ Types.t.inv tbc3 = Types.t.inv tbc2 → (if x = -(1 : ℤ) then let buf1 : List (List α) := Types.t.buffer tbc3; ¬(2 : ℤ) = (0 : ℤ) ∧ (let len2 : ℤ := Int.tdiv (Int.ofNat (List.length buf1)) (2 : ℤ); (0 : ℤ) ≤ len2 ∧ (∀(buf2 : List (List α)), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < len2 → buf2[Int.toNat i]! = ([] : List α)) ∧ Int.ofNat (List.length buf2) = len2 → (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ len2 ∧ (0 : ℤ) + len2 ≤ Int.ofNat (List.length buf1)) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) + len2 ≤ Int.ofNat (List.length buf2)) ∧ (∀(buf21 : List (List α)), List.length buf21 = List.length buf2 → (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) ∨ (0 : ℤ) + len2 ≤ i ∧ i < Int.ofNat (List.length buf21) → buf21[Int.toNat i]! = buf2[Int.toNat i]!) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) + len2 → buf21[Int.toNat i]! = buf1[Int.toNat ((0 : ℤ) + i - (0 : ℤ))]!) → (∀(tbc4 : Types.t α), Types.t.history tbc4 = Types.t.history tbc3 ∧ Types.t.current_time tbc4 = Types.t.current_time tbc3 ∧ Types.t.buffer tbc4 = buf21 ∧ Types.t.inv tbc4 = Types.t.inv tbc3 → (let o3 : ℤ := delta - (1 : ℤ); (((0 : ℤ) ≤ delta ∧ o3 < delta) ∧ Logic.correct tbc4 ∧ Logic.past_time t tbc4 ∧ (0 : ℤ) ≤ o3 ∧ Types.t.current_time tbc4 = Types.timestamp.time t + o3 ∧ (Types.t.history tbc4 = Types.t.history tb2 ∧ (∀(x1 : ℤ), ((0 : ℤ) ≤ x1 ∧ x1 < final_size) ∧ x1 < Int.ofNat (List.length (Types.t.buffer tbc4)) → Logic.func_of_array (Types.t.buffer tbc4) ([] : List α) x1 = Logic.func_of_array (Types.t.buffer tb2) ([] : List α) x1)) ∧ Int.ofNat (List.length (Types.t.buffer tb2)) ≤ final_size) ∧ (∀(tbc5 : Types.t α) (tb3 : Types.t α), Types.t.inv tbc5 = Types.t.inv tbc4 → Types.t.current_time tb3 = Types.t.current_time tb2 ∧ List.length (Types.t.buffer tb3) = List.length (Types.t.buffer tb2) ∧ Types.t.inv tb3 = Types.t.inv tb2 → Logic.correct tbc5 ∧ (Types.t.history tbc5 = Types.t.history tb3 ∧ (∀(x1 : ℤ), (0 : ℤ) ≤ x1 ∧ x1 < final_size → Logic.func_of_array (Types.t.buffer tbc5) ([] : List α) x1 = Logic.func_of_array (Types.t.buffer tb3) ([] : List α) x1)) ∧ Logic.current_timestamp tbc5 = t ∧ List.length (Types.t.buffer tbc5) ≤ List.length (Types.t.buffer tbc4) ∧ Logic.precede tbc5 tbc4 ∧ (∀(t2 : Types.timestamp α), Logic.before t2 t ∧ Logic.past_time t2 tbc4 → Logic.past_time t2 tbc5) → Logic.correct tbc5 ∧ (Types.t.history tbc5 = Types.t.history tb3 ∧ (∀(x1 : ℤ), (0 : ℤ) ≤ x1 ∧ x1 < final_size → Logic.func_of_array (Types.t.buffer tbc5) ([] : List α) x1 = Logic.func_of_array (Types.t.buffer tb3) ([] : List α) x1)) ∧ Logic.current_timestamp tbc5 = t ∧ List.length (Types.t.buffer tbc5) ≤ List.length (Types.t.buffer tbc1) ∧ Logic.precede tbc5 tbc1 ∧ (∀(t2 : Types.timestamp α), Logic.before t2 t ∧ Logic.past_time t2 tbc1 → Logic.past_time t2 tbc5))))))) else if x < final_size then let o3 : List (List α) := Types.t.buffer tb2; ((0 : ℤ) ≤ x ∧ x < Int.ofNat (List.length o3)) ∧ (match o3[Int.toNat x]! with | ([] : List α) => False | List.cons _ q1 => (let o4 : List (List α) := Types.t.buffer tb2; ((0 : ℤ) ≤ x ∧ x < Int.ofNat (List.length o4)) ∧ (∀(tb3 : Types.t α), let o5 : List (List α) := Types.t.buffer tb3; List.length (Types.t.buffer tb3) = List.length o4 → tb3 = Types.t.mk (Types.t.history tb2) (Types.t.current_time tb2) (Types.t.buffer tb3) (Types.t.inv tb2) ∧ List.length (Types.t.buffer tb3) = List.length (Types.t.buffer tb2) → getElem! o5 ∘ Int.toNat = Function.update (getElem! o4 ∘ Int.toNat) x q1 ∧ o5 = List.set o4 (Int.toNat x) q1 → (let o6 : List (List α) := Types.t.buffer tbc3; ((0 : ℤ) ≤ x ∧ x < Int.ofNat (List.length o6)) ∧ (∀(tbc4 : Types.t α), let o7 : List (List α) := Types.t.buffer tbc4; List.length (Types.t.buffer tbc4) = List.length o6 → tbc4 = Types.t.mk (Types.t.history tbc3) (Types.t.current_time tbc3) (Types.t.buffer tbc4) (Types.t.inv tbc3) ∧ List.length (Types.t.buffer tbc4) = List.length (Types.t.buffer tbc3) → getElem! o7 ∘ Int.toNat = Function.update (getElem! o6 ∘ Int.toNat) x q1 ∧ o7 = List.set o6 (Int.toNat x) q1 → (let o8 : ℤ := delta - (1 : ℤ); (((0 : ℤ) ≤ delta ∧ o8 < delta) ∧ Logic.correct tbc4 ∧ Logic.past_time t tbc4 ∧ (0 : ℤ) ≤ o8 ∧ Types.t.current_time tbc4 = Types.timestamp.time t + o8 ∧ (Types.t.history tbc4 = Types.t.history tb3 ∧ (∀(x1 : ℤ), ((0 : ℤ) ≤ x1 ∧ x1 < final_size) ∧ x1 < Int.ofNat (List.length (Types.t.buffer tbc4)) → Logic.func_of_array (Types.t.buffer tbc4) ([] : List α) x1 = Logic.func_of_array (Types.t.buffer tb3) ([] : List α) x1)) ∧ Int.ofNat (List.length (Types.t.buffer tb3)) ≤ final_size) ∧ (∀(tbc5 : Types.t α) (tb4 : Types.t α), Types.t.inv tbc5 = Types.t.inv tbc4 → Types.t.current_time tb4 = Types.t.current_time tb3 ∧ List.length (Types.t.buffer tb4) = List.length (Types.t.buffer tb3) ∧ Types.t.inv tb4 = Types.t.inv tb3 → Logic.correct tbc5 ∧ (Types.t.history tbc5 = Types.t.history tb4 ∧ (∀(x1 : ℤ), (0 : ℤ) ≤ x1 ∧ x1 < final_size → Logic.func_of_array (Types.t.buffer tbc5) ([] : List α) x1 = Logic.func_of_array (Types.t.buffer tb4) ([] : List α) x1)) ∧ Logic.current_timestamp tbc5 = t ∧ List.length (Types.t.buffer tbc5) ≤ List.length (Types.t.buffer tbc4) ∧ Logic.precede tbc5 tbc4 ∧ (∀(t2 : Types.timestamp α), Logic.before t2 t ∧ Logic.past_time t2 tbc4 → Logic.past_time t2 tbc5) → Logic.correct tbc5 ∧ (Types.t.history tbc5 = Types.t.history tb4 ∧ (∀(x1 : ℤ), (0 : ℤ) ≤ x1 ∧ x1 < final_size → Logic.func_of_array (Types.t.buffer tbc5) ([] : List α) x1 = Logic.func_of_array (Types.t.buffer tb4) ([] : List α) x1)) ∧ Logic.current_timestamp tbc5 = t ∧ List.length (Types.t.buffer tbc5) ≤ List.length (Types.t.buffer tbc1) ∧ Logic.precede tbc5 tbc1 ∧ (∀(t2 : Types.timestamp α), Logic.before t2 t ∧ Logic.past_time t2 tbc1 → Logic.past_time t2 tbc5)))))))) else let o3 : List (List α) := Types.t.buffer tbc3; ((0 : ℤ) ≤ x ∧ x < Int.ofNat (List.length o3)) ∧ (match o3[Int.toNat x]! with | ([] : List α) => False | List.cons _ q1 => (let o4 : List (List α) := Types.t.buffer tbc3; ((0 : ℤ) ≤ x ∧ x < Int.ofNat (List.length o4)) ∧ (∀(tbc4 : Types.t α), let o5 : List (List α) := Types.t.buffer tbc4; List.length (Types.t.buffer tbc4) = List.length o4 → tbc4 = Types.t.mk (Types.t.history tbc3) (Types.t.current_time tbc3) (Types.t.buffer tbc4) (Types.t.inv tbc3) ∧ List.length (Types.t.buffer tbc4) = List.length (Types.t.buffer tbc3) → getElem! o5 ∘ Int.toNat = Function.update (getElem! o4 ∘ Int.toNat) x q1 ∧ o5 = List.set o4 (Int.toNat x) q1 → (let o6 : ℤ := delta - (1 : ℤ); (((0 : ℤ) ≤ delta ∧ o6 < delta) ∧ Logic.correct tbc4 ∧ Logic.past_time t tbc4 ∧ (0 : ℤ) ≤ o6 ∧ Types.t.current_time tbc4 = Types.timestamp.time t + o6 ∧ (Types.t.history tbc4 = Types.t.history tb2 ∧ (∀(x1 : ℤ), ((0 : ℤ) ≤ x1 ∧ x1 < final_size) ∧ x1 < Int.ofNat (List.length (Types.t.buffer tbc4)) → Logic.func_of_array (Types.t.buffer tbc4) ([] : List α) x1 = Logic.func_of_array (Types.t.buffer tb2) ([] : List α) x1)) ∧ Int.ofNat (List.length (Types.t.buffer tb2)) ≤ final_size) ∧ (∀(tbc5 : Types.t α) (tb3 : Types.t α), Types.t.inv tbc5 = Types.t.inv tbc4 → Types.t.current_time tb3 = Types.t.current_time tb2 ∧ List.length (Types.t.buffer tb3) = List.length (Types.t.buffer tb2) ∧ Types.t.inv tb3 = Types.t.inv tb2 → Logic.correct tbc5 ∧ (Types.t.history tbc5 = Types.t.history tb3 ∧ (∀(x1 : ℤ), (0 : ℤ) ≤ x1 ∧ x1 < final_size → Logic.func_of_array (Types.t.buffer tbc5) ([] : List α) x1 = Logic.func_of_array (Types.t.buffer tb3) ([] : List α) x1)) ∧ Logic.current_timestamp tbc5 = t ∧ List.length (Types.t.buffer tbc5) ≤ List.length (Types.t.buffer tbc4) ∧ Logic.precede tbc5 tbc4 ∧ (∀(t2 : Types.timestamp α), Logic.before t2 t ∧ Logic.past_time t2 tbc4 → Logic.past_time t2 tbc5) → Logic.correct tbc5 ∧ (Types.t.history tbc5 = Types.t.history tb3 ∧ (∀(x1 : ℤ), (0 : ℤ) ≤ x1 ∧ x1 < final_size → Logic.func_of_array (Types.t.buffer tbc5) ([] : List α) x1 = Logic.func_of_array (Types.t.buffer tb3) ([] : List α) x1)) ∧ Logic.current_timestamp tbc5 = t ∧ List.length (Types.t.buffer tbc5) ≤ List.length (Types.t.buffer tbc1) ∧ Logic.precede tbc5 tbc1 ∧ (∀(t2 : Types.timestamp α), Logic.before t2 t ∧ Logic.past_time t2 tbc1 → Logic.past_time t2 tbc5)))))))))) else Logic.correct tbc1 ∧ (Types.t.history tbc1 = Types.t.history tb1 ∧ (∀(x : ℤ), (0 : ℤ) ≤ x ∧ x < final_size → Logic.func_of_array (Types.t.buffer tbc1) ([] : List α) x = Logic.func_of_array (Types.t.buffer tb1) ([] : List α) x)) ∧ Logic.current_timestamp tbc1 = t ∧ List.length (Types.t.buffer tbc1) ≤ List.length (Types.t.buffer tbc1) ∧ Logic.precede tbc1 tbc1 ∧ (∀(t2 : Types.timestamp α), Logic.before t2 t ∧ Logic.past_time t2 tbc1 → Logic.past_time t2 tbc1)))) ∧ (if final_size < Int.ofNat (List.length (Types.t.buffer tb)) then (0 : ℤ) ≤ final_size ∧ (∀(buf2 : List (List α)), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < final_size → buf2[Int.toNat i]! = ([] : List α)) ∧ Int.ofNat (List.length buf2) = final_size → (let buf1 : List (List α) := Types.t.buffer tb; (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ final_size ∧ (0 : ℤ) + final_size ≤ Int.ofNat (List.length buf1)) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) + final_size ≤ Int.ofNat (List.length buf2)) ∧ (∀(buf21 : List (List α)), List.length buf21 = List.length buf2 → (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) ∨ (0 : ℤ) + final_size ≤ i ∧ i < Int.ofNat (List.length buf21) → buf21[Int.toNat i]! = buf2[Int.toNat i]!) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) + final_size → buf21[Int.toNat i]! = buf1[Int.toNat ((0 : ℤ) + i - (0 : ℤ))]!) → (∀(tb1 : Types.t α), Types.t.history tb1 = Types.t.history tb ∧ Types.t.current_time tb1 = Types.t.current_time tb ∧ Types.t.buffer tb1 = buf21 ∧ Types.t.inv tb1 = Types.t.inv tb → (∀(tb2 : Types.t α), Types.t.history tb2 = Types.t.history tb1 ∧ Types.t.current_time tb2 = Types.timestamp.time t ∧ Types.t.buffer tb2 = Types.t.buffer tb1 ∧ Types.t.inv tb2 = Types.t.inv tb1 → (let o3 : ℤ := Types.t.current_time tb1 - Types.timestamp.time t; (Logic.correct tbc ∧ Logic.past_time t tbc ∧ (0 : ℤ) ≤ o3 ∧ Types.t.current_time tb = Types.timestamp.time t + o3 ∧ (Types.t.history tb = Types.t.history tb2 ∧ (∀(x : ℤ), ((0 : ℤ) ≤ x ∧ x < final_size) ∧ x < Int.ofNat (List.length o2) → Logic.func_of_array o2 ([] : List α) x = Logic.func_of_array (Types.t.buffer tb2) ([] : List α) x)) ∧ Int.ofNat (List.length (Types.t.buffer tb2)) ≤ final_size) ∧ (∀(tbc1 : Types.t α) (tb3 : Types.t α), Types.t.inv tbc1 = Types.t.inv tb → Types.t.current_time tb3 = Types.t.current_time tb2 ∧ List.length (Types.t.buffer tb3) = List.length (Types.t.buffer tb2) ∧ Types.t.inv tb3 = Types.t.inv tb2 → Logic.correct tbc1 ∧ (Types.t.history tbc1 = Types.t.history tb3 ∧ (∀(x : ℤ), (0 : ℤ) ≤ x ∧ x < final_size → Logic.func_of_array (Types.t.buffer tbc1) ([] : List α) x = Logic.func_of_array (Types.t.buffer tb3) ([] : List α) x)) ∧ Logic.current_timestamp tbc1 = t ∧ List.length (Types.t.buffer tbc1) ≤ List.length o2 ∧ Logic.precede tbc1 tbc ∧ (∀(t2 : Types.timestamp α), Logic.before t2 t ∧ Logic.past_time t2 tbc → Logic.past_time t2 tbc1) → Logic.correct tb3 ∧ Logic.current_timestamp tb3 = t ∧ Logic.past_time (Logic.current_timestamp tb3) tb3 ∧ (∀(t2 : Types.timestamp α), Logic.before t2 t ∧ Logic.past_time t2 tb → Logic.past_time t2 tb3) ∧ Logic.precede tb3 tb))))))) else ∀(tb1 : Types.t α), Types.t.history tb1 = Types.t.history tb ∧ Types.t.current_time tb1 = Types.timestamp.time t ∧ Types.t.buffer tb1 = Types.t.buffer tb ∧ Types.t.inv tb1 = Types.t.inv tb → (let o3 : ℤ := Types.t.current_time tb - Types.timestamp.time t; (Logic.correct tbc ∧ Logic.past_time t tbc ∧ (0 : ℤ) ≤ o3 ∧ Types.t.current_time tb = Types.timestamp.time t + o3 ∧ (Types.t.history tb = Types.t.history tb1 ∧ (∀(x : ℤ), ((0 : ℤ) ≤ x ∧ x < final_size) ∧ x < Int.ofNat (List.length o2) → Logic.func_of_array o2 ([] : List α) x = Logic.func_of_array (Types.t.buffer tb1) ([] : List α) x)) ∧ Int.ofNat (List.length (Types.t.buffer tb1)) ≤ final_size) ∧ (∀(tbc1 : Types.t α) (tb2 : Types.t α), Types.t.inv tbc1 = Types.t.inv tb → Types.t.current_time tb2 = Types.t.current_time tb1 ∧ List.length (Types.t.buffer tb2) = List.length (Types.t.buffer tb1) ∧ Types.t.inv tb2 = Types.t.inv tb1 → Logic.correct tbc1 ∧ (Types.t.history tbc1 = Types.t.history tb2 ∧ (∀(x : ℤ), (0 : ℤ) ≤ x ∧ x < final_size → Logic.func_of_array (Types.t.buffer tbc1) ([] : List α) x = Logic.func_of_array (Types.t.buffer tb2) ([] : List α) x)) ∧ Logic.current_timestamp tbc1 = t ∧ List.length (Types.t.buffer tbc1) ≤ List.length o2 ∧ Logic.precede tbc1 tbc ∧ (∀(t2 : Types.timestamp α), Logic.before t2 t ∧ Logic.past_time t2 tbc → Logic.past_time t2 tbc1) → Logic.correct tb2 ∧ Logic.current_timestamp tb2 = t ∧ Logic.past_time (Logic.current_timestamp tb2) tb2 ∧ (∀(t2 : Types.timestamp α), Logic.before t2 t ∧ Logic.past_time t2 tb → Logic.past_time t2 tb2) ∧ Logic.precede tb2 tb))))
  := sorry
end BacktrackArray_Impl_backtrackqtvc
