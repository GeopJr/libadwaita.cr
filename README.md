<p align="center">
  <img width="256" alt="libadwaita.cr logo" src="https://raw.githubusercontent.com/GeopJr/libadwaita.cr/main/logo.svg" />
</p>
<h1 align="center">libadwaita.cr</h1>
<h4 align="center">libadwaita bindings for Crystal</h4>
<p align="center">
  <br />
    <a href="https://github.com/GeopJr/libadwaita.cr/blob/main/CODE_OF_CONDUCT.md"><img src="https://img.shields.io/badge/Contributor%20Covenant-v2.1-3584e4.svg?style=for-the-badge&labelColor=8ff0a4" alt="Code Of Conduct" /></a>
    <a href="https://github.com/GeopJr/libadwaita.cr/blob/main/LICENSE"><img src="https://img.shields.io/badge/LICENSE-MIT-3584e4.svg?style=for-the-badge&labelColor=8ff0a4" alt="MIT Licensed" /></a>
</p>

#

<p align="center">
    <img src="https://i.imgur.com/H6a5Git.png" alt="screenshot of the an example libadwaita.cr app" width="512" />
</p>

#

## Notes

- Bindings are being generated using [gi-crystal](https://github.com/hugopl/gi-crystal).
- It includes everything [gtk4.cr](https://github.com/hugopl/gtk4.cr) does plus libadwaita.
- Docs can be found on the website listed on the sidebar.

#

## Dependencies

- ArchLinux: `pacman -S gtk4 gobject-introspection libadwaita`

Other distros will probably require you to manually build libadwaita for now.

#

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     libadwaita:
       github: GeopJr/libadwaita.cr
   ```

2. Run `shards install`
3. Run `./bin/gi-crystal` to generate the bindings

#

## Usage

Follow the instructions over at [gtk4.cr](https://github.com/hugopl/gtk4.cr) and [gi-crystal](https://github.com/hugopl/gi-crystal) as well as the [examples/](./examples/) folder

#

## Contributing

1. Read the [Code of Conduct](https://github.com/GeopJr/libadwaita.cr/blob/main/CODE_OF_CONDUCT.md)
2. Fork it ( https://github.com/GeopJr/libadwaita.cr/fork )
3. Create your feature branch (git checkout -b my-new-feature)
4. Commit your changes (git commit -am 'Add some feature')
5. Push to the branch (git push origin my-new-feature)
6. Create a new Pull Request
