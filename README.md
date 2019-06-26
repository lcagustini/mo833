# MO833
## Analise de uma simulação com Pyranda na nuvem AWS

Este repositório contém os arquivos necessários para reprodução dos experimentos realizados na matéria MO833, no primeiro semestre de 2019.

## Execução dos experimentos
1. Instalar o Singularity na versão 3.0 ou maior (https://sylabs.io/singularity/)
1. Clonar este repositório Git
1. Entrar na pasta do repositório
1. Criar o container do Singularity com `sudo singularity build base base.def`
1. Executar `grep -H . /sys/devices/system/cpu/cpu*/topology/thread_siblings_list`
    - A topologia esperada pelo script de execução é no formato: (0;4), (1;5), (2;6), (3;7)
    - Caso a topologia do seu processador seja diferente dessa, ou seja, os núcleos lógicos estão organizados diferentemente entre os núcleos físicos, é necessário modificar o script *run.sh* para refletir isto
        - Nas linhas 5 a 8 deve-se ajustar os núcleos lógicos escolhidos
1. Executar `sh run-all.sh` para realizar a advecção com todas as configurações de grupos de controles
1. Os dados resultantes da instrumentação do *3D advect.py* estarão na pasta *csv* ao fim da execução dos experimentos
