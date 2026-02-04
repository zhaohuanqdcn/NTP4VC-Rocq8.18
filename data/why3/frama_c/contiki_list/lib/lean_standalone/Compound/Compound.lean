namespace S1_list
structure s1_list where
  f1_list_next : Memory.addr
  f1_list_x : ℝ
  f1_list_y : ℝ
  f1_list_z : ℝ
axiom inhabited_axiom_s1_list : Inhabited s1_list
attribute [instance] inhabited_axiom_s1_list
noncomputable def eqs1_list (s : s1_list) (s_1 : s1_list) := s1_list.f1_list_next s_1 = s1_list.f1_list_next s ∧ s1_list.f1_list_x s_1 = s1_list.f1_list_x s ∧ s1_list.f1_list_y s_1 = s1_list.f1_list_y s ∧ s1_list.f1_list_z s_1 = s1_list.f1_list_z s
end S1_list
namespace Compound
noncomputable def load_s1_list (p : Memory.addr) (mflt_0 : Memory.addr -> ℝ) (mptr_0 : Memory.addr -> Memory.addr) := S1_list.s1_list.mk (mptr_0 (Memory.shift p (0 : ℤ))) (mflt_0 (Memory.shift p (1 : ℤ))) (mflt_0 (Memory.shift p (2 : ℤ))) (mflt_0 (Memory.shift p (3 : ℤ)))
axiom Q_Load_S1_list_update_Mflt (p : Memory.addr) (q : Memory.addr) (mflt_0 : Memory.addr -> ℝ) (v : ℝ) (mptr_0 : Memory.addr -> Memory.addr) (fact0 : Memory.separated p (4 : ℤ) q (1 : ℤ)) : load_s1_list p (Function.update mflt_0 q v) mptr_0 = load_s1_list p mflt_0 mptr_0
axiom Q_Load_S1_list_eqmem_Mflt (p : Memory.addr) (q : Memory.addr) (k : ℤ) (mflt_0 : Memory.addr -> ℝ) (mflt_1 : Memory.addr -> ℝ) (mptr_0 : Memory.addr -> Memory.addr) (fact0 : Memory.included p (4 : ℤ) q k) (fact1 : Memory.eqmem mflt_0 mflt_1 q k) : load_s1_list p mflt_1 mptr_0 = load_s1_list p mflt_0 mptr_0
axiom Q_Load_S1_list_havoc_Mflt (mflt_2 : Memory.addr -> ℝ) (mflt_0 : Memory.addr -> ℝ) (q : Memory.addr) (k : ℤ) (mflt_1 : Memory.addr -> ℝ) (p : Memory.addr) (mptr_0 : Memory.addr -> Memory.addr) (fact0 : Memory.havoc mflt_2 mflt_0 q k = mflt_1) (fact1 : Memory.separated p (4 : ℤ) q k) : load_s1_list p mflt_1 mptr_0 = load_s1_list p mflt_0 mptr_0
axiom Q_Load_S1_list_update_Mptr (p : Memory.addr) (q : Memory.addr) (mflt_0 : Memory.addr -> ℝ) (mptr_0 : Memory.addr -> Memory.addr) (v : Memory.addr) (fact0 : Memory.separated p (4 : ℤ) q (1 : ℤ)) : load_s1_list p mflt_0 (Function.update mptr_0 q v) = load_s1_list p mflt_0 mptr_0
axiom Q_Load_S1_list_eqmem_Mptr (p : Memory.addr) (q : Memory.addr) (k : ℤ) (mptr_0 : Memory.addr -> Memory.addr) (mptr_1 : Memory.addr -> Memory.addr) (mflt_0 : Memory.addr -> ℝ) (fact0 : Memory.included p (4 : ℤ) q k) (fact1 : Memory.eqmem mptr_0 mptr_1 q k) : load_s1_list p mflt_0 mptr_1 = load_s1_list p mflt_0 mptr_0
axiom Q_Load_S1_list_havoc_Mptr (mptr_2 : Memory.addr -> Memory.addr) (mptr_0 : Memory.addr -> Memory.addr) (q : Memory.addr) (k : ℤ) (mptr_1 : Memory.addr -> Memory.addr) (p : Memory.addr) (mflt_0 : Memory.addr -> ℝ) (fact0 : Memory.havoc mptr_2 mptr_0 q k = mptr_1) (fact1 : Memory.separated p (4 : ℤ) q k) : load_s1_list p mflt_0 mptr_1 = load_s1_list p mflt_0 mptr_0
end Compound
