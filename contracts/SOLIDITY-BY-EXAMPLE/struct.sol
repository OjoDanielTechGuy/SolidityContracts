//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

contract Todo {
    /*Struct: involves creating your own datatype,
    They are useful for grouping together related data*/

    struct Todo {
        string text,
        bool completed
    }

    //array of Todo Struct
    Todo[] public todos;

    //initializing a struct (3 ways)
    function create(string calldata _text) public {
        //1 - calling it like a function
        todos.push(Todo(_text, false));

        //2. key value mapping
        todos.push(Todo({text: _text, completed: false}));

        //3. initializing empty struct then updating it
        Todo memory todo;
        todo.text = _text;

        //todo.completed initialized to false
        todos.push(todo);

        //4. 
    }
}