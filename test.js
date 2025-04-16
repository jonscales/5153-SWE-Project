// Create a new window
const newWindow = window.open("", "_blank", "width=300,height=200");

// Function to create the button and handle the click event
function createButton() {
    const button = document.createElement('button');
    button.textContent = 'Click Me';
    button.onclick = () => {
        newWindow.document.write("<h1>Complete</h1>");
    };
    document.body.appendChild(button);
}

// Call the function to create the button
createButton();