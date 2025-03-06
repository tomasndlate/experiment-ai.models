# Setup the environment for notebooks

🚨 **Important** 🚨

- The folder **notebooks/** needs to be the root of your vscode workspace
- Open directly this folder **notebooks/**, not the parent folder **experiment-ai.model**
- Kernel wouldn't work otherwise

## VS Code Locally

Used Python version: **3.8.5**

### Create Virtual Environment

Where the packeges will be stored

`python3 -m venv .venv`

Activate (start using) the environment. To be able to install packages inside folder.

`source .venv/bin/activate`

Check if pip is working. Pip will be the package manages (command to install dependencies)

`pip --verseion`

### Install project dependencies/requirements

Install dependencies. Use requirements.txt to install the needed dependencies

`pip install -r requirements.txt`

_If doesn't work try the force command. **-U** = update if it had already installed_

`pip install -U -r requirements.txt`

### Update requirements

If packages/dependencies are added during development update the requirements.txt

Install package

`pip install <package-name>`

Update requirements

`pip freeze > requirements.txt`

Don't forget to push this new changes to github 😊

### Select VSCode Kernel to use .venv

Click **Select Kernel**

Select the .venv envirement (which contains a kernel)
