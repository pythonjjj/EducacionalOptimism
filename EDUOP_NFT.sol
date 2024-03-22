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