namespace Unsigned
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom max : ℤ
axiom to_int : t -> ℤ
noncomputable def in_bounds (n : ℤ) := (0 : ℤ) ≤ n ∧ n ≤ max
axiom to_int_in_bounds (n : t) : in_bounds (to_int n)
axiom extensionality (x : t) (y : t) (fact0 : to_int x = to_int y) : x = y
axiom zero_unsigned : t
axiom zero_unsigned_is_zero : to_int zero_unsigned = (0 : ℤ)
axiom radix : ℤ
axiom radix_def : radix = max + (1 : ℤ)
end Unsigned
namespace C
noncomputable def in_us_bounds (n : ℤ) := (0 : ℤ) ≤ n ∧ n ≤ (4294967295 : ℤ)
noncomputable def in_bounds (n : ℤ) := -(2147483648 : ℤ) ≤ n ∧ n ≤ (2147483647 : ℤ)
axiom zone : Type
axiom inhabited_axiom_zone : Inhabited zone
attribute [instance] inhabited_axiom_zone
axiom null_zone : zone
axiom ptr : Type -> Type
axiom inhabited_axiom_ptr {α : Type} [Inhabited α] : Inhabited (ptr α)
attribute [instance] inhabited_axiom_ptr
axiom data :  {α : Type} -> [Inhabited α] -> ptr α -> List α
axiom offset :  {α : Type} -> [Inhabited α] -> ptr α -> ℤ
axiom min :  {α : Type} -> [Inhabited α] -> ptr α -> ℤ
axiom max :  {α : Type} -> [Inhabited α] -> ptr α -> ℤ
axiom writable :  {α : Type} -> [Inhabited α] -> ptr α -> Bool
axiom zone1 :  {α : Type} -> [Inhabited α] -> ptr α -> zone
noncomputable def plength {α : Type} [Inhabited α] (p : ptr α) := Int.ofNat (List.length (data p))
noncomputable def pelts {α : Type} [Inhabited α] (p : ptr α) := getElem! (data p) ∘ Int.toNat
axiom is_not_null :  {α : Type} -> [Inhabited α] -> ptr α -> Prop
axiom is_not_null'spec {α : Type} [Inhabited α] (p : ptr α) : is_not_null p = (¬zone1 p = null_zone)
noncomputable def valid_ptr_shift {α : Type} [Inhabited α] (p : ptr α) (i : ℤ) := min p ≤ offset p + i ∧ offset p + i < max p
noncomputable def valid {α : Type} [Inhabited α] (p : ptr α) (sz : ℤ) := in_bounds sz ∧ (0 : ℤ) ≤ sz ∧ ((0 : ℤ) ≤ min p ∧ min p ≤ offset p) ∧ offset p + sz ≤ max p ∧ max p ≤ plength p
axiom valid_itv_to_shift {α : Type} [Inhabited α] (p : ptr α) (sz : ℤ) (i : ℤ) (fact0 : valid p sz) (fact1 : (0 : ℤ) ≤ i) (fact2 : i < sz) : valid_ptr_shift p i
end C
namespace Config
end Config
namespace Types
axiom limb : Type
axiom inhabited_axiom_limb : Inhabited limb
attribute [instance] inhabited_axiom_limb
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
end Types
namespace Int32Eq
end Int32Eq
namespace UInt64Eq
end UInt64Eq
namespace Lemmas
noncomputable def map_eq_sub_shift {α : Type} [Inhabited α] (x : ℤ -> α) (y : ℤ -> α) (xi : ℤ) (yi : ℤ) (sz : ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < sz → x (xi + i) = y (yi + i)
axiom value_sub : (ℤ -> BitVec 64) -> ℤ -> ℤ -> ℤ
axiom value_sub'def (n : ℤ) (m : ℤ) (x : ℤ -> BitVec 64) : if n < m then value_sub x n m = BitVec.toUInt (x n) + ((18446744073709551615 : ℤ) + (1 : ℤ)) * value_sub x (n + (1 : ℤ)) m else value_sub x n m = (0 : ℤ)
noncomputable def value (x : C.ptr (BitVec 64)) (sz : ℤ) := value_sub (C.pelts x) (C.offset x) (C.offset x + sz)
end Lemmas
namespace Z
axiom mpz_ptr : Type
axiom inhabited_axiom_mpz_ptr : Inhabited mpz_ptr
attribute [instance] inhabited_axiom_mpz_ptr
axiom mpz_eq : mpz_ptr -> mpz_ptr -> Prop
axiom mpz_eq'spec (x : mpz_ptr) (y : mpz_ptr) : mpz_eq x y = (x = y)
axiom mpz_memo : Type
axiom inhabited_axiom_mpz_memo : Inhabited mpz_memo
attribute [instance] inhabited_axiom_mpz_memo
axiom abs_value_of : mpz_memo -> mpz_ptr -> ℤ
axiom alloc : mpz_memo -> mpz_ptr -> ℤ
axiom abs_size : mpz_memo -> mpz_ptr -> ℤ
axiom sgn : mpz_memo -> mpz_ptr -> ℤ
axiom readers : mpz_memo -> mpz_ptr -> ℤ
axiom zones : mpz_memo -> mpz_ptr -> C.zone
axiom mpz_memo'invariant (self : mpz_memo) (p : mpz_ptr) : (0 : ℤ) ≤ alloc self p ∧ (sgn self p = (1 : ℤ) ∨ sgn self p = -(1 : ℤ)) ∧ abs_size self p ≤ alloc self p ∧ (0 : ℤ) ≤ abs_size self p ∧ abs_size self p ≤ (2147483647 : ℤ) ∧ (0 : ℤ) ≤ abs_value_of self p ∧ ((1 : ℤ) ≤ abs_size self p → HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (abs_size self p - (1 : ℤ))) ≤ abs_value_of self p) ∧ abs_value_of self p < HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (abs_size self p))
noncomputable def value_of (x : mpz_ptr) (memo : mpz_memo) := sgn memo x * abs_value_of memo x
noncomputable def sgn_value (p : C.ptr (BitVec 64)) (sz : BitVec 32) := if (0 : ℤ) ≤ BitVec.toInt sz then Lemmas.value p (BitVec.toInt sz) else -Lemmas.value p (-BitVec.toInt sz)
noncomputable def mpz_unchanged (x : mpz_ptr) (memo1 : mpz_memo) (memo2 : mpz_memo) := readers memo1 x = readers memo2 x ∧ (-(2 : ℤ) < readers memo1 x → abs_value_of memo1 x = abs_value_of memo2 x ∧ alloc memo1 x = alloc memo2 x ∧ abs_size memo1 x = abs_size memo2 x ∧ sgn memo1 x = sgn memo2 x ∧ zones memo1 x = zones memo2 x)
structure mpz_struct where
  addr : mpz_ptr
axiom inhabited_axiom_mpz_struct : Inhabited mpz_struct
attribute [instance] inhabited_axiom_mpz_struct
end Z
