-- Fase 6 (ya aplicada en Supabase "caipi" el 2026-11-02)
create table llegadas (
  id uuid primary key default gen_random_uuid(),
  fecha date not null default current_date,
  producto text not null,
  variante text,
  cantidad int not null,
  creado_en timestamptz not null default now()
);
alter table llegadas disable row level security;
alter table items add column recibido int not null default 0;
