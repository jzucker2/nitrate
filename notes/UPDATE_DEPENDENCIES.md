# Update Dependencies

I have a process for updating dependencies.

This is mostly based around [filmstock/notes/UPDATE_DEPENDENCIES.md](https://github.com/jzucker2/filmstock/blob/master/notes/UPDATE_DEPENDENCIES.md)

```
cat .python-version
rm .python-version
pyenv virtualenv 3.10.7 nitrate-example-3.10.7
pyenv virtualenv <version> <unique name>-<version>

# or
rm -rf venv
python3 -m venv venv
source venv/bin/activate

echo "<unique name>-<version>" > .python-version
cd ..
cd filmstock
pip freeze
# should be empty, now install latest pip, according to `Dockerfile`
pip install -r ../filmstock/pip-requirements.txt
```

Now run the following, but first make sure to pin 
any dependencies that you don't want automatically 
updated.

```
pip install --upgrade -r upgrade-requirements.txt
```

Then replace the dependencies in the other files, commit, and push.
