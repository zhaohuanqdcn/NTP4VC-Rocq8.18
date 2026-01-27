import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace nistonacci_Top_nist_ge_nqtvc
axiom nist : ℤ -> ℤ
axiom nist'def (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : if n < (2 : ℤ) then nist n = n else nist n = nist (n - (2 : ℤ)) + (2 : ℤ) * nist (n - (1 : ℤ))
theorem nist_ge_n'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : n ≤ nist n
  := sorry
end nistonacci_Top_nist_ge_nqtvc
