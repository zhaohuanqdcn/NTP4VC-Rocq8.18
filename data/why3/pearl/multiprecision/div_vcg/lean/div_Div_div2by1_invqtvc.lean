import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.Const
import Why3.map.MapEq
import Why3.mach.int.Unsigned
import Why3.mach.c.C
import pearl.multiprecision.lib.lean.types.Config
import pearl.multiprecision.lib.lean.types.Types
import pearl.multiprecision.lib.lean.types.Int32Eq
import pearl.multiprecision.lib.lean.types.UInt64Eq
import pearl.multiprecision.lib.lean.lemmas.Lemmas
import pearl.multiprecision.lib.lean.compare.Compare
import pearl.multiprecision.lib.lean.ptralias.Alias
import pearl.multiprecision.lib.lean.util.UtilOld
import pearl.multiprecision.lib.lean.add.AddOld
import pearl.multiprecision.lib.lean.sub.SubOld
import pearl.multiprecision.lib.lean.logical.LogicalUtil
import pearl.multiprecision.lib.lean.logical.LogicalOld
open Classical
open Lean4Why3
namespace div_Div_div2by1_invqtvc
noncomputable def reciprocal (v : BitVec 64) (d : BitVec 64) := BitVec.toUInt v = (((18446744073709551615 : ℤ) + (1 : ℤ)) * ((18446744073709551615 : ℤ) + (1 : ℤ)) - (1 : ℤ)) / BitVec.toUInt d - ((18446744073709551615 : ℤ) + (1 : ℤ))
theorem div2by1_inv'vc (d : BitVec 64) (uh : BitVec 64) (v : BitVec 64) (l : BitVec 64) (h : BitVec 64) (ul : BitVec 64) (fact0 : ((18446744073709551615 : ℤ) + (1 : ℤ)) / (2 : ℤ) ≤ BitVec.toUInt d) (fact1 : BitVec.toUInt uh < BitVec.toUInt d) (fact2 : reciprocal v d) (fact3 : BitVec.toUInt l + ((18446744073709551615 : ℤ) + (1 : ℤ)) * BitVec.toUInt h = BitVec.toUInt v * BitVec.toUInt uh) : (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (1 : ℤ) ∧ (∀(sl : BitVec 64) (c : BitVec 64), BitVec.toUInt sl + ((18446744073709551615 : ℤ) + (1 : ℤ)) * BitVec.toUInt c = BitVec.toUInt l + BitVec.toUInt ul + (0 : ℤ) ∧ (0 : ℤ) ≤ BitVec.toUInt c ∧ BitVec.toUInt c ≤ (1 : ℤ) → ((0 : ℤ) ≤ BitVec.toUInt c ∧ BitVec.toUInt c ≤ (1 : ℤ)) ∧ (∀(sh : BitVec 64) (c' : BitVec 64), BitVec.toUInt sh + ((18446744073709551615 : ℤ) + (1 : ℤ)) * BitVec.toUInt c' = BitVec.toUInt uh + BitVec.toUInt h + BitVec.toUInt c ∧ (0 : ℤ) ≤ BitVec.toUInt c' ∧ BitVec.toUInt c' ≤ (1 : ℤ) → (∀(o1 : BitVec 64), BitVec.toUInt o1 = (BitVec.toUInt sh + (1 : ℤ)) % ((18446744073709551615 : ℤ) + (1 : ℤ)) → (∀(p : BitVec 64), BitVec.toUInt p = BitVec.toUInt o1 * BitVec.toUInt d % ((18446744073709551615 : ℤ) + (1 : ℤ)) → (∀(o2 : BitVec 64), BitVec.toUInt o2 = (BitVec.toUInt ul - BitVec.toUInt p) % ((18446744073709551615 : ℤ) + (1 : ℤ)) → (if BitVec.toUInt sl < BitVec.toUInt o2 then ∀(o3 : BitVec 64), BitVec.toUInt o3 = (BitVec.toUInt o1 - (1 : ℤ)) % ((18446744073709551615 : ℤ) + (1 : ℤ)) → (∀(o4 : BitVec 64), BitVec.toUInt o4 = (BitVec.toUInt o2 + BitVec.toUInt d) % ((18446744073709551615 : ℤ) + (1 : ℤ)) → (if BitVec.toUInt d ≤ BitVec.toUInt o4 then uint'64_in_bounds (BitVec.toUInt o3 + (1 : ℤ)) ∧ (∀(o5 : BitVec 64), BitVec.toUInt o5 = BitVec.toUInt o3 + (1 : ℤ) → uint'64_in_bounds (BitVec.toUInt o4 - BitVec.toUInt d) ∧ (∀(o6 : BitVec 64), BitVec.toUInt o6 = BitVec.toUInt o4 - BitVec.toUInt d → BitVec.toUInt o5 * BitVec.toUInt d + BitVec.toUInt o6 = BitVec.toUInt ul + ((18446744073709551615 : ℤ) + (1 : ℤ)) * BitVec.toUInt uh ∧ (0 : ℤ) ≤ BitVec.toUInt o6 ∧ BitVec.toUInt o6 < BitVec.toUInt d)) else BitVec.toUInt o3 * BitVec.toUInt d + BitVec.toUInt o4 = BitVec.toUInt ul + ((18446744073709551615 : ℤ) + (1 : ℤ)) * BitVec.toUInt uh ∧ (0 : ℤ) ≤ BitVec.toUInt o4 ∧ BitVec.toUInt o4 < BitVec.toUInt d)) else if BitVec.toUInt d ≤ BitVec.toUInt o2 then uint'64_in_bounds (BitVec.toUInt o1 + (1 : ℤ)) ∧ (∀(o3 : BitVec 64), BitVec.toUInt o3 = BitVec.toUInt o1 + (1 : ℤ) → uint'64_in_bounds (BitVec.toUInt o2 - BitVec.toUInt d) ∧ (∀(o4 : BitVec 64), BitVec.toUInt o4 = BitVec.toUInt o2 - BitVec.toUInt d → BitVec.toUInt o3 * BitVec.toUInt d + BitVec.toUInt o4 = BitVec.toUInt ul + ((18446744073709551615 : ℤ) + (1 : ℤ)) * BitVec.toUInt uh ∧ (0 : ℤ) ≤ BitVec.toUInt o4 ∧ BitVec.toUInt o4 < BitVec.toUInt d)) else BitVec.toUInt o1 * BitVec.toUInt d + BitVec.toUInt o2 = BitVec.toUInt ul + ((18446744073709551615 : ℤ) + (1 : ℤ)) * BitVec.toUInt uh ∧ (0 : ℤ) ≤ BitVec.toUInt o2 ∧ BitVec.toUInt o2 < BitVec.toUInt d))))))
  := sorry
end div_Div_div2by1_invqtvc
