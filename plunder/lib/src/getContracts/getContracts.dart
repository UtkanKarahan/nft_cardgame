import 'package:flutter/services.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/credentials.dart';


Future<DeployedContract> getContract() async {
  // abi.json is the contract metadata, you can download it from the remix IDE
  String abi = await rootBundle.loadString("assets/abi.json");
  String contractAddress = "my_contract_address"; // e.g. 0xd66C81d9b781152e2D9be07Ccdf2303A77B7163c
  String contractName = "my_contract_name"; // you must set your own contract name here

  DeployedContract contract = DeployedContract(
    ContractAbi.fromJson(abi, contractName),
    EthereumAddress.fromHex(contractAddress),
  );

  return contract;
}