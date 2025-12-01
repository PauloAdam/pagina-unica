# Sistema de Paletes NLE - Versão sincronizada (Supabase)

Este repositório contém uma versão do seu sistema de paletes que sincroniza os dados entre todos os dispositivos
usando o Supabase (Postgres + API automática + Realtime).

## Arquivos
- `index.html` - aplicação web completa (frontend), pronta para deploy como *Static Site* (Render, Netlify, Vercel, etc).
- `create_table.sql` - comando SQL para criar a tabela `pallets` no Supabase.
- `README.md` - este arquivo.

## Passo a passo de instalação

### 1) Criar projeto no Supabase
- Acesse https://app.supabase.com e crie um novo projeto.
- Abra **Settings → API → Project URL** e **Settings → API Keys → anon public**.
- Copie a `Project URL` e a `anon public key`.

### 2) Criar tabela
- Vá para **SQL Editor** no Supabase e cole o conteúdo de `create_table.sql`.
- Execute para criar a tabela `pallets`.

### 3) Configurar CORS / RLS (se necessário)
- A chave `anon` usada no frontend precisa ter permissão de leitura/escrita na tabela.
- Se você estiver usando Row Level Security (RLS), desative ou crie políticas adequadas para permitir acesso público:
  - Vá em `Authentication → Policies` ou `Database → Policies` e permita `select/insert/update/delete` para `anon` (apenas para teste).
- Para produção, implemente autenticação e políticas RLS apropriadas.

### 4) Atualizar `index.html`
- No topo do arquivo `index.html` você verá as constantes:
```js
const SUPABASE_URL = "https://your-project.supabase.co";
const SUPABASE_ANON = "YOUR_ANON_PUBLIC_KEY";
```
- Substitua pelos valores do seu projeto.

### 5) Subir no GitHub e publicar
- Suba os arquivos no repositório GitHub (raiz).
- Crie um *Static Site* no Render (ou Netlify/Vercel) apontando para esse repositório.
- Publish directory: `.` (raiz)
- Build command: deixe vazio

### 6) Uso
- Ao acessar o site, ele carregará os pallets do Supabase.
- Ao criar/editar/excluir, os dados são salvos no Supabase e sincronizados automaticamente entre clientes via Realtime.

## Observações importantes
- **Não** insira a `service_role` key no frontend. Use somente a `anon public` key.
- Para ambientes de produção, recomendamos adicionar autenticação e políticas RLS para proteger os dados.
- Se quiser que eu também gere o deploy no seu GitHub ou configure RLS/Policies, posso guiar você.

Boa sorte! 🚀
