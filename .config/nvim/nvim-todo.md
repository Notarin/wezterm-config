# nvim-todo
This file contains my plans for nvim regarding features I wish for during working on a project that I do not have the time at that point to implement

## Selection picker
The Code Line Expansion Navigator is a sophisticated tool designed to enhance code readability and navigation within a single logical line of code, often spanning multiple chained methods or functions. It integrates with the Language Server Protocol (LSP) to provide an interactive dropdown menu, allowing users to explore and interact with individual symbols, method calls, and constructs that constitute a complex line of code. The navigator dynamically responds to user interaction, offering the ability to expand and explore the nested hierarchy of methods or functions like .into_iter(), .filter(), .map(), .sort(), and .collect() in a chained operation.

## Wrap text
This is a visual mode bind, it record the selected text, the opens a pop-up, and asks for input, the input is pre-filled with "<${wrap}>" minus quotes, the user replaces the < and > with what they want to come before and after, and it will replace the selection accordingly, with the selection being treated the same as ${wrap}, essentially, treating the selection as ${wrap}, the text inputted to the left og it as ${left}, and the text to the right as ${right}, it will replace ${wrap} with ${left}${wrap}${right}.

## Rebind command Q to command q
Please for all this is holy rebind that, it is so annoying.
