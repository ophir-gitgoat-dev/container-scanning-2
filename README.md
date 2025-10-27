# Container Scanning 2 - Pull Request Labeling Demo

This repository demonstrates **Arnica's Pull Request policy with automated labeling** for Node.js-based containers.

## Files to Copy to Your Destination Repository

```bash
.gitignore
.github/
awsome-content.Dockerfile
package.json
package-lock.json
```

## Setup Steps

### 1. Copy Files
```bash
# From this repo to your destination:
cp .gitignore /path/to/destination/repo/
cp -r .github /path/to/destination/repo/
cp awsome-content.Dockerfile /path/to/destination/repo/
cp package.json /path/to/destination/repo/
cp package-lock.json /path/to/destination/repo/
```

### 2. Push to Main
```bash
cd /path/to/destination/repo
git add .
git commit -m "Initial setup for Arnica PR labeling demo"
git push origin main
```

**Note:** Verify that GitHub Actions ran successfully in the Actions tab.

### 3. Integrate with Arnica
1. Log into Arnica
2. Go to **Settings** → **Integrations** → **GitHub**
3. Add this repository
4. Ensure Arnica has PR permissions
5. Wait 1-2 minutes for sync

### 4. Set Up Policy (Pull Request Labeling)
1. In Arnica: **Policies** → **Create New Policy**
2. Configure:
   - **Name**: "Dockerfile PR Labeling - Node.js"
   - **Type**: Pull Request Policy
   - **Trigger**: On PR creation/update
   - **Scope**: Apply to `container-scanning-2` only
   - **Actions**: Add labels when Dockerfile changes detected:
     - `dockerfile-changes`
     - `security-review-needed`
     - `dependencies-updated`
3. Save

### 5. Test the Policy
```bash
# Create a test branch and modify Dockerfile
git checkout -b test/dockerfile-update
echo "# Test change" >> awsome-content.Dockerfile
git add awsome-content.Dockerfile
git commit -m "Test: Update Dockerfile"
git push origin test/dockerfile-update
```

Create a Pull Request on GitHub and watch Arnica automatically add labels.

### 6. View Results in Arnica
- **Pull Requests** → `container-scanning-2` → View labeled PRs
- **Policies** → Your policy → View execution history
- **Repositories** → `container-scanning-2` → **Pull Requests** tab

## Expected Vulnerabilities
- `http-proxy-agent@1.0.0` (known CVEs)
- `aws-sdk@2.1297.0` (older version with issues)
- Multiple npm package vulnerabilities

## Policy Type
**Pull Request policy** - Automatically adds labels to PRs when Dockerfile or dependency files are modified.

---

See `container-scanning-1` for the **line-based content scanning policy** demo.
