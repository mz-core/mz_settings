# mz_settings

Resource client-side para configurações globais do mundo: IPLs, interiores nativos, NPC/dispatch, áudio, tráfego, pedestres, pickups, veículos bloqueados e placas. Ele inclui um **catálogo amplo de interiores nativos documentados e úteis para RP**, mas não pretende conter todos os interiores do GTA.

## Estrutura

```text
mz_settings/
├── assets/                       PNGs das placas (inalterados)
├── config/
│   ├── shared.lua                Config, debug e registro do catálogo
│   ├── ipl.lua                   Loader operacional e grupos legados
│   ├── ipl_cayo.lua              Lista ativa original da Cayo
│   ├── ipl_catalog/              Catálogo e settings.lua para ativações
│   ├── npc.lua                   Cops, dispatch e wanted
│   ├── sound.lua                 Rádio, cenas e zonas de áudio
│   ├── traffic.lua               Densidade e spawns de veículos
│   ├── peds.lua                  Densidade e budgets de população
│   ├── world.lua                 Regras gerais do mundo
│   ├── blocked_vehicles.lua      Limpeza de modelos bloqueados
│   ├── pickups.lua               Pickups removidos
│   └── plates.lua                Texturas de placa
├── client/                       Aplicadores por responsabilidade
├── server/main.lua               Log de inicialização
└── fxmanifest.lua                Ordem explícita de carregamento
```

As configs são `client_scripts`, pois o server não lê nenhuma tabela `Config.*`. `config/shared.lua` carrega primeiro; todos os catálogos carregam antes de `client/ipl.lua`; `client/main.lua` carrega antes dos clients que usam `MZSettings`.

## Configurações de gameplay

- NPC/dispatch: edite `Config.NPC` em `config/npc.lua`. `enabled = false` desliga o bloco inteiro.
- Tráfego: edite os multiplicadores `Config.Traffic` entre `0.0` e `1.0`. Eles precisam ser aplicados por frame.
- Pedestres: edite `Config.Peds.pedDensity`, `scenarioPedDensity` e os budgets. O preset de cidade vazia está documentado nos comentários de `traffic.lua` e `peds.lua`.
- Áudio: `Config.Sound` controla rádio, scanner, cenas, emitters e ambient zones. Nomes de áudio precisam ser confirmados no mapa/MLO antes de adicionar.
- Mundo: `Config.World` controla wanted, regeneração, cover, eventos, cenários e remoção de `Config.Pickups`.
- Veículos bloqueados: `Config.BlockedVehiclesCleanup` mantém a lista original e usa `mz_notify` somente quando esse resource estiver iniciado.

## Placas

`Config.Plates` define TXD, normal map e texturas. A configuração ativa original continua sendo:

```lua
{
  plate = 'plate01',
  texture = 'mz_settings_plate_01',
  image = 'placaRJ.png',
  enabled = true
}
```

`plate02` com `placa.png` existe como variante desativada. Não renomeie/remova um PNG sem atualizar a configuração correspondente.

## Tipos do catálogo

- `world`: local físico que já existe; não chama `RequestIpl`.
- `teleport`: interior nativo já disponível, normalmente abaixo do mapa; o catálogo fornece TP, mas não chama `RequestIpl`.
- `ipl`: requer os nomes de `load` confirmados.
- `ipl_entitysets`: carrega IPL e, quando configurados, aplica entity sets depois de validar o interior.
- `map_toggle`: representa estados alternativos do mapa.

Todas as entradas do catálogo começam com `enabled = false`. O catálogo só carrega entradas explicitamente habilitadas; entradas `managedBy` são espelhos informativos e nunca duplicam o grupo legado indicado.

## Grupos legados e catálogo

Para um grupo operacional existente:

```lua
Config.IPL.groups.ships.enabled = true
```

Para uma entrada independente do catálogo, edite somente
`config/ipl_catalog/settings.lua`:

```lua
Config.IPLCatalogSettings = {
  cargo_ship_base = {
    enabled = true,
    variant = 'normal'
  }
}
```

Use `enabled = false` para desligar. Depois de salvar, execute
`restart mz_settings`; `/mzsettings_reloadipl` não relê arquivos do disco.

Entradas como `fib_lobby` possuem `managedBy = 'Config.IPL.groups.story_interiors'` e são apenas informativas: altere o grupo legado indicado para mudar a carga atual.

Não copie um mesmo IPL para o grupo legado e para outra entrada ativa. O loader usa contagem de referências e não remove um IPL ainda requerido por outra entrada.

