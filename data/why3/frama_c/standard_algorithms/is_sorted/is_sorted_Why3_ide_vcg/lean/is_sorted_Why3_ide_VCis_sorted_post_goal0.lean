import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.is_sorted.lib.lean.Compound.Compound
import frama_c.standard_algorithms.is_sorted.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace is_sorted_Why3_ide_VCis_sorted_post_goal0
theorem goal0 (i_2 : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) (p : Bool) (t_1 : Memory.addr -> ℤ) : let x : ℤ := (1 : ℤ) + i_2; let a_1 : Memory.addr := Memory.shift a i_2; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_2 → Cint.is_sint32 i_1 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → (if (0 : ℤ) < i then p = false ∧ Axiomatic.p_weaklysorted_1' t_1 a (0 : ℤ) x ∧ (if (2 : ℤ) + i_2 ≤ i then i_1 = (0 : ℤ) ∧ t_1 (Memory.shift a x) < t_1 a_1 ∧ i_2 ≤ (4294967294 : ℤ) ∧ Memory.valid_rd t a_1 (1 : ℤ) ∧ Memory.valid_rd t (Memory.shift a (Cint.to_uint32 x)) (1 : ℤ) else i_1 = (1 : ℤ)) else i_1 = (1 : ℤ)) → Axiomatic.p_sorted_1' t_1 a (0 : ℤ) i = (¬i_1 = (0 : ℤ))
  := sorry
end is_sorted_Why3_ide_VCis_sorted_post_goal0
