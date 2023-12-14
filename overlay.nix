final: prev: with prev.lib;
foldr composeExtensions (_: _: {}) [
  (import ./pkgs)
] final prev

