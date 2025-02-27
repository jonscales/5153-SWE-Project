To run the React code (web app) you've shared on VS Code, you'll need to set up your development environment. Here’s what you need to get started:

1. Install Node.js and npm
First, ensure that you have Node.js and npm (Node package manager) installed on your computer, as they are required to run and manage React applications.

Download Node.js (npm comes with Node.js).
After installation, check the versions by running the following commands in your terminal:

node -v
npm -v

2. Install VS Code Extensions
For a smooth React development experience, install the following extensions in VS Code:

ESLint: Lints your code and ensures you follow the best practices.
Prettier - Code Formatter: Formats your code automatically.
Reactjs code snippets: Provides snippets for faster coding.
JavaScript (ES6) code snippets: Useful for JavaScript development.
Bracket Pair Colorizer: Helps to easily identify matching brackets.
Path Intellisense: Auto-completes file paths.
npm Intellisense: Provides autocomplete for npm modules.
To install these, just go to the Extensions tab in VS Code (on the left sidebar) and search for each one.

3. Create a React App
You can use create-react-app, which is a tool that sets up a React project with all the required configuration for you.

Open your terminal/command prompt and run the following commands:

npx create-react-app hhh-app
cd hhh-app

This will create a new React project in a folder called hhh-app and automatically install all the dependencies.

Once the setup is complete, open the hhh-app folder in VS Code.

4. Set Up Your Code
Now, you can copy your provided code into the appropriate files.

Replace the default src/App.js with your code.
Ensure that your files are structured as React components (like Registration, EventSchedule, etc.). Each component can be placed in separate files in the src folder.
5. Start the Development Server
Now that your project is set up, you can run the development server to see the result.

In the terminal, run:

npm start

This will start the development server, and you can view the app by navigating to http://localhost:3000 in your browser.