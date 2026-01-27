import Why3.Base
import Why3.why3.Ref.Ref
import pearl.koda_ruskey_vcg.lean.koda_ruskey.KodaRuskey_Spec
import pearl.koda_ruskey_vcg.lean.koda_ruskey.Lemmas
open Classical
open Lean4Why3
namespace koda_ruskey_KodaRuskey_mainqtvc
theorem main'vc (f0 : KodaRuskey_Spec.forest) (bits : List KodaRuskey_Spec.color) (fact0 : KodaRuskey_Spec.white_forest f0 (getElem! bits ∘ Int.toNat)) (fact1 : KodaRuskey_Spec.size_forest f0 = Int.ofNat (List.length bits)) (fact2 : KodaRuskey_Spec.valid_nums_forest f0 (Int.ofNat (List.length bits))) : let o1 : List KodaRuskey_Spec.forest := List.cons f0 ([] : List KodaRuskey_Spec.forest); (KodaRuskey_Spec.size_forest f0 = Int.ofNat (List.length bits) ∧ KodaRuskey_Spec.valid_nums_forest f0 (Int.ofNat (List.length bits)) ∧ Lemmas.sub o1 f0 (getElem! bits ∘ Int.toNat) ∧ Lemmas.any_stack o1 (getElem! bits ∘ Int.toNat) ∧ KodaRuskey_Spec.valid_coloring f0 (getElem! bits ∘ Int.toNat)) ∧ (∀(bits1 : List KodaRuskey_Spec.color) (visited : List (ℤ -> KodaRuskey_Spec.color)), List.length bits1 = List.length bits → (∀(i : ℤ), ¬Lemmas.mem_stack i o1 → bits1[Int.toNat i]! = bits[Int.toNat i]!) ∧ Lemmas.inverse o1 (getElem! bits ∘ Int.toNat) (getElem! bits1 ∘ Int.toNat) ∧ KodaRuskey_Spec.valid_coloring f0 (getElem! bits1 ∘ Int.toNat) ∧ Lemmas.stored_solutions f0 (getElem! bits1 ∘ Int.toNat) o1 ([] : List (ℤ -> KodaRuskey_Spec.color)) visited → Int.ofNat (List.length visited) = KodaRuskey_Spec.count_forest f0 ∧ (let n : ℤ := Int.ofNat (List.length visited); ∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < n → KodaRuskey_Spec.valid_coloring f0 (visited[Int.toNat j]!) ∧ (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < n → ¬j = k → ¬KodaRuskey_Spec.eq_coloring (Int.ofNat (List.length bits1)) (visited[Int.toNat j]!) (visited[Int.toNat k]!))))
  := sorry
end koda_ruskey_KodaRuskey_mainqtvc
