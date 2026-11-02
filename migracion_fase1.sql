-- Fase 1 (ya aplicada en Supabase "caipi" el 2026-11-02)
create table clientes (
  id uuid primary key default gen_random_uuid(),
  telefono text unique, usuario_wa text, nombre text, dni text, tipo_envio text,
  departamento text, distrito text, agencia text, direccion text, referencia text,
  datos_en timestamptz, creado_en timestamptz not null default now()
);
create table productos (
  id uuid primary key default gen_random_uuid(),
  nombre text not null unique, precio_venta numeric not null default 105,
  variantes jsonb not null default '[]'::jsonb, creado_en timestamptz not null default now()
);
create table pedidos (
  id uuid primary key default gen_random_uuid(),
  cliente_id uuid references clientes(id), usuario_wa text,
  estado text not null default 'por_comprar', pagado boolean not null default false,
  courier_codigo text, empacado_en timestamptz, despachado_en timestamptz,
  creado_en timestamptz not null default now()
);
create table items (
  id uuid primary key default gen_random_uuid(),
  pedido_id uuid not null references pedidos(id) on delete cascade,
  producto text not null, variante text, cantidad int not null default 1,
  precio_venta numeric not null default 105, canal text not null default 'WhatsApp',
  en_mano boolean, creado_en timestamptz not null default now()
);
create index items_pedido_idx on items(pedido_id);
alter table clientes disable row level security;
alter table productos disable row level security;
alter table pedidos disable row level security;
alter table items disable row level security;
