# MedClinic

CRM médico da clínica **Intimavie**, preparado para instalação e execução no ambiente interno da clínica.

## Stack

- **Backend:** Node.js, Express, TypeScript, Prisma ORM e JWT.
- **Banco:** MySQL 8+ com migrations Prisma.
- **Frontend:** React, Vite, TypeScript e CSS responsivo.
- **Perfis:** Administrador, Médico e Secretária.

## Requisitos

- Node.js 20+
- MySQL 8+
- npm 10+

## Instalação local

1. Crie o banco e o usuário no MySQL:

```sql
CREATE DATABASE medclinic CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'medclinic'@'localhost' IDENTIFIED BY 'medclinic';
GRANT ALL PRIVILEGES ON medclinic.* TO 'medclinic'@'localhost';
FLUSH PRIVILEGES;
```

2. Configure `server/.env` (já existe um modelo local):

```env
DATABASE_URL="mysql://medclinic:medclinic@localhost:3306/medclinic"
JWT_SECRET="troque-esta-chave-em-producao"
PORT=3333
CORS_ORIGIN="http://localhost:5173"
```

3. Instale e prepare o backend:

```bash
cd server
npm install
npx prisma generate
npx prisma migrate deploy
npm run prisma:seed
```

4. Instale o frontend:

```bash
cd ../client
npm install
```


> Se o projeto já estava instalado antes de uma alteração no `schema.prisma`, execute `cd server && npm run prisma:generate` ou reinstale as dependências para regenerar o cliente Prisma.

5. Inicie em dois terminais:

```bash
# terminal 1
cd server && npm run dev

# terminal 2
cd client && npm run dev
```

Acesse `http://localhost:5173`.

## Acesso inicial

- **Login:** `theomar_rego@hotmail.com`
- **Senha:** `123456`
- **Perfil:** Administrador

Troque a senha após o primeiro acesso em uma evolução de segurança ou diretamente no cadastro de usuários.

## Funcionalidades do primeiro módulo

O Administrador possui CRUD completo para:

- Usuários: nome completo, login, senha e perfil.
- Clínica: razão social, nome fantasia, CNPJ, CNAE e endereço.
- Médicos: nome completo, CRM, RQE e especialidade.
- Convênios: nome, ANS, valor e ativo.
- Procedimentos: nome, valor e ativo.
- Atendimentos: nome, valor, convênio relacionado e ativo; disponível para o perfil Administrador.
- Agendamentos: grade diária de 08:00 a 20:00 em intervalos de 30 minutos; gestão por Administrador/Secretária e consulta diária pelo Médico.
- Pacientes: dados importados da planilha, prontuário, contatos, nascimento, convênio e observações clínicas; disponível para todos os perfis autenticados.

As rotas da API exigem token JWT, e as rotas administrativas exigem perfil `ADMINISTRADOR`.

## Comandos úteis

```bash
cd server
npm run prisma:migrate
npm run prisma:seed
npm run build
```

Para atualizar o schema em desenvolvimento, use `npx prisma migrate dev --name nome_da_mudanca` e versione a migration gerada.

## Estrutura

```text
medclinic/
├── client/                 # React/Vite
├── server/
│   ├── prisma/schema.prisma
│   ├── prisma/migrations/  # histórico SQL do MySQL
│   └── src/index.ts        # API Express
└── README.md
```

> Para produção, utilize HTTPS/rede interna protegida, troque o `JWT_SECRET`, altere a senha inicial e faça backups regulares do MySQL.
