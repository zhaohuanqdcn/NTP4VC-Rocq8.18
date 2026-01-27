import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace find_curve_by_oid_Why3_ide_VCfind_curve_by_oid_post_part4_goal0
theorem goal0 (t_1 : ℤ -> Memory.addr) (i : ℤ) (t_2 : Memory.addr -> ℤ) (a : Memory.addr) (t_3 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let a_1 : Memory.addr := t_1 i; let a_2 : Memory.addr := Memory.shift a_1 (3 : ℤ); let x : ℤ := t_2 a_2; let a_3 : Memory.addr := Memory.shift a_1 (2 : ℤ); ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a → ¬a_1 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬x = (0 : ℤ) → (0 : ℤ) ≤ i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → (0 : ℤ) ≤ x → i ≤ (5 : ℤ) → i ≤ (6 : ℤ) → Memory.framed t_3 → Memory.linked t → Cint.is_uint8 i → Cint.is_uint8 x → Cint.is_uint16 x → Memory.valid_rd t a_3 (1 : ℤ) → Memory.valid_rd t a_2 (1 : ℤ) → Memory.valid_rd t (Memory.shift a (0 : ℤ)) x → Memory.valid_rd t (Memory.shift (t_3 a_3) (0 : ℤ)) x → (∃(i_1 : ℤ), a_1 = t_1 i_1 ∧ (0 : ℤ) ≤ i_1 ∧ i_1 ≤ (5 : ℤ))
  := sorry
end find_curve_by_oid_Why3_ide_VCfind_curve_by_oid_post_part4_goal0
