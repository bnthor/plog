# Wtf is a Plog?

It's a blog, but for yourself. 

You don't feel like writing a blog, but are constantly taking notes? I do, so I wrote this little bash project to create plog entries quickly, and compile them in a html file.

## Requirements

- **Pandoc**, used to compile the plog to an html file `brew install pandoc`.
- **Sox** for audio notes, using brew: `brew install sox`.

## Installation

Git clone this project in your $HOME, then symlink the shell script to your /usr/local/bin with:

`sudo ln -s ~/plog/bin/plog.sh /usr/local/bin/plog`

### Changing defaults

Create a `~/.plogrc` file in your `$HOME`, then copy and edit the **defaults** to your needs:

```
# These are the defaults
DIRECTORY="~/Documents/Plog"
EDITOR="vi"
FILENAME="plog___$(date +%Y_%m_%d___%H_%M)"
```

For example, you could use your iCloud folder as a `$DIRECTORY`. In `~/.plogrc`, write:

`DIRECTORY="/Users/YOUR_NAME/Library/Mobile\ Documents/com\~apple\~CloudDocs/Notes"`

## Description

Using `plog` in your terminal creates a plog entry in the `$DIRECTORY`, opens it with an `$EDITOR` named `plog___YEAR_MONTH_DAY___HOUR_MIN.md`. 

## Options

**-t or --title** : Sets the entry title, its value must be a string.

**-g or --generate** : Creates a html file compiling all your plog entries, with a table of content.

**-a or --audio** : Records an audio plog with sox, no editor here, everything happens in the terminal. When you're done recording, hit `ctrl + C` to stop sox. A mp3 file is saved into your DIRECTORY

## TODO 

- Make it homebrew compatible
- Make it work on Linux distros
- Spread the love