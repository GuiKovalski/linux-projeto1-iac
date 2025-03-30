#!/bin/bash

echo "Criando usuários do sistema..."

# Função para criar usuário
criar_usuario() {
  usuario=$1
  senha=$2
  comentario=$3
  # Verifica se o usuário já existe
  if id "$usuario" &>/dev/null; then
    echo "Usuário '$usuario' já existe. Pulando criação."
  else
    # Cria o usuário com a senha criptografada
    senha_criptografada=$(openssl passwd -6 "$senha")
    useradd "$usuario" -c "$comentario" -s /bin/bash -m -p "$senha_criptografada"
    # Força a expiração da senha, obrigando a troca no próximo login
    passwd "$usuario" -e
    echo "Usuário '$usuario' criado com sucesso."
  fi
}

# Senha padrão
senha_padrao="Senha123"

# Criação dos usuários
criar_usuario "guest10" "$senha_padrao" "Usuário Convidado"
criar_usuario "guest11" "$senha_padrao" "Usuário Convidado"
criar_usuario "guest12" "$senha_padrao" "Usuário Convidado"
criar_usuario "guest13" "$senha_padrao" "Usuário Convidado"

echo "Finalizado!!"

