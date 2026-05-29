function InstallIt! {
    Write-Host "Ugh, fine. Starting your lazy-mode PC setup... Sit tight." -ForegroundColor Cyan

    # Verify Winget is actually there (If you are running win 10 or newer it will be there)
    if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
        Write-Error "Winget isn't found! What kind of ancient OS are you running?!"
        return
    }
     
    #Add your apps here or just use the ones I put as an example, Not like i care or anything...
    $Apps = @(
        "Microsoft.VisualStudioCode",
        "Git.Git",
        "Discord.Discord",
        "Opera.OperaGX",
        "Valve.Steam",
        "Spotify.Spotify",
        "Modrinth.ModrinthApp",
        "Spicetify.Spicetify",
        "Vendicated.Vencord",
        "Python.Python.3.14"
    )
    #Add your modules here, or just use the ones I put as an example again, Not like i care or anything...
    $Modules = @(
        "requests",
        "nbtlib",
        "pillow",
        "base64",
        "gzip",
        "Flask",
        "tkinter",
        "python-dotenv",
        "pypresence",
        "matplotlib"
    )

    foreach ($App in $Apps) {
        Write-Host "`n[+] Attempting to install: $App" -ForegroundColor Tool

        # --- Attempt 1: Standard Winget Repo ---
        Write-Host "  -> Trying standard Winget source..." -ForegroundColor Yellow
        winget install --id $App --source winget --silent --accept-source-agreements --accept-package-agreements

        if ($LASTEXITCODE -eq 0) {
            Write-Host "  [✓] Successfully installed $App via Winget!" -ForegroundColor Green
            continue # Skips the fallback and moves to the next app
        }

        # --- Attempt 2: MS Store Fallback ---
        Write-Warning "  [!] Standard Winget failed for $App. Sigh... trying MS Store fallback..." -Foregroundcolor Yellow
        
        # We try searching by ID first, but MS Store usually prefers names/Store IDs
        winget install --id $App --source msstore --silent --accept-source-agreements --accept-package-agreements

        if ($LASTEXITCODE -eq 0) {
            Write-Host "  [✓] Successfully installed $App from MS Store!" -ForegroundColor Green
        } else {
            Write-Error "  [X] Both standard Winget and MS Store failed for $App. Fix it yourself!" -ForegroundColor Red
        }
    }

    foreach ($Module in $Modules) {
            Write-Host "`n[+] Attempting to install Python module: $Module" -ForegroundColor Tool
            pip install $Module

        if ($LASTEXITCODE -eq 0) {
            Write-Host "  [✓] Successfully installed $Module!" -ForegroundColor Green
        } else {
            Write-Error "  [X] Failed to install $Module. Sigh..." -ForegroundColor Red
        }
    }

    Write-Host "Everything is finished. Don't expect me to congratulate you or anything!" -ForegroundColor Blue
}