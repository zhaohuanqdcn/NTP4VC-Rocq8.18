import Why3.Base
import Why3.int.Sum
import pearl.verifythis_2016_matrix_multiplication.lib.lean.matrices.MyMatrix
import pearl.verifythis_2016_matrix_multiplication.lib.lean.matrices.MatrixArithmetic
import pearl.verifythis_2016_matrix_multiplication.lib.lean.sum_extended.Sum_extended
open Classical
open Lean4Why3
namespace matrices_ring_simp_Symb_m_collapse_okqtvc
structure mono where
  m_prod : List ℤ
  m_pos : Bool
axiom inhabited_axiom_mono : Inhabited mono
attribute [instance] inhabited_axiom_mono
noncomputable def l_mdl : (ℤ -> MyMatrix.mat ℤ) -> List ℤ -> MyMatrix.mat ℤ
  | f, ([] : List ℤ) => MyMatrix.create (-(1 : ℤ)) (-(1 : ℤ)) MatrixArithmetic.zerof
  | f, (List.cons x ([] : List ℤ)) => f x
  | f, (List.cons x q) => MatrixArithmetic.mul (f x) (l_mdl f q)
noncomputable def l_vld : (ℤ -> MyMatrix.mat ℤ) -> ℤ -> ℤ -> List ℤ -> Prop
  | f, r, c, ([] : List ℤ) => False
  | f, r, c, (List.cons x ([] : List ℤ)) => MyMatrix.rows (f x) = r ∧ MyMatrix.cols (f x) = c
  | f, r, c, (List.cons x q) => MyMatrix.rows (f x) = r ∧ l_vld f (MyMatrix.cols (f x)) c q
noncomputable def m_mdl (f : ℤ -> MyMatrix.mat ℤ) (m : mono) := let m0 : MyMatrix.mat ℤ := l_mdl f (mono.m_prod m); if mono.m_pos m = true then m0 else MatrixArithmetic.opp m0
noncomputable def lm_mdl : (ℤ -> MyMatrix.mat ℤ) -> ℤ -> ℤ -> List mono -> MyMatrix.mat ℤ
  | f, r, c, ([] : List mono) => MyMatrix.create r c MatrixArithmetic.zerof
  | f, r, c, (List.cons x q) => MatrixArithmetic.add (lm_mdl f r c q) (m_mdl f x)
noncomputable def lm_mdl_simp : (ℤ -> MyMatrix.mat ℤ) -> ℤ -> ℤ -> List mono -> MyMatrix.mat ℤ
  | f, r, c, ([] : List mono) => MyMatrix.create r c MatrixArithmetic.zerof
  | f, r, c, (List.cons x ([] : List mono)) => m_mdl f x
  | f, r, c, (List.cons x q) => MatrixArithmetic.add (lm_mdl_simp f r c q) (m_mdl f x)
noncomputable def lm_vld : (ℤ -> MyMatrix.mat ℤ) -> ℤ -> ℤ -> List mono -> Prop
  | f, r, c, ([] : List mono) => True
  | f, r, c, (List.cons x q) => l_vld f r c (mono.m_prod x) ∧ lm_vld f r c q
noncomputable def l_compare : List ℤ -> List ℤ -> ℤ
  | ([] : List ℤ), ([] : List ℤ) => (0 : ℤ)
  | ([] : List ℤ), x => -(1 : ℤ)
  | x, ([] : List ℤ) => (1 : ℤ)
  | (List.cons x q), (List.cons y r) => if x < y then -(1 : ℤ) else if y < x then (1 : ℤ) else l_compare q r
noncomputable def m_lower (m1 : mono) (m2 : mono) := let cmp : ℤ := l_compare (mono.m_prod m1) (mono.m_prod m2); cmp < (0 : ℤ) ∨ cmp = (0 : ℤ) ∧ (mono.m_pos m1 = true → mono.m_pos m2 = true)
noncomputable def m_collapse (l : List mono) (m : mono) := match l with | ([] : List mono) => List.cons m ([] : List mono) | List.cons x q => (if ¬mono.m_pos x = true ∧ mono.m_pos m = true ∧ l_compare (mono.m_prod m) (mono.m_prod x) = (0 : ℤ) then q else List.cons m l)
theorem m_collapse_ok'vc (f : ℤ -> MyMatrix.mat ℤ) (r : ℤ) (c : ℤ) (l : List mono) (m : mono) (fact0 : lm_vld f r c l) (fact1 : l_vld f r c (mono.m_prod m)) (fact2 : (0 : ℤ) ≤ r) (fact3 : (0 : ℤ) ≤ c) : let res : List mono := m_collapse l m; (match l with | ([] : List mono) => True | List.cons x q => (if ¬mono.m_pos x = true then if mono.m_pos m = true then true = (if l_compare (mono.m_prod m) (mono.m_prod x) = (0 : ℤ) then true else false) else true = false else true = false) → l_compare (mono.m_prod m) (mono.m_prod x) = (0 : ℤ)) ∧ ((match l with | ([] : List mono) => True | List.cons x q => (∃(o1 : Bool), (if ¬mono.m_pos x = true then if mono.m_pos m = true then o1 = (if l_compare (mono.m_prod m) (mono.m_prod x) = (0 : ℤ) then true else false) else o1 = false else o1 = false) ∧ (o1 = true → mono.m_prod m = mono.m_prod x))) → (res = m_collapse l m ∧ lm_vld f r c res) ∧ lm_mdl f r c res = MatrixArithmetic.add (lm_mdl f r c l) (m_mdl f m))
  := sorry
end matrices_ring_simp_Symb_m_collapse_okqtvc
