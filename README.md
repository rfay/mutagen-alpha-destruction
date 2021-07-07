# Mutagen bug demo

This repo just demonstrates how the alpha of a mutagen sync can be completely destroyed in a very simple way. 

1. `cd workdir` (We do this because the contents of workdir are going to be destroyed, and it's no fun to put this together time after time.)
1. `../start_project.sh`. This just starts a trivial docker container named "tester99" (after removing that container if it already exists)
1. `../start_mutagen_session.sh` starts a mutagen session that syncs the alpha (the workdir directory) to /var in the container. (In this busybox container there's nothing useful in /var, just spool and www)
1. Run `../start_project.sh` again. This stops the existing container and re-runs it... with the same name. 
1. Wait a minute or two. The contents of workdir, which were previously correct (with the original files "one", "two", etc) are now replaced with just the raw contents of the monitor (the spool and www directories). All the original content of the alpha workdir is lost.

What I believe is going on here is the mutagen sync session sees the new (completely unrelated, but same name) container show up and:

* Does *not* sync the contents of the alpha workdir into the container's /var, even though that would make sense
* Instead it copies the contents of the container's `/var` on top of `workdir`, blowing away the files that `workdir` contained.