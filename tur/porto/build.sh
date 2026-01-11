TERMUX_PKG_HOMEPAGE=https://github.com/Felipe605/porto
TERMUX_PKG_DESCRIPTION="Linguagem de programação totalmente em português para Termux"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="Felipe605 <mistall900@gmail.com>"
TERMUX_PKG_VERSION=2.0.0
TERMUX_PKG_SRCURL=https://github.com/Felipe605/porto/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=SKIP
TERMUX_PKG_DEPENDS="clang"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_PLATFORM_INDEPENDENT=false

termux_step_pre_configure() {
    # Porto não precisa de configuração especial
    :
}

termux_step_make() {
    cd src
    $CXX porto.cpp -o porto -std=c++11 -O2
}

termux_step_make_install() {
    # Instala interpretador
    install -Dm755 src/porto $TERMUX_PREFIX/bin/porto
    
    # Cria porto-pkg se não existir
    if [ -f "$TERMUX_PREFIX/bin/porto-pkg" ]; then
        install -Dm755 $TERMUX_PREFIX/bin/porto-pkg $TERMUX_PREFIX/bin/porto-pkg
    fi
    
    # Instala syntax highlighting
    if [ -f "porto.nanorc" ]; then
        install -Dm644 porto.nanorc $TERMUX_PREFIX/share/nano/porto.nanorc
    fi
    
    # Instala exemplos
    if [ -d "exemplos" ]; then
        mkdir -p $TERMUX_PREFIX/share/porto/exemplos
        cp -r exemplos/* $TERMUX_PREFIX/share/porto/exemplos/
    fi
    
    # Instala pacotes oficiais
    if [ -d "pt_pacotes" ]; then
        mkdir -p $TERMUX_PREFIX/share/porto/pt_pacotes
        cp -r pt_pacotes/* $TERMUX_PREFIX/share/porto/pt_pacotes/
    fi
}
