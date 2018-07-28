(import ./reflex-platform {}).project ({ pkgs, ... }: {
  packages = {
    test-jsaddle-issue = ./. ;
  };

  shells = {
    ghc = ["test-jsaddle-issue"];
    ghcjs = ["test-jsaddle-issue"];
  };

  useWarp = true;
})
