require "../src/libadwaita"

def activate(app : Adw::Application)
  Adw.show_about_window(
    nil,
    name: "AboutWindow Example",
    application: app,
    application_name: "About Window With ♥️",
    version: "1.0.0",
    application_icon: "emote-love-symbolic",
    website: "https://github.com/GeopJr/libadwaita.cr/",
    developer_name: "Your Name",
    developers: [
      "Hugo Parente Lima",
      "GeopJr",
      "The libadwaita.cr, gtk4.cr & gi-crystal contributors",
    ],
    license_type: Gtk::License::MitX11,
    debug_info: (<<-DEBUG
    preview_mt: #{{{flag?(:preview_mt)}}}
    gc_none: #{{{flag?(:gc_none)}}}
    release: #{{{flag?(:release)}}}
    debug: #{{{flag?(:debug)}}}
    static: #{{{flag?(:static)}}}
    windows: #{{{flag?(:windows)}}}
    unix: #{{{flag?(:unix)}}}
    aarch64: #{{{flag?(:aarch64)}}}
    x86_64: #{{{flag?(:x86_64)}}}
    DEBUG

      ),
    comments: "This is an example libadwaita AboutWindow",
    issue_url: "https://github.com/GeopJr/libadwaita.cr/issues",
    release_notes: <<-XML
    <ul>
          <li>Added new libadwaita about window!</li>
    </ul>
    XML
  )
end

app = Adw::Application.new("hello.example.com", Gio::ApplicationFlags::None)
app.activate_signal.connect(->activate(Adw::Application))
exit(app.run)
