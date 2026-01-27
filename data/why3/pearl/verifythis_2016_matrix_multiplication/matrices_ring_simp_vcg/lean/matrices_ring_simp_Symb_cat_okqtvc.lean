import Why3.Base
import Why3.int.Sum
import pearl.verifythis_2016_matrix_multiplication.lib.lean.matrices.MyMatrix
import pearl.verifythis_2016_matrix_multiplication.lib.lean.matrices.MatrixArithmetic
import pearl.verifythis_2016_matrix_multiplication.lib.lean.sum_extended.Sum_extended
open Classical
open Lean4Why3
namespace matrices_ring_simp_Symb_cat_okqtvc
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
noncomputable def lm_collapse : List mono -> List mono -> List mono
  | acc, ([] : List mono) => acc
  | acc, (List.cons x q) => lm_collapse (m_collapse acc x) q
noncomputable def cat_rev {α : Type} [Inhabited α] : List α -> List α -> List α
  | acc, ([] : List α) => acc
  | acc, (List.cons x q) => cat_rev (List.cons x acc) q
noncomputable def lm_dump : mono -> List mono -> List mono -> List mono × List mono
  | x, acc, ([] : List mono) => (acc, ([] : List mono))
  | x, acc, (List.cons y q) => if m_lower x y then (acc, List.cons y q) else lm_dump x (m_collapse acc y) q
noncomputable def lm_merge : List mono -> List mono -> List mono -> List mono
  | acc, ([] : List mono), l2 => cat_rev ([] : List mono) (lm_collapse acc l2)
  | acc, (List.cons x q), l2 => match lm_dump x acc l2 with | (acc1, l21) => lm_merge (m_collapse acc1 x) q l21
noncomputable def cat {α : Type} [Inhabited α] : List α -> List α -> List α
  | ([] : List α), l2 => l2
  | (List.cons x q), l2 => List.cons x (cat q l2)
theorem cat_ok'vc (r : ℤ) (k : ℤ) (c : ℤ) (f : ℤ -> MyMatrix.mat ℤ) (l1 : List ℤ) (l2 : List ℤ) (fact0 : (0 : ℤ) ≤ r) (fact1 : (0 : ℤ) ≤ k) (fact2 : (0 : ℤ) ≤ c) (fact3 : l_vld f r k l1) (fact4 : l_vld f k c l2) : (match l2 with | ([] : List ℤ) => (match l1 with | ([] : List ℤ) => False | List.cons x x1 => (match x1 with | ([] : List ℤ) => False | _ => False)) | _ => (match l1 with | ([] : List ℤ) => False | List.cons x x1 => (match x1 with | ([] : List ℤ) => True | _ => (let o1 : ℤ := MyMatrix.cols (f x); (match l1 with | ([] : List ℤ) => False | List.cons _ f1 => f1 = x1) ∧ ((0 : ℤ) ≤ o1 ∧ (0 : ℤ) ≤ k ∧ (0 : ℤ) ≤ c) ∧ l_vld f o1 k x1 ∧ l_vld f k c l2)))) ∧ (∀(result : List ℤ), (match l2 with | ([] : List ℤ) => (match l1 with | ([] : List ℤ) => False | List.cons x x1 => (match x1 with | ([] : List ℤ) => False | _ => False)) | _ => (match l1 with | ([] : List ℤ) => False | List.cons x x1 => (match x1 with | ([] : List ℤ) => result = List.cons x l2 | _ => (let o1 : List ℤ := cat x1 l2; (l_vld f (MyMatrix.cols (f x)) c o1 ∧ l_mdl f o1 = MatrixArithmetic.mul (l_mdl f x1) (l_mdl f l2)) ∧ result = List.cons x o1)))) → (result = cat l1 l2 ∧ l_vld f r c result) ∧ l_mdl f result = MatrixArithmetic.mul (l_mdl f l1) (l_mdl f l2))
  := sorry
end matrices_ring_simp_Symb_cat_okqtvc
