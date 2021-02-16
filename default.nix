{ mkDerivation, aeson, attoparsec, base, bytestring, containers
, free, hashable, HUnit, insert-ordered-containers, lib
, neat-interpolation, old-locale, semigroups, tasty, tasty-hunit
, text, thyme, unordered-containers
}:
mkDerivation {
  pname = "orgmode-parse";
  version = "0.3.0";
  src = ./.;
  libraryHaskellDepends = [
    aeson attoparsec base bytestring containers free hashable
    insert-ordered-containers old-locale semigroups text thyme
    unordered-containers
  ];
  testHaskellDepends = [
    aeson attoparsec base bytestring containers free hashable HUnit
    insert-ordered-containers neat-interpolation old-locale semigroups
    tasty tasty-hunit text thyme unordered-containers
  ];
  description = "A collection of Attoparsec combinators for parsing org-mode flavored documents";
  license = lib.licenses.bsd3;
}
