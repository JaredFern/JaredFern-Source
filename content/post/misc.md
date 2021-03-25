
---
title: Development Workflows for Researchers

# Summary for listings and search engines
summary: "Tools, Tips, and Tricks for Research"

# Date published
date: "2020-03-12T00:00:00Z"

# Date updated
lastmod: "2020-03-06T00:00:00Z"

# Is this an unpublished draft?
draft: true

# Show this page in the Featured widget?
featured: true

authors:
- admin

tags:
# - research
# - industry

categories:
- reference
# - admissions

---
Research in computer science can often involve working with large code bases and scalable systems. We want to spend time on science rather than on [debugging, deployment, etc].

Knowing your tooling and designing your projects according to best practices can accelerate your research workflow so you can focus on higher level problems.

Good project and code management can increase readability and reduce time spent debugging.

* Version Controlling with Git: More than [add, commit, push]
  * Basic Commands: Checkout, branch, remote, diff
  * git add -p: Add code in hunks and verify your changes (instead of pull files)
* Pre-commit Checks:
  * Fix syntax and style mistakes before you commit or experiment
  * Formatters ensure your code is [syntax + compilable, formatted, linted]
* Effectively using your Editor & IDE: If it’s using all that RAM it better be doing work
  * Common Features:
    * File structure: Show your classes, functions, variable scopes
    * Call Graphs: goto declaration, definition, etc
    * Deployment: SFTP and auto-upload your code from inside your IDE
    * Version Control: Tools for merging, checkout and branch management
    * Debugging: Set breakpoints
* Organizing Project Workspaces
  * Separate binaries from libraries:
  * Executables should only argparse and call the library
  * Stay organized - Directories for configs, logs, data, shell scripts, utils

## Managing Dependencies

Virtual environments and containers manage libraries and system-level dependencies across projects. These may be necessary especially when a build requires tool versions not supported by the machine's base operating system.

* Virtual Environments: Controlling python-level dependencies (conda, pip, venv)
  * Export your environments with environment.yml (conda) or requirements.txt (pip) files
* Containers: Controlling system level dependencies
  * Run a virtual container of an OS and your dependencies while maintaining access to the machine’s real file system
  * How to use Docker/Singularity:
    1. Specify your dependencies in a Dockerfile or Singularity
    2. Get a container image by: Pulling from a remote, Building from your config file
    3. Specify your binds: Resources (Tasks, CUDA devices), file paths
  * Docker vs Singularity:
    * They are interoperable! You can build a Singularity image from a DockerFile
    * Docker manages its own images, Singularity stores images as standard .sif files
    * Singularity is more compatible with HPC clusters because it is run as its own job rather than being managed by the docker daemon
  * Kubernetes (K8): Deploying docker containers to multiple servers at scale
* Some Useful Computational Packages and Tools:
  * High Volume Storage & Databases: Lmdb, Msgpack
  * Computation: Numpy, scipy, scikit, tensorflow, torch, keras, JAX, pandas, nltk
  * Distributed Training: Horovod, Apex (with Mixed precision), Torch DistributedData
  * Process & Job Management: multiprocessing, wandb

## Deployment and Experimentation

Developing a deployment framework for committing and running experiments on remote servers will

* Testing Code on your Remote:
  * Use pre-commit tests and test on your local machine (canary)
  * Pull on remote machine and test with debug breakpoints and logging
* Use Jupyter Lab/Notebooks to run code in blocks
  * Deploy Notebooks on Compute Nodes and use port forwarding to experiment with the ipynb locally
  * Warning: Using SFTP and forced autoupload to remote can cause problems with repos using multiple branches by causing desyncs
* Port forwarding (e.g., Tensorboard, Jupyerlab)
* Scheduling Jobs:
  * Daemons: Jobs that just won’t stop
  * Crontab: Schedule recurring jobs to be called by the cron daemon
* HPC Cluster: Queuing jobs on Slurm

## File Systems & Remote Backup

Organizing and cloud-syncing your filesystem can make navigating and accessing files much less of a headache.

* Auto-syncing files across Devices: Google Drive and Dropbox
  * Organizing your filesystem and making it searchable
  * Use symlinks to keep your sensitive things local if you don’t trust your remote storage
* Working with Remote Servers:
  * Access remote files by mounting external servers with NFS
  * Keep your project files synced with SFTP and Deployment Plugins (CLI: rsync)
  * Keep your dev environments synced by maintaining your .dotfiles
  * Ex. .zshprofile, .zshrc, .vimrc, .gitconfig, .tmux.conf
  * Remote Configs: Faster development with SSH and Git Configs

## Personal Security

Services are frequently compromised. Encryption and MFA increase your digital safety when that happens.

* Multi-Factor Authentication: So strangers can’t remote login onto your accounts
  * Use an authenticator app (Duo, Authy, GAuth) or physical security keys instead of SMS
  * Use a password manager (1Pass, Lastpass, etc)
  * Use secure messaging (Signal, Telegram, etc)

## Other Comments

This is a compilation of tools that I've found useful but is by no means an authortitative resource.

* If you need a custom tool, double check it hasn’t been already written
* If you’re copying lots of code, consider abstracting it to a separate class or function

## Resources

* My Dot Files: https://github.com/JaredFern/DotFiles
* MIT Missing Semester Course: https://missing.csail.mit.edu/

