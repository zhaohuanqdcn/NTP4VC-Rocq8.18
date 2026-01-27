import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace check_ia5_string_Why3_ide_VCcheck_ia5_string_assert_rte_mem_access_goal1
theorem goal1 (a : Memory.addr) (i_1 : ℤ) (i : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let a_1 : Memory.addr := Memory.shift a i_1; ¬i = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a → (0 : ℤ) ≤ i → i_1 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint8 (t_1 a_1) → ((0 : ℤ) < i → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 < i_1 → t_1 (Memory.shift a i_2) ≤ (127 : ℤ)) → Memory.valid_rd t a_1 (1 : ℤ)
  := sorry
end check_ia5_string_Why3_ide_VCcheck_ia5_string_assert_rte_mem_access_goal1
