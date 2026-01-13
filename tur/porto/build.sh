TERMUX_PKG_HOMEPAGE=https://github.com/Felipe605/porto
TERMUX_PKG_DESCRIPTION="Linguagem de programação em português para Termux"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="Felipe605 <mistall900@gmail.com>"
TERMUX_PKG_VERSION=2.0.0
TERMUX_PKG_SRCURL=https://github.com/Felipe605/porto/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=SKIP
TERMUX_PKG_DEPENDS="clang"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
    cd src
    $CXX porto.cpp -o porto -std=c++11
}

termux_step_make_install() {
    install -Dm755 src/porto $TERMUX_PREFIX/bin/porto
    install -Dm755 $TERMUX_PREFIX/bin/porto-pkg $TERMUX_PREFIX/bin/porto-pkg
    
    # Instala syntax highlighting
    install -Dm644 porto.nanorc $TERMUX_PREFIX/share/nano/porto.nanorc
    
    # Instala exemplos
    mkdir -p $TERMUX_PREFIX/share/porto/exemplos
    cp -r exemplos/* $TERMUX_PREFIX/share/porto/exemplos/
    
    # Instala pacotes oficiais
    mkdir -p $TERMUX_PREFIX/share/porto/pt_pacotes
    cp -r pt_pacotes/* $TERMUX_PREFIX/share/porto/pt_pacotes/
}
