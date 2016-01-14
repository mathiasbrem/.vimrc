# Verifica se tem Git
command -v git >/dev/null 2>&1 || { echo >&2 "I require git but it's not installed.  Aborting."; exit 1; }

# Função para baixar
download() {
    if hash wget 2>/dev/null; then
        wget "$@"
    else
        curl -O "$@"
    fi
}

# Instala o Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Baixa o .vimrc
git clone https://github.com/verzola/.vimrc.git ~/git/vimrc

# Cria link simbólico do .vimrc
ln -s ~/git/vimrc/.vimrc ~/.vimrc

# Verificar se a pasta de temas existe, caso contrário cria a pasta para o passo seguinte
if [ ! -d ~/.vim/colors ];then
    mkdir -p ~/.vim/colors
fi

# Entra na pasta de temas
cd ~/.vim/colors

# Baixa o colorscheme itg_flat
download https://raw.githubusercontent.com/cdmedia/itg_flat_vim/master/colors/itg_flat.vim

# Instala os plugins
vim +PluginInstall +qall

# Limpa o console
clear
