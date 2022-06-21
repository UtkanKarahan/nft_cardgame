import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plunder/src/cards/character/character.dart';
import 'package:plunder/src/cards/character/character_card.dart';
import 'package:plunder/src/cards/equipment/equipment.dart';
import 'package:plunder/src/cards/pack/pack_card.dart';
import 'package:plunder/src/cards/skill/skill.dart';
import 'package:plunder/src/style/constants.dart';
import 'package:web3dart/web3dart.dart';


import '../cards/adventurer/adventurer.dart';
import '../cards/equipment/equipment_card.dart';
import '../cards/hero/hero.dart';
import '../cards/hero/hero_card.dart';
import '../cards/pack/pack.dart';
import '../cards/skill/skill_card.dart';



  Future<DeployedContract> loadCrystalContract() async {
    String abi =  await rootBundle.loadString("assets/abi/currency_abi.json");
    String contractAdress = currency_address;

    final contract =  DeployedContract(ContractAbi.fromJson(abi, "CURRENCY"), EthereumAddress.fromHex(contractAdress));
    return contract;

  }

  Future<DeployedContract> loadCardContract() async {
    String abi =  await rootBundle.loadString("assets/abi/card_abi.json");
    String contractAdress = card_address;
    final contract = DeployedContract(ContractAbi.fromJson(abi, "CARD"), EthereumAddress.fromHex(contractAdress));
    return contract;

  }

  Future<DeployedContract> loadInterfaceContract() async {
    String abi =  await rootBundle.loadString("assets/abi/interface_abi.json");
    String contractAdress = interaction_address;
    final contract = DeployedContract(ContractAbi.fromJson(abi, "INTERACTION"), EthereumAddress.fromHex(contractAdress));
    return contract;

  }

  Future<DeployedContract> loadPackContract() async {
    String abi =  await rootBundle.loadString("assets/abi/pack_abi.json");
    String contractAdress = pack_address;
    final contract = DeployedContract(ContractAbi.fromJson(abi, "PACK"), EthereumAddress.fromHex(contractAdress));
    return contract;

  }

  Future<List<dynamic>> queryInterface(String functionName, List<dynamic> args, Web3Client ethClient) async {

    final contract = await loadInterfaceContract();
    final ethFunction = contract.function(functionName);

    final result = await ethClient.call(contract: contract, function: ethFunction, params: args);

    return result;
  }

Future<List<dynamic>> queryCrystal(String functionName, List<dynamic> args, Web3Client ethClient) async {

  final contract = await loadCrystalContract();
  final ethFunction = contract.function(functionName);

  final result = await ethClient.call(contract: contract, function: ethFunction, params: args);

  return result;
}

  Future<void> queryInterfaceCrystal(String functionName,BigInt amount, List<dynamic> args, Web3Client ethClient) async {

    final contract = await loadInterfaceContract();

    final ethFunction = contract.function(functionName);

    await ethClient.sendTransaction(EthPrivateKey.fromHex(private_key), Transaction.callContract(contract: contract, function: ethFunction, parameters: args, value: EtherAmount.fromUnitAndValue(EtherUnit.gwei, amount.toDouble() * 100000)),chainId: 4);



  }

  Future<String> queryInterfacePack(String functionName, List<dynamic> args, Web3Client ethClient) async {

    final contract = await loadInterfaceContract();

    final ethFunction = contract.function(functionName);
    final result = await ethClient.sendTransaction(EthPrivateKey.fromHex(private_key), Transaction.callContract(contract: contract, function: ethFunction, parameters: args,),chainId: 4);

    return result;



  }


  Future<List<dynamic>> queryCard(String functionName, List<dynamic> args, Web3Client ethClient) async {

    final contract = await loadCardContract();
    final ethFunction = contract.function(functionName);

    final result = await ethClient.call(contract: contract, function: ethFunction, params: args);

    return result;
  }

  Future<List<dynamic>> queryPack(String functionName, List<dynamic> args, Web3Client ethClient) async {

    final contract = await loadPackContract();
    final ethFunction = contract.function(functionName);

    final result = await ethClient.call(contract: contract, function: ethFunction, params: args);

    return result;
  }

  Future<void> queryPackApproval(String functionName, List<dynamic> args, Web3Client ethClient) async {

    final contract = await loadPackContract();

    final ethFunction = contract.function(functionName);
    await ethClient.sendTransaction(EthPrivateKey.fromHex(private_key), Transaction.callContract(contract: contract, function: ethFunction, parameters: args,),chainId: 4);


  }

  Future<void> getBalance(String targetAddress, Web3Client ethClient) async {

    List<dynamic> result = await queryCrystal("balanceOf", [EthereumAddress.fromHex(targetAddress)], ethClient);

    demoAdventurer.crystal = result[0].toDouble();
    print("Balance Taken As ${demoAdventurer.crystal}");

  }

  Future<void> buyCrystal(BigInt amount, Web3Client ethClient) async {

    await queryInterfaceCrystal("buyToken",amount , [amount], ethClient);
    print("Bought  ${amount.toDouble()} Crystals");

  }

  Future<void> buyPack( Web3Client ethClient) async {

    List<dynamic> result = await queryPack("getCurrentId", [], ethClient);
    print("Pack ID : ${result}");

    Pack temp = Pack(description: 'hebele');
    temp.id = int.parse(result[0].toString());


    debugPrint("aslifhdsaiklhjflsdkajdaskjdklasjdklasjdlksajdkljaslkdjasldjlask");
    List<dynamic> result2 = await queryCard("getCurrentId", [], ethClient);

    temp.contains.add(int.parse(result2[0].toString())+1);
    temp.contains.add(int.parse(result2[0].toString())+2);
    temp.contains.add(int.parse(result2[0].toString())+3);
    temp.contains.add(int.parse(result2[0].toString())+4);

    await queryInterfacePack("buyPack", ["pack","card","card","card","card"], ethClient);




    demoAdventurer.pack_inventory.add(PackCard(pack: temp));


    print("Pack INVENTORY : ${demoAdventurer.pack_inventory}");
    print("Pack INVENTORY : ${demoAdventurer.pack_inventory[demoAdventurer.pack_inventory.length - 1]}");

    print("Bought 1 Pack");

  }

  Future<void> openPack(Pack temp ,Web3Client ethClient) async {



    print("${BigInt.from(temp.id)}");
    await queryPackApproval("approve", [EthereumAddress.fromHex(interaction_address),BigInt.from(temp.id)], ethClient);
    await queryInterface("openPack", [BigInt.from(temp.id)], ethClient);

    demoAdventurer.card_inventory.add(CharacterCard(char: demoCharacter));
    demoAdventurer.card_inventory.add(HeroCard(hero: demoHero));
    demoAdventurer.card_inventory.add(EquipmentCard(equipment: demoEquipment));
    demoAdventurer.card_inventory.add(SkillCard(skill: demoSkill));

    for( var i = 0 ; i < demoAdventurer.pack_inventory.length; i++ ) {
      if (demoAdventurer.pack_inventory[i].pack.id == temp.id ){
        demoAdventurer.pack_inventory.removeAt(i);
      }
    }


    print("Pack Opened");




  }
