import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.NumOf
import Why3.map.Const
open Classical
open Lean4Why3
namespace linear_probing_LinearProbing_numof_updateqtvc
axiom key : Type
axiom inhabited_axiom_key : Inhabited key
attribute [instance] inhabited_axiom_key
axiom keym : Type
axiom inhabited_axiom_keym : Inhabited keym
attribute [instance] inhabited_axiom_keym
axiom keym1 : key -> keym
axiom eq : key -> key -> Prop
axiom eq'spec (x : key) (y : key) : eq x y = (keym1 x = keym1 y)
noncomputable def neq (x : key) (y : key) := ¬eq x y
axiom neq'spec (x : key) (y : key) : neq x y = (¬keym1 x = keym1 y)
axiom hash : key -> ℤ
axiom hash_nonneg (k : key) : (0 : ℤ) ≤ hash k
axiom hash_eq (x : key) (y : key) (fact0 : eq x y) : hash x = hash y
axiom dummy : key
axiom bucket : key -> ℤ -> ℤ
axiom bucket'def (n : ℤ) (k : key) (fact0 : (0 : ℤ) < n) : bucket k n = Int.tmod (hash k) n
axiom bucket'spec (n : ℤ) (k : key) (fact0 : (0 : ℤ) < n) : (0 : ℤ) ≤ bucket k n ∧ bucket k n < n
noncomputable def between (l : ℤ) (j : ℤ) (r : ℤ) := l ≤ j ∧ j < r ∨ r < l ∧ l ≤ j ∨ j < r ∧ r < l
axiom fc : List key -> ℤ -> Bool
axiom fc'def (a : List key) (i : ℤ) : (fc a i = true) = eq (a[Int.toNat i]!) dummy
noncomputable def numof (a : List key) (l : ℤ) (u : ℤ) := NumOf.numof (fc a) l u
theorem numof_update'vc (l : ℤ) (i : ℤ) (u : ℤ) (a1 : List key) (a2 : List key) (fact0 : (0 : ℤ) ≤ l) (fact1 : l ≤ i) (fact2 : i < u) (fact3 : u ≤ Int.ofNat (List.length a1)) (fact4 : List.length a1 = List.length a2) (fact5 : ∀(j : ℤ), l ≤ j ∧ j < u → ¬j = i → a1[Int.toNat j]! = a2[Int.toNat j]!) (fact6 : eq (a1[Int.toNat i]!) dummy) (fact7 : neq (a2[Int.toNat i]!) dummy) : numof a1 l u = (1 : ℤ) + numof a2 l u
  := sorry
end linear_probing_LinearProbing_numof_updateqtvc
