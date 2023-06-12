BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
CONFIG="${BASEDIR}/../../cofing/config.sh"
source "${config}"

echo "Iniciando a criacao em Date"
meuArray=("alunos" "categoria" "cidade" "cliente" "estado" "filial" "item_pedido" "parceiro" "pedido" "subcategoria")
for str in ${meuArray[@]}; do
    cd ../../raw
    mkdir $str
    chmod 777 $str
    cd $str
    curl -O  https://raw.githubusercontent.com/caiuafranca/dados_curso/main/$str.csv

    hdfs dfs -mkdir /datalake/raw/$str
    hdfs dfs -chmod 777 /datalake/raw/$str
    hdfs dfs -copyFromLocal $str.csv /datalake/raw/$str
    

done