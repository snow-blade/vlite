# VLITE

A Package manager for the [lite text editor](https://github.com/rxi/lite) written in [V](https://vlang.io).

## Purpose

lite is a lightweight text editor written mostly in Lua — it aims to provide something practical, pretty, small and fast, implemented as simply as possible; easy to modify and extend, or to use without doing either.

You can read [this blog post](https://blog.snow-blade.vercel.app/post/discover-the-lite-text-editor) for a bit more about lite or go directly to [the github repo](https://github.com/rxi/lite)

So, following the lite philosophy of being lightweight and blazing fast, i started building this package manager in v instead of rust because the binaries generated by rust were way too big for what i needed, after compilation, this package manager takes only 400kb

Also, the though of making a package manager that automates for me the process of installing new packages for the lite text editor was also a good learning opportunity of the [V](https://vlang.io) programming language , it's not really complete and i had to do some small hack for this to work perfectly.

## Build

If you don't have vlang installed yet, follow the installation steps of vlang: 
- [Macos/linux](https://github.com/vlang/v/wiki/Installing-a-C-compiler-on-Linux-and-macOS)
- [Windows](https://github.com/vlang/v/wiki/Installing-a-C-compiler-on-Windows)

On debianbased linux distros run: `sudo apt install libssl-dev`

On rheel distros: `sudo dnf install libssl-devel`

On windows,mac and arch-based distros: You can skip this steps.

Then modify conf.json for the lite path, by replacing the field of lite_path with your lite path

To build and run, type:
```bash
v vlite.v
./vlite
```
Then update your conf.json file by adding the lite directory
> Always be sure to have the conf.json file in the same directory as the binary
## Contributing
PRs are more than welcome, if you don't know yet vlang, good news you can learn it in under an hour at: [https://github.com/vlang/v/blob/master/doc/docs.md](https://github.com/vlang/v/blob/master/doc/docs.md)

I tried to make the code as obvious as possible for any contributor, so you should find your way very easily.

## Running tests:

To check that everything is up and running, just use:

` v test utils_test.v `

## License

Licensed under [MIT](LICENSE)
