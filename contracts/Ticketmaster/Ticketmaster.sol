// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract TokenMaster is ERC721 {
  address public owner;
  uint256 public totalOccasions = 0;
  uint256 public totalSuply;

  struct Occasion {
    uint256 id;
    string name;
    uint256 cost;
    uint256 tickets;
    uint256 maxTickets;
    string date;
    string time;
    string location;
  }

  mapping(uint256 => Occasion) occasions;
  mapping(uint256 => mapping(address => bool)) public hasBought;
  mapping(uint256 => mapping(uint256 => address)) public seatToken;
  mapping(uint256 => uint256[]) seatsTaken;

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  constructor(
    string memory _name, 
    string memory _symbol
  ) ERC721(_name, _symbol) {
    owner = msg.sender;
  }

  function list(
    string memory _name, 
    uint256 _cost, 
    uint256 _maxTickets,
    string memory _date,
    string memory _time,
    string memory _location
  ) public onlyOwner {
    totalOccasions++;

    occasions[totalOccasions] = Occasion(
      totalOccasions,
      _name,
      _cost,
      _maxTickets,
      _maxTickets,
      _date,
      _time,
      _location
    );
  }

  function getOccasion(uint _id) public view returns (Occasion memory) {
    return occasions[_id];
  }

  function mint(uint256 _id, uint256 _seat) public payable {
    // Update ticket count
    occasions[_id].tickets -= 1;

    // Update buying status
    hasBought[_id][msg.sender] = true;

    // Assign seat
    seatToken[_id][_seat] = msg.sender;

    // Update seats currently taken
    seatsTaken[_id].push(_seat);

    totalSuply++;
    _safeMint(msg.sender, totalSuply);
  }
}