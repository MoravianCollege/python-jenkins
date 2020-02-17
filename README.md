# python-jenkins

This repo shows how to set up a Python project with Jenkins.

## Github configuration

In the Settings for the Github repo, add a Webhook.  The pay is
`<url for Jenkins>/github-webhook/`.  No secret needed, but select
"Let me select individual events," and then select both "Pull Requests"
and "Pushes".  This will cause Github to send a job to Jenkins whenever
pushes or pull requests are made.

## Project Structure

The overall structure follows the [python_structure](https://github.com/MoravianCollege/python_structure)
repo.  See the `README.md` in that repo for details.

## Jenkinsfile

The `Jenkinsfile` separates the creation of the virtual environment from 
its usage in the Unit Tests and Static Analysis phases.  In all three
stages, the single step is a multi-line `sh` command.  This is necessary
because Jenkins runs each `sh` command as a separate shell instance.
Therefore, if we activate the virtual environment in one `sh` command,
it will not be active in the next.

Also, note that we use `. .venv/bin/activate` instead of 
`source .venv/bin/activate` because Jenkins uses 
`sh` rather than bash.

## Notes

This still doesn't work with [tox](https://tox.readthedocs.io/en/latest/).
I tried to add `pip install tox` in the `Create Virtual Environment` stage
and `tox` instead of `pytest` in the `Unit Tests` stage.  

## Other Attempts

The [Pyenv Pipeline](https://plugins.jenkins.io/pyenv-pipeline/) plug-in
is supposed to simplify using Python virtual environments in Jenkins.  When
I used it, the logs indicated that requirements were already met, but then
it would not be able to run `pytest`.

When you run `pip install -r requirements.txt` directly, it complains because
it cannot write to `/.local`.  I found a [StackOverflow question](https://stackoverflow.com/questions/51648534/unable-to-pip-install-in-docker-image-as-agent-through-jenkins-declarative-pipel?noredirect=1#comment90322558_51648534)
with an answer that suggested using `withEnv(["HOME=${env.WORKSPACE}"])` to
set the `HOME` variable.  This allowed `pip` to run, but afterward `pytest`
was not in the `PATH` and so could not be run.

Based on the answer to [this StackOverflow question](https://stackoverflow.com/questions/54812697/how-to-pip-install-in-a-docker-image-with-a-jenkins-pipline-step),
I tried create a custom `Dockerfile` that had a `jenkins` user created.  As
with other solutions, I wasn't able to get `pytest` to run.

