namespace Axiomatic
inductive p_linked_n : (ℤ -> ℤ) -> (Memory.addr -> Memory.addr) -> Memory.addr -> Memory.addr -> ℤ -> ℤ -> Memory.addr -> Prop where
 | Q_linked_n_bound (index_0 : ℤ) (malloc_0 : ℤ -> ℤ) (mptr_0 : Memory.addr -> Memory.addr) (bound_0 : Memory.addr) (array_0 : Memory.addr) : (0 : ℤ) ≤ index_0 → index_0 ≤ (2147483646 : ℤ) → p_linked_n malloc_0 mptr_0 bound_0 array_0 index_0 (0 : ℤ) bound_0
 | Q_linked_n_cons (index_0 : ℤ) (n : ℤ) (mptr_0 : Memory.addr -> Memory.addr) (array_0 : Memory.addr) (root_0 : Memory.addr) (malloc_0 : ℤ -> ℤ) (bound_0 : Memory.addr) : mptr_0 (Memory.shift array_0 index_0) = root_0 → (0 : ℤ) < n → (0 : ℤ) ≤ index_0 → (0 : ℤ) ≤ index_0 + n → index_0 + n ≤ (2147483646 : ℤ) → Memory.valid_rw malloc_0 root_0 (4 : ℤ) → p_linked_n malloc_0 mptr_0 (mptr_0 (Memory.shift root_0 (0 : ℤ))) array_0 ((1 : ℤ) + index_0) (n - (1 : ℤ)) bound_0 → p_linked_n malloc_0 mptr_0 root_0 array_0 index_0 n bound_0
end Axiomatic
