{
  pkgs,
  pkgs-unstable,
  ...
}: {
  fonts.packages =
    (with pkgs; [
      ])
    ++ (with pkgs-unstable; [
      (nerdfonts.override {fonts = ["GeistMono" "JetBrainsMono"];})
    ]);
}
