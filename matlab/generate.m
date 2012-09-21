function generate()
    system = buildsystem();
    system.iterate();
    system.exportlatex('data.tex');
end