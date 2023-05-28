// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

struct Todo {
  string text;
  bool completed;
}

contract Todos {
  Todo[] public todos;

  function create(string calldata _text) public {
    // 3 ways to initialize a struct
    // 1 - calling it like a function
    todos.push(Todo(_text, false));

    // 2 - key value mapping
    todos.push(Todo({
      text: _text,
      completed: false
    }));

    // initialize an empty struct and then update it
    Todo memory todo;
    todo.text = _text;

    todos.push(todo);  
  }

  // Solidity automatically created a getter for 'todos' so
  // you don't actually need this function.
  function get(uint _index) public view returns (string memory text, bool completed) {
    Todo storage todo = todos[_index];

    return (todo.text, todo.completed);
  }

  // update text
  function updateText(uint _index, string calldata _text) public {
    Todo storage todo = todos[_index];

    todo.text = _text;
  }

  function toggleCompleted(uint _index) public {
    Todo storage todo = todos[_index];
    todo.completed = !todo.completed;
  }
}