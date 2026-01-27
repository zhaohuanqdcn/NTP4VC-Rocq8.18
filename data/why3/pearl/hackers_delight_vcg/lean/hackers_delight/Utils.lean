import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace Utils
noncomputable def max (x : BitVec 32) (y : BitVec 32) := if x < y then y else x
noncomputable def min (x : BitVec 32) (y : BitVec 32) := if x < y then x else y
noncomputable def count (bv : BitVec 32) := let x : BitVec 32 := bv - ((bv >>> BitVec.toNat (1 : BitVec 32)) &&& (1431655765 : BitVec 32)); let x1 : BitVec 32 := (x &&& (858993459 : BitVec 32)) + ((x >>> BitVec.toNat (2 : BitVec 32)) &&& (858993459 : BitVec 32)); let x2 : BitVec 32 := x1 + (x1 >>> BitVec.toNat (4 : BitVec 32)) &&& (252645135 : BitVec 32); let x3 : BitVec 32 := x2 + (x2 >>> BitVec.toNat (8 : BitVec 32)); x3 + (x3 >>> BitVec.toNat (16 : BitVec 32)) &&& (63 : BitVec 32)
noncomputable def hammingD (a : BitVec 32) (b : BitVec 32) := count (a ^^^ b)
end Utils
