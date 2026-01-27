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

namespace Syntax
inductive datatype where
  | TYunit : datatype
  | TYint : datatype
  | TYbool : datatype
axiom inhabited_axiom_datatype : Inhabited datatype
attribute [instance] inhabited_axiom_datatype
inductive value where
  | Vvoid : value
  | Vint : ℤ -> value
  | Vbool : Bool -> value
axiom inhabited_axiom_value : Inhabited value
attribute [instance] inhabited_axiom_value
inductive operator where
  | Oplus : operator
  | Ominus : operator
  | Omult : operator
  | Ole : operator
axiom inhabited_axiom_operator : Inhabited operator
attribute [instance] inhabited_axiom_operator
axiom mident : Type
axiom inhabited_axiom_mident : Inhabited mident
attribute [instance] inhabited_axiom_mident
axiom ident : Type
axiom inhabited_axiom_ident : Inhabited ident
attribute [instance] inhabited_axiom_ident
inductive term where
  | Tvalue : value -> term
  | Tvar : ident -> term
  | Tderef : mident -> term
  | Tbin : term -> operator -> term -> term
axiom inhabited_axiom_term : Inhabited term
attribute [instance] inhabited_axiom_term
inductive fmla where
  | Fterm : term -> fmla
  | Fand : fmla -> fmla -> fmla
  | Fnot : fmla -> fmla
  | Fimplies : fmla -> fmla -> fmla
  | Flet : ident -> term -> fmla -> fmla
  | Fforall : ident -> datatype -> fmla -> fmla
axiom inhabited_axiom_fmla : Inhabited fmla
attribute [instance] inhabited_axiom_fmla
inductive stmt where
  | Sskip : stmt
  | Sassign : mident -> term -> stmt
  | Sseq : stmt -> stmt -> stmt
  | Sif : term -> stmt -> stmt -> stmt
  | Sassert : fmla -> stmt
  | Swhile : term -> fmla -> stmt -> stmt
axiom inhabited_axiom_stmt : Inhabited stmt
attribute [instance] inhabited_axiom_stmt
end Syntax
namespace SemOp
axiom env : Type
axiom inhabited_axiom_env : Inhabited env
attribute [instance] inhabited_axiom_env
axiom stack : Type
axiom inhabited_axiom_stack : Inhabited stack
attribute [instance] inhabited_axiom_stack
noncomputable def get_stack : Syntax.ident -> List (Syntax.ident × Syntax.value) -> Syntax.value
  | i, ([] : List (Syntax.ident × Syntax.value)) => Syntax.value.Vvoid
  | i, (List.cons (x, v) r) => if x = i then v else get_stack i r
noncomputable def eval_bin (x : Syntax.value) (op : Syntax.operator) (y : Syntax.value) := match (x, y) with | (Syntax.value.Vint x1, Syntax.value.Vint y1) => (match op with | Syntax.operator.Oplus => Syntax.value.Vint (x1 + y1) | Syntax.operator.Ominus => Syntax.value.Vint (x1 - y1) | Syntax.operator.Omult => Syntax.value.Vint (x1 * y1) | Syntax.operator.Ole => Syntax.value.Vbool (if x1 ≤ y1 then true else false)) | (_, _) => Syntax.value.Vvoid
noncomputable def eval_term : (Syntax.mident -> Syntax.value) -> List (Syntax.ident × Syntax.value) -> Syntax.term -> Syntax.value
  | sigma, pi, (Syntax.term.Tvalue v) => v
  | sigma, pi, (Syntax.term.Tvar id1) => get_stack id1 pi
  | sigma, pi, (Syntax.term.Tderef id1) => sigma id1
  | sigma, pi, (Syntax.term.Tbin t1 op t2) => eval_bin (eval_term sigma pi t1) op (eval_term sigma pi t2)
noncomputable def eval_fmla : (Syntax.mident -> Syntax.value) -> List (Syntax.ident × Syntax.value) -> Syntax.fmla -> Prop
  | sigma, pi, (Syntax.fmla.Fterm t) => eval_term sigma pi t = Syntax.value.Vbool true
  | sigma, pi, (Syntax.fmla.Fand f1 f2) => eval_fmla sigma pi f1 ∧ eval_fmla sigma pi f2
  | sigma, pi, (Syntax.fmla.Fnot f1) => ¬eval_fmla sigma pi f1
  | sigma, pi, (Syntax.fmla.Fimplies f1 f2) => eval_fmla sigma pi f1 → eval_fmla sigma pi f2
  | sigma, pi, (Syntax.fmla.Flet x t f1) => eval_fmla sigma (List.cons (x, eval_term sigma pi t) pi) f1
  | sigma, pi, (Syntax.fmla.Fforall x Syntax.datatype.TYint f1) => ∀(n : ℤ), eval_fmla sigma (List.cons (x, Syntax.value.Vint n) pi) f1
  | sigma, pi, (Syntax.fmla.Fforall x Syntax.datatype.TYbool f1) => ∀(b : Bool), eval_fmla sigma (List.cons (x, Syntax.value.Vbool b) pi) f1
  | sigma, pi, (Syntax.fmla.Fforall x Syntax.datatype.TYunit f1) => eval_fmla sigma (List.cons (x, Syntax.value.Vvoid) pi) f1
