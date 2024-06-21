# Configurando o Linux Ubuntu para desenvolvimento
*(lembre de sempre olhar a documentação oficial de cada ferramenta caso algo dê errado)*

  ```bash
  sudo apt update 
  ```
## Instalando o Git
  
  ```zsh
  sudo apt install git
  ```

---

  
## Instalando temas (Flat-Remix)

1. Criando uma pasta para guardar os repositorios do git que usaremos nas configurações do linux
   
 ```zsh
  mkdir apt_git
  cd apt_git
  ```

2. Clonando o repositorio de icons do flat-remix
   
  ```zsh
  git clone https://github.com/daniruiz/flat-remix
  ```

3. Clonando o repositorio de temas do flat-remix
   
  ```zsh
  git clone https://github.com/daniruiz/flat-remix-gtk
  ```

4. Criando os diretorios onde ficaram armazenados os icones e temas clonados anteriormente
   
  ```zsh
  mkdir -p ~/.icons && mkdir -p ~/.themes
  ```

5. Movendo os temas e icones para as pastas criadas

   
  ```zsh
  cp -r flat-remix/Flat-Remix* ~/.icons/ && cp -r flat-remix-gtk/themes/Flat-Remix* ~/.themes/ && cp -r flat-remix-gtk/themes-old/Flat-Remix-GTK*
  ```

---



## Instalando Gnome-Tweak


```zsh
sudo apt install gnome-tweaks
```
---


## Instalando itens essenciais para desenvolvimento no geral

```zsh
sudo apt install build-essential defaut-jdk libssl-dev exuberant-ctags n-curses-term ack-grep silversearcher-ag fontconfig imagemgick libmagickwand-dev software-properties-common git vim-gtk3 curl
```

---

## Instalando ASDF

ASDF é uma ferramenta que gerencia versões universal

 
```zsh
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
```

**Para bash e Git temos**

Adciona 2 linhas seguintes ao arquivo ~/.bashrc
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"

Teste com 
```zsh
asdf version
```

Agora é so instalar os plugins do asdf para cada linguagem, basta pesquisar e seguir o passo a passo da documentação de cada plugin

Por exemplo o Ruby:
1. pesquisei "ruby plugin asdf"
2. encontrei esse link [asdf-ruby](https://github.com/asdf-vm/asdf-ruby)
   
```zsh
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
```

3. Show all installable versions
```zsh
asdf list-all ruby
```

4. Install specific version
```zsh
asdf install ruby latest
```

5. Set a version globally (on your ~/.tool-versions file)
```zsh
asdf global ruby latest
```

6. Now kotlin commands are available
```zsh
ruby -help
```

*Faça isso com as linguagens que tem atualização frequentes ou que você trabalhe com varias versões dela em diferentes projetos. Eu instalo ruby / nodejs / golang / erlang / elixir / kotlin / rust / crystal*

---

## Instalar banco de dados

```zsh
sudo apt -y postgresql-10 postgresql-contrib postgresql-server-dev-10 redis-server libhiredis-dev memcached libmemcached-dev
```

## Instalar MongoDB

1. A partir de um terminal, instale gnupg e curl, se ainda não estiverem disponíveis:

```zsh
sudo apt-get install gnupg curl
```

2. Para importar a chave GPG pública do MongoDB, execute o seguinte comando:

```zsh
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor
```

```zsh
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
```

3. Recarregar o banco de dados do pacote local
```zsh
sudo apt-get update
```

4. Para instalar a versão estável mais recente, emita o seguinte

```zsh
sudo apt-get install -y mongodb-org
```

5. Inicie o MongoDB

```zsh
sudo systemctl start mongod

```

6. Verifique se o MongoDB foi iniciado com sucesso

```zsh
sudo systemctl status mongod
```

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> WARNING: Nunca esponha servidores na INTERNET sem pelo menos um firewall

## Instalar Docker

1. Instale alguns pacotes pré-requisitos que permitem ao apt usar pacotes sobre HTTPS

```zsh
sudo apt install apt-transport-https ca-certificates curl software-properties-common
```

2. Adicione a chave GPG para o repositório oficial do Docker ao seu sistema
```zsh
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

3. Adicione o repositório do Docker às fontes do APT
```zsh
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
```

4.Certifique-se de que está prestes a instalar a partir do repositório do Docker em vez do repositório padrão do Ubuntu
```zsh
apt-cache policy docker-ce
```

5. Por fim, instale o Docker
```zsh
sudo apt install docker-ce
```

O Docker deve estar instalado agora, o daemon iniciado e o processo habilitado para iniciar automaticamente no boot. Verifique se está em execução

```zsh
sudo systemctl status docker
```

*Rodar docker sem o comando 'sudo'*
```zsh
sudo usermod -aG docker $USER
```

**Reinicar o pc**

Teste:
```zsh
docker run hello-world
```

* Para ver as imagens instaladas
```zsh
docker images
```

---

## Instalar Tmux

```zsh
sudo apt install tmux
```

---

## Install Zsh

```zsh
apt install zsh
```

**Colocar asdf no ~/.zshrc, basta adcionar a linha:**
. "$HOME/.asdf/asdf.sh"

---

## Install Tilix

```zsh
sudo add-apt-repository ppa:webupd8team/terminix
```

```zsh
sudo apt-get update
```

```zsh
sudo apt install tilix
```

---

## Instalando Oh My Shell

```zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
