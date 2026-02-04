namespace Memory
structure addr where
  base : ℤ
  offset : ℤ
axiom inhabited_axiom_addr : Inhabited addr
attribute [instance] inhabited_axiom_addr
axiom addr_le : addr -> addr -> Prop
axiom addr_lt : addr -> addr -> Prop
axiom addr_le_bool : addr -> addr -> Bool
axiom addr_lt_bool : addr -> addr -> Bool
axiom addr_le_def (p : addr) (q : addr) (fact0 : addr.base p = addr.base q) : addr_le p q = (addr.offset p ≤ addr.offset q)
axiom addr_lt_def (p : addr) (q : addr) (fact0 : addr.base p = addr.base q) : addr_lt p q = (addr.offset p < addr.offset q)
axiom addr_le_bool_def (p : addr) (q : addr) : addr_le p q = (addr_le_bool p q = true)
axiom addr_lt_bool_def (p : addr) (q : addr) : addr_lt p q = (addr_lt_bool p q = true)
noncomputable def shift (p : addr) (k : ℤ) := addr.mk (addr.base p) (addr.offset p + k)
noncomputable def shift_sint16 (p : addr) (k : ℤ) := shift p ((2 : ℤ) * k)
noncomputable def shift_sint32 (p : addr) (k : ℤ) := shift p ((4 : ℤ) * k)
noncomputable def shift_sint64 (p : addr) (k : ℤ) := shift p ((8 : ℤ) * k)
noncomputable def shift_uint16 (p : addr) (k : ℤ) := shift p ((2 : ℤ) * k)
noncomputable def shift_uint32 (p : addr) (k : ℤ) := shift p ((4 : ℤ) * k)
noncomputable def shift_uint64 (p : addr) (k : ℤ) := shift p ((8 : ℤ) * k)
noncomputable def shift_ptr (p : addr) (k : ℤ) := shift p ((8 : ℤ) * k)
noncomputable def included (p : addr) (a : ℤ) (q : addr) (b : ℤ) := (0 : ℤ) < a → (0 : ℤ) ≤ b ∧ addr.base p = addr.base q ∧ addr.offset q ≤ addr.offset p ∧ addr.offset p + a ≤ addr.offset q + b
noncomputable def separated (p : addr) (a : ℤ) (q : addr) (b : ℤ) := a ≤ (0 : ℤ) ∨ b ≤ (0 : ℤ) ∨ ¬addr.base p = addr.base q ∨ addr.offset q + b ≤ addr.offset p ∨ addr.offset p + a ≤ addr.offset q
noncomputable def eqmem {α : Type} [Inhabited α] (m1 : addr -> α) (m2 : addr -> α) (p : addr) (a : ℤ) := ∀(q : addr), included q (1 : ℤ) p a → m1 q = m2 q
axiom havoc :  {α : Type} -> [Inhabited α] -> (addr -> α) -> (addr -> α) -> addr -> ℤ -> addr -> α
noncomputable def valid_rw (m : ℤ -> ℤ) (p : addr) (n : ℤ) := (0 : ℤ) < n → (0 : ℤ) < addr.base p ∧ (0 : ℤ) ≤ addr.offset p ∧ addr.offset p + n ≤ m (addr.base p)
noncomputable def valid_rd (m : ℤ -> ℤ) (p : addr) (n : ℤ) := (0 : ℤ) < n → ¬(0 : ℤ) = addr.base p ∧ (0 : ℤ) ≤ addr.offset p ∧ addr.offset p + n ≤ m (addr.base p)
noncomputable def invalid (m : ℤ -> ℤ) (p : addr) (n : ℤ) := (0 : ℤ) < n → m (addr.base p) ≤ addr.offset p ∨ addr.offset p + n ≤ (0 : ℤ)
axiom valid_rw_rd (m : ℤ -> ℤ) (p : addr) (n : ℤ) (fact0 : valid_rw m p n) : valid_rd m p n
axiom valid_string (p : addr) (m : ℤ -> ℤ) (fact0 : addr.base p < (0 : ℤ)) (fact1 : (0 : ℤ) ≤ addr.offset p) (fact2 : addr.offset p < m (addr.base p)) : valid_rd m p (1 : ℤ) ∧ ¬valid_rw m p (1 : ℤ)
axiom separated_1 (p : addr) (a : ℤ) (q : addr) (b : ℤ) (i : ℤ) (j : ℤ) (fact0 : separated p a q b) (fact1 : addr.offset p ≤ i) (fact2 : i < addr.offset p + a) (fact3 : addr.offset q ≤ j) (fact4 : j < addr.offset q + b) : ¬addr.mk (addr.base p) i = addr.mk (addr.base q) j
axiom region : ℤ -> ℤ
axiom linked : (ℤ -> ℤ) -> Prop
axiom sconst : (addr -> ℤ) -> Prop
noncomputable def framed (m : addr -> addr) := ∀(p : addr), region (addr.base (m p)) ≤ (0 : ℤ)
axiom separated_included (a : ℤ) (b : ℤ) (p : addr) (q : addr) (fact0 : (0 : ℤ) < a) (fact1 : (0 : ℤ) < b) (fact2 : separated p a q b) : ¬included p a q b
axiom included_trans (p : addr) (a : ℤ) (q : addr) (b : ℤ) (r : addr) (c : ℤ) (fact0 : included p a q b) (fact1 : included q b r c) : included p a r c
axiom separated_trans (p : addr) (a : ℤ) (q : addr) (b : ℤ) (r : addr) (c : ℤ) (fact0 : included p a q b) (fact1 : separated q b r c) : separated p a r c
axiom separated_sym (p : addr) (a : ℤ) (q : addr) (b : ℤ) : separated p a q b = separated q b p a
axiom eqmem_included {α : Type} [Inhabited α] (p : addr) (a : ℤ) (q : addr) (b : ℤ) (m1 : addr -> α) (m2 : addr -> α) (fact0 : included p a q b) (fact1 : eqmem m1 m2 q b) : eqmem m1 m2 p a
axiom eqmem_sym {α : Type} [Inhabited α] (m1 : addr -> α) (m2 : addr -> α) (p : addr) (a : ℤ) (fact0 : eqmem m1 m2 p a) : eqmem m2 m1 p a
axiom havoc_access {α : Type} [Inhabited α] (m0 : addr -> α) (m1 : addr -> α) (p : addr) (a : ℤ) (q : addr) : havoc m0 m1 p a q = (if separated q (1 : ℤ) p a then m1 q else m0 q)
axiom int_of_addr : addr -> ℤ
axiom addr_of_int : ℤ -> addr
axiom base_offset : ℤ -> ℤ
axiom base_index : ℤ -> ℤ
axiom int_of_addr_bijection (a : ℤ) : int_of_addr (addr_of_int a) = a
axiom addr_of_int_bijection (p : addr) : addr_of_int (int_of_addr p) = p
axiom addr_of_null : int_of_addr (addr.mk (0 : ℤ) (0 : ℤ)) = (0 : ℤ)
axiom base_offset_zero : base_offset (0 : ℤ) = (0 : ℤ)
axiom base_offset_inj (i : ℤ) : base_index (base_offset i) = i
axiom base_offset_monotonic (i : ℤ) (j : ℤ) (fact0 : i < j) : base_offset i < base_offset j
end Memory
namespace Compound
end Compound
namespace A_OccArray
axiom l_occ_a : (Memory.addr -> ℤ) -> ℤ -> Memory.addr -> ℤ -> ℤ -> ℤ
axiom Q_end_occ_a (to_0 : ℤ) (from_0 : ℤ) (mchar_0 : Memory.addr -> ℤ) (e : ℤ) (t : Memory.addr) (fact0 : to_0 ≤ from_0) : l_occ_a mchar_0 e t from_0 to_0 = (0 : ℤ)
axiom Q_iter_occ_a_true (to_0 : ℤ) (mchar_0 : Memory.addr -> ℤ) (t : Memory.addr) (e : ℤ) (from_0 : ℤ) : mchar_0 (Memory.shift t (to_0 - (1 : ℤ))) = e → from_0 < to_0 → (1 : ℤ) + l_occ_a mchar_0 e t from_0 (to_0 - (1 : ℤ)) = l_occ_a mchar_0 e t from_0 to_0
axiom Q_iter_occ_a_false (to_0 : ℤ) (mchar_0 : Memory.addr -> ℤ) (t : Memory.addr) (e : ℤ) (from_0 : ℤ) : ¬mchar_0 (Memory.shift t (to_0 - (1 : ℤ))) = e → from_0 < to_0 → l_occ_a mchar_0 e t from_0 (to_0 - (1 : ℤ)) = l_occ_a mchar_0 e t from_0 to_0
end A_OccArray
namespace Axiomatic13
noncomputable def p_valid_memb (malloc_0 : ℤ -> ℤ) (mptr_0 : Memory.addr -> Memory.addr) (mint_0 : Memory.addr -> ℤ) (m : Memory.addr) := let x : ℤ := mint_0 (Memory.shift m (0 : ℤ)); let x_1 : ℤ := mint_0 (Memory.shift m (1 : ℤ)); let x_2 : ℤ := x_1 * x; let a : Memory.addr := mptr_0 (Memory.shift m (2 : ℤ)); let a_1 : Memory.addr := mptr_0 (Memory.shift m (3 : ℤ)); let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); (0 : ℤ) < x ∧ x_2 ≤ (2147483647 : ℤ) ∧ Memory.valid_rw malloc_0 m (4 : ℤ) ∧ Memory.valid_rw malloc_0 a (1 : ℤ) ∧ Memory.valid_rw malloc_0 a_1 (1 : ℤ) ∧ Memory.valid_rw malloc_0 a_2 x_1 ∧ Memory.valid_rw malloc_0 a_3 x_2 ∧ Memory.separated a_2 x_1 a_3 x_2
noncomputable def p__memb_full (mptr_0 : Memory.addr -> Memory.addr) (mchar_0 : Memory.addr -> ℤ) (mint_0 : Memory.addr -> ℤ) (m : Memory.addr) := ∀(i : ℤ), (0 : ℤ) ≤ i → i < mint_0 (Memory.shift m (1 : ℤ)) → ¬mchar_0 (Memory.shift (mptr_0 (Memory.shift m (2 : ℤ))) i) = (0 : ℤ)
noncomputable def l__memb_index (mptr_0 : Memory.addr -> Memory.addr) (mint_0 : Memory.addr -> ℤ) (m : Memory.addr) (ptr_0 : Memory.addr) := Int.tdiv (Memory.addr.offset ptr_0 - Memory.addr.offset (mptr_0 (Memory.shift m (3 : ℤ)))) (mint_0 (Memory.shift m (0 : ℤ)))
noncomputable def l__memb_ptr (mptr_0 : Memory.addr -> Memory.addr) (mint_0 : Memory.addr -> ℤ) (m : Memory.addr) (index_0 : ℤ) := Memory.shift (mptr_0 (Memory.shift m (3 : ℤ))) (index_0 * mint_0 (Memory.shift m (0 : ℤ)))
noncomputable def p__memb_has (mptr_0 : Memory.addr -> Memory.addr) (mint_0 : Memory.addr -> ℤ) (m : Memory.addr) (ptr_0 : Memory.addr) := ∃(i : ℤ), l__memb_ptr mptr_0 mint_0 m i = ptr_0 ∧ (0 : ℤ) ≤ i ∧ i < mint_0 (Memory.shift m (1 : ℤ))
noncomputable def p__memb_allocated (mptr_0 : Memory.addr -> Memory.addr) (mchar_0 : Memory.addr -> ℤ) (mint_0 : Memory.addr -> ℤ) (m : Memory.addr) (ptr_0 : Memory.addr) := ¬mchar_0 (Memory.shift (mptr_0 (Memory.shift m (2 : ℤ))) (l__memb_index mptr_0 mint_0 m ptr_0)) = (0 : ℤ) ∧ p__memb_has mptr_0 mint_0 m ptr_0
noncomputable def l__memb_numfree (mptr_0 : Memory.addr -> Memory.addr) (mchar_0 : Memory.addr -> ℤ) (mint_0 : Memory.addr -> ℤ) (m : Memory.addr) := A_OccArray.l_occ_a mchar_0 (0 : ℤ) (mptr_0 (Memory.shift m (2 : ℤ))) (0 : ℤ) (mint_0 (Memory.shift m (1 : ℤ)))
noncomputable def p__memb_empty (mptr_0 : Memory.addr -> Memory.addr) (mchar_0 : Memory.addr -> ℤ) (mint_0 : Memory.addr -> ℤ) (m : Memory.addr) := ∀(i : ℤ), (0 : ℤ) ≤ i → i < mint_0 (Memory.shift m (1 : ℤ)) → mchar_0 (Memory.shift (mptr_0 (Memory.shift m (2 : ℤ))) i) = (0 : ℤ)
axiom Q_mult_simplification (b : ℤ) (a : ℤ) (fact0 : (0 : ℤ) < b) (fact1 : (0 : ℤ) ≤ a) : Int.tdiv (a * b) b = a
end Axiomatic13
