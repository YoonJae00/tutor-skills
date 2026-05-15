# Install Tutor Skills for Gemini CLI (Windows)
$SkillCreatorPath = "C:\Users\YoonJae\AppData\Roaming\npm\node_modules\@google\gemini-cli\bundle\builtin\skill-creator"

Write-Host "Packaging tutor-setup..."
node "$SkillCreatorPath\scripts\package_skill.cjs" ./skills/tutor-setup

Write-Host "Packaging tutor..."
node "$SkillCreatorPath\scripts\package_skill.cjs" ./skills/tutor

Write-Host "Installing tutor-setup.skill..."
gemini skills install ./tutor-setup.skill --scope user

Write-Host "Installing tutor.skill..."
gemini skills install ./tutor.skill --scope user

Write-Host ""
Write-Host "Done! Please run '/skills reload' in your Gemini CLI session to enable the new skills."
Write-Host "Usage:"
Write-Host "  /tutor-setup  — Generate a StudyVault"
Write-Host "  /tutor        — Start a quiz"
