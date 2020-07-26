# VLITE

A Package manager for the [lite text editor](https://github.com/rxi/lite) written in [V](https://vlang.io).

## Purpose

lite is a lightweight text editor written mostly in Lua — it aims to provide something practical, pretty, small and fast, implemented as simply as possible; easy to modify and extend, or to use without doing either.

So i though of making a package manager that automaates for me the process of installing new packages for the lite text editor, it's not really complete and i had to do some small hack for this to work perfectly.

## Build

If you don't have vlang installed yet, follow the installation steps of vlang: 
- [Macos/linux](https://github.com/vlang/v/wiki/Installing-a-C-compiler-on-Linux-and-macOS)
- [Windows](https://github.com/vlang/v/wiki/Installing-a-C-compiler-on-Windows)

On debianbased linux distros run: `sudo apt install libssl-dev`

On rheel distros: `sudo dnf install libssl-devel`

On windows,mac and arch-based distros: Everything is fine

Then modify conf.json for the lite path, by replacing the field of lite_path with your lite path

To build and run, type:
```bash
v vlite.v
./vlite
```
## Contributing
PRs are more than welcome, if you don't know yet vlang, good news you can learn it in under an hour at: [https://github.com/vlang/v/blob/master/doc/docs.md](https://github.com/vlang/v/blob/master/doc/docs.md)

I tried to make the code as obvious as possible for any contributor, so you should find your way very easily.
## License

Licensed under [MIT](LICENSE)