noncomputable def valid_fmla (p : Syntax.fmla) := ∀(sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)), eval_fmla sigma pi p
inductive one_step : (Syntax.mident -> Syntax.value) -> List (Syntax.ident × Syntax.value) -> Syntax.stmt -> (Syntax.mident -> Syntax.value) -> List (Syntax.ident × Syntax.value) -> Syntax.stmt -> Prop where
 | one_step_assign (sigma' : Syntax.mident -> Syntax.value) (sigma : Syntax.mident -> Syntax.value) (x : Syntax.mident) (pi : List (Syntax.ident × Syntax.value)) (t : Syntax.term) : sigma' = Function.update sigma x (eval_term sigma pi t) → one_step sigma pi (Syntax.stmt.Sassign x t) sigma' pi Syntax.stmt.Sskip
 | one_step_seq_noskip (sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)) (s1 : Syntax.stmt) (sigma' : Syntax.mident -> Syntax.value) (pi' : List (Syntax.ident × Syntax.value)) (s1' : Syntax.stmt) (s2 : Syntax.stmt) : one_step sigma pi s1 sigma' pi' s1' → one_step sigma pi (Syntax.stmt.Sseq s1 s2) sigma' pi' (Syntax.stmt.Sseq s1' s2)
 | one_step_seq_skip (sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)) (s : Syntax.stmt) : one_step sigma pi (Syntax.stmt.Sseq Syntax.stmt.Sskip s) sigma pi s
 | one_step_if_true (sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)) (t : Syntax.term) (s1 : Syntax.stmt) (s2 : Syntax.stmt) : eval_term sigma pi t = Syntax.value.Vbool true → one_step sigma pi (Syntax.stmt.Sif t s1 s2) sigma pi s1
 | one_step_if_false (sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)) (t : Syntax.term) (s1 : Syntax.stmt) (s2 : Syntax.stmt) : eval_term sigma pi t = Syntax.value.Vbool false → one_step sigma pi (Syntax.stmt.Sif t s1 s2) sigma pi s2
 | one_step_assert (sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)) (f : Syntax.fmla) : eval_fmla sigma pi f → one_step sigma pi (Syntax.stmt.Sassert f) sigma pi Syntax.stmt.Sskip
 | one_step_while_true (sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)) (inv : Syntax.fmla) (cond : Syntax.term) (body : Syntax.stmt) : eval_fmla sigma pi inv → eval_term sigma pi cond = Syntax.value.Vbool true → one_step sigma pi (Syntax.stmt.Swhile cond inv body) sigma pi (Syntax.stmt.Sseq body (Syntax.stmt.Swhile cond inv body))
 | one_step_while_false (sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)) (inv : Syntax.fmla) (cond : Syntax.term) (body : Syntax.stmt) : eval_fmla sigma pi inv → eval_term sigma pi cond = Syntax.value.Vbool false → one_step sigma pi (Syntax.stmt.Swhile cond inv body) sigma pi Syntax.stmt.Sskip
inductive many_steps : (Syntax.mident -> Syntax.value) -> List (Syntax.ident × Syntax.value) -> Syntax.stmt -> (Syntax.mident -> Syntax.value) -> List (Syntax.ident × Syntax.value) -> Syntax.stmt -> ℤ -> Prop where
 | many_steps_refl (sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)) (s : Syntax.stmt) : many_steps sigma pi s sigma pi s (0 : ℤ)
 | many_steps_trans (sigma1 : Syntax.mident -> Syntax.value) (pi1 : List (Syntax.ident × Syntax.value)) (s1 : Syntax.stmt) (sigma2 : Syntax.mident -> Syntax.value) (pi2 : List (Syntax.ident × Syntax.value)) (s2 : Syntax.stmt) (sigma3 : Syntax.mident -> Syntax.value) (pi3 : List (Syntax.ident × Syntax.value)) (s3 : Syntax.stmt) (n : ℤ) : one_step sigma1 pi1 s1 sigma2 pi2 s2 → many_steps sigma2 pi2 s2 sigma3 pi3 s3 n → many_steps sigma1 pi1 s1 sigma3 pi3 s3 (n + (1 : ℤ))
