$connParams = @{
    ServerInstance = "localhost"
    Database = "MovieDB"
    TrustServerCertificate = $true
}
$apiKey = $env:ANTHROPIC_API_KEY
$schema = "Table: Movies, Columns: movie_id (int), title (nvarchar), genre (nvarchar), release_year (int), director (nvarchar), rating (decimal), runtime (int)"

$userQuestion = "Show me all action movies from the 1980s"
$prompt = "You are a T-SQL expert. Convert the following question to a T-SQL query using these schema: $schema, ONLY the raw SQL query, no explanation, no markdown, no backticks. Here is the question: $userQuestion"

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
$results = Invoke-Sqlcmd @connParams -Query $sql
$results | Format-Table