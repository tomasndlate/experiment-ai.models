# Setup the environment for notebooks

🚨 **Important** 🚨

- The folder **notebooks/** needs to be the root of your vscode workspace
- Open directly this folder **notebooks/**, not the parent folder **experiment-ai.model**
- Kernel wouldn't work otherwise

<br/>

## VS Code Locally

Used Python version: **3.8.5**

<br/>

### Create Virtual Environment

Where the packeges will be stored

`python3 -m venv .venv`

Activate (start using) the environment. To be able to install packages inside folder.

`source .venv/bin/activate`

Check if pip is working. Pip will be the package manages (command to install dependencies)

`pip --verseion`

<br/>

### Install project dependencies/requirements

Install dependencies. Use requirements.txt to install the needed dependencies

`pip install -r requirements.txt`

_If doesn't work try the force command. **-U** = update if it had already installed_

`pip install -U -r requirements.txt`

<br/>

### Update requirements

If packages/dependencies are added during development update the requirements.txt

Install package

`pip install <package-name>`

Update requirements

`pip freeze > requirements.txt`

Don't forget to push this new changes to github 😊

<br/>

### Select VSCode Kernel to use .venv

Click **Select Kernel**

<img width="320" alt="kernel" src="https://github.com/user-attachments/assets/b5544f1c-49e2-4d78-aa9a-459769aef8b3" />

Select the .venv envirement (which contains a kernel)

<img width="665" alt="select-kernel" src="https://github.com/user-attachments/assets/893a7139-7d90-42e2-8f84-e22ca44049d9" />


