# Setup the environment for notebooks

🚨 **Important** 🚨

- The folder **src/** needs to be the root of your vscode workspace
- Open directly this folder **srcs/**, not the parent folder **experiment-ai.model**

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

### Select VSCode interpreter to use .venv

Select the interpreter, use the .venv

<img width="703" alt="select interpreter" src="https://github.com/user-attachments/assets/79a6e0ad-3f38-4e25-8477-811edda3d783" />

<br/>
<br/>
<br/>

## Environment Variables

### Create .env file

This file is going to save secrets locally - not update to github. Create under the **src/** folder.

<img width="266" alt="env file" src="https://github.com/user-attachments/assets/2cd971a8-1fb0-4308-a7e7-42fede8c8301" />

<br/>

### Add Secrets

This are the needed secrets:

```
KAGGLE_USERNAME=<value>
KAGGLE_KEY=<value>
```

