import Why3.Base
import Why3.int.NumOf
open Classical
open Lean4Why3
namespace verifythis_2021_lexicographic_permutations_1_Top_lt_transqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom permutation : Type
axiom inhabited_axiom_permutation : Inhabited permutation
attribute [instance] inhabited_axiom_permutation
noncomputable def lt (p : List ℤ) (q : List ℤ) := (List.length p = List.length q ∧ (0 : ℤ) < Int.ofNat (List.length q)) ∧ (∃(i : ℤ), ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length p)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → p[Int.toNat j]! = q[Int.toNat j]!) ∧ p[Int.toNat i]! < q[Int.toNat i]!)
theorem lt_trans'vc (p : List ℤ) (q : List ℤ) (r : List ℤ) (fact0 : lt p q) (fact1 : lt q r) : lt p r
  := sorry
end verifythis_2021_lexicographic_permutations_1_Top_lt_transqtvc
