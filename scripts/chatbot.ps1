$connParams = @{
    ServerInstance = "localhost"
    Database = "MovieDB"
    TrustServerCertificate = $true
}

#CONFIG SECTION
$apiKey = $env:ANTHROPIC_API_KEY
$provider = "anthropic" #options: "anthropic", ollama"
$model = "claude-haiku-4-5-20251001" #for ollama, change to: "llama3"

#WELCOME MESSAGE AND SCHEMA
$schema = "Five Tables [with columns]: Genres [genre_id (int, PRIMARY KEY), name (nvarchar)], Directors [director_id (int, PRIMARY KEY), name (nvarchar), last_name (nvarchar)], Actors [actor_id (int, PRIMARY KEY), name (nvarchar), last_name (nvarchar)], Movies [movie_id (int, PRIMARY KEY), title (nvarchar), release_year (int), rating (decimal), runtime (int), genre_id (int, FOREIGN KEY (referencing to Genres)), director_id (int, FOREIGN KEY (referencing to Directors))], MovieActors [movie_id (int, FOREIGN KEY (referencing to Movies), actor_id (int, FOREIGN KEY (referencing to Actors))]"
$genres = Invoke-Sqlcmd @connParams -Query "SELECT name FROM genres"
$genreslist = $genres.name -join ", "
Write-Host "Welcome! This chatbot works only for data selection. If you want to exit the chat, just type 'exit'" -ForegroundColor Cyan
Write-Host "List of available genres: $genreslist" -ForegroundColor White
Write-Host "---------------------" -ForegroundColor Cyan

    while($true){
        $userQuestion = Read-Host "You"
        $prompt = "You are a T-SQL expert. Convert the following question to a T-SQL query using these schema: $schema, ONLY the raw SQL query, no explanation, no markdown, no backticks. Here is the question: $userQuestion. User might type in any language but the T-SQL query should always be valid to SQL language. If the question is not related to movies or the database, return exactly this text and nothing else: NOT_A_DB_QUERY. Always JOIN related tables to return human readable names instead of foreign key IDs. For example, return genre name instead of genre_id, and director full name instead of director_id."
            if ($userQuestion.Trim() -eq ""){
                continue
            } 
            if ($userQuestion -eq "exit"){
                break
            }

            #else
            if ($provider -eq "anthropic"){
                $body = @{
                    model = $model
                    max_tokens = 512
                    messages = @(
                        @{
                            role = "user"
                            content = $prompt
                        }
                    )    
                } | ConvertTo-Json -Depth 5

                $response = Invoke-RestMethod -Uri "https://api.anthropic.com/v1/messages" -Method Post -Headers @{
                    "x-api-key"         = $apiKey
                    "anthropic-version" = "2023-06-01"
                    "content-type"      = "application/json"
                    } -Body $body

                $sql = $response.content[0].text

            }
            elseif ($provider -eq "ollama") {
                #llama
            }
            else {
                Write-Host "Error, please choose correct provider for your API. Current models: Ollama, Claude, check CONFIG section inside chatbot file" -ForegroundColor Red
                break
            }
                Write-Host "Generated SQL: $sql" -ForegroundColor Yellow
                if ($sql.TrimStart().ToUpper().StartsWith("SELECT")) {
                    $results = Invoke-Sqlcmd @connParams -Query $sql
                    $results | Format-Table
                }
                elseif ($sql.Trim() -eq "NOT_A_DB_QUERY") {
                    Write-Host "Sorry, I can only answer questions about the movies database" -ForegroundColor Red
                }
                else {
                    Write-Host "Sorry, I can only run SELECT queries." -ForegroundColor Red
                }            

            
    }