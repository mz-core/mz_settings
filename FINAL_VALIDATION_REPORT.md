# Relatório final — refatoração do mz_settings

## Diagnóstico original

O resource possuía um único `config.lua` de 1.201 linhas carregado como shared, embora nenhuma configuração fosse consumida no server. Os clients já estavam separados por responsabilidade. `client/ipl.lua` carregava/removia listas sem deduplicação, sem referência entre entradas, sem catálogo, sem variantes e sem `disableProps`. A configuração de placas estava hardcoded em `client/placa.lua`. O único export externo encontrado é o uso opcional de `mz_notify`; não havia banco, framework, dependência ou API do Bob74.

Ordem original confirmada: `config.lua` → `client/main.lua` → `client/ipl.lua` → demais clients. `server/main.lua` apenas imprime a inicialização.

## Arquivos

Criados:

- `config/shared.lua`, `ipl.lua`, `ipl_cayo.lua`, `npc.lua`, `sound.lua`, `traffic.lua`, `peds.lua`, `world.lua`, `blocked_vehicles.lua`, `pickups.lua` e `plates.lua`;
- nove arquivos em `config/ipl_catalog/`, incluindo `settings.lua` para ativações centralizadas;
- `README.md` e este relatório.

Alterados:

- `fxmanifest.lua`;
- `client/ipl.lua`;
- `client/placa.lua`.

Removido:

- `config.lua`, depois da comparação estrutural entre os blocos antigos e novos.

Não foram alterados `client/main.lua`, `npc.lua`, `sound.lua`, `traffic.lua`, `density.lua`, `world.lua`, `server/main.lua` nem os PNGs.

## Preservação

A comparação Lua profunda confirmou igualdade integral de:

- `Config.NPC`;
- `Config.Sound`;
- `Config.Traffic`;
- `Config.Peds`;
- `Config.World`;
- `Config.BlockedVehiclesCleanup`;
- `Config.Pickups`.

Também foram confirmados:

- `Config.Debug = false`;
- IPL operacional, delay de 1.000 ms, `LoadMpDlcMaps` e `EnableMpDlcMaps` ativos;
- estados de habilitação de todos os grupos antigos;
- listas exatas dos grupos antigos, exceto as duas correções deliberadas em grupos desativados descritas abaixo;
- quatro interiores operacionais continuam desativados;
- radar da Cayo ativo;
- placa `plate01` ativa com `placaRJ.png` e normal `placa_f.png`;
- server continua sem depender de config e mantém o log de inicialização.

## Cayo Perico

A lista foi migrada literalmente e comparada item a item: **330/330 IPLs, mesma ordem**. O grupo e o radar permanecem ativos. Os pares `h4_mansion_gate_closed`/`h4_mansion_gate_broken` e `h4_islandairstrip_doorsopen`/`h4_islandairstrip_doorsclosed` continuam presentes para não alterar silenciosamente o visual; o validador emite warnings.

## Catálogo

Foram registradas **134 entradas**, todas desativadas:

| Categoria raiz | Entradas |
|---|---:|
| business | 32 |
| residences | 23 |
| criminal | 19 |
| entertainment | 18 |
| services | 17 |
| story | 14 |
| dlc | 11 |

Tipos: 56 `ipl_entitysets`, 50 `teleport`, 14 `ipl`, 10 `map_toggle` e 4 `world`.

- 106 entradas possuem coordenada interna confirmada/documentada;
- 28 permanecem com coordenada pendente e `TODO` explícito;
- 23 variantes de catálogo foram declaradas;
- o grupo Nightclub possui 50 variantes operacionais exclusivas;
- nenhum novo IPL ou entity set ficou ativo.

A fonte técnica foi o código oficial Bob74 IPL tag 2.6.1. Ele foi usado apenas como referência; não foi instalado no resource e não se tornou dependência.

## Conflitos e correções

Corrigidos sem impacto no runtime atual:

1. O grupo Biker desativado continha quatro nomes não existentes na sequência oficial: `interior_2 + ware02`, `ware03`, `ware04` e `ware05`. Foram mantidos `interior_2 + ware01` e `interior_3..6 + ware02..05`.
2. O grupo Nightclub desativado deixou de carregar todos os anúncios/DJs simultaneamente. Agora requer uma única `activeVariant` e inclui uma barreira + um estado por case.

