require "../src/libadwaita"

def activate(app : Adw::Application)
  window = Adw::ApplicationWindow.new(app)
  window.title = "Entry"

  boxRoot = Gtk::Box.new(Gtk::Orientation::Vertical, 0)
  header = Adw::HeaderBar.new

  box = Gtk::Box.new(:vertical, 0)
  label = Gtk::Label.new(use_markup: true)
  entry = Gtk::Entry.new

  entry.notify_signal["text"].connect do
    label.text = entry.text
  end

  entry.activate_signal.connect do
    label.markup = "<b>#{label.text}</b>"
    GLib.timeout(1.seconds) do
      label.markup = label.text
      false
    end
  end

  box.prepend(label)
  box.append(entry)
  boxRoot.append(header)
  boxRoot.append(box)
  window.content = boxRoot

  window.present
end

app = Adw::Application.new("hello.example.com", Gio::ApplicationFlags::None)
app.activate_signal.connect(->activate(Adw::Application))
exit(app.run(ARGV))
