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
namespace Firstorder_term_spec_Spec_free_var_derive_equivalence_of_subst_fo_term_listqtvc
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
theorem free_var_derive_equivalence_of_subst_fo_term_list'vc {ty'c0 : Type} {ty'c3 : Type} {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'c0] [Inhabited ty'c3] [Inhabited ty'b0] [Inhabited ty'b3] (t : fo_term_list ty'b0 ty'b3) (s10 : ty'b0 -> Spec.symbol ty'c0) (s13 : ty'b3 -> fo_term ty'c0 ty'c3) (s20 : ty'b0 -> Spec.symbol ty'c0) (s23 : ty'b3 -> fo_term ty'c0 ty'c3) (fact0 : subst_fo_term_list t s10 s13 = subst_fo_term_list t s20 s23) : (∀(x : ty'b0), is_symbol_free_var_in_fo_term_list x t → s10 x = s20 x) ∧ (∀(x : ty'b3), is_fo_term_free_var_in_fo_term_list x t → s13 x = s23 x)
  := sorry
end Firstorder_term_spec_Spec_free_var_derive_equivalence_of_subst_fo_term_listqtvc
