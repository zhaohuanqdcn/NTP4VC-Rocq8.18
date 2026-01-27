import Why3.Base
import pearl.koda_ruskey_vcg.lean.koda_ruskey.KodaRuskey_Spec
open Classical
open Lean4Why3
namespace koda_ruskey_Lemmas_sub_valid_coloring_f1qtvc
axiom stack : Type
axiom inhabited_axiom_stack : Inhabited stack
attribute [instance] inhabited_axiom_stack
noncomputable def mem_stack : ℤ -> List KodaRuskey_Spec.forest -> Prop
  | n, ([] : List KodaRuskey_Spec.forest) => False
  | n, (List.cons f tl) => KodaRuskey_Spec.mem_forest n f ∨ mem_stack n tl
noncomputable def size_stack : List KodaRuskey_Spec.forest -> ℤ
  | ([] : List KodaRuskey_Spec.forest) => (0 : ℤ)
  | (List.cons f st1) => KodaRuskey_Spec.size_forest f + size_stack st1
noncomputable def even_forest : KodaRuskey_Spec.forest -> Prop
  | KodaRuskey_Spec.forest.E => False
  | (KodaRuskey_Spec.forest.N x f1 f2) => ¬even_forest f1 ∨ even_forest f2
noncomputable def final_forest : KodaRuskey_Spec.forest -> (ℤ -> KodaRuskey_Spec.color) -> Prop
  | KodaRuskey_Spec.forest.E, c => True
  | (KodaRuskey_Spec.forest.N i f1 f2), c => c i = KodaRuskey_Spec.color.Black ∧ final_forest f1 c ∧ (if ¬even_forest f1 then KodaRuskey_Spec.white_forest f2 c else final_forest f2 c)
noncomputable def any_forest (f : KodaRuskey_Spec.forest) (c : ℤ -> KodaRuskey_Spec.color) := KodaRuskey_Spec.white_forest f c ∨ final_forest f c
noncomputable def unchanged (st : List KodaRuskey_Spec.forest) (c1 : ℤ -> KodaRuskey_Spec.color) (c2 : ℤ -> KodaRuskey_Spec.color) := ∀(i : ℤ), mem_stack i st → c1 i = c2 i
noncomputable def inverse : List KodaRuskey_Spec.forest -> (ℤ -> KodaRuskey_Spec.color) -> (ℤ -> KodaRuskey_Spec.color) -> Prop
  | ([] : List KodaRuskey_Spec.forest), c1, c2 => True
  | (List.cons f st'), c1, c2 => (KodaRuskey_Spec.white_forest f c1 ∧ final_forest f c2 ∨ final_forest f c1 ∧ KodaRuskey_Spec.white_forest f c2) ∧ (if even_forest f then unchanged st' c1 c2 else inverse st' c1 c2)
noncomputable def any_stack : List KodaRuskey_Spec.forest -> (ℤ -> KodaRuskey_Spec.color) -> Prop
  | ([] : List KodaRuskey_Spec.forest), c => True
  | (List.cons f st1), c => (KodaRuskey_Spec.white_forest f c ∨ final_forest f c) ∧ any_stack st1 c
inductive sub : List KodaRuskey_Spec.forest -> KodaRuskey_Spec.forest -> (ℤ -> KodaRuskey_Spec.color) -> Prop where
 | Sub_reflex (f : KodaRuskey_Spec.forest) (c : ℤ -> KodaRuskey_Spec.color) : sub (List.cons f ([] : List KodaRuskey_Spec.forest)) f c
 | Sub_brother (st : List KodaRuskey_Spec.forest) (f2 : KodaRuskey_Spec.forest) (c : ℤ -> KodaRuskey_Spec.color) (i : ℤ) (f1 : KodaRuskey_Spec.forest) : sub st f2 c → sub st (KodaRuskey_Spec.forest.N i f1 f2) c
 | Sub_append (st : List KodaRuskey_Spec.forest) (f1 : KodaRuskey_Spec.forest) (c : ℤ -> KodaRuskey_Spec.color) (i : ℤ) (f2 : KodaRuskey_Spec.forest) : sub st f1 c → c i = KodaRuskey_Spec.color.Black → sub (st ++ List.cons f2 ([] : List KodaRuskey_Spec.forest)) (KodaRuskey_Spec.forest.N i f1 f2) c
noncomputable def disjoint_stack (f : KodaRuskey_Spec.forest) (st : List KodaRuskey_Spec.forest) := ∀(i : ℤ), KodaRuskey_Spec.mem_forest i f → ¬mem_stack i st
theorem sub_valid_coloring_f1'vc (i : ℤ) (f1 : KodaRuskey_Spec.forest) (f2 : KodaRuskey_Spec.forest) (c : ℤ -> KodaRuskey_Spec.color) (i1 : ℤ) (fact0 : KodaRuskey_Spec.no_repeated_forest (KodaRuskey_Spec.forest.N i f1 f2)) (fact1 : KodaRuskey_Spec.valid_coloring (KodaRuskey_Spec.forest.N i f1 f2) c) (fact2 : c i = KodaRuskey_Spec.color.Black) (fact3 : KodaRuskey_Spec.mem_forest i1 f1) (fact4 : KodaRuskey_Spec.valid_coloring f1 (Function.update c i1 KodaRuskey_Spec.color.Black)) : KodaRuskey_Spec.valid_coloring (KodaRuskey_Spec.forest.N i f1 f2) (Function.update c i1 KodaRuskey_Spec.color.Black)
  := sorry
end koda_ruskey_Lemmas_sub_valid_coloring_f1qtvc
