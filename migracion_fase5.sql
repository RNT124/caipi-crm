-- Fase 5 (ya aplicada en Supabase "caipi" el 2026-11-02)
create table gastos (
  id uuid primary key default gen_random_uuid(),
  fecha date not null default current_date,
  tipo text not null,
  monto numeric not null default 0,   -- S/
  nota text,
  creado_en timestamptz not null default now()
);
alter table gastos disable row level security;
