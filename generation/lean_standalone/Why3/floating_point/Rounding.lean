namespace Rounding
inductive mode where
  | NearestTiesToEven : mode
  | ToZero : mode
  | Up : mode
  | Down : mode
  | NearestTiesToAway : mode
axiom inhabited_axiom_mode : Inhabited mode
attribute [instance] inhabited_axiom_mode
end Rounding
