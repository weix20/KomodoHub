
# KomodoHub

## 🚀 Getting Started (For Developers)
Follow these steps to set up and run the project locally.

### 📌 Prerequisites
1. **Clone the repository:**  
   ```bash
   git clone (repo_url)
   ```

2. **Ensure you have npm installed properly:**  
   You can check this by running:
   ```bash
   npm -v
   ```
   If not installed, follow the [official npm installation guide](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm).

### 📦 Installing Dependencies
After cloning the repository, navigate to the project directory and install the required node modules by running:

```bash
npm install
```

### 🖥 Setting Up Your IDE
To work efficiently, make sure to install:
- **Vue Extension** (for Vue support)
- **Tailwind Extension** (for styling and improved IntelliSense recommendations)

### 🔧 Running the Development Server
Start the local development server using:

```bash
npm run dev
```
Follow the instructions in the terminal to see the website working.

### 📱 Testing on Mobile
To test the website on your phone or another device on the same WiFi connection, run:

```bash
npm run dev -- --host
```
Copy the generated link and open it in your mobile browser.

### ✅ Type Safety & Building
Before finalizing, ensure type safety and check for potential issues by running:

```bash
npm run build
```
This will warn you of any problems that could occur if the site was uploaded to a server.  
(Although we won't be deploying, it's good practice to test this step.)

### 🌳 Creating Branches
We will soon be creating different branches to better organize and manage the project.
