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

## Receitas e atestados digitais

O módulo emite receitas somente para medicamentos não controlados e atestados. No servidor, configure `PUBLIC_BASE_URL` com a origem HTTPS pública da aplicação, `CLINICAL_DOCUMENT_SIGNING_PROVIDER=VIDAAS`, o `VIDAAS_CHANNEL_ID` habilitado pela VALID e `VIDAAS_CALLBACK_URL` igual à URI cadastrada no Channel e terminada em `/api/vidaas/callback`. Opcionalmente, defina `VIDAAS_API_BASE_URL`; o padrão é `https://services.integraicp.com.br`. Sem uma seleção explícita, o sistema mantém o fluxo local P12 existente e passa a selecionar VIDaaS automaticamente quando `VIDAAS_CHANNEL_ID` está configurado.

```env
PUBLIC_BASE_URL="https://www.intimavie.com.br"
CLINICAL_DOCUMENT_SIGNING_PROVIDER="VIDAAS"
VIDAAS_CHANNEL_ID=""
VIDAAS_CALLBACK_URL="https://api.intimavie.com.br/api/vidaas/callback"
VIDAAS_API_BASE_URL="https://services.integraicp.com.br"
CERTIFICATE_ENCRYPTION_KEY="gere-uma-chave-aleatoria-separada-com-32-caracteres-ou-mais"
```

O backend requer `pdfsig` (fornecido pelo pacote `poppler-utils`) para verificar criptograficamente o PDF antes de concluir a emissão e durante a consulta pública do QR. Em produção, instale essa dependência no mesmo container/host do servidor. A página `/validar/:code` apresenta o status do documento e da integridade do PDF. A cadeia de certificação ICP-Brasil deve ser confirmada também no serviço oficial [VALIDAR do ITI](https://validar.iti.gov.br/); a resposta automática local não substitui essa validação oficial. A migration `20261108190000_vidaas_clinical_documents` deve ser aplicada com `cd server && npm run prisma:migrate` após configurar o backup e a janela de implantação.

No build de produção do cliente, configure `VITE_API_URL` com a URL HTTPS da API, por exemplo `https://api.intimavie.com.br/api`. Em produção, `JWT_SECRET` e `CERTIFICATE_ENCRYPTION_KEY` são obrigatórias, devem ter pelo menos 32 caracteres e precisam ser valores independentes. Se o backend estiver atrás de um proxy reverso confiável, configure `TRUST_PROXY_HOPS` com a quantidade exata de proxies para que a limitação das consultas públicas use o IP do visitante.

## Executar server e client simultaneamente

Na pasta raiz do projeto, execute:

```bash
npm run up
```

Esse comando instala as dependências do `server` e do `client`, executa o build dos dois projetos e inicia ambos em modo desenvolvimento.

Para encerrar os dois processos, pressione `Ctrl+C`.

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
