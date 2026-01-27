import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
import Why3.int.NumOf
import pearl.bitcount_vcg.lean.bitcount.BitCounting32
import Why3.mach.bv.BVCheck32
open Classical
open Lean4Why3
namespace bitcount_AsciiCode_asciiqtvc
noncomputable def validAscii (b : BitVec 32) := Even (BitCounting32.count_logic b)
axiom fun_or :  {α : Type} -> [Inhabited α] -> (α -> Bool) -> (α -> Bool) -> α -> Bool
axiom fun_or'def {α : Type} [Inhabited α] (f : α -> Bool) (g : α -> Bool) (x : α) : (fun_or f g x = true) = (f x = true ∨ g x = true)
theorem ascii'vc (b : BitVec 32) (c : BitVec 32) (fact0 : ¬b[BitVec.toNat (w32_size_bv - (1 : BitVec 32))]! = true) (fact1 : BitVec.toUInt c = BitCounting32.count_logic b) : ((31 : BitVec 32) < w32_size_bv ∨ (31 : ℤ) < (32 : ℤ)) ∧ (let maskbit : BitVec 32 := c <<< BitVec.toNat (31 : BitVec 32); maskbit = c <<< (31 : ℕ) → (let code : BitVec 32 := b ||| maskbit; BitVec.eq_sub code b (BitVec.toNat (0 : BitVec 32)) (BitVec.toNat (w32_size_bv - (1 : BitVec 32))) ∧ validAscii code))
  := sorry
end bitcount_AsciiCode_asciiqtvc
