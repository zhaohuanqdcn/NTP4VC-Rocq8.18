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
namespace Impl
end Impl
namespace Nat
inductive nat where
  | ONat : nat
  | SNat : nat -> nat
axiom inhabited_axiom_nat : Inhabited nat
attribute [instance] inhabited_axiom_nat
noncomputable def nat_to_int : nat -> ℤ
  | nat.ONat => (0 : ℤ)
  | (nat.SNat n1) => (1 : ℤ) + nat_to_int n1
noncomputable def add_nat : nat -> nat -> nat
  | nat.ONat, n2 => n2
  | (nat.SNat n11), n2 => nat.SNat (add_nat n11 n2)
end Nat
namespace Funcs
axiom some :  {α : Type} -> [Inhabited α] -> α -> Option α
axiom some_def {α : Type} [Inhabited α] (x : α) : some x = Option.some x
axiom ocase :  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> (α -> β) -> β -> Option α -> β
axiom ocase_def {β : Type} {α : Type} [Inhabited β] [Inhabited α] (f : α -> β) (d : β) (x : Option α) : ocase f d x = (match x with | (Option.none : Option α) => d | Option.some x1 => f x1)
noncomputable def omap {β : Type} {α : Type} [Inhabited β] [Inhabited α] (f : α -> β) (x : Option α) := match x with | (Option.none : Option α) => (Option.none : Option β) | Option.some x1 => Option.some (f x1)
noncomputable def olift {β : Type} {α : Type} [Inhabited β] [Inhabited α] (f : α -> β) := ocase (Func.compose some f) (Option.none : Option β)
end Funcs
namespace Sum.Sum
inductive sum (α : Type) (β : Type) where
  | Left : α -> sum α β
  | Right : β -> sum α β
