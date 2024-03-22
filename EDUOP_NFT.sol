//Construindo um ERC721:
//fonte: https://docs.openzeppelin.com/contracts/3.x/access-control
//Vamos usar ERC721 para criar um conjunto de aulas. Cada NFT representa uma lição. Cada grupo de lições criados, será "minted" e enviado para o criador. não há necessidade de enviar os tokens posteriormente.
//futuramente implementar controle de acesso https://docs.openzeppelin.com/contracts/3.x/access-control

// contracts/aulasItem.sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";



contract aulasItem is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() public ERC721("aulasItem", "AIT") {}

    function awardItem(address criador, string memory tokenURI)
        public
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(criador, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}


//Criando novas aulas:

> aulasItem.awardItem(criadorAddress, "https://aulas.example/item-id-xyz.json")
Transaction successful. Transaction hash: 0x...
Events emitted:
 - Transfer(0x0000000000000000000000000000000000000000, criadorAddress, 7)



//o proprietário (criador) e a metadata para cada aula:

> aulasItem.ownerOf(7)
criadorAddress
> aulasItem.tokenURI(7)
"https://aulas.example/item-id-xyz.json"
This tokenURI should resolve to a JSON document that might look something like:


{
    "name": "aula1",
    "description": "essa aula é a primeira",
    "image": "https://aulas.example/item-id-xyz.png",
    "strength": 20
}




//Importações:

O contrato importa as bibliotecas necessárias ERC721 e Counters do OpenZeppelin.
Declaração do Contrato:

O contrato aulasItem é declarado e herda da biblioteca ERC721.
Inicialização do Counter:

Um contador é inicializado para rastrear o ID dos tokens.
Construtor:

O construtor do contrato é chamado para definir os metadados do ERC721, incluindo o nome ("aulasItem") e o símbolo ("AIT").
Função awardItem:

Esta função permite que o criador de aulas minta novos tokens representando as lições. Ele recebe o endereço do criador e o URI do token como parâmetros, incrementa o contador de IDs dos tokens, cria um novo token com o ID incrementado, atribui o token ao criador e define o URI do token.
Exemplo de Uso:

Um exemplo de uso é fornecido para criar uma nova aula usando a função awardItem. Ele demonstra como criar uma nova aula, especificando o endereço do criador e o URI do token.
Exemplo de Metadata:

Um exemplo de como a metadata do token pode ser estruturada é fornecido. Ele mostra um JSON com campos como nome, descrição, imagem e força.
