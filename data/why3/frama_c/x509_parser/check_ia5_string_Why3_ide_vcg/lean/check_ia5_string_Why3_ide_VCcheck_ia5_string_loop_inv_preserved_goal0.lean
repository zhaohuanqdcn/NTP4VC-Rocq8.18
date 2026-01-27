import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace check_ia5_string_Why3_ide_VCcheck_ia5_string_loop_inv_preserved_goal0
theorem goal0 (a : Memory.addr) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a i_1; let x : ℤ := t_1 a_1; ¬i = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a → (0 : ℤ) ≤ i → i_1 < i → i_2 ≤ i_1 → (0 : ℤ) ≤ i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → -(1 : ℤ) ≤ i_1 → i_1 ≤ (65534 : ℤ) → i_1 ≤ (2147483646 : ℤ) → x ≤ (127 : ℤ) → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 ((1 : ℤ) + i_1) → Cint.is_uint8 x → Memory.valid_rd t a_1 (1 : ℤ) → ((0 : ℤ) < i → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 < i_1 → t_1 (Memory.shift a i_3) ≤ (127 : ℤ)) → t_1 (Memory.shift a i_2) ≤ (127 : ℤ)
  := sorry
end check_ia5_string_Why3_ide_VCcheck_ia5_string_loop_inv_preserved_goal0