axiom inhabited_axiom_sum {α : Type} [Inhabited α] {β : Type} [Inhabited β] : Inhabited (sum α β)
attribute [instance] inhabited_axiom_sum
end Sum.Sum
namespace Spec
inductive symbol (ty'b0 : Type) where
  | Var_symbol : ty'b0 -> symbol ty'b0
axiom inhabited_axiom_symbol {ty'b0 : Type} [Inhabited ty'b0] : Inhabited (symbol ty'b0)
attribute [instance] inhabited_axiom_symbol
mutual
noncomputable def nat_size_symbol {ty'b0 : Type} [Inhabited ty'b0] : symbol ty'b0 -> Nat.nat
  | (symbol.Var_symbol v0) => Nat.nat.SNat Nat.nat.ONat
noncomputable def size_symbol {ty'b0 : Type} [Inhabited ty'b0] : symbol ty'b0 -> ℤ
  | (symbol.Var_symbol v0) => (1 : ℤ)
end
noncomputable def rename_symbol {ty'c0 : Type} {ty'b0 : Type} [Inhabited ty'c0] [Inhabited ty'b0] (t : symbol ty'b0) (s0 : ty'b0 -> ty'c0) := match t with | symbol.Var_symbol v0 => symbol.Var_symbol (s0 v0)
axiom rename_subst_symbol :  {ty'd0 : Type} -> [Inhabited ty'd0] ->  {ty'c0 : Type} -> [Inhabited ty'c0] ->  {ty'b0 : Type} -> [Inhabited ty'b0] -> (ty'b0 -> symbol ty'c0) -> (ty'c0 -> ty'd0) -> ty'b0 -> symbol ty'd0
axiom rename_subst_symbol_definition {ty'd0 : Type} {ty'c0 : Type} {ty'b0 : Type} [Inhabited ty'd0] [Inhabited ty'c0] [Inhabited ty'b0] (s0 : ty'b0 -> symbol ty'c0) (s10 : ty'c0 -> ty'd0) (x : ty'b0) : rename_subst_symbol s0 s10 x = rename_symbol (s0 x) s10
noncomputable def olifts_symbol {ty'c0 : Type} {ty'b0 : Type} [Inhabited ty'c0] [Inhabited ty'b0] (s : ty'b0 -> symbol ty'c0) := Funcs.ocase (rename_subst_symbol s Funcs.some) (symbol.Var_symbol (Option.none : Option ty'c0))
noncomputable def subst_symbol {ty'c0 : Type} {ty'b0 : Type} [Inhabited ty'c0] [Inhabited ty'b0] (t : symbol ty'b0) (s0 : ty'b0 -> symbol ty'c0) := match t with | symbol.Var_symbol v0 => s0 v0
axiom subst_compose_symbol :  {ty'd0 : Type} -> [Inhabited ty'd0] ->  {ty'c0 : Type} -> [Inhabited ty'c0] ->  {ty'b0 : Type} -> [Inhabited ty'b0] -> (ty'b0 -> symbol ty'c0) -> (ty'c0 -> symbol ty'd0) -> ty'b0 -> symbol ty'd0
axiom subst_compose_symbol_definition {ty'd0 : Type} {ty'c0 : Type} {ty'b0 : Type} [Inhabited ty'd0] [Inhabited ty'c0] [Inhabited ty'b0] (s0 : ty'b0 -> symbol ty'c0) (s10 : ty'c0 -> symbol ty'd0) (x : ty'b0) : subst_compose_symbol s0 s10 x = subst_symbol (s0 x) s10
axiom subst_id_symbol :  {ty'b0 : Type} -> [Inhabited ty'b0] -> ty'b0 -> symbol ty'b0
axiom subst_id_symbol_definition {ty'b0 : Type} [Inhabited ty'b0] (x : ty'b0) : subst_id_symbol x = symbol.Var_symbol x
noncomputable def is_symbol_free_var_in_symbol {ty'b0 : Type} [Inhabited ty'b0] (x : ty'b0) (t : symbol ty'b0) := match t with | symbol.Var_symbol v0 => v0 = x
axiom rename_free_var_inversion_symbol_symbol {ty'c0 : Type} {ty'b0 : Type} [Inhabited ty'c0] [Inhabited ty'b0] (x : ty'c0) (t : symbol ty'b0) (s0 : ty'b0 -> ty'c0) (fact0 : is_symbol_free_var_in_symbol x (rename_symbol t s0)) : ∃(y : ty'b0), is_symbol_free_var_in_symbol y t ∧ s0 y = x
axiom subst_free_var_inversion_symbol_symbol {ty'c0 : Type} {ty'b0 : Type} [Inhabited ty'c0] [Inhabited ty'b0] (x : ty'c0) (t : symbol ty'b0) (s0 : ty'b0 -> symbol ty'c0) (fact0 : is_symbol_free_var_in_symbol x (subst_symbol t s0)) : ∃(y : ty'b0), is_symbol_free_var_in_symbol y t ∧ is_symbol_free_var_in_symbol x (s0 y)
end Spec
namespace Types
inductive nl_symbol (ty'b0 : Type) where
  | NLFVar_symbol : ty'b0 -> nl_symbol ty'b0
  | NLBruijn_symbol : ℤ -> nl_symbol ty'b0
axiom inhabited_axiom_nl_symbol {ty'b0 : Type} [Inhabited ty'b0] : Inhabited (nl_symbol ty'b0)
attribute [instance] inhabited_axiom_nl_symbol
structure nlimpl_symbol where
  nlrepr_symbol_field : nl_symbol ℤ
  nlfree_var_symbol_set_abstraction_symbol_field : ℤ
  model_symbol_field : Spec.symbol ℤ
axiom inhabited_axiom_nlimpl_symbol : Inhabited nlimpl_symbol
attribute [instance] inhabited_axiom_nlimpl_symbol
inductive cons_symbol where
  | NLCVar_symbol : ℤ -> cons_symbol
axiom inhabited_axiom_cons_symbol : Inhabited cons_symbol
attribute [instance] inhabited_axiom_cons_symbol
end Types
namespace Logic
mutual
noncomputable def nat_nlsize_symbol {ty'b0 : Type} [Inhabited ty'b0] : Types.nl_symbol ty'b0 -> Nat.nat
  | (Types.nl_symbol.NLFVar_symbol v0) => Nat.nat.SNat Nat.nat.ONat
  | (Types.nl_symbol.NLBruijn_symbol v0) => Nat.nat.SNat Nat.nat.ONat
noncomputable def nlsize_symbol {ty'b0 : Type} [Inhabited ty'b0] : Types.nl_symbol ty'b0 -> ℤ
  | (Types.nl_symbol.NLFVar_symbol v0) => (1 : ℤ)
  | (Types.nl_symbol.NLBruijn_symbol v0) => (1 : ℤ)
end
axiom shiftb_symbol :  {ty'b0 : Type} -> [Inhabited ty'b0] -> (ℤ -> Spec.symbol ty'b0) -> ℤ -> Spec.symbol (Option ty'b0)
axiom shiftb_symbol_definition {ty'b0 : Type} [Inhabited ty'b0] (bnd : ℤ -> Spec.symbol ty'b0) (i : ℤ) : shiftb_symbol bnd i = (if i = (0 : ℤ) then Spec.symbol.Var_symbol (Option.none : Option ty'b0) else Spec.rename_symbol (bnd (i - (1 : ℤ))) Funcs.some)
noncomputable def nlmodel_symbol {ty'b0 : Type} {ty'c0 : Type} [Inhabited ty'b0] [Inhabited ty'c0] (t : Types.nl_symbol ty'b0) (fr0 : ty'b0 -> Spec.symbol ty'c0) (bnd0 : ℤ -> Spec.symbol ty'c0) := match t with | Types.nl_symbol.NLFVar_symbol v0 => fr0 v0 | Types.nl_symbol.NLBruijn_symbol v0 => bnd0 v0
noncomputable def correct_indexes_symbol {ty'b0 : Type} [Inhabited ty'b0] (t : Types.nl_symbol ty'b0) := match t with | Types.nl_symbol.NLFVar_symbol v0 => True | Types.nl_symbol.NLBruijn_symbol v0 => (0 : ℤ) ≤ v0
noncomputable def bound_depth_of_symbol_in_symbol {ty'b0 : Type} [Inhabited ty'b0] (t : Types.nl_symbol ty'b0) := match t with | Types.nl_symbol.NLFVar_symbol v0 => (0 : ℤ) | Types.nl_symbol.NLBruijn_symbol v0 => (1 : ℤ) + v0
noncomputable def nlimpl_symbol_ok (t : Types.nlimpl_symbol) := nlmodel_symbol (Types.nlimpl_symbol.nlrepr_symbol_field t) Spec.subst_id_symbol (Func.const (Spec.symbol.Var_symbol (-(1 : ℤ)))) = Types.nlimpl_symbol.model_symbol_field t ∧ correct_indexes_symbol (Types.nlimpl_symbol.nlrepr_symbol_field t) ∧ bound_depth_of_symbol_in_symbol (Types.nlimpl_symbol.nlrepr_symbol_field t) = (0 : ℤ) ∧ (∀(x : ℤ), Spec.is_symbol_free_var_in_symbol x (Types.nlimpl_symbol.model_symbol_field t) → x < Types.nlimpl_symbol.nlfree_var_symbol_set_abstraction_symbol_field t)
noncomputable def cons_ok_symbol (c : Types.cons_symbol) := match c with | Types.cons_symbol.NLCVar_symbol v0 => True
noncomputable def cons_rel_symbol (c : Types.cons_symbol) (t : Types.nlimpl_symbol) := match c with | Types.cons_symbol.NLCVar_symbol v0 => Types.nlimpl_symbol.model_symbol_field t = Spec.symbol.Var_symbol v0
noncomputable def cons_open_rel_symbol (c : Types.cons_symbol) (t : Types.nlimpl_symbol) := match c with | Types.cons_symbol.NLCVar_symbol v0 => Types.nlimpl_symbol.model_symbol_field t = Spec.symbol.Var_symbol v0
end Logic
namespace Impl
end Impl
namespace Spec
mutual
inductive fo_term_list (ty'b0 : Type) (ty'b3 : Type) where
  | FONil : fo_term_list ty'b0 ty'b3
  | FOCons : fo_term ty'b0 ty'b3 -> fo_term_list ty'b0 ty'b3 -> fo_term_list ty'b0 ty'b3
inductive fo_term (ty'b0 : Type) (ty'b3 : Type) where
  | Var_fo_term : ty'b3 -> fo_term ty'b0 ty'b3
  | App : Spec.symbol ty'b0 -> fo_term_list ty'b0 ty'b3 -> fo_term ty'b0 ty'b3
end
axiom inhabited_axiom_fo_term_list {ty'b0 : Type} [Inhabited ty'b0] {ty'b3 : Type} [Inhabited ty'b3] : Inhabited (fo_term_list ty'b0 ty'b3)
attribute [instance] inhabited_axiom_fo_term_list
axiom inhabited_axiom_fo_term {ty'b0 : Type} [Inhabited ty'b0] {ty'b3 : Type} [Inhabited ty'b3] : Inhabited (fo_term ty'b0 ty'b3)
attribute [instance] inhabited_axiom_fo_term
mutual
noncomputable def nat_size_fo_term_list {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : fo_term_list ty'b0 ty'b3 -> Nat.nat
  | (fo_term_list.FONil : fo_term_list ty'b0 ty'b3) => let s : Nat.nat := Nat.nat.SNat Nat.nat.ONat; s
  | (fo_term_list.FOCons v0 v1) => let s : Nat.nat := Nat.nat.SNat Nat.nat.ONat; let s1 : Nat.nat := Nat.add_nat (nat_size_fo_term_list v1) s; let s2 : Nat.nat := Nat.add_nat (nat_size_fo_term v0) s1; s2
noncomputable def nat_size_fo_term {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : fo_term ty'b0 ty'b3 -> Nat.nat
  | (fo_term.Var_fo_term v0) => Nat.nat.SNat Nat.nat.ONat
  | (fo_term.App v0 v1) => let s : Nat.nat := Nat.nat.SNat Nat.nat.ONat; let s1 : Nat.nat := Nat.add_nat (nat_size_fo_term_list v1) s; let s2 : Nat.nat := Nat.add_nat (Spec.nat_size_symbol v0) s1; s2
noncomputable def size_fo_term_list {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : fo_term_list ty'b0 ty'b3 -> ℤ
  | (fo_term_list.FONil : fo_term_list ty'b0 ty'b3) => let s : ℤ := (1 : ℤ); s
  | (fo_term_list.FOCons v0 v1) => let s : ℤ := (1 : ℤ); let s1 : ℤ := size_fo_term_list v1 + s; let s2 : ℤ := size_fo_term v0 + s1; s2
noncomputable def size_fo_term {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : fo_term ty'b0 ty'b3 -> ℤ
  | (fo_term.Var_fo_term v0) => (1 : ℤ)
  | (fo_term.App v0 v1) => let s : ℤ := (1 : ℤ); let s1 : ℤ := size_fo_term_list v1 + s; let s2 : ℤ := Spec.size_symbol v0 + s1; s2
end
mutual
noncomputable def rename_fo_term_list {ty'c0 : Type} {ty'c3 : Type} {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'c0] [Inhabited ty'c3] [Inhabited ty'b0] [Inhabited ty'b3] : fo_term_list ty'b0 ty'b3 -> (ty'b0 -> ty'c0) -> (ty'b3 -> ty'c3) -> fo_term_list ty'c0 ty'c3
  | (fo_term_list.FONil : fo_term_list ty'b0 ty'b3), s0, s3 => (fo_term_list.FONil : fo_term_list ty'c0 ty'c3)
  | (fo_term_list.FOCons v0 v1), s0, s3 => fo_term_list.FOCons (rename_fo_term v0 s0 s3) (rename_fo_term_list v1 s0 s3)
noncomputable def rename_fo_term {ty'c0 : Type} {ty'c3 : Type} {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'c0] [Inhabited ty'c3] [Inhabited ty'b0] [Inhabited ty'b3] : fo_term ty'b0 ty'b3 -> (ty'b0 -> ty'c0) -> (ty'b3 -> ty'c3) -> fo_term ty'c0 ty'c3
  | (fo_term.Var_fo_term v0), s0, s3 => fo_term.Var_fo_term (s3 v0)
  | (fo_term.App v0 v1), s0, s3 => fo_term.App (Spec.rename_symbol v0 s0) (rename_fo_term_list v1 s0 s3)
end
axiom rename_subst_fo_term :  {ty'c0 : Type} -> [Inhabited ty'c0] ->  {ty'b3 : Type} -> [Inhabited ty'b3] ->  {ty'd0 : Type} -> [Inhabited ty'd0] ->  {ty'd3 : Type} -> [Inhabited ty'd3] ->  {ty'c3 : Type} -> [Inhabited ty'c3] -> (ty'b3 -> fo_term ty'c0 ty'c3) -> (ty'c0 -> ty'd0) -> (ty'c3 -> ty'd3) -> ty'b3 -> fo_term ty'd0 ty'd3
axiom rename_subst_fo_term_definition {ty'c0 : Type} {ty'b3 : Type} {ty'd0 : Type} {ty'd3 : Type} {ty'c3 : Type} [Inhabited ty'c0] [Inhabited ty'b3] [Inhabited ty'd0] [Inhabited ty'd3] [Inhabited ty'c3] (s0 : ty'b3 -> fo_term ty'c0 ty'c3) (s10 : ty'c0 -> ty'd0) (s13 : ty'c3 -> ty'd3) (x : ty'b3) : rename_subst_fo_term s0 s10 s13 x = rename_fo_term (s0 x) s10 s13
noncomputable def olifts_fo_term {ty'c0 : Type} {ty'c3 : Type} {ty'b3 : Type} [Inhabited ty'c0] [Inhabited ty'c3] [Inhabited ty'b3] (s : ty'b3 -> fo_term ty'c0 ty'c3) := Funcs.ocase (rename_subst_fo_term s Func.identity Funcs.some) (fo_term.Var_fo_term (Option.none : Option ty'c3))
mutual
noncomputable def subst_fo_term_list {ty'c0 : Type} {ty'c3 : Type} {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'c0] [Inhabited ty'c3] [Inhabited ty'b0] [Inhabited ty'b3] : fo_term_list ty'b0 ty'b3 -> (ty'b0 -> Spec.symbol ty'c0) -> (ty'b3 -> fo_term ty'c0 ty'c3) -> fo_term_list ty'c0 ty'c3
  | (fo_term_list.FONil : fo_term_list ty'b0 ty'b3), s0, s3 => (fo_term_list.FONil : fo_term_list ty'c0 ty'c3)
  | (fo_term_list.FOCons v0 v1), s0, s3 => fo_term_list.FOCons (subst_fo_term v0 (Spec.rename_subst_symbol s0 Func.identity) (rename_subst_fo_term s3 Func.identity Func.identity)) (subst_fo_term_list v1 (Spec.rename_subst_symbol s0 Func.identity) (rename_subst_fo_term s3 Func.identity Func.identity))
noncomputable def subst_fo_term {ty'c0 : Type} {ty'c3 : Type} {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'c0] [Inhabited ty'c3] [Inhabited ty'b0] [Inhabited ty'b3] : fo_term ty'b0 ty'b3 -> (ty'b0 -> Spec.symbol ty'c0) -> (ty'b3 -> fo_term ty'c0 ty'c3) -> fo_term ty'c0 ty'c3
  | (fo_term.Var_fo_term v0), s0, s3 => s3 v0
  | (fo_term.App v0 v1), s0, s3 => fo_term.App (Spec.subst_symbol v0 (Spec.rename_subst_symbol s0 Func.identity)) (subst_fo_term_list v1 (Spec.rename_subst_symbol s0 Func.identity) (rename_subst_fo_term s3 Func.identity Func.identity))
end
axiom subst_compose_fo_term :  {ty'c0 : Type} -> [Inhabited ty'c0] ->  {ty'b3 : Type} -> [Inhabited ty'b3] ->  {ty'd0 : Type} -> [Inhabited ty'd0] ->  {ty'd3 : Type} -> [Inhabited ty'd3] ->  {ty'c3 : Type} -> [Inhabited ty'c3] -> (ty'b3 -> fo_term ty'c0 ty'c3) -> (ty'c0 -> Spec.symbol ty'd0) -> (ty'c3 -> fo_term ty'd0 ty'd3) -> ty'b3 -> fo_term ty'd0 ty'd3
axiom subst_compose_fo_term_definition {ty'c0 : Type} {ty'b3 : Type} {ty'd0 : Type} {ty'd3 : Type} {ty'c3 : Type} [Inhabited ty'c0] [Inhabited ty'b3] [Inhabited ty'd0] [Inhabited ty'd3] [Inhabited ty'c3] (s0 : ty'b3 -> fo_term ty'c0 ty'c3) (s10 : ty'c0 -> Spec.symbol ty'd0) (s13 : ty'c3 -> fo_term ty'd0 ty'd3) (x : ty'b3) : subst_compose_fo_term s0 s10 s13 x = subst_fo_term (s0 x) s10 s13
axiom subst_id_fo_term :  {ty'b0 : Type} -> [Inhabited ty'b0] ->  {ty'b3 : Type} -> [Inhabited ty'b3] -> ty'b3 -> fo_term ty'b0 ty'b3
axiom subst_id_fo_term_definition {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] (x : ty'b3) : (subst_id_fo_term : ty'b3 -> fo_term ty'b0 ty'b3) x = fo_term.Var_fo_term x
mutual
noncomputable def is_symbol_free_var_in_fo_term_list {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : ty'b0 -> fo_term_list ty'b0 ty'b3 -> Prop
  | x, (fo_term_list.FONil : fo_term_list ty'b0 ty'b3) => False
  | x, (fo_term_list.FOCons v0 v1) => is_symbol_free_var_in_fo_term x v0 ∨ is_symbol_free_var_in_fo_term_list x v1
noncomputable def is_fo_term_free_var_in_fo_term_list {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : ty'b3 -> fo_term_list ty'b0 ty'b3 -> Prop
  | x, (fo_term_list.FONil : fo_term_list ty'b0 ty'b3) => False
  | x, (fo_term_list.FOCons v0 v1) => is_fo_term_free_var_in_fo_term x v0 ∨ is_fo_term_free_var_in_fo_term_list x v1
noncomputable def is_symbol_free_var_in_fo_term {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : ty'b0 -> fo_term ty'b0 ty'b3 -> Prop
  | x, (fo_term.Var_fo_term v0) => False
  | x, (fo_term.App v0 v1) => Spec.is_symbol_free_var_in_symbol x v0 ∨ is_symbol_free_var_in_fo_term_list x v1
noncomputable def is_fo_term_free_var_in_fo_term {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : ty'b3 -> fo_term ty'b0 ty'b3 -> Prop
  | x, (fo_term.Var_fo_term v0) => v0 = x
  | x, (fo_term.App v0 v1) => is_fo_term_free_var_in_fo_term_list x v1
end
end Spec
namespace Types
mutual
inductive nl_fo_term_list (ty'b0 : Type) (ty'b3 : Type) where
  | NL_FONil : nl_fo_term_list ty'b0 ty'b3
  | NL_FOCons : nl_fo_term ty'b0 ty'b3 -> nl_fo_term_list ty'b0 ty'b3 -> nl_fo_term_list ty'b0 ty'b3
inductive nl_fo_term (ty'b0 : Type) (ty'b3 : Type) where
  | NLFVar_fo_term : ty'b3 -> nl_fo_term ty'b0 ty'b3
  | NLBruijn_fo_term : ℤ -> nl_fo_term ty'b0 ty'b3
  | NL_App : Types.nl_symbol ty'b0 -> nl_fo_term_list ty'b0 ty'b3 -> nl_fo_term ty'b0 ty'b3
end
axiom inhabited_axiom_nl_fo_term_list {ty'b0 : Type} [Inhabited ty'b0] {ty'b3 : Type} [Inhabited ty'b3] : Inhabited (nl_fo_term_list ty'b0 ty'b3)
attribute [instance] inhabited_axiom_nl_fo_term_list
axiom inhabited_axiom_nl_fo_term {ty'b0 : Type} [Inhabited ty'b0] {ty'b3 : Type} [Inhabited ty'b3] : Inhabited (nl_fo_term ty'b0 ty'b3)
attribute [instance] inhabited_axiom_nl_fo_term
structure nlimpl_fo_term_list where
  nlrepr_fo_term_list_field : nl_fo_term_list ℤ ℤ
  nlfree_var_symbol_set_abstraction_fo_term_list_field : ℤ
  nlfree_var_fo_term_set_abstraction_fo_term_list_field : ℤ
  model_fo_term_list_field : Spec.fo_term_list ℤ ℤ
axiom inhabited_axiom_nlimpl_fo_term_list : Inhabited nlimpl_fo_term_list
attribute [instance] inhabited_axiom_nlimpl_fo_term_list
structure nlimpl_fo_term where
  nlrepr_fo_term_field : nl_fo_term ℤ ℤ
  nlfree_var_symbol_set_abstraction_fo_term_field : ℤ
  nlfree_var_fo_term_set_abstraction_fo_term_field : ℤ
  model_fo_term_field : Spec.fo_term ℤ ℤ
axiom inhabited_axiom_nlimpl_fo_term : Inhabited nlimpl_fo_term
attribute [instance] inhabited_axiom_nlimpl_fo_term
inductive cons_fo_term_list where
  | NLC_FONil : cons_fo_term_list
  | NLC_FOCons : nlimpl_fo_term -> nlimpl_fo_term_list -> cons_fo_term_list
axiom inhabited_axiom_cons_fo_term_list : Inhabited cons_fo_term_list
attribute [instance] inhabited_axiom_cons_fo_term_list
inductive cons_fo_term where
  | NLCVar_fo_term : ℤ -> cons_fo_term
  | NLC_App : Types.nlimpl_symbol -> nlimpl_fo_term_list -> cons_fo_term
axiom inhabited_axiom_cons_fo_term : Inhabited cons_fo_term
attribute [instance] inhabited_axiom_cons_fo_term
end Types
namespace Logic
mutual
noncomputable def nat_nlsize_fo_term_list {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : Types.nl_fo_term_list ty'b0 ty'b3 -> Nat.nat
  | (Types.nl_fo_term_list.NL_FONil : Types.nl_fo_term_list ty'b0 ty'b3) => let s : Nat.nat := Nat.nat.SNat Nat.nat.ONat; s
  | (Types.nl_fo_term_list.NL_FOCons v0 v1) => let s : Nat.nat := Nat.nat.SNat Nat.nat.ONat; let s1 : Nat.nat := Nat.add_nat (nat_nlsize_fo_term_list v1) s; let s2 : Nat.nat := Nat.add_nat (nat_nlsize_fo_term v0) s1; s2
noncomputable def nat_nlsize_fo_term {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : Types.nl_fo_term ty'b0 ty'b3 -> Nat.nat
  | (Types.nl_fo_term.NLFVar_fo_term v0) => Nat.nat.SNat Nat.nat.ONat
  | (Types.nl_fo_term.NLBruijn_fo_term v0) => Nat.nat.SNat Nat.nat.ONat
  | (Types.nl_fo_term.NL_App v0 v1) => let s : Nat.nat := Nat.nat.SNat Nat.nat.ONat; let s1 : Nat.nat := Nat.add_nat (nat_nlsize_fo_term_list v1) s; let s2 : Nat.nat := Nat.add_nat (Logic.nat_nlsize_symbol v0) s1; s2
noncomputable def nlsize_fo_term_list {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : Types.nl_fo_term_list ty'b0 ty'b3 -> ℤ
  | (Types.nl_fo_term_list.NL_FONil : Types.nl_fo_term_list ty'b0 ty'b3) => let s : ℤ := (1 : ℤ); s
  | (Types.nl_fo_term_list.NL_FOCons v0 v1) => let s : ℤ := (1 : ℤ); let s1 : ℤ := nlsize_fo_term_list v1 + s; let s2 : ℤ := nlsize_fo_term v0 + s1; s2
noncomputable def nlsize_fo_term {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : Types.nl_fo_term ty'b0 ty'b3 -> ℤ
  | (Types.nl_fo_term.NLFVar_fo_term v0) => (1 : ℤ)
  | (Types.nl_fo_term.NLBruijn_fo_term v0) => (1 : ℤ)
  | (Types.nl_fo_term.NL_App v0 v1) => let s : ℤ := (1 : ℤ); let s1 : ℤ := nlsize_fo_term_list v1 + s; let s2 : ℤ := Logic.nlsize_symbol v0 + s1; s2
end
axiom shiftb_fo_term :  {ty'b0 : Type} -> [Inhabited ty'b0] ->  {ty'b3 : Type} -> [Inhabited ty'b3] -> (ℤ -> Spec.fo_term ty'b0 ty'b3) -> ℤ -> Spec.fo_term ty'b0 (Option ty'b3)
axiom shiftb_fo_term_definition {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] (bnd : ℤ -> Spec.fo_term ty'b0 ty'b3) (i : ℤ) : shiftb_fo_term bnd i = (if i = (0 : ℤ) then Spec.fo_term.Var_fo_term (Option.none : Option ty'b3) else Spec.rename_fo_term (bnd (i - (1 : ℤ))) Func.identity Funcs.some)
mutual
noncomputable def nlmodel_fo_term_list {ty'b0 : Type} {ty'c3 : Type} {ty'c0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'c3] [Inhabited ty'c0] [Inhabited ty'b3] : Types.nl_fo_term_list ty'b0 ty'b3 -> (ty'b0 -> Spec.symbol ty'c0) -> (ℤ -> Spec.symbol ty'c0) -> (ty'b3 -> Spec.fo_term ty'c0 ty'c3) -> (ℤ -> Spec.fo_term ty'c0 ty'c3) -> Spec.fo_term_list ty'c0 ty'c3
  | (Types.nl_fo_term_list.NL_FONil : Types.nl_fo_term_list ty'b0 ty'b3), fr0, bnd0, fr3, bnd3 => (Spec.fo_term_list.FONil : Spec.fo_term_list ty'c0 ty'c3)
  | (Types.nl_fo_term_list.NL_FOCons v0 v1), fr0, bnd0, fr3, bnd3 => Spec.fo_term_list.FOCons (nlmodel_fo_term v0 (Spec.rename_subst_symbol fr0 Func.identity) (Spec.rename_subst_symbol bnd0 Func.identity) (Spec.rename_subst_fo_term fr3 Func.identity Func.identity) (Spec.rename_subst_fo_term bnd3 Func.identity Func.identity)) (nlmodel_fo_term_list v1 (Spec.rename_subst_symbol fr0 Func.identity) (Spec.rename_subst_symbol bnd0 Func.identity) (Spec.rename_subst_fo_term fr3 Func.identity Func.identity) (Spec.rename_subst_fo_term bnd3 Func.identity Func.identity))
noncomputable def nlmodel_fo_term {ty'b0 : Type} {ty'c3 : Type} {ty'c0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'c3] [Inhabited ty'c0] [Inhabited ty'b3] : Types.nl_fo_term ty'b0 ty'b3 -> (ty'b0 -> Spec.symbol ty'c0) -> (ℤ -> Spec.symbol ty'c0) -> (ty'b3 -> Spec.fo_term ty'c0 ty'c3) -> (ℤ -> Spec.fo_term ty'c0 ty'c3) -> Spec.fo_term ty'c0 ty'c3
  | (Types.nl_fo_term.NLFVar_fo_term v0), fr0, bnd0, fr3, bnd3 => fr3 v0
  | (Types.nl_fo_term.NLBruijn_fo_term v0), fr0, bnd0, fr3, bnd3 => bnd3 v0
  | (Types.nl_fo_term.NL_App v0 v1), fr0, bnd0, fr3, bnd3 => Spec.fo_term.App (Logic.nlmodel_symbol v0 (Spec.rename_subst_symbol fr0 Func.identity) (Spec.rename_subst_symbol bnd0 Func.identity)) (nlmodel_fo_term_list v1 (Spec.rename_subst_symbol fr0 Func.identity) (Spec.rename_subst_symbol bnd0 Func.identity) (Spec.rename_subst_fo_term fr3 Func.identity Func.identity) (Spec.rename_subst_fo_term bnd3 Func.identity Func.identity))
end
mutual
noncomputable def correct_indexes_fo_term_list {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : Types.nl_fo_term_list ty'b0 ty'b3 -> Prop
  | (Types.nl_fo_term_list.NL_FONil : Types.nl_fo_term_list ty'b0 ty'b3) => True
  | (Types.nl_fo_term_list.NL_FOCons v0 v1) => correct_indexes_fo_term v0 ∧ correct_indexes_fo_term_list v1
noncomputable def correct_indexes_fo_term {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : Types.nl_fo_term ty'b0 ty'b3 -> Prop
  | (Types.nl_fo_term.NLFVar_fo_term v0) => True
  | (Types.nl_fo_term.NLBruijn_fo_term v0) => (0 : ℤ) ≤ v0
  | (Types.nl_fo_term.NL_App v0 v1) => Logic.correct_indexes_symbol v0 ∧ correct_indexes_fo_term_list v1
end
mutual
noncomputable def bound_depth_of_symbol_in_fo_term_list {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : Types.nl_fo_term_list ty'b0 ty'b3 -> ℤ
  | (Types.nl_fo_term_list.NL_FONil : Types.nl_fo_term_list ty'b0 ty'b3) => (0 : ℤ)
  | (Types.nl_fo_term_list.NL_FOCons v0 v1) => let b : ℤ := bound_depth_of_symbol_in_fo_term v0; let a : ℤ := b; let b1 : ℤ := bound_depth_of_symbol_in_fo_term_list v1; let a1 : ℤ := (if b1 < a then a else b1); a1
noncomputable def bound_depth_of_fo_term_in_fo_term_list {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : Types.nl_fo_term_list ty'b0 ty'b3 -> ℤ
  | (Types.nl_fo_term_list.NL_FONil : Types.nl_fo_term_list ty'b0 ty'b3) => (0 : ℤ)
  | (Types.nl_fo_term_list.NL_FOCons v0 v1) => let b : ℤ := bound_depth_of_fo_term_in_fo_term v0; let a : ℤ := b; let b1 : ℤ := bound_depth_of_fo_term_in_fo_term_list v1; let a1 : ℤ := (if b1 < a then a else b1); a1
noncomputable def bound_depth_of_symbol_in_fo_term {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : Types.nl_fo_term ty'b0 ty'b3 -> ℤ
  | (Types.nl_fo_term.NLFVar_fo_term v0) => (0 : ℤ)
  | (Types.nl_fo_term.NLBruijn_fo_term v0) => (0 : ℤ)
  | (Types.nl_fo_term.NL_App v0 v1) => let b : ℤ := Logic.bound_depth_of_symbol_in_symbol v0; let a : ℤ := b; let b1 : ℤ := bound_depth_of_symbol_in_fo_term_list v1; let a1 : ℤ := (if b1 < a then a else b1); a1
noncomputable def bound_depth_of_fo_term_in_fo_term {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : Types.nl_fo_term ty'b0 ty'b3 -> ℤ
  | (Types.nl_fo_term.NLFVar_fo_term v0) => (0 : ℤ)
  | (Types.nl_fo_term.NLBruijn_fo_term v0) => (1 : ℤ) + v0
  | (Types.nl_fo_term.NL_App v0 v1) => let b : ℤ := bound_depth_of_fo_term_in_fo_term_list v1; let a : ℤ := b; a
end
noncomputable def nlimpl_fo_term_list_ok (t : Types.nlimpl_fo_term_list) := nlmodel_fo_term_list (Types.nlimpl_fo_term_list.nlrepr_fo_term_list_field t) Spec.subst_id_symbol (Func.const (Spec.symbol.Var_symbol (-(1 : ℤ)))) Spec.subst_id_fo_term (Func.const (Spec.fo_term.Var_fo_term (-(1 : ℤ)))) = Types.nlimpl_fo_term_list.model_fo_term_list_field t ∧ correct_indexes_fo_term_list (Types.nlimpl_fo_term_list.nlrepr_fo_term_list_field t) ∧ bound_depth_of_symbol_in_fo_term_list (Types.nlimpl_fo_term_list.nlrepr_fo_term_list_field t) = (0 : ℤ) ∧ bound_depth_of_fo_term_in_fo_term_list (Types.nlimpl_fo_term_list.nlrepr_fo_term_list_field t) = (0 : ℤ) ∧ (∀(x : ℤ), Spec.is_symbol_free_var_in_fo_term_list x (Types.nlimpl_fo_term_list.model_fo_term_list_field t) → x < Types.nlimpl_fo_term_list.nlfree_var_symbol_set_abstraction_fo_term_list_field t) ∧ (∀(x : ℤ), Spec.is_fo_term_free_var_in_fo_term_list x (Types.nlimpl_fo_term_list.model_fo_term_list_field t) → x < Types.nlimpl_fo_term_list.nlfree_var_fo_term_set_abstraction_fo_term_list_field t)
noncomputable def nlimpl_fo_term_ok (t : Types.nlimpl_fo_term) := nlmodel_fo_term (Types.nlimpl_fo_term.nlrepr_fo_term_field t) Spec.subst_id_symbol (Func.const (Spec.symbol.Var_symbol (-(1 : ℤ)))) Spec.subst_id_fo_term (Func.const (Spec.fo_term.Var_fo_term (-(1 : ℤ)))) = Types.nlimpl_fo_term.model_fo_term_field t ∧ correct_indexes_fo_term (Types.nlimpl_fo_term.nlrepr_fo_term_field t) ∧ bound_depth_of_symbol_in_fo_term (Types.nlimpl_fo_term.nlrepr_fo_term_field t) = (0 : ℤ) ∧ bound_depth_of_fo_term_in_fo_term (Types.nlimpl_fo_term.nlrepr_fo_term_field t) = (0 : ℤ) ∧ (∀(x : ℤ), Spec.is_symbol_free_var_in_fo_term x (Types.nlimpl_fo_term.model_fo_term_field t) → x < Types.nlimpl_fo_term.nlfree_var_symbol_set_abstraction_fo_term_field t) ∧ (∀(x : ℤ), Spec.is_fo_term_free_var_in_fo_term x (Types.nlimpl_fo_term.model_fo_term_field t) → x < Types.nlimpl_fo_term.nlfree_var_fo_term_set_abstraction_fo_term_field t)
noncomputable def cons_ok_fo_term_list (c : Types.cons_fo_term_list) := match c with | Types.cons_fo_term_list.NLC_FONil => True | Types.cons_fo_term_list.NLC_FOCons v0 v1 => nlimpl_fo_term_ok v0 ∧ nlimpl_fo_term_list_ok v1
noncomputable def cons_ok_fo_term (c : Types.cons_fo_term) := match c with | Types.cons_fo_term.NLCVar_fo_term v0 => True | Types.cons_fo_term.NLC_App v0 v1 => Logic.nlimpl_symbol_ok v0 ∧ nlimpl_fo_term_list_ok v1
noncomputable def cons_rel_fo_term_list (c : Types.cons_fo_term_list) (t : Types.nlimpl_fo_term_list) := match c with | Types.cons_fo_term_list.NLC_FONil => Types.nlimpl_fo_term_list.model_fo_term_list_field t = Spec.fo_term_list.FONil | Types.cons_fo_term_list.NLC_FOCons v0 v1 => Types.nlimpl_fo_term_list.model_fo_term_list_field t = Spec.fo_term_list.FOCons (Spec.rename_fo_term (Types.nlimpl_fo_term.model_fo_term_field v0) Func.identity Func.identity) (Spec.rename_fo_term_list (Types.nlimpl_fo_term_list.model_fo_term_list_field v1) Func.identity Func.identity)
noncomputable def cons_rel_fo_term (c : Types.cons_fo_term) (t : Types.nlimpl_fo_term) := match c with | Types.cons_fo_term.NLCVar_fo_term v0 => Types.nlimpl_fo_term.model_fo_term_field t = Spec.fo_term.Var_fo_term v0 | Types.cons_fo_term.NLC_App v0 v1 => Types.nlimpl_fo_term.model_fo_term_field t = Spec.fo_term.App (Spec.rename_symbol (Types.nlimpl_symbol.model_symbol_field v0) Func.identity) (Spec.rename_fo_term_list (Types.nlimpl_fo_term_list.model_fo_term_list_field v1) Func.identity Func.identity)
noncomputable def cons_open_rel_fo_term_list (c : Types.cons_fo_term_list) (t : Types.nlimpl_fo_term_list) := match c with | Types.cons_fo_term_list.NLC_FONil => (match Types.nlimpl_fo_term_list.model_fo_term_list_field t with | Spec.fo_term_list.FONil => True | Spec.fo_term_list.FOCons w0 w1 => False) | Types.cons_fo_term_list.NLC_FOCons v0 v1 => (match Types.nlimpl_fo_term_list.model_fo_term_list_field t with | Spec.fo_term_list.FONil => False | Spec.fo_term_list.FOCons w0 w1 => Types.nlimpl_fo_term.model_fo_term_field v0 = Spec.rename_fo_term w0 Func.identity Func.identity ∧ Types.nlimpl_fo_term_list.model_fo_term_list_field v1 = Spec.rename_fo_term_list w1 Func.identity Func.identity)
noncomputable def cons_open_rel_fo_term (c : Types.cons_fo_term) (t : Types.nlimpl_fo_term) := match c with | Types.cons_fo_term.NLCVar_fo_term v0 => Types.nlimpl_fo_term.model_fo_term_field t = Spec.fo_term.Var_fo_term v0 | Types.cons_fo_term.NLC_App v0 v1 => (match Types.nlimpl_fo_term.model_fo_term_field t with | Spec.fo_term.Var_fo_term w0 => False | Spec.fo_term.App w0 w1 => Types.nlimpl_symbol.model_symbol_field v0 = Spec.rename_symbol w0 Func.identity ∧ Types.nlimpl_fo_term_list.model_fo_term_list_field v1 = Spec.rename_fo_term_list w1 Func.identity Func.identity)
end Logic
namespace Impl
end Impl
namespace Types
inductive sdata where
  | PConflict : Types.nlimpl_fo_term_list -> Types.nlimpl_fo_term_list -> sdata
  | Assign : Types.nlimpl_fo_term -> sdata
axiom inhabited_axiom_sdata : Inhabited sdata
attribute [instance] inhabited_axiom_sdata
axiom subst : Type
axiom inhabited_axiom_subst : Inhabited subst
attribute [instance] inhabited_axiom_subst
axiom timesubst : Type
axiom inhabited_axiom_timesubst : Inhabited timesubst
attribute [instance] inhabited_axiom_timesubst
structure unifier_subst where
  unifier_base_model : ℤ -> Spec.fo_term ℤ ℤ
  unifier : ℤ -> Spec.fo_term ℤ ℤ
axiom inhabited_axiom_unifier_subst : Inhabited unifier_subst
attribute [instance] inhabited_axiom_unifier_subst
structure unification_return where
  final_unifier : unifier_subst
  unifier_factor : ℤ -> Spec.fo_term ℤ ℤ
axiom inhabited_axiom_unification_return : Inhabited unification_return
attribute [instance] inhabited_axiom_unification_return
end Types
namespace Logic
axiom sdata_inv : Types.sdata -> Bool
axiom sdata_inv_def (x : Types.sdata) : (sdata_inv x = true) = (match x with | Types.sdata.PConflict l1 l2 => Logic.nlimpl_fo_term_list_ok l1 ∧ Logic.nlimpl_fo_term_list_ok l2 ∧ (∀(x1 : ℤ), Spec.is_fo_term_free_var_in_fo_term_list x1 (Types.nlimpl_fo_term_list.model_fo_term_list_field l1) → (0 : ℤ) ≤ x1) ∧ (∀(x1 : ℤ), Spec.is_fo_term_free_var_in_fo_term_list x1 (Types.nlimpl_fo_term_list.model_fo_term_list_field l2) → (0 : ℤ) ≤ x1) | Types.sdata.Assign l => Logic.nlimpl_fo_term_ok l ∧ (∀(x1 : ℤ), Spec.is_fo_term_free_var_in_fo_term x1 (Types.nlimpl_fo_term.model_fo_term_field l) → (0 : ℤ) ≤ x1))
axiom smodel : Types.timestamp Types.sdata -> ℤ -> Spec.fo_term ℤ ℤ
axiom smodel_def (l : Types.timestamp Types.sdata) (x : ℤ) : smodel l x = (match Types.timestamp.table l x with | ([] : List Types.sdata) => Spec.fo_term.Var_fo_term x | List.cons (Types.sdata.PConflict _ _) _ => Spec.fo_term.Var_fo_term x | List.cons (Types.sdata.Assign u) _ => Types.nlimpl_fo_term.model_fo_term_field u)
noncomputable def unassigned (l : Types.timestamp Types.sdata) (x : ℤ) := match Types.timestamp.table l x with | List.cons (Types.sdata.Assign _) _ => False | _ => True
noncomputable def unifier_subst_ok (rho : Types.t Types.sdata) (u : Types.unifier_subst) := smodel (Logic.current_timestamp rho) = Types.unifier_subst.unifier_base_model u ∧ (∀(x : ℤ), Types.unifier_subst.unifier_base_model u x = Spec.fo_term.Var_fo_term x → unassigned (Logic.current_timestamp rho) x) ∧ (∀(x : ℤ), Types.unifier_subst.unifier_base_model u x = Spec.fo_term.Var_fo_term x → Types.unifier_subst.unifier u x = Spec.fo_term.Var_fo_term x) ∧ Spec.subst_compose_fo_term (Types.unifier_subst.unifier_base_model u) Spec.subst_id_symbol (Types.unifier_subst.unifier u) = Types.unifier_subst.unifier u ∧ Spec.subst_compose_fo_term (Types.unifier_subst.unifier u) Spec.subst_id_symbol (Types.unifier_subst.unifier_base_model u) = Types.unifier_subst.unifier u ∧ Spec.subst_compose_fo_term (Types.unifier_subst.unifier u) Spec.subst_id_symbol (Types.unifier_subst.unifier u) = Types.unifier_subst.unifier u ∧ Logic.correct rho ∧ Types.t.inv rho = sdata_inv
end Logic
namespace Unification_Impl_conflictqtvc
axiom unassigned_closure : Types.timestamp Types.sdata -> ℤ -> Bool
axiom unassigned_closure_def (y : Types.timestamp Types.sdata) (y1 : ℤ) : (unassigned_closure y y1 = true) = Logic.unassigned y y1
theorem conflict'vc (t1 : Types.nlimpl_fo_term_list) (t2 : Types.nlimpl_fo_term_list) (rhob : Types.t Types.sdata) (rho : Types.unifier_subst) (fact0 : Logic.sdata_inv (Types.sdata.PConflict t1 t2) = true) (fact1 : Logic.unifier_subst_ok rhob rho) : Logic.correct rhob ∧ (let t : Types.timestamp Types.sdata := Logic.current_timestamp rhob; let lp : ℤ -> Bool := unassigned_closure (Logic.current_timestamp rhob); (Logic.nlimpl_fo_term_list_ok t1 ∧ Logic.nlimpl_fo_term_list_ok t2 ∧ Logic.unifier_subst_ok rhob rho ∧ (∀(y : ℤ), Spec.is_fo_term_free_var_in_fo_term_list y (Types.nlimpl_fo_term_list.model_fo_term_list_field t1) → (0 : ℤ) ≤ y) ∧ (∀(y : ℤ), Spec.is_fo_term_free_var_in_fo_term_list y (Types.nlimpl_fo_term_list.model_fo_term_list_field t2) → (0 : ℤ) ≤ y) ∧ (∀(x : ℤ), x ∈ ([] : List ℤ) → lp x = true ∧ (0 : ℤ) ≤ x) ∧ (∀(x : ℤ), Logic.unassigned (Logic.current_timestamp rhob) x → lp x = true)) ∧ (∀(l : List ℤ) (rhob1 : Types.t Types.sdata), Types.t.inv rhob1 = Types.t.inv rhob → (∀(o1 : Types.unification_return), Logic.unifier_subst_ok rhob1 (Types.unification_return.final_unifier o1) ∧ Logic.precede rhob rhob1 ∧ (∀(x : ℤ), x ∈ l → lp x = true ∧ (0 : ℤ) ≤ x) ∧ (∀(x : ℤ), Logic.unassigned (Logic.current_timestamp rhob1) x → lp x = true) ∧ Spec.subst_compose_fo_term (Types.unifier_subst.unifier rho) Spec.subst_id_symbol (Types.unification_return.unifier_factor o1) = Types.unifier_subst.unifier (Types.unification_return.final_unifier o1) ∧ (∀(s : ℤ -> Spec.fo_term ℤ ℤ), let s' : ℤ -> Spec.fo_term ℤ ℤ := Spec.subst_compose_fo_term (Types.unifier_subst.unifier rho) Spec.subst_id_symbol s; Spec.subst_fo_term_list (Types.nlimpl_fo_term_list.model_fo_term_list_field t1) Spec.subst_id_symbol s' = Spec.subst_fo_term_list (Types.nlimpl_fo_term_list.model_fo_term_list_field t2) Spec.subst_id_symbol s' → s' = Spec.subst_compose_fo_term (Types.unifier_subst.unifier (Types.unification_return.final_unifier o1)) Spec.subst_id_symbol s) ∧ (let s0 : ℤ -> Spec.fo_term ℤ ℤ := Types.unifier_subst.unifier (Types.unification_return.final_unifier o1); Spec.subst_fo_term_list (Types.nlimpl_fo_term_list.model_fo_term_list_field t1) Spec.subst_id_symbol s0 = Spec.subst_fo_term_list (Types.nlimpl_fo_term_list.model_fo_term_list_field t2) Spec.subst_id_symbol s0) ∧ (let s0 : ℤ -> Spec.fo_term ℤ ℤ := Types.unifier_subst.unifier (Types.unification_return.final_unifier o1); let s1 : ℤ -> Spec.fo_term ℤ ℤ := Types.unifier_subst.unifier_base_model rho; Spec.subst_compose_fo_term s0 Spec.subst_id_symbol s1 = s0 ∧ s0 = Spec.subst_compose_fo_term s1 Spec.subst_id_symbol s0) ∧ (let s0 : ℤ -> Spec.fo_term ℤ ℤ := Types.unifier_subst.unifier (Types.unification_return.final_unifier o1); let s1 : ℤ -> Spec.fo_term ℤ ℤ := Types.unifier_subst.unifier rho; Spec.subst_compose_fo_term s0 Spec.subst_id_symbol s1 = s0 ∧ s0 = Spec.subst_compose_fo_term s1 Spec.subst_id_symbol s0) → (match l with | ([] : List ℤ) => Logic.precede rhob rhob1 ∧ Logic.correct rhob1 | List.cons v _ => (Logic.past_time t rhob1 ∧ Logic.correct rhob1) ∧ (∀(rhob2 : Types.t Types.sdata), Types.t.inv rhob2 = Types.t.inv rhob1 → Logic.correct rhob2 ∧ Logic.current_timestamp rhob2 = t ∧ Logic.past_time (Logic.current_timestamp rhob2) rhob2 ∧ (∀(t21 : Types.timestamp Types.sdata), Logic.before t21 t ∧ Logic.past_time t21 rhob1 → Logic.past_time t21 rhob2) ∧ Logic.precede rhob2 rhob1 → (let o2 : Types.sdata := Types.sdata.PConflict t1 t2; (Logic.correct rhob2 ∧ (0 : ℤ) ≤ v ∧ Types.t.inv rhob2 o2 = true) ∧ (∀(rhob3 : Types.t Types.sdata), Types.t.inv rhob3 = Types.t.inv rhob2 → Logic.past_time (Logic.current_timestamp rhob3) rhob3 ∧ Logic.correct rhob3 ∧ Logic.precede rhob2 rhob3 ∧ (let tb0 : ℤ -> List Types.sdata := Types.timestamp.table (Logic.current_timestamp rhob2); Types.timestamp.table (Logic.current_timestamp rhob3) = Func.update tb0 v (List.cons o2 (tb0 v))) → Logic.unifier_subst_ok rhob3 rho ∧ Logic.precede rhob rhob3))))) ∧ (Logic.precede rhob rhob1 ∧ Logic.correct rhob1 → (Logic.past_time t rhob1 ∧ Logic.correct rhob1) ∧ (∀(rhob2 : Types.t Types.sdata), Types.t.inv rhob2 = Types.t.inv rhob1 → Logic.correct rhob2 ∧ Logic.current_timestamp rhob2 = t ∧ Logic.past_time (Logic.current_timestamp rhob2) rhob2 ∧ (∀(t21 : Types.timestamp Types.sdata), Logic.before t21 t ∧ Logic.past_time t21 rhob1 → Logic.past_time t21 rhob2) ∧ Logic.precede rhob2 rhob1 → Logic.unifier_subst_ok rhob2 rho ∧ Logic.precede rhob rhob2))))
  := sorry
end Unification_Impl_conflictqtvc
