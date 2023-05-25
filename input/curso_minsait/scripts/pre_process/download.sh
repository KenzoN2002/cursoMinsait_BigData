

cd ../../raw
mkdir categoria
cd categoria
meuArray=("alunos" "cidade" "cliente" "estado" "filial" "item_pedido" "parceiro" "produto" "subcategoria")
for str in ${meuArray[@]}; do
    curl -O  https://raw.githubusercontent.com/caiuafranca/dados_curso/main/$str.csv
done