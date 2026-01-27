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
namespace UnionFind_pure
axiom uf_pure : Type
axiom inhabited_axiom_uf_pure : Inhabited uf_pure
attribute [instance] inhabited_axiom_uf_pure
axiom repr : uf_pure -> ℤ -> ℤ -> Prop
axiom size : uf_pure -> ℤ
axiom num : uf_pure -> ℤ
axiom Repr_function_1 (x : ℤ) (u : uf_pure) (fact0 : (0 : ℤ) ≤ x) (fact1 : x < size u) : ∃(y : ℤ), ((0 : ℤ) ≤ y ∧ y < size u) ∧ repr u x y
axiom Repr_function_2 (x : ℤ) (u : uf_pure) (y : ℤ) (z : ℤ) (fact0 : (0 : ℤ) ≤ x) (fact1 : x < size u) (fact2 : repr u x y) (fact3 : repr u x z) : y = z
noncomputable def same (u : uf_pure) (x : ℤ) (y : ℤ) := ∀(r : ℤ), repr u x r = repr u y r
noncomputable def same_reprs (u1 : uf_pure) (u2 : uf_pure) := ∀(x : ℤ) (r : ℤ), repr u1 x r = repr u2 x r
axiom OneClass (u : uf_pure) (x : ℤ) (y : ℤ) (fact0 : num u = (1 : ℤ)) (fact1 : (0 : ℤ) ≤ x) (fact2 : x < size u) (fact3 : (0 : ℤ) ≤ y) (fact4 : y < size u) : same u x y
end UnionFind_pure
namespace UnionFind_sig
axiom uf : Type
axiom inhabited_axiom_uf : Inhabited uf
attribute [instance] inhabited_axiom_uf
axiom state : uf -> UnionFind_pure.uf_pure
end UnionFind_sig
namespace Graph_sig
axiom graph : Type
axiom inhabited_axiom_graph : Inhabited graph
attribute [instance] inhabited_axiom_graph
inductive path : graph -> ℤ -> ℤ -> Prop where
 | Path_refl (g : graph) (x : ℤ) : path g x x
 | Path_sym (g : graph) (x : ℤ) (y : ℤ) : path g x y → path g y x
 | Path_trans (g : graph) (x : ℤ) (y : ℤ) (z : ℤ) : path g x y → path g y z → path g x z
