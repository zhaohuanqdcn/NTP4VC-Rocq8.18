import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.x509_parser.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace parse_rdn_val_dc_Why3_ide_VCparse_rdn_val_dc_assert_rte_mem_access_2_part1_goal1
theorem goal1 (i : ℤ) (i_1 : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (fact0 : ¬i = (0 : ℤ)) (fact1 : ¬i = (3 : ℤ)) (fact2 : ¬i_1 = (0 : ℤ)) (fact3 : ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a) (fact4 : (0 : ℤ) ≤ i) (fact5 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact6 : -(2147483646 : ℤ) ≤ i) (fact7 : -(2147483645 : ℤ) ≤ i) (fact8 : (2 : ℤ) ≤ i) (fact9 : (3 : ℤ) ≤ i) (fact10 : i ≤ (65 : ℤ)) (fact11 : i ≤ (65537 : ℤ)) (fact12 : i ≤ (65538 : ℤ)) (fact13 : Memory.linked t) (fact14 : Cint.is_uint16 i) (fact15 : Cint.is_sint32 i_1) (fact16 : Cint.is_uint16 (i - (3 : ℤ))) (fact17 : Cint.is_uint16 (i - (2 : ℤ))) (fact18 : Memory.valid_rd t (Memory.shift a (2 : ℤ)) (1 : ℤ)) (fact19 : (0 : ℤ) < i → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) : Memory.valid_rd t (Memory.shift a ((3 : ℤ) + Cint.to_sint32 (i - (4 : ℤ)))) (1 : ℤ)
  := sorry
end parse_rdn_val_dc_Why3_ide_VCparse_rdn_val_dc_assert_rte_mem_access_2_part1_goal1
