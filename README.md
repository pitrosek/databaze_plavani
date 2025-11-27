# 🏊‍♂️ Databáze plaveckých soutěží
Tato databáze je vytvořena pro ukládání a správu informací týkajících se plaveckých soutěží. Je strukturovaná tak, aby dokázala postihnout všechny hlavní prvky, které při organizaci závodů vznikají: samotné závodníky, jejich zázemí, disciplíny, závody i výsledky.

Základem systému je tabulka plavec, kde jsou evidovány osobní údaje jednotlivých závodníků. Každý plavec má přiřazený záznam ve dvou dalších tabulkách — ve stat a klub. Tabulka států umožňuje přiřadit závodníkovi jeho národnost, zatímco tabulka klubů zachycuje plavecký klub, za který závodník startuje. Tyto dvě vazby tak doplňují základní identitu plavce a poskytují přehled o jeho sportovním i geografickém zázemí.

Samostatnou část tvoří tabulka disciplina, která obsahuje jednotlivé plavecké disciplíny. Ty se liší stylem i délkou tratě a slouží k přesnému určení toho, v čem závodník soutěží. Databáze díky tomu dokáže rozlišovat mezi výkony plavců v různých kategoriích.

Tabulka zavod představuje konkrétní soutěžní události. Každý záznam může reprezentovat jeden závod, soutěžní den nebo událost v rámci většího plaveckého meetingu. Tato tabulka slouží jako spojovací bod pro jednotlivé výsledky.

Výkony plavců jsou zaznamenávány v tabulce vysledek. Každý výsledek je pevně spojen se třemi klíčovými údaji: s plavcem, se závodem a s disciplínou. Díky tomu je možné přesně určit, kdo závodil, kde závodil a v jaké disciplíně. Výsledková tabulka tak obsahuje kompletní informace o časech, umístěních nebo dalších hodnotách, které plavec během soutěže dosáhl.

Celkově tato databáze poskytuje ucelený systém, který dokáže uchovávat záznamy o plavcích, jejich sportovním působení a konkrétních výkonech v různých soutěžích. Díky navzájem propojeným tabulkám je možné jednoduše dohledat průběh závodů, seznam účastníků i jejich výsledky.


https://dbdiagram.io/d/Plavani-69031f446735e111707261f4
