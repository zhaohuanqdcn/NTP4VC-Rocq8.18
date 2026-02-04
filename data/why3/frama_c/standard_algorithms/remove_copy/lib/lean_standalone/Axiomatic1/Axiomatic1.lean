namespace Cint
noncomputable def is_bool (x : ℤ) := x = (0 : ℤ) ∨ x = (1 : ℤ)
noncomputable def is_uint8 (x : ℤ) := (0 : ℤ) ≤ x ∧ x < (256 : ℤ)
noncomputable def is_sint8 (x : ℤ) := -(128 : ℤ) ≤ x ∧ x < (128 : ℤ)
noncomputable def is_uint16 (x : ℤ) := (0 : ℤ) ≤ x ∧ x < (65536 : ℤ)
noncomputable def is_sint16 (x : ℤ) := -(32768 : ℤ) ≤ x ∧ x < (32768 : ℤ)
noncomputable def is_uint32 (x : ℤ) := (0 : ℤ) ≤ x ∧ x < (4294967296 : ℤ)
noncomputable def is_sint32 (x : ℤ) := -(2147483648 : ℤ) ≤ x ∧ x < (2147483648 : ℤ)
noncomputable def is_uint64 (x : ℤ) := (0 : ℤ) ≤ x ∧ x < (18446744073709551616 : ℤ)
noncomputable def is_sint64 (x : ℤ) := -(9223372036854775808 : ℤ) ≤ x ∧ x < (9223372036854775808 : ℤ)
axiom is_bool0 : is_bool (0 : ℤ)
axiom is_bool1 : is_bool (1 : ℤ)
noncomputable def to_bool (x : ℤ) := if x = (0 : ℤ) then (0 : ℤ) else (1 : ℤ)
axiom to_uint8 : ℤ -> ℤ
axiom to_sint8 : ℤ -> ℤ
axiom to_uint16 : ℤ -> ℤ
axiom to_sint16 : ℤ -> ℤ
axiom to_uint32 : ℤ -> ℤ
axiom to_sint32 : ℤ -> ℤ
axiom to_uint64 : ℤ -> ℤ
axiom to_sint64 : ℤ -> ℤ
axiom two_power_abs : ℤ -> ℤ
axiom two_power_abs_is_positive (n : ℤ) : (0 : ℤ) < two_power_abs n
axiom two_power_abs_plus_pos (n : ℤ) (m : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : (0 : ℤ) ≤ m) : two_power_abs (n + m) = two_power_abs n * two_power_abs m
axiom two_power_abs_plus_one (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : two_power_abs (n + (1 : ℤ)) = (2 : ℤ) * two_power_abs n
noncomputable def is_uint (n : ℤ) (x : ℤ) := (0 : ℤ) ≤ x ∧ x < two_power_abs n
noncomputable def is_sint (n : ℤ) (x : ℤ) := -two_power_abs n ≤ x ∧ x < two_power_abs n
axiom to_uint : ℤ -> ℤ -> ℤ
axiom to_sint : ℤ -> ℤ -> ℤ
axiom is_to_uint (n : ℤ) (x : ℤ) : is_uint n (to_uint n x)
axiom is_to_sint (n : ℤ) (x : ℤ) : is_sint n (to_sint n x)
axiom is_to_uint8 (x : ℤ) : is_uint8 (to_uint8 x)
axiom is_to_sint8 (x : ℤ) : is_sint8 (to_sint8 x)
axiom is_to_uint16 (x : ℤ) : is_uint16 (to_uint16 x)
axiom is_to_sint16 (x : ℤ) : is_sint16 (to_sint16 x)
axiom is_to_uint32 (x : ℤ) : is_uint32 (to_uint32 x)
axiom is_to_sint32 (x : ℤ) : is_sint32 (to_sint32 x)
axiom is_to_uint64 (x : ℤ) : is_uint64 (to_uint64 x)
axiom is_to_sint64 (x : ℤ) : is_sint64 (to_sint64 x)
axiom id_uint (n : ℤ) (x : ℤ) : is_uint n x = (to_uint n x = x)
axiom id_sint (n : ℤ) (x : ℤ) : is_sint n x = (to_sint n x = x)
axiom id_uint8 (x : ℤ) (fact0 : is_uint8 x) : to_uint8 x = x
axiom id_sint8 (x : ℤ) (fact0 : is_sint8 x) : to_sint8 x = x
axiom id_uint16 (x : ℤ) (fact0 : is_uint16 x) : to_uint16 x = x
axiom id_sint16 (x : ℤ) (fact0 : is_sint16 x) : to_sint16 x = x
axiom id_uint32 (x : ℤ) (fact0 : is_uint32 x) : to_uint32 x = x
axiom id_sint32 (x : ℤ) (fact0 : is_sint32 x) : to_sint32 x = x
axiom id_uint64 (x : ℤ) (fact0 : is_uint64 x) : to_uint64 x = x
axiom id_sint64 (x : ℤ) (fact0 : is_sint64 x) : to_sint64 x = x
axiom proj_uint (n : ℤ) (x : ℤ) : to_uint n (to_uint n x) = to_uint n x
axiom proj_sint (n : ℤ) (x : ℤ) : to_sint n (to_sint n x) = to_sint n x
axiom proj_uint8 (x : ℤ) : to_uint8 (to_uint8 x) = to_uint8 x
axiom proj_sint8 (x : ℤ) : to_sint8 (to_sint8 x) = to_sint8 x
axiom proj_uint16 (x : ℤ) : to_uint16 (to_uint16 x) = to_uint16 x
axiom proj_sint16 (x : ℤ) : to_sint16 (to_sint16 x) = to_sint16 x
axiom proj_uint32 (x : ℤ) : to_uint32 (to_uint32 x) = to_uint32 x
axiom proj_sint32 (x : ℤ) : to_sint32 (to_sint32 x) = to_sint32 x
axiom proj_uint64 (x : ℤ) : to_uint64 (to_uint64 x) = to_uint64 x
axiom proj_sint64 (x : ℤ) : to_sint64 (to_sint64 x) = to_sint64 x
axiom proj_su (n : ℤ) (x : ℤ) : to_sint n (to_uint n x) = to_uint n x
axiom incl_su (n : ℤ) (x : ℤ) (fact0 : is_uint n x) : is_sint n x
axiom proj_su_uint (n : ℤ) (m : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : (0 : ℤ) ≤ m) : to_sint (m + n) (to_uint n x) = to_uint n x
axiom proj_su_sint (n : ℤ) (m : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : (0 : ℤ) ≤ m) : to_sint n (to_uint (m + (n + (1 : ℤ))) x) = to_sint n x
axiom proj_int8 (x : ℤ) : to_sint8 (to_uint8 x) = to_sint8 x
axiom proj_int16 (x : ℤ) : to_sint16 (to_uint16 x) = to_sint16 x
axiom proj_int32 (x : ℤ) : to_sint32 (to_uint32 x) = to_sint32 x
axiom proj_int64 (x : ℤ) : to_sint64 (to_uint64 x) = to_sint64 x
axiom proj_us_uint (n : ℤ) (m : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : (0 : ℤ) ≤ m) : to_uint (n + (1 : ℤ)) (to_sint (m + n) x) = to_uint (n + (1 : ℤ)) x
axiom incl_uint (n : ℤ) (i : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : (0 : ℤ) ≤ i) (fact2 : is_uint n x) : is_uint (n + i) x
axiom incl_sint (n : ℤ) (i : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : (0 : ℤ) ≤ i) (fact2 : is_sint n x) : is_sint (n + i) x
axiom incl_int (n : ℤ) (i : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : (0 : ℤ) ≤ i) (fact2 : is_uint n x) : is_sint (n + i) x
end Cint
namespace Compound
end Compound
namespace Axiomatic
noncomputable def p_unchanged_1' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) := ∀(i : ℤ), let a_1 : Memory.addr := Memory.shift a i; m ≤ i → i < n → mint_1 a_1 = mint_0 a_1
noncomputable def p_hasvalue_1' (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (v : ℤ) := ∃(i : ℤ), mint_0 (Memory.shift a i) = v ∧ m ≤ i ∧ i < n
end Axiomatic
namespace A_Count
axiom l_count_1' : (Memory.addr -> ℤ) -> Memory.addr -> ℤ -> ℤ -> ℤ -> ℤ
axiom Q_CountSectionEmpty (n : ℤ) (m : ℤ) (v : ℤ) (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (fact0 : n ≤ m) (fact1 : Cint.is_sint32 v) : l_count_1' mint_0 a m n v = (0 : ℤ)
axiom Q_CountSectionHit (n : ℤ) (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (v : ℤ) (m : ℤ) : mint_0 (Memory.shift a (n - (1 : ℤ))) = v → m < n → Cint.is_sint32 v → (1 : ℤ) + l_count_1' mint_0 a m (n - (1 : ℤ)) v = l_count_1' mint_0 a m n v
axiom Q_CountSectionMiss (n : ℤ) (mint_0 : Memory.addr -> ℤ) (a : Memory.addr) (v : ℤ) (m : ℤ) : ¬mint_0 (Memory.shift a (n - (1 : ℤ))) = v → m < n → Cint.is_sint32 v → l_count_1' mint_0 a m (n - (1 : ℤ)) v = l_count_1' mint_0 a m n v
axiom Q_CountSectionRead (v : ℤ) (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (m : ℤ) (n : ℤ) (fact0 : Cint.is_sint32 v) (fact1 : Axiomatic.p_unchanged_1' mint_0 mint_1 a m n) : l_count_1' mint_1 a m n v = l_count_1' mint_0 a m n v
end A_Count
namespace Axiomatic1
noncomputable def p_multisetretainrest_1' (mint_0 : Memory.addr -> ℤ) (mint_1 : Memory.addr -> ℤ) (a : Memory.addr) (m1_0 : ℤ) (m2_0 : ℤ) (b : Memory.addr) (n1_0 : ℤ) (n2_0 : ℤ) (v : ℤ) := ∀(i : ℤ), ¬i = v → Cint.is_sint32 i → A_Count.l_count_1' mint_1 a m1_0 m2_0 i = A_Count.l_count_1' mint_0 b n1_0 n2_0 i
end Axiomatic1
