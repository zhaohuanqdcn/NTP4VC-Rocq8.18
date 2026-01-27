import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.x509_parser.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace parse_rdn_val_dc_Why3_ide_VCparse_rdn_val_dc_assert_rte_mem_access_3_part2_goal4
theorem goal4 (i_1 : ℤ) (i : ℤ) (i_2 : ℤ) (i_3 : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := (4 : ℤ) + i_1; let x_1 : ℤ := i - (4 : ℤ); ¬i = (0 : ℤ) → ¬i = (3 : ℤ) → ¬i_2 = (0 : ℤ) → ¬i_3 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → -(2147483646 : ℤ) ≤ i → -(2147483645 : ℤ) ≤ i → -(2147483644 : ℤ) ≤ i → (2 : ℤ) ≤ i → (3 : ℤ) ≤ i → (4 : ℤ) ≤ i → i ≤ (65 : ℤ) → i ≤ (65537 : ℤ) → i ≤ (65538 : ℤ) → i ≤ (65539 : ℤ) → x ≤ i → (5 : ℤ) + i_1 ≤ i → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_sint32 i_2 → Cint.is_sint32 i_3 → Cint.is_uint16 x_1 → Cint.is_uint16 (i - (3 : ℤ)) → Cint.is_uint16 (i - (2 : ℤ)) → Memory.valid_rd t (Memory.shift a (2 : ℤ)) (1 : ℤ) → Memory.valid_rd t (Memory.shift a ((3 : ℤ) + Cint.to_sint32 x_1)) (1 : ℤ) → ((0 : ℤ) < i → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) → Memory.valid_rd t (Memory.shift a x) (1 : ℤ)
  := sorry
end parse_rdn_val_dc_Why3_ide_VCparse_rdn_val_dc_assert_rte_mem_access_3_part2_goal4
