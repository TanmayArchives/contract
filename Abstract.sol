// Abstract
abstract contract Employee {
    string public name;
    uint public employeeId;
    constructor(string memory _name, uint _employeeId) {
        name = _name;
        employeeId = _employeeId;
    }
    function performTask() public virtual returns (string memory);
}

// Developer 
contract Developer is Employee {
    string public programmingLanguage;

    constructor(string memory _name, uint _employeeId, string memory _programmingLanguage) 
        Employee(_name, _employeeId) {
        programmingLanguage = _programmingLanguage;
    }
  // abstract function
    function performTask() public override returns (string memory) {
        return string(abi.encodePacked("Writing code in ", programmingLanguage)); }
}


// Manager contract inherits Employee
contract Manager is Employee {
    uint public teamSize;
    constructor(string memory _name, uint _employeeId, uint _teamSize) 
        Employee(_name, _employeeId) {
        teamSize = _teamSize;
    }
 // Implementing the abstract function
    function performTask() public override returns (string memory) {
        return string(abi.encodePacked("Managing a team of ", uint2str(teamSize), " employees"));
    }

    // convert uint to string
    function uint2str(uint _i) internal pure returns (string memory) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len;
        while (_i != 0) {
            k = k-1;
            uint8 temp = (48 + uint8(_i - _i / 10 * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        return string(bstr);
    }
}
// create and manage employees
contract EmployeeFactory {
    Employee[] public employees;
    function createDeveloper(string memory _name, uint _employeeId, string memory _programmingLanguage) public {
        Developer newDev = new Developer(_name, _employeeId, _programmingLanguage);
        employees.push(newDev);
    }
    function createManager(string memory _name, uint _employeeId, uint _teamSize) public {
        Manager newManager = new Manager(_name, _employeeId, _teamSize);
        employees.push(newManager);
    }
    function getEmployeeTask(uint index) public view returns (string memory) {
        return employees[index].performTask();
    }
}
