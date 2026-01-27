import Why3.Base
import Why3.map.MapInjection
open Classical
open Lean4Why3
namespace InvertingAnInjection
noncomputable def injective (a : List ℤ) (n : ℤ) := MapInjection.injective (getElem! a ∘ Int.toNat) n
noncomputable def surjective (a : List ℤ) (n : ℤ) := MapInjection.surjective (getElem! a ∘ Int.toNat) n
noncomputable def range (a : List ℤ) (n : ℤ) := MapInjection.range (getElem! a ∘ Int.toNat) n
end InvertingAnInjection
