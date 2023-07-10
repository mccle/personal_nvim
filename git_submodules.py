import os
import glob
import subprocess

gitdirs = glob.glob("**/.git/", recursive=True)

for gitdir in gitdirs:
    if os.path.exists(gitdir) and gitdir != ".git/":
        url = (
            subprocess.check_output(
                ["git", "-C", gitdir, "config", "--get", "remote.origin.url"]
            )
            .decode()
            .strip()
        )
        print(f"gitdir: {gitdir}, url: {url}")
        print(f"{gitdir[:-4]}.git")
        subprocess.run(["mv", gitdir, f"{gitdir[:-4]}.git"])
