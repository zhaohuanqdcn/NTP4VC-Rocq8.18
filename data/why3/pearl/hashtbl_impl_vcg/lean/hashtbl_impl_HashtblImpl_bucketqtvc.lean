import Why3.Base
import Why3.map.Const
open Classical
open Lean4Why3
namespace hashtbl_impl_HashtblImpl_bucketqtvc
axiom key : Type
axiom inhabited_axiom_key : Inhabited key
attribute [instance] inhabited_axiom_key
axiom hash : key -> ℤ
axiom hash'spec (x : key) : (0 : ℤ) ≤ hash x
theorem bucket'vc (n : ℤ) (k : key) (fact0 : (0 : ℤ) < n) : let o1 : ℤ := hash k; (0 : ℤ) ≤ o1 → ¬n = (0 : ℤ) ∧ (let result : ℤ := Int.tmod o1 n; (0 : ℤ) ≤ result ∧ result < n)
  := sorry
end hashtbl_impl_HashtblImpl_bucketqtvc
