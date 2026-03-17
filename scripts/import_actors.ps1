$connParams = @{
    ServerInstance = "localhost"
    Database = "MovieDB"
    TrustServerCertificate = $true
}
$actors = Import-Csv ".\sql\import_actors.csv"

foreach ($actor in $actors){
    Write-Host "Processing: $($actor.name) $($actor.last_name)" #progress
    $existingActor = Invoke-Sqlcmd @connParams -Query "SELECT actor_id FROM actors WHERE name = '$($actor.name)' AND last_name = '$($actor.last_name)';"

        if ($existingActor -eq $null){
            #Actor not found - insert and capture new id
            #inserting the actor and getting back new id to $actor_id variable
            $actor_id = Invoke-Sqlcmd @connParams -Query "INSERT INTO Actors (name, last_name) VALUES ('$($actor.name)','$($actor.last_name)'); SELECT SCOPE_IDENTITY() AS actor_id"
            
        }
        else {
            #if actor is found - using the existing id
            $actor_id = $existingActor
        }

        #splitting movie_titles column to get individual titles
            $movies = $actor.movie_titles.Split("|")
            foreach ($title in $movies){
                $movie_id = Invoke-Sqlcmd @connParams -Query "SELECT movie_id FROM Movies WHERE title = '$title'"
                Invoke-Sqlcmd @connParams -Query "INSERT INTO MovieActors (movie_id, actor_id) VALUES ('$($movie_id.movie_id)','$($actor_id.actor_id)')"
            }
}