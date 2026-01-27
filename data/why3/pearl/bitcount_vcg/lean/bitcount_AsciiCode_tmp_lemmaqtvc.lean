import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
import Why3.int.NumOf
import pearl.bitcount_vcg.lean.bitcount.BitCounting32
import pearl.bitcount_vcg.lean.bitcount.Hamming
import Why3.mach.bv.BVCheck32
open Classical
open Lean4Why3
namespace bitcount_AsciiCode_tmp_lemmaqtvc
noncomputable def validAscii (b : BitVec 32) := Even (BitCounting32.count_logic b)
axiom fun_or :  {α : Type} -> [Inhabited α] -> (α -> Bool) -> (α -> Bool) -> α -> Bool
axiom fun_or'def {α : Type} [Inhabited α] (f : α -> Bool) (g : α -> Bool) (x : α) : (fun_or f g x = true) = (f x = true ∨ g x = true)
axiom nth_closure : BitVec 32 -> ℤ -> Bool
axiom nth_diff_closure : BitVec 32 -> BitVec 32 -> ℤ -> Bool
theorem tmp_lemma'vc (i : ℤ) (j : ℤ) (a : BitVec 32) (b : BitVec 32) (fact0 : i < j) : (Even (NumOf.numof (nth_closure a) i j) ∧ Odd (NumOf.numof (nth_closure b) i j) ∨ Odd (NumOf.numof (nth_closure a) i j) ∧ Even (NumOf.numof (nth_closure b) i j)) = Odd (NumOf.numof (nth_diff_closure a b) i j)
  := sorry
end bitcount_AsciiCode_tmp_lemmaqtvc
