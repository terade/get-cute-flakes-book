{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  # nativeBuildInputs is usually what you want -- tools you need to run
  nativeBuildInputs = with pkgs.buildPackages; [
    (pkgs.texlive.combine {
      inherit (pkgs.texlive)
        scheme-small
        dvisvgm
        wrapfig
        ulem
        hyperref
        capt-of
        ctex
        adjustbox
        babel-german
        background
        bidi
        collectbox
        csquotes
        everypage
        filehook
        footmisc
        footnotebackref
        framed
        fvextra
        letltxmacro
        ly1
        mdframed
        mweights
        needspace
        pagecolor
        sourcecodepro
        sourcesanspro
        titling
        ucharcat
        unicode-math
        upquote
        xecjk
        xurl
        zref
        ;
    })
    gnumake
    pandoc
    imagemagick
  ];
}
