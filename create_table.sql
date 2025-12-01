-- SQL para criar tabela 'pallets' no Supabase (Postgres)
-- Cole isto em SQL editor do Supabase (SQL Editor) e execute.

create table if not exists public.pallets (
  id bigserial primary key,
  number text not null,
  color text,
  products jsonb default '[]'::jsonb,
  updated_at timestamptz default now()
);

-- index opcional para busca por number
create index if not exists idx_pallets_number on public.pallets ((lower(number)));
