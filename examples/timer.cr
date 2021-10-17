require "../src/libadwaita"

def activate(app : Adw::Application)
  window = Adw::ApplicationWindow.new(app)
  window.title = "Timer"
  window.set_default_size(200, 200)

  box = Gtk::Box.new(Gtk::Orientation::Vertical, 0)
  header = Adw::HeaderBar.new
  label = Gtk::Label.new("0")

  GLib.timeout(1.second) do
    label.text = Time.local.to_s
    true
  end

  GLib.idle_add do
    label.text = "I was idle..."
    false
  end
  box.append(header)
  box.append(label)
  window.content = box
  window.present
end

app = Adw::Application.new("hello.example.com", Gio::ApplicationFlags::None)
app.activate_signal.connect(->activate(Adw::Application))
exit(app.run(ARGV))