end Graph_sig
namespace vacid_0_build_maze_BuildMaze_build_mazeqtvc
theorem build_maze'vc (n : ℤ) (graph : Graph_sig.graph) (fact0 : (1 : ℤ) ≤ n) (fact1 : ∀(x : ℤ) (y : ℤ), (x = y) = Graph_sig.path graph x y) : let o1 : ℤ := n * n; (0 : ℤ) ≤ o1 ∧ (∀(u : UnionFind_sig.uf), UnionFind_pure.num (UnionFind_sig.state u) = o1 ∧ UnionFind_pure.size (UnionFind_sig.state u) = o1 ∧ (∀(x : ℤ), (0 : ℤ) ≤ x ∧ x < o1 → UnionFind_pure.repr (UnionFind_sig.state u) x x) → ((1 : ℤ) ≤ UnionFind_pure.num (UnionFind_sig.state u) ∧ (UnionFind_pure.num (UnionFind_sig.state u) + (0 : ℤ) = UnionFind_pure.size (UnionFind_sig.state u) ∧ UnionFind_pure.size (UnionFind_sig.state u) = n * n) ∧ (∀(x : ℤ) (y : ℤ), (0 : ℤ) ≤ x ∧ x < n * n → (0 : ℤ) ≤ y ∧ y < n * n → UnionFind_pure.same (UnionFind_sig.state u) x y = Graph_sig.path graph x y)) ∧ (∀(u1 : UnionFind_sig.uf) (num_edges : ℤ) (graph1 : Graph_sig.graph), (1 : ℤ) ≤ UnionFind_pure.num (UnionFind_sig.state u1) ∧ (UnionFind_pure.num (UnionFind_sig.state u1) + num_edges = UnionFind_pure.size (UnionFind_sig.state u1) ∧ UnionFind_pure.size (UnionFind_sig.state u1) = n * n) ∧ (∀(x : ℤ) (y : ℤ), (0 : ℤ) ≤ x ∧ x < n * n → (0 : ℤ) ≤ y ∧ y < n * n → UnionFind_pure.same (UnionFind_sig.state u1) x y = Graph_sig.path graph1 x y) → (if (1 : ℤ) < UnionFind_pure.num (UnionFind_sig.state u1) then (0 : ℤ) < n ∧ (∀(x : ℤ), (0 : ℤ) ≤ x ∧ x < n → (0 : ℤ) < n ∧ (∀(y : ℤ), (0 : ℤ) ≤ y ∧ y < n → (0 : ℤ) < (2 : ℤ) ∧ (∀(d : ℤ), (0 : ℤ) ≤ d ∧ d < (2 : ℤ) → (∀(w : ℤ), (if d = (0 : ℤ) then w = x + (1 : ℤ) else w = x) → (∀(z : ℤ), (if d = (0 : ℤ) then z = y else z = y + (1 : ℤ)) → (∀(o2 : Bool), (if w < n then o2 = (if z < n then true else false) else o2 = false) → (if o2 = true then let a : ℤ := y * n + x; let b : ℤ := w * n + z; ((0 : ℤ) ≤ b ∧ b < UnionFind_pure.size (UnionFind_sig.state u1)) ∧ (∀(u2 : UnionFind_sig.uf) (o3 : ℤ), UnionFind_pure.repr (UnionFind_sig.state u2) b o3 ∧ UnionFind_pure.size (UnionFind_sig.state u2) = UnionFind_pure.size (UnionFind_sig.state u1) ∧ UnionFind_pure.num (UnionFind_sig.state u2) = UnionFind_pure.num (UnionFind_sig.state u1) ∧ UnionFind_pure.same_reprs (UnionFind_sig.state u2) (UnionFind_sig.state u1) → ((0 : ℤ) ≤ a ∧ a < UnionFind_pure.size (UnionFind_sig.state u2)) ∧ (∀(u3 : UnionFind_sig.uf) (o4 : ℤ), UnionFind_pure.repr (UnionFind_sig.state u3) a o4 ∧ UnionFind_pure.size (UnionFind_sig.state u3) = UnionFind_pure.size (UnionFind_sig.state u2) ∧ UnionFind_pure.num (UnionFind_sig.state u3) = UnionFind_pure.num (UnionFind_sig.state u2) ∧ UnionFind_pure.same_reprs (UnionFind_sig.state u3) (UnionFind_sig.state u2) → (if ¬o4 = o3 then (((0 : ℤ) ≤ a ∧ a < UnionFind_pure.size (UnionFind_sig.state u3)) ∧ ((0 : ℤ) ≤ b ∧ b < UnionFind_pure.size (UnionFind_sig.state u3)) ∧ ¬UnionFind_pure.same (UnionFind_sig.state u3) a b ∧ ¬Graph_sig.path graph1 a b ∧ (∀(x1 : ℤ) (y1 : ℤ), (0 : ℤ) ≤ x1 ∧ x1 < UnionFind_pure.size (UnionFind_sig.state u3) → (0 : ℤ) ≤ y1 ∧ y1 < UnionFind_pure.size (UnionFind_sig.state u3) → UnionFind_pure.same (UnionFind_sig.state u3) x1 y1 = Graph_sig.path graph1 x1 y1)) ∧ (∀(u4 : UnionFind_sig.uf) (graph2 : Graph_sig.graph), UnionFind_pure.same (UnionFind_sig.state u4) a b ∧ UnionFind_pure.size (UnionFind_sig.state u4) = UnionFind_pure.size (UnionFind_sig.state u3) ∧ UnionFind_pure.num (UnionFind_sig.state u4) = UnionFind_pure.num (UnionFind_sig.state u3) - (1 : ℤ) ∧ (∀(x1 : ℤ) (y1 : ℤ), (0 : ℤ) ≤ x1 ∧ x1 < UnionFind_pure.size (UnionFind_sig.state u4) → (0 : ℤ) ≤ y1 ∧ y1 < UnionFind_pure.size (UnionFind_sig.state u4) → UnionFind_pure.same (UnionFind_sig.state u4) x1 y1 = Graph_sig.path graph2 x1 y1) → (1 : ℤ) ≤ UnionFind_pure.num (UnionFind_sig.state u4) ∧ (UnionFind_pure.num (UnionFind_sig.state u4) + (num_edges + (1 : ℤ)) = UnionFind_pure.size (UnionFind_sig.state u4) ∧ UnionFind_pure.size (UnionFind_sig.state u4) = n * n) ∧ (∀(x1 : ℤ) (y1 : ℤ), (0 : ℤ) ≤ x1 ∧ x1 < n * n → (0 : ℤ) ≤ y1 ∧ y1 < n * n → UnionFind_pure.same (UnionFind_sig.state u4) x1 y1 = Graph_sig.path graph2 x1 y1)) else (1 : ℤ) ≤ UnionFind_pure.num (UnionFind_sig.state u3) ∧ (UnionFind_pure.num (UnionFind_sig.state u3) + num_edges = UnionFind_pure.size (UnionFind_sig.state u3) ∧ UnionFind_pure.size (UnionFind_sig.state u3) = n * n) ∧ (∀(x1 : ℤ) (y1 : ℤ), (0 : ℤ) ≤ x1 ∧ x1 < n * n → (0 : ℤ) ≤ y1 ∧ y1 < n * n → UnionFind_pure.same (UnionFind_sig.state u3) x1 y1 = Graph_sig.path graph1 x1 y1)))) else (1 : ℤ) ≤ UnionFind_pure.num (UnionFind_sig.state u1) ∧ (UnionFind_pure.num (UnionFind_sig.state u1) + num_edges = UnionFind_pure.size (UnionFind_sig.state u1) ∧ UnionFind_pure.size (UnionFind_sig.state u1) = n * n) ∧ (∀(x1 : ℤ) (y1 : ℤ), (0 : ℤ) ≤ x1 ∧ x1 < n * n → (0 : ℤ) ≤ y1 ∧ y1 < n * n → UnionFind_pure.same (UnionFind_sig.state u1) x1 y1 = Graph_sig.path graph1 x1 y1)))))))) else num_edges = n * n - (1 : ℤ) ∧ (∀(x : ℤ) (y : ℤ), (0 : ℤ) ≤ x ∧ x < n * n → (0 : ℤ) ≤ y ∧ y < n * n → Graph_sig.path graph1 x y))))
  := sorry
end vacid_0_build_maze_BuildMaze_build_mazeqtvc
