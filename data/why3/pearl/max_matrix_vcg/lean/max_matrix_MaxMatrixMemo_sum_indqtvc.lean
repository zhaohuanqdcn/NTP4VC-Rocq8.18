import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.Const
import pearl.max_matrix_vcg.lean.max_matrix.Bitset
open Classical
open Lean4Why3
namespace max_matrix_MaxMatrixMemo_sum_indqtvc
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
theorem sum_ind'vc (i : ℤ) (s : ℤ -> ℤ) (j : ℤ) (fact0 : i < n) : sum (Function.update s i j) i n = mixfix_lbrb (mixfix_lbrb m i) j + sum s (i + (1 : ℤ)) n
  := sorry
end max_matrix_MaxMatrixMemo_sum_indqtvc
