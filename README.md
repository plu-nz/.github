# PLUNZ

**Small apps. Big possibilities.**

PLUNZ é uma marca para aplicativos pequenos e independentes, cada um focado em uma necessidade específica. Juntos, eles formam uma caixa de ferramentas digital. O símbolo `+` representa essa união.

Este repositório é o ponto de entrada para o trabalho na PLUNZ: o [perfil público](profile/README.md), contexto compartilhado, decisões e documentação que atravessam os produtos. Código específico de cada aplicativo fica no respectivo repositório.

## Produtos

| Produto | Ideia | Endereço provisório | Estado |
| --- | --- | --- | --- |
| Capturar | Portfólio de fotos/PWA com fotos do Google Drive ou Photos do usuário, feed e álbuns, sem likes, seguidores ou comentários | `photos.plu.nz` | Conceito inicial; projeto original em `xonha/capturar` |
| Marmitar | Organização de refeições e marmitas | `meals.plu.nz` | Conceito inicial |
| Psincro | Agenda de psicólogos com sincronização de horários, confirmações e pagamentos | `calendar.plu.nz` | Conceito inicial |

Nomes e subdomínios podem mudar. O domínio principal é `plu.nz`.

## Como usar este repositório

- Comece por [Contexto](docs/contexto.md) ao abrir uma sessão de Codex, Claude ou outro agente.
- Registre decisões que afetam mais de um produto em [Decisões](docs/decisoes/README.md).
- Mantenha documentação de implementação dentro do repositório do produto.
- Use [AGENTS.md](AGENTS.md) como instrução comum para agentes.

## Organização técnica

A preferência é por infraestrutura Cloudflare de baixo custo, avaliada conforme as necessidades de cada produto. Repositórios que forem monorepos recebem o prefixo `mono-` (por exemplo, API e frontend no mesmo repositório).

A organização GitHub é `plu-nz`. Não alterar seu nome.
