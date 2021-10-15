require "../src/adw"

def activate(app : Adw::Application)
  Gtk.show_about_dialog(nil, name: "AboutDialog Example",
    application: app,
    program_name: "About Dialog With ♥️",
    version: "1.0.0",
    logo_icon_name: "emote-love-symbolic",
    website: "https://github.com/GeopJr/libadwaita.cr",
    website_label: "Crystal Gtk-4+Libadwaita Bindings",
    authors: ["Hugo Parente Lima", "Evangelos \"GeopJr\" Paterakis"],
    license_type: Gtk::License::MitX11)
end

app = Adw::Application.new("hello.example.com", Gio::ApplicationFlags::None)
app.activate_signal.connect(->activate(Adw::Application))
exit(app.run(ARGV))
