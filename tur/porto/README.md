# Porto

Porto é a primeira linguagem de programação totalmente em português criada para Termux.

## Características

- 🇧🇷 Sintaxe 100% em português
- 🚀 Simples e intuitiva para iniciantes
- 🎨 Syntax highlighting integrado
- 📦 Package manager próprio
- ⚡ Alto desempenho (C++)

## Instalação

```bash
pkg install tur-repo
pkg install porto
```

## Uso Básico

```bash
# Criar arquivo
nano ola.pt

# Executar
porto ola.pt
```

## Exemplo

```porto
# Olá Mundo
escreva "Olá, Mundo!"

# Variáveis
variavel nome = "Porto"
variavel versao = 2.0

# Condicional
se versao >= 2.0 entao
    escreva "Versão atual!"
fim

# Loop
variavel i = 1
enquanto i <= 5 faca
    escreva i
    variavel i = i + 1
fim
```

## Package Manager

```bash
porto-pkg listar
porto-pkg instalar matematica
```

## Documentação

- GitHub: https://github.com/Felipe605/porto
- Exemplos: /data/data/com.termux/files/usr/share/porto/exemplos/

## Autor

Felipe605 (Mista) - mistall900@gmail.com
