# Install Tutor Skills for Gemini CLI (Windows)

# Dynamically find the gemini-cli skill-creator path
$GlobalNpmRoot = (npm root -g)
$SkillCreatorPath = Join-Path $GlobalNpmRoot "@google\gemini-cli\bundle\builtin\skill-creator"

if (-not (Test-Path "$SkillCreatorPath\scripts\package_skill.cjs")) {
    Write-Error "Could not find gemini-cli skill-creator at $SkillCreatorPath."
    Write-Host "Please ensure gemini-cli is installed globally: npm install -g @google/gemini-cli"
    exit 1
}

Write-Host "Found skill-creator at: $SkillCreatorPath"

Write-Host "Packaging tutor-setup..."
node "$SkillCreatorPath\scripts\package_skill.cjs" ./skills/tutor-setup

Write-Host "Packaging tutor..."
node "$SkillCreatorPath\scripts\package_skill.cjs" ./skills/tutor

Write-Host "Installing tutor-setup.skill..."
gemini skills install ./tutor-setup.skill --scope user --consent

Write-Host "Installing tutor.skill..."
gemini skills install ./tutor.skill --scope user --consent

Write-Host ""
Write-Host "Done! Please run '/skills reload' in your Gemini CLI session to enable the new skills."
Write-Host "Usage:"
Write-Host "  /tutor-setup  — Generate a StudyVault"
Write-Host "  /tutor        — Start a quiz"
