import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace LemmaFunction1
axiom fact : ℤ -> ℤ
axiom fact0 : fact (0 : ℤ) = (1 : ℤ)
axiom factn (n : ℤ) (fact0 : (0 : ℤ) < n) : fact n = n * fact (n - (1 : ℤ))
end LemmaFunction1
