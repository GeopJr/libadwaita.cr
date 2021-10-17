require "../src/libadwaita"

app = Adw::Application.new("hello.example.com", Gio::ApplicationFlags::None)
count = 0

app.activate_signal.connect do
  window = Adw::ApplicationWindow.new(app)
  window.title = "Hello Adwaita!"
  window.set_default_size(600, 400)

  root = Gtk::Box.new(Gtk::Orientation::Vertical, 0)
  header = Adw::HeaderBar.new

  pref_group = Adw::PreferencesGroup.new
  pref_group.halign = Gtk::Align::Center
  pref_group.valign = Gtk::Align::Center
  pref_group.hexpand = true
  pref_group.vexpand = true

  ["Support GNOME!", "Crystal goes brrrrr..."].each_with_index do |text, i|
    icon = i % 2 === 0 ? "face-angel-symbolic" : "face-devilish-symbolic"

    row = Adw::ActionRow.new
    row.icon_name = icon

    label = Gtk::Label.new
    label.text = text

    row.add_suffix(label)

    pref_group.add(row)
  end

  root.append(header)
  root.append(pref_group)

  window.content = root
  window.present
end

exit(app.run(ARGV))
