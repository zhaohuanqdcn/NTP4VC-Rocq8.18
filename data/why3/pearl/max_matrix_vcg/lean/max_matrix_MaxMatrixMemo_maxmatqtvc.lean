import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.Const
import pearl.max_matrix_vcg.lean.max_matrix.Bitset
import pearl.max_matrix_vcg.lean.max_matrix.HashTable
open Classical
open Lean4Why3
namespace max_matrix_MaxMatrixMemo_maxmatqtvc
axiom t : Type -> Type
axiom inhabited_axiom_t {α : Type} [Inhabited α] : Inhabited (t α)
attribute [instance] inhabited_axiom_t
axiom contents :  {α : Type} -> [Inhabited α] -> t α -> ℤ -> α
axiom create :  {α : Type} -> [Inhabited α] -> α -> t α
axiom create'spec {α : Type} [Inhabited α] (x : α) : contents (create x) = Const.const x
axiom mixfix_lbrb :  {α : Type} -> [Inhabited α] -> t α -> ℤ -> α
axiom mixfix_lbrb'spec {α : Type} [Inhabited α] (m : t α) (k : ℤ) : mixfix_lbrb m k = contents m k
axiom mixfix_lblsmnrb :  {α : Type} -> [Inhabited α] -> t α -> ℤ -> α -> t α
axiom mixfix_lblsmnrb'spec {α : Type} [Inhabited α] (m : t α) (k : ℤ) (v : α) : contents (mixfix_lblsmnrb m k v) = Function.update (contents m) k v
axiom n : ℤ
axiom n'def : (0 : ℤ) ≤ n ∧ n ≤ Bitset.size
axiom m : t (t ℤ)
axiom m'def (i : ℤ) (j : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < n) (fact2 : (0 : ℤ) ≤ j) (fact3 : j < n) : (0 : ℤ) ≤ mixfix_lbrb (mixfix_lbrb m i) j
axiom mapii : Type
axiom inhabited_axiom_mapii : Inhabited mapii
attribute [instance] inhabited_axiom_mapii
noncomputable def solution (s : ℤ -> ℤ) (i : ℤ) := (∀(k : ℤ), i ≤ k ∧ k < n → (0 : ℤ) ≤ s k ∧ s k < n) ∧ (∀(k1 : ℤ) (k2 : ℤ), i ≤ k1 ∧ k1 < k2 ∧ k2 < n → ¬s k1 = s k2)
noncomputable def f (s : ℤ -> ℤ) (i : ℤ) := mixfix_lbrb (mixfix_lbrb m i) (s i)
axiom sum : (ℤ -> ℤ) -> ℤ -> ℤ -> ℤ
axiom Sum_def_empty (j : ℤ) (i : ℤ) (c : ℤ -> ℤ) (fact0 : j ≤ i) : sum c i j = (0 : ℤ)
axiom Sum_def_non_empty (i : ℤ) (j : ℤ) (c : ℤ -> ℤ) (fact0 : i < j) : sum c i j = f c i + sum c (i + (1 : ℤ)) j
axiom Sum_right_extension (i : ℤ) (j : ℤ) (c : ℤ -> ℤ) (fact0 : i < j) : sum c i j = sum c i (j - (1 : ℤ)) + f c (j - (1 : ℤ))
axiom Sum_transitivity (i : ℤ) (k : ℤ) (j : ℤ) (c : ℤ -> ℤ) (fact0 : i ≤ k) (fact1 : k ≤ j) : sum c i j = sum c i k + sum c k j
axiom Sum_eq (i : ℤ) (j : ℤ) (c1 : ℤ -> ℤ) (c2 : ℤ -> ℤ) (fact0 : ∀(k : ℤ), i ≤ k ∧ k < j → f c1 k = f c2 k) : sum c1 i j = sum c2 i j
axiom key : Type
axiom inhabited_axiom_key : Inhabited key
attribute [instance] inhabited_axiom_key
axiom value : Type
axiom inhabited_axiom_value : Inhabited value
attribute [instance] inhabited_axiom_value
noncomputable def pre (k : ℤ × Bitset.set) := match k with | (i, c) => ((0 : ℤ) ≤ i ∧ i ≤ n) ∧ Bitset.cardinal c = n - i ∧ (∀(k1 : ℤ), Bitset.mem k1 c → (0 : ℤ) ≤ k1 ∧ k1 < n)
noncomputable def post (k : ℤ × Bitset.set) (v : ℤ × t ℤ) := match k with | (i, c) => (match v with | (r, sol) => (0 : ℤ) ≤ r ∧ solution (contents sol) i ∧ (∀(k1 : ℤ), i ≤ k1 ∧ k1 < n → Bitset.mem (mixfix_lbrb sol k1) c) ∧ r = sum (contents sol) i n ∧ (∀(s : ℤ -> ℤ), solution s i → (∀(k1 : ℤ), i ≤ k1 ∧ k1 < n → Bitset.mem (s k1) c) → sum s i n ≤ r))
axiom table : Type
axiom inhabited_axiom_table : Inhabited table
attribute [instance] inhabited_axiom_table
noncomputable def inv (t1 : HashTable.t (ℤ × Bitset.set) (ℤ × t ℤ)) := ∀(k : ℤ × Bitset.set) (v : ℤ × t ℤ), HashTable.mixfix_lbrb t1 k = Option.some v → post k v
theorem maxmat'vc (table1 : HashTable.t (ℤ × Bitset.set) (ℤ × t ℤ)) (fact0 : ∀(k : ℤ × Bitset.set), HashTable.mixfix_lbrb table1 k = Option.none) : let o1 : ℤ := n; ((0 : ℤ) ≤ o1 ∧ o1 ≤ Bitset.size) ∧ (let o2 : Bitset.set := Bitset.below o1; (∀(x : ℤ), Bitset.mem x o2 = ((0 : ℤ) ≤ x ∧ x < o1)) → (pre ((0 : ℤ), o2) ∧ inv table1) ∧ (∀(table2 : HashTable.t (ℤ × Bitset.set) (ℤ × t ℤ)) (o3 : ℤ) (o4 : t ℤ), post ((0 : ℤ), o2) (o3, o4) ∧ inv table2 → (∃(s : ℤ -> ℤ), solution s (0 : ℤ) ∧ o3 = sum s (0 : ℤ) n) ∧ (∀(s : ℤ -> ℤ), solution s (0 : ℤ) → sum s (0 : ℤ) n ≤ o3)))
  := sorry
end max_matrix_MaxMatrixMemo_maxmatqtvc
