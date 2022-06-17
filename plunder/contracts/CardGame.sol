//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "hardhat/console.sol";

contract GameCards is ERC721 {
    address public owner;
    uint userId = 1;
    uint tokenId = 1;
    uint rarityId = 1;
    uint skillId = 1;
    uint randomId = 11;

    uint[] rarity_list = [1,2,3,4,5];
    string[] card_names = ["card1", "card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "card11"];
    string[] skill_names = ["skill1", "skill2", "skill3", "skill4", "skill5", "skill", "skill7", "skill8", "skill9", "skill10",
     "skill11", "skill12", "skill13", "skill14", "skill15", "skill16", "skill17", "skill18", "skill19", "skill20",
     "skill21", "skill22", "skill23", "skill24", "skill25", "skill26", "skill27", "skill28", "skill29" ];
    string[] classes = ["Class1", "Class2", "Class3", "Class4"];
    
    struct Skill {
        string skillName;
        uint skillId;
    }
    

    struct User {
        uint userId;
    }

    struct Card {
        uint cardId;
        string cardName;
        address owner;
        uint attack;
        uint durability;
        uint health;
        Skill skill;
        uint class;
        uint rarity;
    }

    User[] allUsers;
    Skill[] allSkills;
    Card[] allCards;


    mapping(address => User[]) public userAddresses;
    mapping(address => Card[]) public cardAddresses;
    mapping(string => bool) public tokenExists;
    mapping(address => bool) public userExists;

    mapping(uint => Skill[]) public skillLevels;

    constructor() ERC721("GameCard", "GC"){
        owner = msg.sender;
    }

    function createSkills() public {
        require(msg.sender == owner, "Only owner can create skills!");
        uint rarity = 0;
        for (uint i = 0; i<skill_names.length; i++){
            rarity = random(5);
            allSkills.push(Skill(skill_names[i], skillId));
            skillLevels[rarity].push(Skill(skill_names[i], skillId));
            skillId++;
        }
    }

    function getSkills() public view returns(Skill[] memory){
        return allSkills;
    }

    function getLevelSkills(uint _level) public view returns(Skill[] memory){
        return skillLevels[_level];
    }

    function registerUser() public {
        require(!userExists[msg.sender], "A user from this address is already registered!");
        userAddresses[msg.sender].push(User(userId));
        allUsers.push(User(userId));
        userExists[msg.sender] = true;
        userId++;
    }

    function createCard() public payable returns(Card memory){
        require(userExists[msg.sender], "This user is not registered!");
        uint _rarity = random(5);
        string[] memory names = card_names;
        string memory name = names[random(card_names.length)];
        uint att = random(1000);
        uint hlt = random(2000);
        uint dur = random(10);
        uint skillNum = random(skillLevels[_rarity].length);
        Skill memory _skill = skillLevels[_rarity][skillNum];
        uint _class = random(classes.length);

        _safeMint(msg.sender, tokenId);

        Card memory card = Card({
            cardId: tokenId,
            cardName: name,
            owner: msg.sender,
            attack: att,
            health: hlt,+
            durability: dur,
            skill: _skill,
            class: _class,
            rarity: _rarity});

        cardAddresses[msg.sender].push(card);
        allCards.push(card);

        tokenId++;
        return (card);
    }

    function getAllCards() public view returns(Card[] memory) {
        return allCards;
    }

    function getMyCards() public view returns(Card[] memory) {
        return cardAddresses[msg.sender];
    }

    function getAllUsers() public view returns(User[] memory) {
        return allUsers;
    }

    function getMyUser() public view returns(User[] memory) {
        return userAddresses[msg.sender];
    }

    function random(uint range) public returns (uint) {
        uint randomnumber = uint(keccak256(abi.encodePacked(randomId, msg.sender))) % range;
        randomId++;
        return randomnumber + 1;
    }

}