noncomputable def reductible (sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)) (s : Syntax.stmt) := ∃(sigma' : Syntax.mident -> Syntax.value) (pi' : List (Syntax.ident × Syntax.value)) (s' : Syntax.stmt), one_step sigma pi s sigma' pi' s'
end SemOp
namespace FreshVariables
noncomputable def msubst_term : Syntax.term -> Syntax.mident -> Syntax.ident -> Syntax.term
  | (Syntax.term.Tvalue x0), x, v => Syntax.term.Tvalue x0
  | (Syntax.term.Tvar x0), x, v => Syntax.term.Tvar x0
  | (Syntax.term.Tderef y), x, v => if x = y then Syntax.term.Tvar v else Syntax.term.Tderef y
  | (Syntax.term.Tbin t1 op t2), x, v => Syntax.term.Tbin (msubst_term t1 x v) op (msubst_term t2 x v)
noncomputable def msubst : Syntax.fmla -> Syntax.mident -> Syntax.ident -> Syntax.fmla
  | (Syntax.fmla.Fterm e), x, v => Syntax.fmla.Fterm (msubst_term e x v)
  | (Syntax.fmla.Fand f1 f2), x, v => Syntax.fmla.Fand (msubst f1 x v) (msubst f2 x v)
  | (Syntax.fmla.Fnot f1), x, v => Syntax.fmla.Fnot (msubst f1 x v)
  | (Syntax.fmla.Fimplies f1 f2), x, v => Syntax.fmla.Fimplies (msubst f1 x v) (msubst f2 x v)
  | (Syntax.fmla.Flet y t f1), x, v => Syntax.fmla.Flet y (msubst_term t x v) (msubst f1 x v)
  | (Syntax.fmla.Fforall y ty f1), x, v => Syntax.fmla.Fforall y ty (msubst f1 x v)
noncomputable def fresh_in_term : Syntax.ident -> Syntax.term -> Prop
  | id1, (Syntax.term.Tvalue x) => True
  | id1, (Syntax.term.Tderef x) => True
  | id1, (Syntax.term.Tvar i) => ¬id1 = i
  | id1, (Syntax.term.Tbin t1 x t2) => fresh_in_term id1 t1 ∧ fresh_in_term id1 t2
noncomputable def fresh_in_fmla : Syntax.ident -> Syntax.fmla -> Prop
  | id1, (Syntax.fmla.Fterm e) => fresh_in_term id1 e
  | id1, (Syntax.fmla.Fand f1 f2) => fresh_in_fmla id1 f1 ∧ fresh_in_fmla id1 f2
  | id1, (Syntax.fmla.Fimplies f1 f2) => fresh_in_fmla id1 f1 ∧ fresh_in_fmla id1 f2
  | id1, (Syntax.fmla.Fnot f1) => fresh_in_fmla id1 f1
  | id1, (Syntax.fmla.Flet y t f1) => ¬id1 = y ∧ fresh_in_term id1 t ∧ fresh_in_fmla id1 f1
  | id1, (Syntax.fmla.Fforall y x f1) => ¬id1 = y ∧ fresh_in_fmla id1 f1
end FreshVariables
namespace blocking_semantics5_HoareLogic_if_ruleqtvc
noncomputable def valid_triple (p : Syntax.fmla) (s : Syntax.stmt) (q : Syntax.fmla) := ∀(sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)), SemOp.eval_fmla sigma pi p → (∀(sigma' : Syntax.mident -> Syntax.value) (pi' : List (Syntax.ident × Syntax.value)) (n : ℤ), SemOp.many_steps sigma pi s sigma' pi' Syntax.stmt.Sskip n → SemOp.eval_fmla sigma' pi' q)
noncomputable def total_valid_triple (p : Syntax.fmla) (s : Syntax.stmt) (q : Syntax.fmla) := ∀(sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)), SemOp.eval_fmla sigma pi p → (∃(sigma' : Syntax.mident -> Syntax.value) (pi' : List (Syntax.ident × Syntax.value)) (n : ℤ), SemOp.many_steps sigma pi s sigma' pi' Syntax.stmt.Sskip n ∧ SemOp.eval_fmla sigma' pi' q)
theorem if_rule'vc (p : Syntax.fmla) (t : Syntax.term) (s1 : Syntax.stmt) (q : Syntax.fmla) (s2 : Syntax.stmt) (fact0 : valid_triple (Syntax.fmla.Fand p (Syntax.fmla.Fterm t)) s1 q) (fact1 : valid_triple (Syntax.fmla.Fand p (Syntax.fmla.Fnot (Syntax.fmla.Fterm t))) s2 q) : valid_triple p (Syntax.stmt.Sif t s1 s2) q
  := sorry
end blocking_semantics5_HoareLogic_if_ruleqtvc
