$connParams = @{
    ServerInstance = "localhost"
    Database = "MovieDB"
    TrustServerCertificate = $true
}
$apiKey = $env:ANTHROPIC_API_KEY
$schema = "Table: Movies, Columns: movie_id (int), title (nvarchar), genre (nvarchar), release_year (int), director (nvarchar), rating (decimal), runtime (int)"

    while($true){
        $userQuestion = Read-Host "You" 
            if ($userQuestion -eq "exit"){
                break
            }
            #else

                $prompt = "You are a T-SQL expert. Convert the following question to a T-SQL query using these schema: $schema, ONLY the raw SQL query, no explanation, no markdown, no backticks. Here is the question: $userQuestion.If the question is not related to movies or the database, return exactly this text and nothing else: NOT_A_DB_QUERY"

                $body = @{
                    model = "claude-haiku-4-5-20251001"
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
                Write-Host "Generated SQL: $sql"
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