Apenas documentados/preservados:

1. Trevor: `TrevorsTrailerTidy` e `TrevorsTrailerTrash` seguem juntos no grupo ativo legado; o catálogo declara variantes exclusivas e marca “aguardando teste runtime”. `TrevorsTrailer` é base/complementar; Tidy/Trash são estados alternativos. `TrevorsMP` continua preservado até teste.
2. Heist apartment: `bnkheist_apt_dest` e `bnkheist_apt_norm` seguem ativos; o catálogo possui variantes normal/destroyed.
3. Cayo: pares de portão e portas incompatíveis permanecem na migração literal.
4. MLOs: o showroom nativo de Simeon pode conflitar com PDM customizado; nenhuma remoção automática foi adicionada.

## Loader

O loader agora:

- monta um plano único com caches de solicitados, removidos, entradas ativas e referências;
- deduplica `RequestIpl` preservando a ordem das listas;
- aplica todos os removes antes dos loads;
- não remove um IPL referenciado por outra entrada ativa;
- processa apenas catálogo habilitado e ignora carga para `world`/`teleport`;
- evita duplicação de entradas `managedBy`;
- processa somente `activeVariant`;
- aguarda `interiorApplyDelayMs`, valida o interior, desabilita `disableProps`, aplica props/entity sets/cores e chama `RefreshInterior`;
- mantém `/mzsettings_reloadipl`, o delay e o radar Cayo por frame;
- não adiciona loop de IPL por frame.

`externalLoader = 'native'` é o padrão e único modo implementado. Nenhum export fictício do Bob74 foi chamado.

## Campos

Campos antigos sem consumo encontrados e preservados como reservados:

- `Config.NPC.disableScenarioCops`, `disableRandomBoats`, `disableRandomTrains`;
- `Config.Traffic.emergencyVehicleDensity`, `boatDensity`, `trainDensity`.

Implementados: `disableProps`, `serverGameBuild`, `externalLoader`, `interiorApplyDelayMs`, catálogo, variantes, `managedBy`, coordenadas, routing bucket descritivo e entity sets.

Metadados como `label`, `category`, `notes`, `tags`, `conflictsWith` e `needsRoutingBucket` são informativos. Nenhum campo público antigo foi removido.

## Debug e validação

Com debug ativo foram adicionados:

- `/mzsettings_ipllist [category]`;
- `/mzsettings_iplinfo <key>`;
- `/mzsettings_ipltp <key> inside|outside`;
- `/mzsettings_iplvalidate`.

O validador cobre duplicações, load/remove, overlaps, variantes, tipos, coordenadas, interiors/entity sets, game build, props, grupos vazios, campos desconhecidos, nomes suspeitos e conflitos conhecidos de Cayo/Trevor/Nightclub. Warnings não derrubam o resource e a saída é limitada.

## Testes estáticos executados

- `luac -p` em todos os arquivos Lua: aprovado;
- execução isolada de todos os configs com stub de `vector4`: aprovada;
- comparação profunda dos blocos operacionais antes da remoção do arquivo antigo: aprovada;
- Cayo: 330/330 itens e ordem exata;
- catálogo: 134 entradas, 0 ativas;
- simulação do loader com natives stubadas: 406 IPLs únicos e 406 chamadas (sem duplicação), 27 removes e comando de reload registrado;
- simulação com debug: cinco comandos registrados e validador executado sem erro;
- manifest e ordem explícita inspecionados;
- busca por referência a `config.lua`: nenhuma;
- server, ausência de banco/dependência/framework e assets conferidos.

## Runtime pendente

**Implementado — aguardando runtime** no FiveM para:

- mapa base sem buracos; FIB; Simeon; Michael; Trevor; Union Depository; morgue;
- Cayo e radar da Cayo;
- sons, rádio, NPC, dispatch, wanted, tráfego e peds;
- pickups, veículos bloqueados e placa personalizada;
- reload de IPL, comandos de TP e entity sets;
- variantes, colisões/LODs e conflitos com MLOs.

Não houve migration de banco, NUI, framework, alteração de `sv_enforceGameBuild` ou nova dependência.
