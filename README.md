# dotfiles

I set these up by cloning this repo somewhere and then symlinking each file into my home directory:

```bash
ls -A dotfiles/ | grep -v "\.git/" | grep -v "\.gitmodules" \
    | while read file; do ln -s dotfiles/$file; done
```