## Variantes

Somente uma variante é considerada. Em `settings.lua`, use:

```lua
cargo_ship_base = {
  enabled = true,
  variant = 'sunk'
}
```

Internamente, `variant` configura `activeVariant`. Nunca escolha vários DJs, estilos, portas abertas/fechadas ou estados normal/destruído simultaneamente.

O grupo `nightclub_cases` foi convertido em 50 variantes (`case0..9` × estado). Exemplo:

```lua
Config.IPL.groups.nightclub_cases.enabled = true
Config.IPL.groups.nightclub_cases.activeVariant = 'case0_forsale'
```

Isso carrega apenas a barreira e o anúncio escolhidos, em vez de todos os DJs/estados.

## Coordenadas e routing buckets

`inside.coords` e `outside.coords` usam `vector4(x, y, z, heading)`. Quando a referência só confirma `vector3`, o heading fica `0.0` e o comentário indica ajuste pendente. Coordenadas não confirmadas permanecem `nil` com `TODO`; não use uma entrada pendente em produção.

`needsRoutingBucket = true` é apenas documentação. `mz_settings` não cria instâncias: routing buckets pertencem aos resources de houses, jobs, gangs, organizações ou missões.

## Entity sets

O fluxo do loader é: aplicar removes, aplicar loads, aguardar `interiorApplyDelayMs`, resolver o interior, validar com `IsValidInterior`, desabilitar `disableProps`, ativar/desativar props/entity sets, aplicar cores e chamar `RefreshInterior`.

Nenhum entity set novo está ativo por padrão. Confirme nomes e combinações em runtime; vários estilos, portas ou níveis de produção são mutuamente exclusivos.

## Game build

Entradas de DLC possuem `gameBuild` apenas quando confirmado pela referência 2.6.1. `Config.IPL.serverGameBuild` é opcional:

```lua
Config.IPL.serverGameBuild = nil
```

Se preenchido, o validador avisa sobre uma entrada habilitada que exige build maior. O resource não altera nem tenta descobrir `sv_enforceGameBuild`.

## Cayo Perico

O grupo `cayo_perico` e o radar continuam ativos. A lista original foi migrada literalmente. Ela contém estados incompatíveis, como portão fechado/quebrado e portas do hangar abertas/fechadas; isso é avisado pelo validador, mas não foi corrigido silenciosamente para preservar o mapa atual. A seleção final aguarda teste runtime.

## Debug e teste

Com `Config.Debug = true`, ficam disponíveis:

```text
/mzsettings_ipllist [category]
/mzsettings_iplinfo <key>
/mzsettings_ipltp <key> inside
/mzsettings_ipltp <key> outside
/mzsettings_iplvalidate
```

O TP recusa coordenada `nil`, solicita colisão, usa timeout e sempre descongela o ped. A saída de lista/warnings é limitada para evitar spam. O comando `/mzsettings_reloadipl` continua disponível independentemente do debug.

Para testar uma entrada: habilite somente ela (e sua variante, se existir), reinicie/recarregue o resource, execute a validação e visite `inside`/`outside`. Verifique colisão, portas, LOD, entity sets e o console. Desabilite antes de testar outra entrada do mesmo `overlapGroup`.

## MLOs e loaders externos

IPLs nativos podem conflitar com MLOs. Um PDM customizado, como uma instalação baseada no GABZ PDM, pode manter portas/colisões incompatíveis se o showroom nativo do Simeon continuar carregado. A remoção deve ser configuração explícita; o resource não tenta detectar MLOs automaticamente.

`Config.IPL.externalLoader = 'native'` é o único modo implementado. Bob74 IPL 2.6.1 foi usado como referência técnica, não foi instalado nem adicionado como dependência. Se `bob74_ipl` já rodar no servidor, desative cargas duplicadas manualmente; este resource não chama exports externos não confirmados.

## Adicionando uma entrada

Use `Config.RegisterIPLCatalog` em um arquivo de categoria, comece desativado e só inclua dados confirmados:

```lua
Config.RegisterIPLCatalog('minha_entrada', {
  enabled = false,
  label = 'Minha entrada',
  category = 'business.example',
  type = 'teleport',
  inside = nil,
  notes = { 'TODO: confirmar coordenada interna antes de usar.' }
})
```

Não invente IPL, coordenada, interior ID, entity set ou game build. Execute `/mzsettings_iplvalidate` e teste no FiveM antes de habilitar em produção.
