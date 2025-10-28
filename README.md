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
6. Add Integration for [Container scanning](https://docs.arnica.io/arnica-documentation/getting-started/container-integrations/ghcr)

### 4. Set Up Policy (Pull Request Labeling)
1. In Arnica: **Policies** → **Create New Policy**
2. Configure:
   - **Name**: "Dockerfile PR Labeling - Node.js"
   - **Type**: Code Risk
   - **Trigger**: On Pull Request (created/updated)
   - **Scope**: Apply to `container-scanning-2` repository only
   - **Conditions**: Add file path condition for `*.Dockerfile` and `package*.json`
   - **Actions**:
     - Label all Dockerfiles
     - Enable both annotations
3. Save

![Policy Configuration](image.png)

### 5. Test the Policy
1. create a small PR in the repo that just changes a simple file (dosne't need to be the Dockerfile itself)
2. verify after a few seconds Arnica adds a commit with the new lables.

Create a Pull Request on GitHub and watch Arnica automatically add labels.

## Policy Type
**Code Risk policy with On Pull Request trigger** - Automatically adds labels and comments to PRs when Dockerfile or dependency files are modified.

