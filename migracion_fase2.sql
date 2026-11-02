-- Fase 2 (ya aplicada en Supabase "caipi" el 2026-11-02)
create table compras (
  id uuid primary key default gen_random_uuid(),
  fecha date not null default current_date,
  producto text not null,
  variante text,
  cantidad int not null,
  costo numeric not null default 0,   -- S/ por set
  creado_en timestamptz not null default now()
);
alter table compras disable row level security;
