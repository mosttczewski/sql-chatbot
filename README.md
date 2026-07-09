# sql-chatbot
(For learning purposes) Using T-SQL and PowerShell by building a natural language to SQL chatbot.

## What does the chatbot do?
This chatbot translates natural language questions into SQL queries and selects data from a desired database to make data selection more friendly and faster.

**For example**
User types a message 'I want to see all movies from the 90s' — the chatbot with AI help translates this message into SQL language and prints back all matching movies in a clear table structure.

## Requirements
To make the chatbot work you need to have:
- Working Anthropic API key to make API calls, or Ollama installed on your desktop (specifically the llama3 model for this bot)
- PowerShell 7
- SQL Server or any DBMS able to run T-SQL language
- SqlServer PowerShell module

**(Without these it won't work)**

# Setup

## 1. Install the SqlServer PowerShell module
Run this once in PowerShell:
```powershell
Install-Module -Name SqlServer -Scope CurrentUser
```

## 2. Allow PowerShell to run local scripts
Run this once in PowerShell:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## 3. Set your Anthropic API key as an environment variable
```powershell
[System.Environment]::SetEnvironmentVariable("ANTHROPIC_API_KEY", "your-key-here", "User")
```

## 4. Chatbot setup
After cloning the project, open `scripts\chatbot.ps1` and configure the settings in the `#CONFIG SECTION` at the top of the file. Further instructions are inside that section.

**IF YOU HAVE YOUR OWN DATABASE YOU HAVE TO CHANGE THE $schema VARIABLES ON YOUR OWN, SPECIFIED TO YOUR DATABASE!!! REMEMBER ABOUT PROMPT ACCURACY!!!**

## 5. Database setup
### If you want to use it on your own database and your own data, you can skip that!

1. Open your DBMS
2. Create a new database
3. Run `sql\01-create-tables.sql`
4. Run `sql\02-insert-data.sql`

## 6. Running the chatbot
Navigate to the project root folder in PowerShell:
```powershell
cd your_path\sql-chatbot
```
Then run:
```powershell
.\scripts\chatbot.ps1
```
If you have set up the database and the config section before, you should be good to go!

# Structure

### scripts
- chatbot.ps1
Chatbot file
- import_actors.ps1
Imports actors from a CSV file into the database

### sql (here are the files you can skip if you using it on your own DB)
- 01-create-tables.sql
Script creating tables
- 02-insert-data.sql
Script inserting various data into tables created before
- import_actors.csv
CSV file with actors data, free to edit

# What I learned
- **SQL Server and SSMS** — setting up and managing a local SQL Server instance, using SSMS to write and execute queries, and understanding how SQL Server differs from other database systems.
- **T-SQL vs MySQL** — key syntax differences like IDENTITY(1,1) instead of AUTO_INCREMENT, NVARCHAR for Unicode text support, TOP instead of LIMIT, and sp_rename for renaming columns.
- **Relational database design** — normalizing data across multiple tables using foreign keys and junction tables instead of storing everything in one flat table. For example, separating Directors and Genres from Movies to avoid repeated data.
- **PowerShell scripting** — writing scripts that connect to SQL Server, call external APIs, handle JSON responses, loop for user input, and import data from CSV files.
- **API calls** — how HTTP requests work, how to authenticate with an API key, how to send and parse JSON, and how to integrate an AI model into a practical tool.
- **Git** — version control workflow including committing, pushing to GitHub, and structuring a repository professionally for a portfolio project.