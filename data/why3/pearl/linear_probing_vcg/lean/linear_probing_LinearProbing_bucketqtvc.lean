import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.Const
open Classical
open Lean4Why3
namespace linear_probing_LinearProbing_bucketqtvc
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
theorem bucket'vc (n : ℤ) (k : key) (fact0 : (0 : ℤ) < n) : ¬n = (0 : ℤ) ∧ (let result : ℤ := Int.tmod (hash k) n; (0 : ℤ) ≤ result ∧ result < n)
  := sorry
end linear_probing_LinearProbing_bucketqtvc
