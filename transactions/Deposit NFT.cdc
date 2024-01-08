import CryptoPoops from 0x06
import NonFungibleToken from 0x05

transaction (recepient: Address, name: String, favouriteFood: String, luckyNumber: Int)  {

    prepare (acct: AuthAccount) {


    let nftMinter = acct.borrow<&CryptoPoops.Minter>(from: /storage/Minter)!

    let PublicReference = getAccount(recepient).getCapability(/public/Collection)
                            .borrow<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>()
                            ??panic("This account does not have a collection")

                            PublicReference.deposit(token: <- nftMinter.createNFT(name: name, favouriteFood: favouriteFood, luckyNumber: luckyNumber))

            log(PublicReference)
    }
}