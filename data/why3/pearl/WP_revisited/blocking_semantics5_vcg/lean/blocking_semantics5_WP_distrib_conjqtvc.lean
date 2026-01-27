import Why3.Base
import pearl.WP_revisited.lib.lean.blocking_semantics5.Syntax
import pearl.WP_revisited.lib.lean.blocking_semantics5.SemOp
import pearl.WP_revisited.lib.lean.blocking_semantics5.Typing
import pearl.WP_revisited.lib.lean.blocking_semantics5.TypingAndSemantics
import pearl.WP_revisited.lib.lean.blocking_semantics5.FreshVariables
open Classical
open Lean4Why3
namespace blocking_semantics5_WP_distrib_conjqtvc
axiom fresh_from : Syntax.fmla -> Syntax.ident
axiom fresh_from_fmla (f : Syntax.fmla) : FreshVariables.fresh_in_fmla (fresh_from f) f
axiom abstract_effects : Syntax.stmt -> Syntax.fmla -> Syntax.fmla
axiom abstract_effects_specialize (sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)) (s : Syntax.stmt) (f : Syntax.fmla) (fact0 : SemOp.eval_fmla sigma pi (abstract_effects s f)) : SemOp.eval_fmla sigma pi f
axiom abstract_effects_distrib_conj (sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)) (s : Syntax.stmt) (p : Syntax.fmla) (q : Syntax.fmla) (fact0 : SemOp.eval_fmla sigma pi (abstract_effects s p)) (fact1 : SemOp.eval_fmla sigma pi (abstract_effects s q)) : SemOp.eval_fmla sigma pi (abstract_effects s (Syntax.fmla.Fand p q))
axiom abstract_effects_monotonic (p : Syntax.fmla) (q : Syntax.fmla) (sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)) (s : Syntax.stmt) (fact0 : SemOp.valid_fmla (Syntax.fmla.Fimplies p q)) (fact1 : SemOp.eval_fmla sigma pi (abstract_effects s p)) : SemOp.eval_fmla sigma pi (abstract_effects s q)
noncomputable def wp : Syntax.stmt -> Syntax.fmla -> Syntax.fmla
  | Syntax.stmt.Sskip, q => q
  | (Syntax.stmt.Sassert f), q => Syntax.fmla.Fand f (Syntax.fmla.Fimplies f q)
  | (Syntax.stmt.Sseq s1 s2), q => wp s1 (wp s2 q)
  | (Syntax.stmt.Sassign x t), q => let id1 : Syntax.ident := fresh_from q; Syntax.fmla.Flet id1 t (FreshVariables.msubst q x id1)
  | (Syntax.stmt.Sif t s1 s2), q => Syntax.fmla.Fand (Syntax.fmla.Fimplies (Syntax.fmla.Fterm t) (wp s1 q)) (Syntax.fmla.Fimplies (Syntax.fmla.Fnot (Syntax.fmla.Fterm t)) (wp s2 q))
  | (Syntax.stmt.Swhile cond inv body), q => Syntax.fmla.Fand inv (abstract_effects body (Syntax.fmla.Fand (Syntax.fmla.Fimplies (Syntax.fmla.Fand (Syntax.fmla.Fterm cond) inv) (wp body inv)) (Syntax.fmla.Fimplies (Syntax.fmla.Fand (Syntax.fmla.Fnot (Syntax.fmla.Fterm cond)) inv) q)))
axiom abstract_effects_writes (body : Syntax.stmt) (cond : Syntax.term) (inv : Syntax.fmla) (q : Syntax.fmla) (sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)) : SemOp.eval_fmla sigma pi (abstract_effects body (Syntax.fmla.Fand (Syntax.fmla.Fimplies (Syntax.fmla.Fand (Syntax.fmla.Fterm cond) inv) (wp body inv)) (Syntax.fmla.Fimplies (Syntax.fmla.Fand (Syntax.fmla.Fnot (Syntax.fmla.Fterm cond)) inv) q))) → SemOp.eval_fmla sigma pi (wp body (abstract_effects body (Syntax.fmla.Fand (Syntax.fmla.Fimplies (Syntax.fmla.Fand (Syntax.fmla.Fterm cond) inv) (wp body inv)) (Syntax.fmla.Fimplies (Syntax.fmla.Fand (Syntax.fmla.Fnot (Syntax.fmla.Fterm cond)) inv) q))))
theorem distrib_conj'vc (sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)) (s : Syntax.stmt) (p : Syntax.fmla) (q : Syntax.fmla) (fact0 : SemOp.eval_fmla sigma pi (wp s p)) (fact1 : SemOp.eval_fmla sigma pi (wp s q)) : SemOp.eval_fmla sigma pi (wp s (Syntax.fmla.Fand p q))
  := sorry
end blocking_semantics5_WP_distrib_conjqtvc
